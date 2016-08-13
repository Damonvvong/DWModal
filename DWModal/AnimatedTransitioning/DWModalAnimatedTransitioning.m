//
//  DWModalAnimatedTransitioning.m
//  AlterDemo
//
//  Created by Damon on 16/8/4.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalAnimatedTransitioning.h"

@interface DWModalAnimatedTransitioning ()

@property (nonatomic, strong) DWModalAnimator *animator;/**< 动画控制器 */

@end



@implementation DWModalAnimatedTransitioning

+(instancetype)animatedTransitioningWithModelStyle:(DWModelStyle)style{

    DWModalAnimatedTransitioning *animatedTransition = [[DWModalAnimatedTransitioning alloc] init];
    animatedTransition.animator = [DWModalAnimator animatorWithStyle:style];
    return animatedTransition;
}


#pragma mark - UIViewControllerAnimatedTransitioning

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    if (self.presenting) {

        return DWModalDefaultShowDuration;

    }else{
        
        return DWModalDefaultDismissDuration;
    }

}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    UIViewController *fromeVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC    = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    if ((!fromeVC && !toVC) || ![transitionContext containerView]) return;

    if (!self.animator) {
        [NSException raise:DWModalExceptionPropertyIsNil format:@"-[The animator is nil] must given a value"];
    }

    if (self.presenting) {

        toVC.view.center = [transitionContext containerView].center;
        [[transitionContext containerView] addSubview:toVC.view];

        [self.animator modalController:toVC completion:^{
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];

    }else{

        [self.animator dismissController:fromeVC completion:^{

            [fromeVC.view removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

        }];

    }
}

@end
