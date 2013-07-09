//
//  FoodGameController.m
//  FoodWorldCup
//
//  Created by Joseph Kang on 12. 4. 11..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "FoodGameController.h"
#import "WinViewController.h"

@interface FoodGameController ()

@end

@implementation FoodGameController

@synthesize typeName;
@synthesize upImage;
@synthesize downImage;
@synthesize upTextImage;
@synthesize downTextImage;

- (void)dealloc{
    [imageArr release];
    [textArr release];
    [imageIndex release];
    [nextIndex release];
    [popupView release];
    
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
    
    popupView = [[PopupViewController alloc] init];		
    [self.view addSubview:popupView.view];	
    popupView.view.hidden = YES;		
    
    imageArr = [[NSMutableArray alloc] init];
    textArr = [[NSMutableArray alloc] init];
    imageIndex = [[NSMutableArray alloc] init];
    nextIndex = [[NSMutableArray alloc] init];
    
    upIndex = 0;
    downIndex = 0;
    bEnd = false;
    
    for(int i = 1; i<33; i++){
        //음식 이미지
        NSString *fileName = [NSString stringWithFormat:@"%@Food%d", typeName, i];
        NSString *typeFile = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
        UIImage *imageBg = [[UIImage alloc] initWithContentsOfFile:typeFile];
        NSLog(@"fileName : %@", fileName);
        
        //음식 텍스트        
        NSString *textName = [NSString stringWithFormat:@"%@Text%d", typeName, i];
        NSString *typeTextFile = [[NSBundle mainBundle] pathForResource:textName ofType:@"png"];
        UIImage *textBg = [[UIImage alloc] initWithContentsOfFile:typeTextFile];
        NSLog(@"textName : %@", textName);
        
        NSNumber *imgNumber = [[NSNumber alloc] initWithInt:i-1];
        [imageIndex addObject:imgNumber];
        
        if(imageBg != nil){
            [imageArr addObject:imageBg];
        }
        
        if(textBg != nil){
            [textArr addObject:textBg];
        }
        
        NSLog(@"imageArr : %d", [imageArr count]);
        NSLog(@"textArr : %d", [textArr count]);
    }
    
    NSLog(@"image : %d", [imageIndex count]);
    NSLog(@"imageArr : %d", [imageArr count]);
    NSLog(@"textArr : %d", [textArr count]);
        
    [self showRound:16];
}

- (void)showRound:(int)nRound
{
    upImage.hidden = YES;
    upTextImage.hidden = YES;
    downImage.hidden = YES;
    downTextImage.hidden = YES;
    
    UIImageView *roundImage = [[UIImageView alloc] init];
    roundImage.frame = CGRectMake(320, 200, 144, 75);
    NSString *strRound = [NSString stringWithFormat:@"%dgang.png", nRound ];
    [roundImage setImage:[UIImage imageNamed:strRound]];
    [self.view addSubview:roundImage];
    
    [UIView beginAnimations:nil context:roundImage];
    [UIView setAnimationDuration:2.0f];
    [UIView setAnimationRepeatCount:1]; 
    [roundImage setTransform:CGAffineTransformMakeTranslation(-470.0f, 0.0f)];
    [UIView commitAnimations];	
    
    popupView.view.hidden = NO;
        
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(suffleImage) userInfo:nil repeats:NO];    
}

- (void)suffleImage{
    tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedFood:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    popupView.view.hidden = YES;

    upImage.hidden = NO;
    upTextImage.hidden = NO;
    downImage.hidden = NO;
    downTextImage.hidden = NO;
            
    NSUInteger randomIndex = arc4random() % [imageIndex count];
    upIndex = [[imageIndex objectAtIndex:randomIndex] intValue];
    NSLog(@"Up imgRnd : %d", upIndex); 
    
    [imageIndex removeObjectAtIndex:randomIndex];
    
    //상단 이미지, 텍스트
    [upImage setImage:[imageArr objectAtIndex:upIndex]];
    [upTextImage setImage:[textArr objectAtIndex:upIndex]];
    
    
    randomIndex = arc4random() % [imageIndex count];
    downIndex = [[imageIndex objectAtIndex:randomIndex] intValue];
    NSLog(@"Down imgRnd : %d", downIndex); 
    
    [imageIndex removeObjectAtIndex:randomIndex];
    
    //하단 이미지, 텍스트                
    [downImage setImage:[imageArr objectAtIndex:downIndex]];
    [downTextImage setImage:[textArr objectAtIndex:downIndex]];
}

- (void)chooseImage:(int)nSelectedIndex{
    NSNumber *selectedNumber = [[NSNumber alloc] initWithInt:nSelectedIndex];
    [nextIndex addObject:selectedNumber];
    
    if([nextIndex count] == 8)        //8강 완료시점 생성 
        [imageIndex removeAllObjects];
        
    if([imageIndex count] == 0){
        int nRound = [nextIndex count];        
        if(nRound == 8 || nRound == 4 || nRound == 2) {
            [imageIndex release];
            imageIndex = [[NSMutableArray alloc] initWithArray:nextIndex copyItems:TRUE];
            [nextIndex removeAllObjects];
            
            [self showRound:nRound];
        }
        else{
            //ending
            NSLog(@"The End");
            bEnd = true;
            WinViewController *winView = [[WinViewController alloc] initWithNibName:@"WinViewController" bundle:nil];
            winView.titleName = [NSString stringWithFormat:@"%@Text%d", typeName, nSelectedIndex + 1];
            winView.imageName = [NSString stringWithFormat:@"%@Food%d", typeName, nSelectedIndex + 1];
            
            [self.navigationController pushViewController:winView animated:YES];
        }
        
    }else 
        [self suffleImage];        
}

- (void)viewDidUnload{
    [self setUpImage:nil];
    [self setDownImage:nil];
    [self setUpTextImage:nil];
    [self setDownTextImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
} 

- (void)tappedFood:(UITapGestureRecognizer *)tgs {
    if(bEnd) return;
    
    if(tgs.state == UIGestureRecognizerStateRecognized) {
        CGPoint p = [tgs locationInView:tgs.view];
        NSLog(@"%@ Tapped!", NSStringFromCGPoint(p));
        
        if((self.view.frame.size.height / 2) > p.y) {
            NSLog(@"Up %d", upIndex);
            [self chooseImage:upIndex];
        }
        else{
            NSLog(@"Down %d", downIndex);
            [self chooseImage:downIndex];
        }  
    }    
}

@end
