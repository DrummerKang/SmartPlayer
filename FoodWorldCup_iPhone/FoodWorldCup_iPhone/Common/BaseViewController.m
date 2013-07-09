//
//  BaseViewController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 7..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

@synthesize titleBar;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
        
    /*
    titleBar = [[[NSBundle mainBundle] loadNibNamed:@"TitleView" owner:self options:nil] objectAtIndex:0] ; 
    NSLog(@"%f",titleBar.frame.size.height);
    [self.view addSubview:titleBar];
    [titleBar.backBtn addTarget:self action:@selector(backbutton:) forControlEvents:UIControlEventTouchUpInside];     
     */
}

/// 타이틀스트링 이미지 뷰 테그 
#define NAVI_TITLE_IMAGE_tag        0x1000
/// 타이틀 "Back" 버튼 테그 
#define NAVI_BACK_BUTTON_tag  NAVI_TITLE_IMAGE_tag + 1

/**
 @brief 타이틀바를 만든다
 */
-(void)MakeTitleBar{
    CGRect frame = self.navigationController.navigationBar.frame; 
    frame.size.height = 55+77; // 높이 
    self.navigationController.navigationBar.frame = frame;
    
    UIButton* backBtn = (UIButton*)[self.navigationController.navigationBar viewWithTag:NAVI_BACK_BUTTON_tag];
    
    if(backBtn == nil){
        backBtn = [[UIButton alloc] initWithFrame:CGRectMake(18, 64, 57, 57)];
        backBtn.backgroundColor = [UIColor clearColor];
        [backBtn setImage:[UIImage imageNamed:@"common_btn_front_nor"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"common_btn_front_sel"] forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(backbutton:) forControlEvents:UIControlEventTouchUpInside];
        backBtn.tag = NAVI_BACK_BUTTON_tag;
        [self.navigationController.navigationBar addSubview:backBtn];
    }    
}

#pragma mark- 타이틀바 텍스트 이미지설정
/**
 @brief 상단 타이틀명 이미지를 설정
 @param image : 타이틀명 이미지
 */
-(void)settitleImage:(UIImage*)image
{
    //[titleBar.titleText setImage:image];
}

#pragma mark- 타이틀바 텍스트 설정
/**
 @brief 상단 타이틀명 설정
 @param text:타이틀 스트링
 */
-(void)settitleText:(NSString*)text
{
    [titleBar.titleText setText:text];
}

/**
 @brief back 버튼 클릭 이벤트
 @param btn: 버튼 포인터
 */
-(void)backbutton:(UIButton*)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 @brief 타이틀바 show/hide
 @param mode:Y/N
 */
-(void)titleBarShow:(BOOL)mode
{
    self.titleBar.hidden = mode;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return NO;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    titleBar = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
