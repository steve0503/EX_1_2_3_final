//
//  CartCell.m
//  EX_1_2_1
//
//  Created by 이 해용 on 2014. 1. 13..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "CartCell.h"
#import "CartDelegate.h"
#import "CartItem.h"


@interface CartCell()

@property (weak, nonatomic) id<CartDelegate> delegate;

@property (copy, nonatomic) NSString* productCode;

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
    
    
    
    //제품 구별용 코드
    
    self.productCode = item.product.code;
    
    
    
    //셀 반영
    
    self.name.text = item.product.name;
    
    self.quantity.text = [NSString stringWithFormat:@"%d개",item.quantity];
    
    
}






- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
