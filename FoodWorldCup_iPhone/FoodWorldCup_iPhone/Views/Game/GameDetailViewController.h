//
//  GameDetailViewController.h
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 5. 6..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

typedef struct _Canvas{				//왼쪽에 위치한 
	int state;
	UIImageView *view;
	int imgIndex;
	int location;
	
}Canvas;

@interface GameDetailViewController : BaseViewController{
    //벌칙 인원수
    NSString *peopleNumber;
    NSInteger people;
    
    //펼쳐진 카드
    UIImageView *cardImage[9];
    
    //O Image
    UIImage *chooseImage[9];
	Canvas okRoom[9];
    
    //랜덤으로 섞인 부분의 실제 인덱스
    int shuffledIndex[9];
    
    NSInteger cardNum;
    
    NSInteger touchCount;
    int touched_first;
    int touched_second;  
    int touched_index[2];
    
    NSMutableArray *imageArr;
}

@property (retain, nonatomic) IBOutlet UIButton *homeBtn;
- (IBAction)homeBtn:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *reActionBtn;
- (IBAction)reActionBtn:(id)sender;


@property (nonatomic, copy) NSString *peopleNumber;

- (void)gameStart;

-(void)ScrambleInit;
-(void)arrayRandom:(Canvas*)sel size:(int)size range:(int)range;

@end
