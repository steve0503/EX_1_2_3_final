//
//  CartCell.h
//  EX_1_2_1
//
//  Created by 이 해용 on 2014. 1. 13..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartDelegate.h"
#import "CartItem.h"

@interface CartCell : UITableViewCell

@property (weak, nonatomic) id<CartDelegate> delegate;
@property (copy, nonatomic) NSString* productCode;


-(void)setCartItem:(CartItem*)item;

@end
