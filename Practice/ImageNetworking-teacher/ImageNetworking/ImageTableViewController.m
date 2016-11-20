//
//  ImageTableViewController.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

//imageview, imagetableview를 임폴트
#import "ImageTableViewController.h"
#import "ImageViewController.h"

@interface ImageTableViewController ()

//이미지 피커와 네비게이션바를 사용하기위한 델리게이트 프로토콜
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//배열
@property (nonatomic, readonly) NSArray *imageInfos;

@end

@implementation ImageTableViewController

#pragma mark - Properties

//userinformation에 들어있는 것을 return으로 imageinfos에 배열로 넣어준다.
- (NSArray *)imageInfos {
    return [[UserInformation sharedUserInfo] imageInfoJSONArray];
}

#pragma mark - ViewController Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
 
    //이미지 업로드 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadTableViewData)
                                                 name:ImageListUpdatedNotification
                                               object:nil];
    
    //이미지 업로드 완료 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:[RequestObject class]
                                             selector:@selector(requestImageList)
                                                 name:ImageUploadDidSuccessNotification
                                               object:nil];
    
    //uitableview에 프로퍼티로 지정되어있음 로딩 표시
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.tintColor = [UIColor redColor];
    [self.refreshControl addTarget:[RequestObject class]
                            action:@selector(requestImageList)
                  forControlEvents:UIControlEventValueChanged];
}

//뷰가 나타난 후 동작되는 메서드
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //userinformation싱글턴에 userid가 nil일 경우 / 아무런 데이터가 없을 경우
    //showuseridalert메서드를 실행
    if ([[UserInformation sharedUserInfo] userId] == nil) {
        [self showUserIdAlert];
    }
}

#pragma mark - Custom Methods

//테이블뷰 리로드하는 메서드
- (void)reloadTableViewData {
    //테이블뷰 리로드
    //테이블뷰 로딩 end
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

//유저아이디 얼럿띄우기 위한 메서드
- (void)showUserIdAlert {
    //얼럿컨트롤러
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"유저 ID 입력"
                                                                   message:@"유저 ID를 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    //얼럿 액션 핸들러
    id actionHandler = ^(UIAlertAction * _Nonnull action) {
        //얼럿텍스트필드의 텍스트길이가 0일때, 텍스트필드에 아무글씨도 없을때, 글자수가 0일때
        if (alert.textFields.firstObject.text.length == 0 ||
            [alert.textFields.firstObject.text containsString:@" "] ||
            [alert.textFields.firstObject.text integerValue] == 0) {
            //다시 이메서드를 실행시킴
            [self showUserIdAlert];
            //그외의 다른 경우 일때
        } else {
            //싱글턴의 userid에 얼럿의 텍스트필드에 입력된 userid를 저장한다.
            [[UserInformation sharedUserInfo] setUserId:alert.textFields.firstObject.text];
            //입력된 텍스트를 네비게이션 바의 타이틀에 넣어준다
            self.navigationItem.title = alert.textFields.firstObject.text;
            //싱글턴 메서드 실행
            [RequestObject requestImageList];
        }
    };
    
    //얼럿 액션, 핸들러 실행
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler: actionHandler];
    
    //얼럿안의 텍스트필드 추가
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        //텍스트필드 안의 안내글, 키보드타입
        textField.placeholder = @"100~150 사이의 숫자";
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    //얼럿위의 액션 추가
    [alert addAction:okAction];
    
    //뷰위에 올림
    [self presentViewController:alert animated:YES completion:nil];
}

//사진을 가져올때 사진에 대한 정보입력 얼럿
- (void)showImageTitleAlert:(UIImage *)image {
    //얼럿
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진제목"
                                                                   message:@"사진제목을 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    //확인버튼 액션 핸들러
    id okHandler = ^(UIAlertAction * _Nonnull action) {
        //텍스트필드의 텍스트길이가 0일때, 텍스트에 값이 nil일때
        if (alert.textFields.firstObject.text.length == 0 ||
            alert.textFields.firstObject.text == nil) {
            //메서드 재시작
            [self showImageTitleAlert:image];
            //위와 다른 조건일때, 값이 있을경우
        } else {
            //스트링객체에 텍스트필드의 텍스트를 담는다.
            //requestobject싱글턴 메서드를 실행
            NSString *imageTitle = alert.textFields.firstObject.text;
            [RequestObject requestUploadImage:image title:imageTitle originImageId:nil];
        }
    };
    
    //확인, 취소 액션
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler: okHandler];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    //액션 추가
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    
    //얼럿에 텍스트필드 추가
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진제목";
    }];
    
    //뷰위에 올림
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - IBActions
//네비게이션바의 업로드 버튼 눌럿을경우 동작되는 메서드
- (IBAction)clickUploadImageButton:(id)sender {
    //피커 객체 생성
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    //델리게이트와 타입지정
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //뷰위에 생성
    [self presentViewController:imagePicker animated:YES completion:nil];
}

