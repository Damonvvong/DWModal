//
//  DWModalAnimatedTransitioning.h
//  AlterDemo
//
//  Created by Damon on 16/8/4.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWModalConst.h"
#import "DWModalAnimator.h"

@interface DWModalAnimatedTransitioning : NSObject < UIViewControllerAnimatedTransitioning >


@property (nonatomic, assign) BOOL presenting; /**< 展示中 */

+(instancetype)animatedTransitioningWithModelStyle:(DWModelStyle)style;


@end
