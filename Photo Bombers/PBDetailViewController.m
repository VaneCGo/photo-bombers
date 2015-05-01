//
//  PBDetailViewController.m
//  Photo Bombers
//
//  Created by Vanessa Cantero Gómez on 29/03/14.
//  Copyright (c) 2014 Vanessa Cantero Gómez. All rights reserved.
//

#import "PBDetailViewController.h"
#import "PBPhotoController.h"

@interface PBDetailViewController ()

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIDynamicAnimator *animator;

@end

@implementation PBDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, -320.0 , 320.0f, 320.0f)];
    [self.view addSubview:self.imageView];
    
    [PBPhotoController imageForPhoto:self.photo size:@"standard_resolution" completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self.view addGestureRecognizer:tap];
    
    //Adding dynamics
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

////Center the image
//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    
//    CGSize size = self.view.bounds.size;
//    CGSize imageSize = CGSizeMake(size.width, size.width);
//    
//    self.imageView.frame = CGRectMake(0.0, (size.height - imageSize.height) / 2.0, imageSize.width, imageSize.height);
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:self.view.center];
    [self.animator addBehavior:snap];
}

- (void)close {
    [self.animator removeAllBehaviors];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds) + 180.0f)];
    [self.animator addBehavior:snap];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
