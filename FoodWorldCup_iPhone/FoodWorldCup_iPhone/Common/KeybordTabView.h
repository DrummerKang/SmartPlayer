//
//  KeybordTabView.h
//  OllehSmarZone_iphone
//
//  Created by seo junghoon on 11. 11. 16..
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

/**
 @brief 키보드 클래스
 */

#import <UIKit/UIKit.h>

@interface KeybordTabView : UIView

@property (retain,nonatomic) UISegmentedControl *prevButton;
@property (retain,nonatomic) UISegmentedControl *nextButton;
@property (retain,nonatomic) UISegmentedControl *closeButton;

-(void)MaikePrev;
-(void)MaikeNext;
-(void)MaikeClose;
-(void)setEnabledPrev;
-(void)setEnabledNext;

@end
