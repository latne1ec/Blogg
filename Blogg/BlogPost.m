//
//  BlogPost.m
//  Blogg
//
//  Created by Evan Latner on 2/14/15.
//  Copyright (c) 2015 Evan Latner. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

-(id)initWithTitle: (NSString *)title {
    
    self = [super init];
    
    if (self) {
        
        self.title = title;
        self.thumbnail = nil;
        
    }
    
    return self;
    
}

+(id) blogPostWithTitle:(NSString *)title {
    
    return [[self alloc] initWithTitle:title];
    
}


-(NSURL *)thumbnailUrl {
    
    return [NSURL URLWithString:self.thumbnail];
    
}

-(NSString *)formattedDate {
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *tempDate = [formatter dateFromString:self.date];
    
    [formatter setDateFormat:@"EE MMM, dd"];
    
    return [formatter stringFromDate:tempDate];
    
    
}

@end
