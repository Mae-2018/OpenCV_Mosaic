//
//  MosaicTool.m
//  OpenCVMosaic
//
//  Created by Mae on 2019/3/8.
//  Copyright © 2019年 Mae. All rights reserved.
//

#import "MosaicTool.h"
#import <opencv2/imgproc/types_c.h>

using namespace cv;

@implementation MosaicTool
+ (UIImage *)opencvImage:(UIImage *)image level:(int)level{
    //将iOS图片转为OpenCV
    Mat met_image_src;
    UIImageToMat(image, met_image_src);
    
    //确定宽高
    int w = met_image_src.cols;
    int h = met_image_src.rows;
    
//    将图片转为RGB格式
    Mat mat_image_dst;
    cvtColor(met_image_src, mat_image_dst, CV_RGBA2RGB, 3);
    
    //为了不影响原来的图片，clone一份
   Mat mat_image_clone = mat_image_dst.clone();
    
    int x = w - level;
    int y = h - level;
    
    for (int i = 0; i < y ; i+= level) {
        for (int j = 0; j < x ; j+= level) {
            //创建一个矩形区域
            Rect2i mosaicRect = Rect2i(j,i,level,level);
//            给矩形区域填充数据
            Mat roi = mat_image_dst(mosaicRect);
            Scalar scalar =  Scalar(
                                       mat_image_dst.at<Vec3b>(i,j)[0],
                                       mat_image_dst.at<Vec3b>(i,j)[1],
                                       mat_image_dst.at<Vec3b>(i,j)[2]
            );
            Mat roiCopy = Mat(mosaicRect.size(),CV_8UC3,scalar);
            roiCopy.copyTo(roi);
        }
    }
    return MatToUIImage(mat_image_dst);
}
@end
