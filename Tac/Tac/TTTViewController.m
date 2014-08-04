//
//  TTTViewController.m
//  Tac
//
//  Created by Merritt Tidwell on 7/29/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import "TTTViewController.h"
#import "TTTTouchSpot.h"
@interface TTTViewController ()

@end

@implementation TTTViewController

{
    NSMutableArray * spots;
    
    BOOL player1Turn;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        spots = [@[]mutableCopy];
        
        player1Turn = YES;
        
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
            
            [spots addObject:spot];
            
            
            
            //run for each col in each row
        }
    }
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // NSLog(@"touched");
    
    UITouch * touch = [touches allObjects][0];
    
    NSLog(@"%d",spots.count);
    
    int spotWH = 80;
    for (TTTTouchSpot * spot in spots)
    {
        CGPoint location= [touch locationInView:spot];
        
        // x >= 0
        // y >= 0
        
        
        // x <= spotWH
        // y <= spotWH
        
        if (location.x >= 0 && location.y >= 0)
            if (location.x <= spotWH && location.y <= spotWH) {
                
                
                if(spot.player==0)
                {
                    
                    NSLog(@"%@", spot);
                    
                    spot.player = (player1Turn) ? 1 :2;
                    player1Turn=!player1Turn;
                    [self checkForWinner];
                }
                
                
            }
        //NSLog(@"x: %f y :%f", location.x,location.y);
    }
    
    
    
    
}

-(void)checkForWinner
{
    NSArray * possibilites = @[
                               @[@0,@1,@2],
                               @[@3,@4,@5],
                               @[@6,@7,@8],
                               @[@0,@3,@6],
                               @[@1,@4,@7],
                               @[@2,@5,@8],
                               @[@0,@4,@8],
                               @[@2,@4,@6]
                               ];
    
    BOOL winner = NO;

for (NSArray * possibility in possibilites)

    {
        TTTTouchSpot * spot0 = spots[[possibility[0]intValue]];
        TTTTouchSpot * spot1 = spots[[possibility[1] intValue]];
        TTTTouchSpot * spot2 = spots[[possibility[2] intValue]];
    
    if(spot0.player ==spot1.player && spot1.player == spot2.player && spot0 != 0)
        
    {
        winner = YES;
    NSLog(@"player %d won"spot0.player);
        UIAlertView  * alert = [[UIAlertView alloc] initwithTitle:@"Winner" message:[NSStringWithFormat:"Player %d Won",spot0.player]
                                [alert show];
    }
    }

     for(TTTTouchSpot * spot in spots)
                                if (spot.player==0)
                                emptySpots++;
                                
                                
                                if (emptySpots ==0 && !winner)
                                {
                                //draw
                                    UIAlertView  * alert = [[UIAlertView alloc] initwithTitle:@"Winner" message:[NSStringWithFormat:"Player %d Won",spot0player]
                                                            [alert show];

    
                                    
                                
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
