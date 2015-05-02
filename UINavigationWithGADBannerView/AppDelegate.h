//
//  AppDelegate.h
//  UINavigationWithGADBannerView
//
//  Created by EndoTsuyoshi on 2015/05/03.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    UINavigationController *navController;
    ViewController *viewController;
    // Declare one as an instance variable
    GADBannerView *bannerView_;
}

@property (nonatomic, retain) UIWindow *window;

@property (nonatomic, retain) UINavigationController *navController;

@property (nonatomic, retain) ViewController *viewController;



@end

