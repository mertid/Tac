//
//  TTTGameData.h
//  Tac
//
//  Created by Merritt Tidwell on 8/28/14.
//  Copyright (c) 2014 Merritt Tidwell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTTGameData : NSObject

+ (TTTGameData *)mainData;
@property (nonatomic) NSMutableArray * spots;
@property (nonatomic) BOOL player1Turn;


-(void)checkForWinner;
@end
