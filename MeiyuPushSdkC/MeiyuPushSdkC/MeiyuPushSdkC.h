//
//  MeiyuPushSdkC.h
//  MeiYuPushDemo
//
//  Created by qingyun on 3/31/14.
//  Copyright (c) 2014 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>


//#ifdef __cplusplus
//extern "C"
//{
//#endif
//    
//    void c_ctest();
//        
//#ifdef __cplusplus
//}

#if defined(__cplusplus)
extern "C"{
#endif
extern void UnitySendMessage(const char *, const char *, const char *);
void test();
#if defined(__cplusplus)
}
#endif

