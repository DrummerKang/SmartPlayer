//
//  WinViewController.m
//  FoodWorldCup_iPhone
//
//  Created by Kang on 12. 5. 10..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "WinViewController.h"
#import "MenuListController.h"

@implementation WinViewController

@synthesize titleImage;
@synthesize bgLogImage;
@synthesize winFoodImage;
@synthesize winTextImage;

@synthesize titleName;
@synthesize imageName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)showWinFood
{
    NSLog(@"%@ %@", imageName, titleName);
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    [winFoodImage setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
    
    filePath = [[NSBundle mainBundle] pathForResource:titleName ofType:@"png"];
    [titleImage setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
    
    
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo1" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo2" ofType:@"png"]], nil];
    
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:[bgLogImage frame]];
    [self.view addSubview:aniImage];

    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];    
}

#pragma mark - Button Action

- (IBAction)goToMainBtn:(id)sender{
    MenuListController *menuListController = [[MenuListController alloc] initWithNibName:@"MenuListController" bundle:nil];
    [self.navigationController pushViewController:menuListController animated:YES];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];   
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"winText" ofType:@"png"];
    [winTextImage setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
    
    filePath = [[NSBundle mainBundle] pathForResource:@"bgLogo" ofType:@"png"];
    [bgLogImage setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
 
    [self showWinFood];
}


- (void)viewDidUnload
{
    [self setTitleImage:nil];
    [self setBgLogImage:nil];
    [self setWinFoodImage:nil];
    [self setWinTextImage:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
