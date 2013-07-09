//
//  FoodGameController.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PopupViewController.h"

@interface FoodGameController : BaseViewController{
    NSString *typeName;
    
    NSMutableArray *imageArr;
    NSMutableArray *textArr;
    NSMutableArray *imageIndex;
    NSMutableArray *nextIndex;
    
    int upIndex;
    int downIndex;
    bool bEnd;
        
    //터치 안되게 막기위한 뷰
    PopupViewController *popupView;
    
    UITapGestureRecognizer *tapGestureRecognizer;
}

//타입
@property (nonatomic, copy) NSString *typeName;
//상단 이미지
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *upImage;
//상단 텍스트
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *upTextImage;
//하단 이미지
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *downImage;
//하단 텍스트
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *downTextImage;

- (void)suffleImage;

- (void)showRound:(int) nRound;

- (void)tappedFood:(UITapGestureRecognizer*) tgs;

- (void)chooseImage:(int) nSelectedIndex;

@end
