//
//  Cart.h
//  EX_1_2_1
//
//  Created by 이 해용 on 2014. 1. 12..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CartItem.h"

@interface Cart : NSObject

//Adding Product to Cart


-(void)addProduct:(Product* )product;


// Increase/Decrease the quantity of Product in Cart


-(void)incQuantity:(NSString *)productCode;


-(void)decQuantity:(NSString* )productCode;


-(CartItem *)cartItemWith:(NSString *)productCode;


@end
