//
//  ImageTableViewController.m
//  NetworkingMiniProject2
//
//  Created by geon hui kim on 2016. 11. 16..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ImageTableViewController.h"

@interface ImageTableViewController ()
<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ImageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self.tableView
                                             selector:@selector(reloadData)
                                                 name:ImageListUpdatedNotification
                                               object:nil];
}

#pragma mark - id alert
//뷰가 나타날때 해줄 메서드
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //여기에 해도 무방함
    //if ([[[UserInformation sharedUserInfo]userId] isEqualToString:self.navigationItem.title] == NO)
    [self showUserIdAlert];
}
//얼럿을 띄우는 메서드
- (void)showUserIdAlert
{
    if ([[[UserInformation sharedUserInfo]userId] isEqualToString:self.navigationItem.title] == NO) {
        
        UIAlertController *userid = [UIAlertController alertControllerWithTitle:@"유저 ID"
                                                                        message:@"유저 id를 입력해주세요"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
        id actionHandler = ^(UIAlertAction * _Nonnull action) {
            if (userid.textFields.firstObject.text.length == 0 ||
                [userid.textFields.firstObject.text containsString:@" "] ||
                [userid.textFields.firstObject.text integerValue] == 0) {
                [self showUserIdAlert];
            }else {
                [[UserInformation sharedUserInfo] setUserId:userid.textFields.firstObject.text];
                
                self.navigationItem.title = userid.textFields.firstObject.text;
                
                //서버에게 사진을 가져오는 요청 메서드
                [RequestObject requestImageList];
            }
        };

        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                           style:UIAlertActionStyleDefault
                                                         handler:actionHandler];
        
        [userid addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"100~150입력";
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }];
        
        [userid addAction:okAction];
        [self presentViewController:userid animated:YES completion:nil];
    };
}

#pragma mark - memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button action
- (IBAction)clickRfeash:(id)sender
{
    //사진 리스트 재요청
    [RequestObject requestImageList];
}

- (IBAction)clickAdd:(id)sender
{
    //이미지 피커 보여주기
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:picker animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{

    UIImage *image = nil;
    
    if (info[UIImagePickerControllerEditedImage])
    {
        image = info[UIImagePickerControllerEditedImage];
    }else{
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목"
                                                                   message:@"사진 제목을 입력하세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    //핸들러..
    id nameHandler = ^(UIAlertAction * _Nonnull action)
    {
        if (alert.textFields.firstObject.text.length == 0) {
        }else{
            NSString *imageTitle = alert.textFields.firstObject.text;
            NSLog(@"사진 제목 : %@",imageTitle);
            
            //사진올리기
            [RequestObject requestUploadImage:image title:imageTitle];
        }
    };
    //ok 버튼
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nameHandler];
    //cancel 버튼
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"사진 제목";
    }];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

#pragma mark - Table view data source
//세션
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}
//로우
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [[[UserInformation sharedUserInfo] imageInfoList] count];
}
//셀 (중요 공부할것!!)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    
    //중요
    NSDictionary *imageInfoDic = [[[UserInformation sharedUserInfo] imageInfoList] objectAtIndex:indexPath.row];
    NSString *imageTitle = [imageInfoDic objectForKey:@"title"];
    NSString *thumbnailURLString = [imageInfoDic objectForKey:@"thumbnail_url"];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    //이미지를 보여지기
    id imageTaskHandler =  ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *image = [UIImage imageWithData:data];
        
        //main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
            cellForUpdate.imageView.image = image;
        });
    };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:thumbnailURL completionHandler:imageTaskHandler];
    
    [dataTask resume];
    
    [[cell textLabel] setText:imageTitle];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"displayImage" object:nil];
}


//셀을 에디트 하겟다.
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //서버에 삭제를 요청하기, 과제
        
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
