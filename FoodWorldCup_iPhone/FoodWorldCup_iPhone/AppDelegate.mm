//
//  AppDelegate.m
//  FoodWorldCup_iPhone
//
//  Created by Joseph Kang on 12. 5. 8..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"

@implementation AppDelegate

@synthesize window;

- (void)dealloc{
    [window release];
    [super dealloc];
}

- (void) applicationDidFinishLaunching:(UIApplication*)application{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    MainController *mainController = [[MainController alloc] init];
    mainController.view.frame = [window bounds];
    mainController.view.backgroundColor = [UIColor whiteColor];
    naviController = [[UINavigationController alloc] initWithRootViewController:mainController];
    [naviController setNavigationBarHidden:YES];
    
	[window addSubview:naviController.view];
    [window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    //self.IsDidBecomeActive = NO;
    //nowLocation.latitude = 0.0f;
    //nowLocation.longitude = 0.0f;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
