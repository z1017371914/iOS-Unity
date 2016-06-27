//
//  MeiyuPushSdkC.m
//  MeiYuPushDemo
//
//  Created by qingyun on 3/31/14.
//  Copyright (c) 2014 qingyun. All rights reserved.
//

#import "MeiyuPushSdkC.h"
#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#include "HeadTransform.h"
#include "HeadTracker.h"
#include "CardboardSDK.h"
@interface MeiyuPushSdkC : NSObject
@property (strong, nonatomic) CMMotionManager *motionmanager;
@end


@implementation MeiyuPushSdkC
-(CMMotionManager *)motionmanager
{
    if (_motionmanager == nil) {
        _motionmanager = [[CMMotionManager alloc] init];
        if (_motionmanager.deviceMotionAvailable) {
            [_motionmanager startDeviceMotionUpdates];
        }
        
    }
    return _motionmanager;
}

@end
#if defined(__cplusplus)
extern "C"{
#endif
MeiyuPushSdkC *sdk = NULL;
CardboardSDK::HeadTransform *_headTranform = NULL;
CardboardSDK::HeadTracker *_headTracker = NULL;
void test(){
    if (sdk==NULL) {
        sdk = [[MeiyuPushSdkC alloc] init];
    }
    if (_headTracker == NULL) {
        _headTracker = new CardboardSDK::HeadTracker();
        _headTracker->startTracking([UIApplication sharedApplication].statusBarOrientation);
        NSLog(@"生成tracker");
    }
    if (_headTranform == NULL) {
        _headTranform = new CardboardSDK::HeadTransform();
    }
    _headTranform->setHeadView(_headTracker->lastHeadView());
    GLKVector3 attitude = _headTranform->eulerAngles();
    char arr[50];
    sprintf(arr, "%lf",attitude.x*180/M_PI);
    NSLog(@"%s",arr);
    UnitySendMessage("Main Camera", "testBtnResultPitch", arr);
    sprintf(arr, "%lf",attitude.y*180/M_PI);
    NSLog(@"%s",arr);
    UnitySendMessage("Main Camera", "testBtnResultRoll", arr);
    sprintf(arr, "%lf",attitude.z*180/M_PI);
    NSLog(@"%s",arr);
    UnitySendMessage("Main Camera", "testBtnResultYaw", arr);
}
#if defined(__cplusplus)
}
#endif

