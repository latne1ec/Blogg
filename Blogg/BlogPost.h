//
//  BlogPost.h
//  Blogg
//
//  Created by Evan Latner on 2/14/15.
//  Copyright (c) 2015 Evan Latner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;




-(id)initWithTitle: (NSString *)title;

+(id)blogPostWithTitle: (NSString *)title;

-(NSURL *)thumbnailUrl;


-(NSString *)formattedDate;


@end
