//
//  ViewController.m
//  BlocksTutorial
//
//  Created by aybek can kaya on 6/10/14.
//  Copyright (c) 2014 aybek can kaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    imView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.view addSubview:imView];
    
    [self loadingWithGlobalBlock];
}

-(void)loadingWithGlobalBlock
{
    NSLog(@"Processing...");
    PictureLoader *loader = [[PictureLoader alloc]init];
    
    [loader loadImageWithURL:IMAGE_URL GlobalBlock:^(NSString *imStr, UIImage *image, NSUInteger len) {
        NSLog(@"data length : %d" , len);
        NSLog(@"loaded successfully");
        imView.image = image;
        
    }];
    
}

-(void)loadingWithBlock
{
    NSLog(@"Processing...");
    PictureLoader *loader = [[PictureLoader alloc]init];
    
    [loader loadImageWithURL:IMAGE_URL success:^(UIImage *img, NSString *url) {
       
        
        NSLog(@"loaded successfully");
        imView.image = img;
        
    } failure:^(NSString *url, NSError *error) {
        
    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
