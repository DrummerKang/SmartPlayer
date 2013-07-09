//
//  MenuListController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 7..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "MenuListController.h"
#import "FoodGameController.h"

#define KOREA           @"KOREA"
#define JAPAN           @"Japan"
#define CHINA           @"CHINESE"
#define BASE            @"BUN"
#define FAST            @"FAST"

@interface MenuListController ()

@end

@implementation MenuListController

- (void)dealloc{
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults integerForKey:@"MAN"];
    [defaults integerForKey:@"LADY"];
    
    /*
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:@"당신의 성별은 무엇입니까?" delegate:self cancelButtonTitle:@"남" otherButtonTitles:@"여", nil];
    [alert show];     
     [alert release];
    */
    
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(koreaImage) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(japanImage) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(chinaImage) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(baseImage) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(fastImage) userInfo:nil repeats:NO];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 320, 480);
    [imageView setImage:[UIImage imageNamed:@"menuList.png"]];
    [self.view addSubview:imageView];
}

#pragma mark -
#pragma mark Image

//한식
- (void)koreaImage{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"koreaList1" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"koreaList2" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"koreaList3" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"koreaList4" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"koreaList5" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"koreaList6" ofType:@"png"]], nil];
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 96)];
    [self.view addSubview:aniImage];
    
    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];
}

//일식
- (void)japanImage{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japanList2" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japanList3" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japanList4" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japanList5" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japanList6" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"japanList1" ofType:@"png"]], nil];
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 96, 320, 96)];
    [self.view addSubview:aniImage];
    
    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];
}

//중식
- (void)chinaImage{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chinaList3" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chinaList4" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chinaList5" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chinaList6" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chinaList1" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chinaList2" ofType:@"png"]], nil];
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 192, 320, 96)];
    [self.view addSubview:aniImage];
    
    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];
}

//분식
- (void)baseImage{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bunList4" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bunList5" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bunList6" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bunList1" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bunList2" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bunList3" ofType:@"png"]], nil];
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 288, 320, 96)];
    [self.view addSubview:aniImage];
    
    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];
}

//패스트푸드
- (void)fastImage{
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    
    imgArray = [NSMutableArray arrayWithObjects:
                [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fastList5" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fastList6" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fastList1" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fastList2" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fastList3" ofType:@"png"]], [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fastList4" ofType:@"png"]], nil];
    
    UIImageView *aniImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 384, 320, 96)];
    [self.view addSubview:aniImage];
    
    aniImage.animationImages = imgArray;
    aniImage.animationDuration = 1.0;
    aniImage.animationRepeatCount = 0;
    [aniImage startAnimating];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dataSave{
    [defaults setInteger:manCount forKey:@"MAN"];
    [defaults setInteger:ladyCount forKey:@"LADY"];
    [defaults synchronize];
}

#pragma mark -
#pragma mark Alert Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        NSLog(@"Man");
        manCount++;
        [self dataSave];
        
    }else{
        NSLog(@"Lady");
        ladyCount++;
        [self dataSave];
    }        
}

#pragma mark -
#pragma Button Action

//한식
- (IBAction)koreaFoodBtn:(id)sender {
    FoodGameController *foodGameController = [[FoodGameController alloc] initWithNibName:@"FoodGameController" bundle:nil];
    foodGameController.typeName = KOREA;
    [self.navigationController pushViewController:foodGameController animated:YES];
}

//일식
- (IBAction)japanFoodBtn:(id)sender {
    FoodGameController *foodGameController = [[FoodGameController alloc] initWithNibName:@"FoodGameController" bundle:nil];
    foodGameController.typeName = JAPAN;
    [self.navigationController pushViewController:foodGameController animated:YES];
}

//중식
- (IBAction)chinaFoodBtn:(id)sender {
    FoodGameController *foodGameController = [[FoodGameController alloc] initWithNibName:@"FoodGameController" bundle:nil];
    foodGameController.typeName = CHINA;
    [self.navigationController pushViewController:foodGameController animated:YES];
}

//분식
- (IBAction)basedFoodBtn:(id)sender {
    FoodGameController *foodGameController = [[FoodGameController alloc] initWithNibName:@"FoodGameController" bundle:nil];
    foodGameController.typeName = BASE;
    [self.navigationController pushViewController:foodGameController animated:YES];
}

//패스트푸드
- (IBAction)fastFoodBtn:(id)sender {
    FoodGameController *foodGameController = [[FoodGameController alloc] initWithNibName:@"FoodGameController" bundle:nil];
    foodGameController.typeName = FAST;
    [self.navigationController pushViewController:foodGameController animated:YES];
}

@end
