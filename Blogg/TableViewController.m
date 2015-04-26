//
//  TableViewController.m
//  Blogg
//
//  Created by Evan Latner on 2/14/15.
//  Copyright (c) 2015 Evan Latner. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"


#define CLIENT_ID @"VPHBFYCGLAKRNZTCX2E2SUXQXQLZFVZ4JLWCRN5TCLFLW2CI"
#define CLIENT_SECRET @"MAJMGKNWIUNYHIBUGHSS2GSMMTV0M2T5T3LCTBYI0ZGOF22D"



@interface TableViewController ()

@end

@implementation TableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSURL *url = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];
    
    
    
    
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    NSError *error = nil;
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    
     NSLog(@"%@", dataDic);
    
    
    self.blogPosts = [NSMutableArray array];
    
    NSArray *blogPostsArray = [dataDic objectForKey:@"posts"];
    
    
    for (NSDictionary *bpDic in blogPostsArray) {
        
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDic objectForKey:@"title"]];
        
        blogPost.author = [bpDic objectForKey:@"author"];
        blogPost.thumbnail = [bpDic objectForKey:@"thumbnail"];
        blogPost.date = [bpDic objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDic objectForKey:@"url"]];
        
        
        
        
        
        [self.blogPosts addObject:blogPost];
        
    }

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    
    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
        
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailUrl];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    }
    
    else {
        
        cell.imageView.image = [UIImage imageNamed:@"photo.JPG"];
        
    }

    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@",blogPost.author, [blogPost formattedDate]];

    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"push"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        
        [segue.destinationViewController setBlogPostUrl:blogPost.url];
        [segue.destinationViewController setTitle:blogPost.title];
        
        
        
        
        
        
    }
    
    
}




@end
