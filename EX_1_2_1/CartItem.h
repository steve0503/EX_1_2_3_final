//
//  CartItem.h
//  EX_1_2_1
//
//  Created by 이 해용 on 2014. 1. 12..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface CartItem : NSObject

@property (weak, nonatomic) Product* product;

@property (nonatomic) int quantity;

@end
