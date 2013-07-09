//
//  TitleView.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 7..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleView : UIView

//백 버튼
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *backBtn;
//타이틀 텍스트
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *titleText;

@end
