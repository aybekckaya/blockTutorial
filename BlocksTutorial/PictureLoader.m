//
//  PictureLoader.m
//  BlocksTutorial
//
//  Created by aybek can kaya on 6/15/14.
//  Copyright (c) 2014 aybek can kaya. All rights reserved.
//

#import "PictureLoader.h"

@implementation PictureLoader

-(id)init
{
    if(self = [super init])
    {
        
    }
    
    return self;
}


-(void)loadImageWithURL:(NSString *)imageURL GlobalBlock:(PictureGlobalBlock)block
{
    // resim urlsi olusturma
    
    NSURL *URL = [NSURL URLWithString:imageURL];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSUInteger dataLength = [data length]; // 1 - DATA LENGTH
    
    UIImage *img = [UIImage imageWithData:data]; // 2- image
    
    block(imageURL,img,dataLength); // call the block
    
    
}

-(void)loadImageWithURL:(NSString *)url success:(void (^)(UIImage *, NSString *))success failure:(void (^)(NSString *, NSError *))failure
{
    // failure demo
    NSString *extension = [url substringWithRange:NSMakeRange(url.length-3, 3)];
    
    if(! ([extension isEqualToString:@"JPG"] || [extension isEqualToString:@"jpg"]))
    {
        NSDictionary *userInfo = @{@"Reason": @"resim jpg formatinda olmalidir."};
        NSError *err= [NSError errorWithDomain:@"Err" code:-11 userInfo:userInfo];
        
        failure(url, err);
        
        return;
    }
    
    NSURL *URL = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    UIImage *img = [UIImage imageWithData:data];
    
    
    success (img,url);
}


@end
