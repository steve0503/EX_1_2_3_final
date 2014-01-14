//
//  Product.m
//  3_4_16
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "Product.h"

@implementation Product

+(id)product:(NSString *)name code:(NSString*)code price:(NSString *)price image:(NSString *)image{
    
    Product *item = [[Product alloc] init];
    
    item.name = name;
    item.price = price;
    item.imageName = image;
    item.code = code;
    
    return item;
    
}


-(BOOL)isEqualProduct:(NSString *)productCode{
    
    return [self.code isEqualToString:productCode];
    
}

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}




@end
