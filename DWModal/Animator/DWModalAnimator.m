//
//  DWModalAnimator.m
//  AlterDemo
//
//  Created by Damon on 16/8/4.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalAnimator.h"

@interface DWModalBounceAnimator : DWModalAnimator @end

@interface DWModalFadeAnimator   : DWModalAnimator @end

@implementation DWModalAnimator

+ (id)animatorWithStyle:(DWModelStyle)style{

    switch (style) {
        case DWModalBounce:{
            return [[DWModalBounceAnimator alloc] init];
            break;
        }
        case DWModalFade:{
            return [[DWModalFadeAnimator alloc] init];
            break;
        }
        default:{
            return [[DWModalAnimator alloc] init];
            break;
        }
    }
}


#pragma mark - DWModalAnimatorProtocol
- (void)modalController:(UIViewController *)controller
             completion:(DWCompletionHandler)completion{

    [NSException raise:DWModalExceptionMethodNotImplemented format:@"-[%@ modalController:completion:] must be completion", NSStringFromClass([self class])];
}


- (void)dismissController:(UIViewController *)controller
               completion:(DWCompletionHandler)completion{

    [NSException raise:DWModalExceptionMethodNotImplemented format:@"-[%@ dismissController:completion:] must be completion", NSStringFromClass([self class])];


}
#pragma mark - CAAnimationDelegate

DWCompletionHandler completion = ^(){};

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    DWCompletionHandler completion = [anim valueForKey:@"completion"];

    if (!completion) { return; }
    anim = nil;

    completion();
}

@end

@implementation DWModalBounceAnimator

- (void)modalController:(UIViewController *) controller
             completion:(DWCompletionHandler)completion{



    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.fillMode = kCAFillModeBoth;
    animation.duration = DWModalDefaultShowDuration;
    animation.removedOnCompletion = YES;
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 0.01f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.1f)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 0.9f)],
                         [NSValue valueWithCATransform3D:CATransform3DIdentity]];

    animation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    __weak typeof(self) weakSelf = self;
    animation.delegate = weakSelf;
    [animation setValue:completion forKey:@"completion"];
    [controller.view.layer addAnimation:animation forKey:@"BounceAnimator"];
}


- (void)dismissController:(UIViewController *) controller
               completion:(DWCompletionHandler)completion{

    controller.view.transform = CGAffineTransformMakeScale(0.00, 0.00);

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values   = @[ @(1), @(1.2), @(0.00) ];
    animation.keyTimes = @[ @(0), @(0.4), @(1) ];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = DWModalDefaultDismissDuration;
    animation.removedOnCompletion = YES;
    __weak typeof(self) weakSelf = self;
    animation.delegate = weakSelf;
    [animation setValue:completion forKey:@"completion"];
    [controller.view.layer addAnimation:animation forKey:@"BounceAnimator"];
    controller.view.transform = CGAffineTransformMakeScale(0.01, 0.01);

}

@end

@implementation DWModalFadeAnimator

- (void)modalController:(UIViewController *) controller
             completion:(DWCompletionHandler)completion{

    CAAnimationGroup *group = [CAAnimationGroup animation];

    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = @1.2;
    animation1.toValue = @1;

    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.fromValue = @0;
    animation2.toValue = @1;

    group.animations = @[animation1,animation2];
    group.delegate = self;
    group.removedOnCompletion = YES;
    group.duration = DWModalDefaultDismissDuration;

    [group setValue:completion forKey:@"completion"];
    [controller.view.layer addAnimation:group forKey:@"FadeAnimator"];

}


- (void)dismissController:(UIViewController *) controller
               completion:(DWCompletionHandler)completion{

    controller.view.alpha = 0;
    CAAnimationGroup *group = [CAAnimationGroup animation];

    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = @1;
    animation1.toValue = @1.2;

    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.fromValue = @1;
    animation2.toValue = @0;

    group.animations = @[animation1,animation2];
    group.delegate = self;
    group.removedOnCompletion = YES;
    group.duration = DWModalDefaultDismissDuration;

    [group setValue:completion forKey:@"completion"];
    [controller.view.layer addAnimation:group forKey:@"FadeAnimator"];
    
}

@end
