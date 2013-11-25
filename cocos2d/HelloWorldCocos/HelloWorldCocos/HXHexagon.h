//
//  HXHexagon.h
//  HelloWorldCocos
//
//  Created by Nic Launceford on 11/22/13.
//  Copyright (c) 2013 Nic Launceford. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HXHexagon : NSObject
+ (instancetype)HexagonWithSideLength:(float)sideLength withOriginX:(float)x withOriginY:(float)y;
- (void) draw;
- (CGPoint) upperLeftPoint;
- (CGPoint) upperRightPoint;
- (CGPoint) middleRightPoint;
- (CGPoint) lowerRightPoint;
- (CGPoint) lowerLeftPoint;
- (CGPoint) middleLeftPoint;
@end
