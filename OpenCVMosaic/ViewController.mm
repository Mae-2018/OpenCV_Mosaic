//
//  ViewController.m
//  OpenCVMosaic
//
//  Created by Mae on 2019/3/8.
//  Copyright © 2019年 Mae. All rights reserved.
//

#import "ViewController.h"
#import "MosaicTool.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)naturalPic:(id)sender {
    self.imageView.image = [UIImage imageNamed:@"Image"];
}
- (IBAction)Mosaic:(id)sender {
    self.imageView.image = [MosaicTool opencvImage:self.imageView.image level:30];
}


@end
