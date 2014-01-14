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

static Cart *_instance = nil;

+ (id)defaultCart
{
    if (nil == _instance) {
        _instance = [[Cart alloc] init];
    }
    return _instance;
}

- (id) init
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}



//Adding product to Cart
- (void)addProduct:(Product *)item
{
    CartItem *cartItem = [self cartItemWith:item.code];
    
   
    if (cartItem == nil)
    {
        cartItem = [[CartItem alloc] init];
        cartItem.product = item;
        cartItem.quantity = 1;
        [self.items addObject:cartItem];
    }
    else
    {
        [self incQuantity:item.code];
    }
}


//Increase the number of the products in cart

-(void)incQuantity:(NSString *)productCode
{
    
    CartItem *item = [self cartItemWith:productCode];
    
    item.quantity++;
    
}


//Decrease the number of the products in cart

- (void)decQuantity:(NSString *)productCode
    {
        CartItem *item = [self cartItemWith:productCode];
        item.quantity--;
    
        // Remove the item when the quantity is 0
    
    if (0 == item.quantity)
    {
        [self.items removeObject:item];
    }
}


//Search for the product with product code

- (CartItem *)cartItemWith:(NSString *)productCode
{
    for (CartItem *item in self.items)
    {
        if([item.product isEqualProduct:productCode])
        {
            return item;
        }
    }
    return nil;
}

@end
