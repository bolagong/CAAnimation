//
//  CircleTransition.h
//  CAAnimation
//
//  Created by changbo on 2019/10/9.
//  Copyright © 2019 CB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleTransition : NSObject<UIViewControllerAnimatedTransitioning>

// YES push进来，NO pop出去
@property (nonatomic,assign) BOOL isPush;

@end

NS_ASSUME_NONNULL_END
