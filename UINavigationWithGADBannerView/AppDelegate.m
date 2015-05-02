//
//  AppDelegate.m
//  UINavigationWithGADBannerView
//
//  Created by EndoTsuyoshi on 2015/05/03.
//  Copyright (c) 2015年 com.endo. All rights reserved.
//

#import "AppDelegate.h"

#define MY_BANNER_UNIT_ID @"**************************************";


@implementation AppDelegate

@synthesize window = _window;

@synthesize navController = _navController;

@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.viewController = [[ViewController alloc]init];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    CGRect frameForWindow = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:frameForWindow];
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.navController.view];
    
    
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    /**********************************************************
     * set admob
     **********************************************************/
    
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    bannerView_.rootViewController = self.navController;
    [self.window addSubview:bannerView_];
    
    GADRequest *request = [GADRequest request];
    [bannerView_ loadRequest:request];
    
    [bannerView_ setFrame:CGRectMake(0, 0, screenBounds.size.width, bannerView_.bounds.size.height)];
    bannerView_.center = CGPointMake(screenBounds.size.width / 2,
                                     screenBounds.size.height - (bannerView_.bounds.size.height / 2));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    bannerView_ = nil;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


@end
