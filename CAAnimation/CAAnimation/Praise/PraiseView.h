//
//  PraiseView.h
//  CAAnimation
//
//  Created by changbo on 2019/9/24.
//  Copyright © 2019 CB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PraiseView : UIView

// YES 只有喷射效果，NO 只有动态效果没有喷射效果
@property (nonatomic,assign) BOOL isExplosion;

// YES(取消和确定)都带喷射效果，NO只有(确定)有喷射效果
@property (nonatomic,assign) BOOL isExpSure;

- (void)setBtnImage:(UIImage *)aImage selectImage:(UIImage *)selectImage;
@end

NS_ASSUME_NONNULL_END
