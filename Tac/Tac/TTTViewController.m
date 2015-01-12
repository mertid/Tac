//
//  TTTViewController.m
//  Tac
//
//  Created by Merritt Tidwell on 7/29/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//
#import "TTTGameData.h"
#import "TTTViewController.h"
#import "TTTTouchSpot.h"
@interface TTTViewController ()

@end

@implementation TTTViewController

{
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
                
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    
    int spotWH = 80;
    int padding = 20;
    int gridWH = (spotWH* 3) + (padding* 2);
    float spacingW = (SCREEN_WIDTH-gridWH)/2;
    float spacingH = (SCREEN_HEIGHT-gridWH)/2;
    
    
    
    for(int row = 0; row < 3; row++)
    {
        //run for each row
        
        for(int col=0; col<3; col++)
        {
            
            int x = (spotWH + padding) * col + spacingW;
            int y = (spotWH +padding) * row + spacingH;
            
            TTTTouchSpot * spot = [[TTTTouchSpot alloc]initWithFrame:CGRectMake(x, y, spotWH, spotWH) ];
            
         //   spot.backgroundColor = [UIColor lightGrayColor];
            spot.layer.cornerRadius = spotWH/6;
            
            spot.player = 0;
            
            [self.view addSubview:spot];
            
            [[TTTGameData mainData].spots addObject:spot];
            
            
            
            //run for each col in each row
        }
    }
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // NSLog(@"touched");
    
    UITouch * touch = [touches allObjects][0];
    
    NSLog(@"%d",[TTTGameData mainData].spots.count);
    
    int spotWH = 80;
    for (TTTTouchSpot * spot in [TTTGameData mainData].spots)
    {
        CGPoint location= [touch locationInView:spot];
     
        
        if (location.x >= 0 && location.y >= 0)
            if (location.x <= spotWH && location.y <= spotWH) {
                
                
                if(spot.player==0)
                {
                    
                    NSLog(@"%@", spot);
                    
                    spot.player = [TTTGameData mainData].player1Turn ? 1 :2;
                    
                    
                    [TTTGameData mainData].player1Turn=![TTTGameData mainData].player1Turn;
                    
                    [[TTTGameData mainData] checkForWinner];
                }
                
                
            }
        //NSLog(@"x: %f y :%f", location.x,location.y);
    }
    
    
    
    
}

                                
//ui alertview for winner or dreae


// make this work for every case
/*
 
 012
 345
 678
 036
 147
 258
 048
 246
 
 */


@end
