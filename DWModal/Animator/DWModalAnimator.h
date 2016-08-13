//
//  DWModalAnimator.h
//  AlterDemo
//
//  Created by Damon on 16/8/4.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalAnimatorProtocol.h"




@interface DWModalAnimator : NSObject <DWModalAnimatorProtocol>

//+()

+(id)animatorWithStyle:(DWModelStyle)style;


@end
