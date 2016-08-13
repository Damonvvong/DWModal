//
//  DWModalPresentationController.m
//  AlterDemo
//
//  Created by Damon on 16/8/4.
//  Copyright © 2016年 damonwong. All rights reserved.
//

#import "DWModalPresentationController.h"

@interface DWModalPresentationController ()

//@property (nonatomic, strong) UIView *backMaskView; /**< 背景蒙版 */

@property (nonatomic, assign) BOOL editing;/**< 正在编辑 */

@end

@implementation DWModalPresentationController

- (void)keyboardWillShow:(NSNotification *)notification{
	self.editing = YES;
}

- (void)keyboardWillhide:(NSNotification *)notification{
	self.editing = NO;
}
-(void)containerViewWillLayoutSubviews{
	
	[super containerViewWillLayoutSubviews];
	self.containerView.gestureRecognizers = nil;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillhide:) name:UIKeyboardWillHideNotification object:nil];
	[self.containerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dw_dismissPresent)]];
	[UIView animateWithDuration:DWModalDefaultShowDuration animations:^{
		self.containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
	}];
	
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)dw_dismissPresent{
	
	
	if(self.editing){
		[self.presentedViewController.view endEditing:YES];
	}else {
		self.containerView.gestureRecognizers = nil;
		[self.presentedViewController dismissViewControllerAnimated:true completion:^{
		}];
		[UIView animateWithDuration:DWModalDefaultDismissDuration animations:^{
			self.containerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.0];
		} completion:^(BOOL finished) {
			self.containerView.gestureRecognizers = nil;
		}];
	}
	
}

@end
