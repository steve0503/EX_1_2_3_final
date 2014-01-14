//
//  CartCell.m
//  EX_1_2_1
//
//  Created by 이 해용 on 2014. 1. 13..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "CartCell.h"

@interface CartCell()


@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *quantity;

@end


@implementation CartCell


-(IBAction)plusClicked:(id)sender{
    
    [self.delegate incQuantity:self.productCode];
}

-(IBAction)minusClicked:(id)sender{
    
    [self.delegate decQuantity:self.productCode];
}


-(void)setCartItem:(CartItem*)item{

    self.productCode = item.product.code;
    self.name.text = item.product.name;
    self.quantity.text = [NSString stringWithFormat:@"%d개",item.quantity];

}

@end
