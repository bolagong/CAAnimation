//
//  SlideMenuView.h
//  CAAnimation
//
//  Created by changbo on 2019/9/30.
//  Copyright © 2019 CB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideMenuView : UIView

@property (nonatomic,copy) NSArray<UIButton *> *menuItems;

- (void)showAcition;


@end

NS_ASSUME_NONNULL_END
