//
//  DWModalAnimatorProtocol.h
//  AlterDemo
//
//  Created by Damon on 16/8/4.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalConst.h"

@protocol DWModalAnimatorProtocol <NSObject>

@required

- (void)modalController:(UIViewController *)controller
             completion:(DWCompletionHandler)completion;


- (void)dismissController:(UIViewController *)controller
               completion:(DWCompletionHandler)completion;
@end
