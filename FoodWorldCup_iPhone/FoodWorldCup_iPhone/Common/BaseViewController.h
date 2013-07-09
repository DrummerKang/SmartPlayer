//
//  BaseViewController.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 7..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

@interface BaseViewController : UIViewController{
    TitleView *titleView;
}

//TitleBarView
@property (nonatomic,retain) TitleView* titleBar;

/**
 @brief 타이틀바를 만든다
 */
- (void)MakeTitleBar;

#pragma mark- 타이틀바 텍스트 설정

/**
 @brief 상단 타이틀명 설정
 @param text:타이틀 스트링
 */
-(void)settitleText:(NSString*)text;

/**
 @brief 타이틀바 show/hide
 @param mode:Y/N
 */
-(void)titleBarShow:(BOOL)mode;

@end
