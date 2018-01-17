//
//  ZRMultipleWaveLoadingView.m
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/19.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRMultipleWaveLoadingView.h"
#import "ZRMultipleWavePathMaker.h"
#import "UIView+GKExtension.h"
#import "OtherMacro.h"
#import "UIColor+Extension.h"
#import "XiuXiView.h"

@interface ZRMultipleWaveLoadingView (){
    ///上层x方向偏移量
    CGFloat _topXOffset;
    ///下层x方向偏移量
    CGFloat _bottomXOffset;
    ///y方向偏移量
    CGFloat _yOffset;
    ///y每次改变量
    CGFloat _yChangeValue;
}
@property (nonatomic,strong) CADisplayLink *displayLink;
@property (nonatomic,strong) CAShapeLayer *topWaveLayer;
@property (nonatomic,strong) CAShapeLayer *bottomWaveLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int timeCount;
@property (nonatomic, assign) int count;
/**
 波浪路径制造
 */
@property (nonatomic,strong) ZRMultipleWavePathMaker *pathMaker;
@end
@implementation ZRMultipleWaveLoadingView

- (instancetype)init{
    return [self initWithFrame:CGRectMake(0, 0, 150, 150)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (void)removeFromSuperview{
    [super removeFromSuperview];
    [_displayLink invalidate];
}
- (void)configView{
    self.layer.cornerRadius = self.height / 2;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithHexString:BLUE_COLOR].CGColor;
    [self setDefaultValues];
    [self configPathMaker];
    [self configWaveLayer];
    [self addSubview:self.progressLabel];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction)];
    if ([[UIDevice currentDevice].systemVersion floatValue]< 10.0) {
        _displayLink.frameInterval = 2;
    }else{
        _displayLink.preferredFramesPerSecond = 30;
    }
   [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timeCount = 0;
    self.count = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(repeatShowTime:) userInfo:@"admin" repeats:YES];
}

- (void)setDefaultValues{
    _topXOffset = 0;
    _bottomXOffset = self.width /  4;
    _yOffset = 0;
    _yChangeValue = 1/5.0;
    self.progress = 0;
}

- (void)configPathMaker{
    ZRMultipleWavePathMaker *pathMaker = [[ZRMultipleWavePathMaker alloc]initWithLimitSize:self.bounds.size waveHeight:self.height * 0.15];
    self.pathMaker = pathMaker;
}
- (void)configWaveLayer{
    UIColor *darkBlue = [UIColor colorWithRed:26 / 255.0 green:106 / 255.0 blue:239 / 255.0 alpha:1];
    self.bottomWaveLayer = [CAShapeLayer layer];
    _bottomWaveLayer.frame = self.bounds;
    _bottomWaveLayer.fillColor = darkBlue.CGColor;
    _bottomWaveLayer.strokeColor = darkBlue.CGColor;
    [self.layer addSublayer:_bottomWaveLayer];
    
    UIColor *blue = [UIColor colorWithHexString:BLUE_COLOR];
    self.topWaveLayer = [CAShapeLayer layer];
    _topWaveLayer.frame = self.bounds;
    _topWaveLayer.fillColor = blue.CGColor;
    _topWaveLayer.strokeColor = blue.CGColor;
    [self.layer addSublayer:_topWaveLayer];
}

- (void)displayLinkAction{
    //判断是否已经到达目标进度
    CGFloat targetYOffset = self.height * _progress;
    if (_yOffset < targetYOffset) {
        _yOffset += _yChangeValue;
        _pathMaker.yOffset = _yOffset;
    }else if (_yOffset >= self.height){
        _yOffset = self.height;
        _displayLink.paused = YES;
    }
    
    //改变x偏移量
    _topXOffset ++;
    _bottomXOffset += 2;
    if (_topXOffset > self.width) {
        _topXOffset = 0;
    }
    if (_bottomXOffset > self.width) {
        _bottomXOffset = 0;
    }
    
    [_pathMaker createPathWithXOffSet:_topXOffset];
    _topWaveLayer.path = _pathMaker.wavePath.CGPath;
    [_pathMaker createPathWithXOffSet:_bottomXOffset];
    _bottomWaveLayer.path = _pathMaker.wavePath.CGPath;
}

- (void)setProgress:(CGFloat)progress{
    if (_progress != progress) {
        _progress = MIN(MAX(progress, 0), 1);
    }
}

- (UILabel *)progressLabel{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
        _progressLabel.center = CGPointMake(self.width / 2, self.height / 2);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor blackColor];
    }
    return _progressLabel;
}

-(void)repeatShowTime:(NSTimer *)tempTimer {
    self.timeCount++;
    _progressLabel.text = [NSString stringWithFormat:@"%ds", self.timeCount];
    if (self.timeCount == 20) {
        [self timeCountStop];
        self.count ++;
    }
}

-(void)timeCountStop{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timeCount = 0;
    self.progressLabel.text = @"0s";
}

-(void)dealloc {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
