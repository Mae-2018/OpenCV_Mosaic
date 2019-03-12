//
//  MosaicTool.h
//  OpenCVMosaic
//
//  Created by Mae on 2019/3/8.
//  Copyright © 2019年 Mae. All rights reserved.
//

#import <Foundation/Foundation.h>
//导入OpenCV头文件
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/highgui.hpp>
#import <opencv2/core/types.hpp>





@interface MosaicTool : NSObject
+ (UIImage *)opencvImage:(UIImage *)image level:(int)level;
@end