//이미지 리프레쉬 버튼눌렀을경우 동작되는 메서드
- (IBAction)clickRefeshImageListButton:(id)sender {
    //싱글턴 메서드 구현
    [RequestObject requestImageList];
}

#pragma mark - Image picker controller delegate
//이미지피커에서 사진선택완료했을경우 동작되는 메서드
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //이미지담을 객체 하나를 만든다.
    UIImage *image = nil;
    //info가 편집된 사진이면
    if (info[UIImagePickerControllerEditedImage]) {
        //이미지객체에 편집된 이미지를 넣어준다.
        image = info[UIImagePickerControllerEditedImage];
    } else {//아닐경우
        //이미지객체에 원본이미지를 넣어준다.
        image = info[UIImagePickerControllerOriginalImage];
    }
    //이전화면으로 되돌아간다. completion일때 핸들러 구동
    [picker dismissViewControllerAnimated:YES completion:^{
                                   //사진정보입력하는 메서드 구동
                                   [self showImageTitleAlert:image];
                               }];
}

#pragma mark - Table view data source
//테이블뷰 섹션 갯수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//테이블뷰 로우 갯수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageInfos.count;
}
//테이블뷰 셀 정보
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //셀객체 생성, 재정의
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    
    //imageinfos배열을 딕셔너리 객체에 넣는다.
    //title스트링객체에 딕셔너리의 타이틀 키로 가져온다.
    //thumbnail스트링객체에 딕셔너리의 썸네일 키로 가져온다.
    //nsurl객체에 주소를 받은 스트링객체를 지정해준다. thumbnailurlstring
    NSDictionary *imageInfo = [self.imageInfos objectAtIndex:indexPath.row];
    NSString *title = [imageInfo objectForKey:JSONTitleKey];
    NSString *thumbnailURLString = [imageInfo objectForKey:JSONTumbnailURLKey];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    id imageHandler = ^(NSData * _Nullable data,NSURLResponse * _Nullable response,NSError * _Nullable error) {
        //data일때
        if (data) {
            //이미지 객체에 데이터를 uiimage데이터로 바꿔서 넣어준다.
            UIImage *image = [UIImage imageWithData:data];
            //image일때
            if (image) {
                //비동기,
                dispatch_async(dispatch_get_main_queue(), ^{
                    //셀을 추가, 사진
                    UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
                    cellForUpdate.imageView.image = image;
                });
            }
        }
    };
    //세션 태스크 객체를 만들어준다.
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL
                                                         completionHandler:imageHandler];
    //실행
    [task resume];
    //셀 타이틀 넣기
    [[cell textLabel] setText:title];
    return cell;
}

// Override to support conditional editing of the table view. // 테이블뷰 편집가능여부
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view. //편집내용
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //편집스타일이 셀삭제일경우
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //딕셔너리 객체에 self.imageinfos배열의 인덱스 순서대로
        NSDictionary *imageInfo = self.imageInfos[indexPath.row];
        //싱글턴 메서드 실행
        [RequestObject requestDeleteImage:imageInfo[JSONImageIDKey]];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//세그동작 메서드
//테이블뷰에서 선택된 이미지를 다음화면에서 띄우게 하는 메서드
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //테이블뷰객체에 sender를 넣어준다.
    UITableViewCell *cell = sender;
    //인덱스패스 객체에 테이블뷰의 셀을 넣어준다.
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    //딕셔너리 객체에 테이블뷰의 인덱스패스 순서를 넣어준다.
    NSDictionary *imageInfo = self.imageInfos[cellIndex.row];
    //ImageViewController클래스 객체를 만들어서 세그의 연결될화면을 넣어준다.
    ImageViewController *nextViewController = segue.destinationViewController;
    //다음화면의 imageinfo에 딕셔너리 데이터를 넣어준다.
    nextViewController.imageInfo = imageInfo;
}



@end
