//
//  ViewController.m
//  AlertAndGesture
//
//  Created by geon hui kim on 2016. 10. 27..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIImagePickerController *image1;
@property UIImagePickerController *image2;
@property UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *mainimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [mainimage setImage:[UIImage imageNamed:@"원피스"]];
    [mainimage setUserInteractionEnabled:YES];
    [self.view addSubview:mainimage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchesForView:)];
    [mainimage addGestureRecognizer:tap];

}

- (void)touchesForView:(UITapGestureRecognizer *)sender
{
    //핸들러
    void (^handblock)(UIAlertAction *) = ^(UIAlertAction * _Nonnull action) {
        if ([action.title isEqualToString:@"라이브러리"]) {
            
            NSLog(@"라이브러리를 선택했습니다.");
            self.image1 = [[UIImagePickerController alloc]init];
            self.image1.delegate = self;
            self.image1.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:self.image1 animated:YES completion:nil];
            
        }else if ([action.title isEqualToString:@"사진앨범"]) {
            NSLog(@"사진앨범을 선택했습니다.");
            self.image2 = [[UIImagePickerController alloc]init];
            self.image2.delegate = self;
            self.image2.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            [self presentViewController:self.image2 animated:YES completion:nil];
            
        }else if ([action.title isEqualToString:@"카메라"]) {
            NSLog(@"카메라를 선택했습니다.");
            
        }else {
            NSLog(@"취소하였습니다.");
        }
    };
    
    UIAlertController *mainAlert = [UIAlertController alertControllerWithTitle:@"사진소스 가져오기"
                                                                       message:@"사진소스별로 가져오기 하시겠습니다까"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *mainAction = [UIAlertAction actionWithTitle:@"라이브러리"
                                                         style:UIAlertActionStyleDefault
                                                       handler:handblock];
    
    UIAlertAction *mainAction1 = [UIAlertAction actionWithTitle:@"사진앨범"
                                                         style:UIAlertActionStyleDefault
                                                       handler:handblock];

    UIAlertAction *mainAction2 = [UIAlertAction actionWithTitle:@"취소"
                                                         style:UIAlertActionStyleCancel
                                                       handler:handblock];

    UIAlertAction *mainAction3 = [UIAlertAction actionWithTitle:@"카메라"
                                                          style:UIAlertActionStyleDefault
                                                        handler:handblock];

    [mainAlert addAction:mainAction];
    [mainAlert addAction:mainAction1];
    [mainAlert addAction:mainAction2];
    [mainAlert addAction:mainAction3];
    
    [self presentViewController:mainAlert animated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        self.imageview.image = image;
        [self.imageview setContentMode:UIViewContentModeScaleToFill];
        
    }else if (picker.sourceType == UIImagePickerControllerSourceTypeSavedPhotosAlbum) {
        self.imageview.image = image;
        [self.imageview setContentMode:UIViewContentModeScaleToFill];
    }
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
