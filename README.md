# CAAnimation
点赞动画，弹框动画，转场动画


### 自定义圆形转场动画

效果图：

![转场动画.gif](https://upload-images.jianshu.io/upload_images/5261964-ad39e9bf8daf8088.gif?imageMogr2/auto-orient/strip)


大致实现思路：
* 1.实现相关跳转的代理和协议。
* 2.添加 UIViewControllerAnimatedTransitioning 相关协议类。
* 3.在类协议里面实现要做的动画协议，然后转场动画。
* 4.通过查找最长半径，画两个圆，来实现动画。
* 5.动画结束后，通知上下文执行完成动画。


### 点赞动画

效果图：

![点赞动画.gif](https://upload-images.jianshu.io/upload_images/5261964-fc51926cb113cc1e.gif?imageMogr2/auto-orient/strip)


大致实现思路：
* 1.根据关键帧动画 CAKeyframeAnimation 修改 transform.scale 来实现 弹性效果。
* 2.添加粒子动画（CAEmitterLayer粒子发射器，CAEmitterCell粒子动画），设置粒子数量，发射位置，形状等。
* 3.添加动画到视图layer上。


### 弹窗动画

效果图：

![弹窗动画.gif](https://upload-images.jianshu.io/upload_images/5261964-5a89b515343d63cb.gif?imageMogr2/auto-orient/strip)


大致实现思路：
* 1.首先创建一个模糊视图和弹窗视图放到window上。
* 2.滑入滑出的时候通过修改坐标移动上下。
* 3.添加弹簧一样的动画效果,方法如下：
```
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion API_AVAILABLE(ios(7.0));
```
* 4.做两个辅助view，来获取弹簧幅度值。
* 5.通过频率计时器（CADisplayLink）来实时获取弹簧幅度值。


### 贝塞尔曲线的一些绘制和一些CA的内容

效果图：
![曲线绘制.gif](https://upload-images.jianshu.io/upload_images/5261964-c014c1e98f24d354.gif?imageMogr2/auto-orient/strip)


