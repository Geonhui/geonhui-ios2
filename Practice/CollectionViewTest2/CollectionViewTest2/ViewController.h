//
//  ViewController.h
//  CollectionViewTest2
//
//  Created by geon hui kim on 2016. 11. 30..
//  Copyright © 2016년 geon hui kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UICollectionViewDelegate, UICollectionViewDataSource>

//스토리보드 컬렉션뷰
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property NSArray *item;

@end

