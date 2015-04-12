//
//  CollectionTableViewCell.h
//  CollectionTableView
//
//  Created by li yuanchao on 15/4/10.
//  Copyright (c) 2015年 liyc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidSelectedCell)(void);

@interface CollectionTableViewCell : UICollectionViewCell

@property (nonatomic, copy) DidSelectedCell didSelectedCell;

@end
