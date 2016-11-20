//
//  ImageViewController.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 12..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//스토리보드와 연결된 이미지뷰
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

#pragma mark - IBActions
//편집버튼눌렀을경우 메서드
- (IBAction)clickEditButton:(id)sender {
    //이미지피커 객체를 만든다.
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //델리게이트와 타입을 지정해준다.
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}
//이미지를 탭했을경우 메서드
- (IBAction)tapImageView:(id)sender {
    //네비게이션바를 숨김, 눌렀을 경우
    BOOL isNavibarHidden = self.navigationController.navigationBarHidden;
    //숨김해제
    [self.navigationController setNavigationBarHidden:!isNavibarHidden animated:YES];
}

#pragma mark - ViewController Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    //노티피케이션 받음
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveUploadImageSuccessNotification:)
                                                 name:ImageUploadDidSuccessNotification
                                               object:nil];
}
//뷰가 나타날때
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //이미지뷰에 이미지가 없을때
    if (self.imageView.image == nil) {
        //url객체에 이미지 데이터를 받는다.
        NSURL *imageURL = [NSURL URLWithString:self.imageInfo[JSONImageURLKey]];
        //loadImageFromURL메서드 실행
        [self loadImageFromURL:imageURL];
    }
}
//디얼록
- (void)dealloc {
    //노티피케이션 해제
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Image picker controller delegate
//이미지 선택했을때의 메서드
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //이미지객체를 만든다.
    UIImage *image = nil;
    //편집이미지일 경우
    if (info[UIImagePickerControllerEditedImage]) {
        //편집된 이미지를 이미지 객체에 넣어준다.
        image = info[UIImagePickerControllerEditedImage];
    } else {//다른 경우
        //원본 이미지를 이미지 객체에 넣어준다.
        image = info[UIImagePickerControllerOriginalImage];
    }
    //이전화면으로 완료했을경우 핸들러실행
    [picker dismissViewControllerAnimated:YES completion:^{
                                   //showImageTitleAlert 메서드 실행
                                   [self showImageTitleAlert:image];
                               }];
}

#pragma mark - Custom Methods
//이미지를 제대로 받았을 경우의 메서드
- (void)didReceiveUploadImageSuccessNotification:(NSNotification *)noti {
    NSLog(@"noti info %@",noti.userInfo);
    //노티가 userinfo일 경우
    if (noti.userInfo) {
        //스트링 객체에 url주소를 받아온다.
        NSString *imageURLString = noti.userInfo[JSONImageDataKey];
        //url스트링객체가 클래스가 스트링이 맞으면
        if ([imageURLString isKindOfClass:[NSString class]]) {
            //다음 메서드실행하고 스트링객체를 지정해준다.
            [self loadImageFromURL:[NSURL URLWithString:imageURLString]];
        }
    }
}
//이미지로드
- (void)loadImageFromURL:(NSURL *)imageURL {
    
    id imageHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //데이터일때
        if (data) {
            //이미지객체에 이미지데이터로 넣어준다.
            UIImage *image = [UIImage imageWithData:data];
            //이미지일때
            if (image) {
                //비동기
                dispatch_async(dispatch_get_main_queue(), ^{
                    //이미지뷰에 이미지를 넣어준다.
                    self.imageView.image = image;
                });
            }
        }
    };
    //태스크실행, 핸들러동작
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:imageURL
                                                         completionHandler:imageHandler];
    //싦행
    [task resume];

}
//사진얼럿 메서드
- (void)showImageTitleAlert:(UIImage *)image {
    //얼럿생성
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진제목"
                                                                   message:@"사진제목을 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    //ok버튼 액션 핸들러
    id okHandler = ^(UIAlertAction * _Nonnull action) {
        //얼럿 텍스트필드 텍스트길이가 0일때, 아무값도 없을때
        if (alert.textFields.firstObject.text.length == 0 ||
            alert.textFields.firstObject.text == nil) {
            //메서드 재실행
            [self showImageTitleAlert:image];
        } else {//다른조건일때
            //스트링객체에 텍스트필드의 텍스트를 넣어준다.
            NSString *imageTitle = alert.textFields.firstObject.text;
            //싱글턴 메서드실행
            [RequestObject requestUploadImage:image
                                        title:imageTitle
                                originImageId:self.imageInfo[JSONImageIDKey]];
        }
    };
    //확인,취소액션생성
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler: okHandler];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    //얼럿에 액션추가
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    
    //얼럿에 텍스트필드 추가
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
