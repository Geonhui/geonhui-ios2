//
//  ViewController.m
//  Networking Mini Project
//
//  Created by geon hui kim on 2016. 11. 15..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"
//#import "UserInformation.h"

@interface ViewController ()
<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property NSMutableArray *photoArray;
@property UITableView *mainTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //네비게이션 좌측
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                 target:self
                                                                                 action:nil];
    
    self.navigationItem.leftBarButtonItem = refreshItem;
    
    //네비게이션 우측
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(showimagepicker)];
    
    self.navigationItem.rightBarButtonItem = addItem;
    
    //테이블뷰
    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.mainTable setDelegate:self];
    [self.mainTable setDataSource:self];
    [self.view addSubview:self.mainTable];

    //로그인 얼럿
    UIAlertController *mainAlert = [UIAlertController alertControllerWithTitle:@"유저 ID 입력"
                                                                        message:@"유저 id를 입력해주세요"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *mainAction = [UIAlertAction actionWithTitle:@"확인"
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
             //얼럿안의 텍스트필드 접근
             UITextField *number = mainAlert.textFields.firstObject;
             NSLog(@"textfield : %@", number.text);

             //데이터 저장
             [[UserInformation ShardData] userData:[NSString stringWithFormat:@"%@", number.text]];

             //네비게이션 타이틀 저장된 데이터로 표현
             self.navigationItem.title = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"Number"]];
             NSLog(@"title : %@", self.navigationItem.title);
                                                        }];
    
    [mainAlert addAction:mainAction];
    
    [mainAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"100 ~ 150사이의 숫자";
    }];
    
    [self presentViewController:mainAlert animated:YES completion:nil];
    
    //저장할 어레이 생성
    self.photoArray = [[NSMutableArray alloc] init];
    
}

//세션
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//로우
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photoArray.count;
}

//셀
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        
        //딕셔너리 객체에 어레이의 들어잇는 딕셔너리 객체를 순서대로 가져온다.
        NSDictionary *dic = [self.photoArray objectAtIndex:indexPath.row];
        
        //위에서 만든 딕셔너리의 키값으로 가져온다.
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[dic objectForKey:@"photoName"]];
        cell.imageView.image = [dic objectForKey:@"photoImage"];
        
    }return cell;
}

//이미지피커
//photo 라이브러리 사용하도록 설정해주어야 한다. 접근허용
- (void)showimagepicker
{
    UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:type];
    [self presentViewController:picker animated:YES completion:nil];
}

//이미지피커 취소
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//이미지 가져오기
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    //이전화면
    [picker dismissViewControllerAnimated:YES completion:^{
    
        UIAlertController *photoAlert = [UIAlertController alertControllerWithTitle:@"사진제목"
                                                                            message:@"사진제목을 입력해 주십시오."
                                                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *photoAction1 = [UIAlertAction actionWithTitle:@"확인"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 //얼럿의 텍스트필드의 텍스트를 가져옴
                                                                 //이미지피커의 이미지를 가져옴
                                                                 UITextField *photoName = photoAlert.textFields.firstObject;
                                                                 UIImage *photoImage = info[UIImagePickerControllerOriginalImage];
                                                                 
                                                                 //이미지와 텍스트를 담을 딕셔너리객체를 만들어준다.
                                                                 //딕셔너리 객체에 텍스트와 이미지를 넣어준다.
                                                                 NSMutableDictionary *infoDic = [NSMutableDictionary new];
                                                                 [infoDic setObject:photoName.text forKey:@"photoName"];
                                                                 [infoDic setObject:photoImage forKey:@"photoImage"];

                                                                 //딕셔너리의 데이터를 셀프의 어레이에 넣는다.
                                                                 [self.photoArray addObject:infoDic];

                                                                 //테이블뷰 데이터를 다시 로드한다.
                                                                 [self.mainTable reloadData];
                                                                 
                                                             }];
        
        UIAlertAction *photoAction2 = [UIAlertAction actionWithTitle:@"취소"
                                                               style:UIAlertActionStyleCancel
                                                             handler:nil];
        
        [photoAlert addAction:photoAction1];
        [photoAlert addAction:photoAction2];
        
        //얼럿의 텍스트필드 생성
        [photoAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"사진제목";
        }];

        [self presentViewController: photoAlert animated:YES completion:nil];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
