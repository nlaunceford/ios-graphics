//
//  HxBoard.h
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HxBoard : NSObject

+ (instancetype) boardWithHexSideSize:(float)hexSideSize
                                       withBoardWidth:(int)boardWidth
                                       withBoardHeight:(int)boardHeight
                                       withOffsetX:(int)xOffset
                                       withOffsetY:(int)yOffset;

- (void) draw;

@end
