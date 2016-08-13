//
//  DWModalTransitioningDelegate.m
//  AlterDemo
//
//  Created by Damon on 16/8/5.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalTransitioningDelegate.h"
#import "DWModalPresentationController.h"
#import "DWModalAnimatedTransitioning.h"

@interface DWModalTransitioningDelegate ()

@property (nonatomic, strong) DWModalAnimatedTransitioning  *animatedTransitioning;   /**<   */

@end

@implementation DWModalTransitioningDelegate

/**
 *  获得转场动画管理者
 *
 *  @param presented  要展示控制器
 *  @param presenting 展示中的控制器
 *  @param source     源控制器
 *
 *  @return 管理者
 */
-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {

    DWModalPresentationController *presentationController = [[DWModalPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];

    return presentationController;
}

#pragma mark - animator

/// 告诉系统谁来负责展现的样式

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {

    self.animatedTransitioning.presenting = YES;
    return self.animatedTransitioning;
}

/// 告诉系统谁来负责消失的样式

-(nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    self.animatedTransitioning.presenting = NO;
    return self.animatedTransitioning;

}

#pragma mark - getter && setter 

-(DWModalAnimatedTransitioning *)animatedTransitioning{

    if (!_animatedTransitioning) {
        _animatedTransitioning = [DWModalAnimatedTransitioning animatedTransitioningWithModelStyle:DWModelStyleValue];
    }
    return _animatedTransitioning;
}



@end
