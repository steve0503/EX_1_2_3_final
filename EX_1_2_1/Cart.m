//
//  Cart.m
//  EX_1_2_1
//
//  Created by 이 해용 on 2014. 1. 12..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "Cart.h"
#import "CartItem.h"


@implementation Cart


//Cart내  상품 수량을 늘린다.

-(void)incQuantity:(NSString *)productCode{
    
    CartItem *item = [self cartItemWith:productCode];
    
    item.quantity++;
    
}


//Cart 내 상품 수량을 줄인다.

-(void)decQuantity:(NSString *)productCode{
    
    CartItem *item = [self cartItemWith:productCode];
    
    item.quantity--;
    
    if (0 == item.quantity) {
        
    }
    
}


// 상품 코드로 카트 내 상품 찾기


-(CartItem *)cartItemWith:(NSString *)productCode{
    
    for (CartItem *item in item) {
        if ([item.product isEqualProduct:productCode]) {
            return item;
        }
    }
    
    return nil;
}


@end
