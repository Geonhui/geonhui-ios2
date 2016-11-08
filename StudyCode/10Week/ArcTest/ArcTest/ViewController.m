//
//  ViewController.m
//  ArcTest
//
//  Created by geon hui kim on 2016. 11. 8..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//weak은 약한 연결
//연결이 되어도 retaincount가 증가되거나 감소되지 않는다.
//스토리보드에
@property (weak, nonatomic) IBOutlet UILabel *weaklabel;

//strong은 강한 연결
//연결시 retaincount가 증가 및 감소 한다.
@property (strong, nonatomic) IBOutlet UILabel *stronglabel;

@end

@implementation ViewController

//버튼을 누를 경우 위의 라벨이 둘다 사라지도록 한다.
- (IBAction)removebutton:(id)sender
{
    //uilabel 프로퍼티에게 superview에서 떨어져라
    [self.weaklabel removeFromSuperview];
    [self.stronglabel removeFromSuperview];
}

//버튼을 누를 경우 사라진 라벨을 다시 올린다.
- (IBAction)addbutton:(id)sender
{
    //view에게 uilabel을 다시 올려라
    [self.view addSubview:self.weaklabel];
    [self.view addSubview:self.stronglabel];
    NSLog(@"weak : %@, strong : %@", self.weaklabel, self.stronglabel);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
