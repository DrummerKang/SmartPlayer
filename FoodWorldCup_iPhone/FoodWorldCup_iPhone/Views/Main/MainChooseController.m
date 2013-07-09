//
//  MainChooseController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "MainChooseController.h"
#import "MenuListController.h"
#import "GameViewController.h"

@interface MainChooseController ()

@end

@implementation MainChooseController

@synthesize foodBtn;
@synthesize gameBtn;

- (void)dealloc{
    [foodBtn release];
    [gameBtn release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidUnload{
    [self setFoodBtn:nil];
    [self setGameBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Button Aciton

//음식선택
- (IBAction)foodBtn:(id)sender {
    MenuListController *menuListController = [[MenuListController alloc] initWithNibName:@"MenuListController" bundle:nil];
    [self.navigationController pushViewController:menuListController animated:YES];
}

//게임선택
- (IBAction)gameBtn:(id)sender {
    GameViewController *gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    [self.navigationController pushViewController:gameViewController animated:YES];
}

@end
