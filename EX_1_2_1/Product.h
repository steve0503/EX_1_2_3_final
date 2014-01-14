//
//  Product.h
//  3_4_16
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong,nonatomic) NSString *name, *price, *imageName,*code;

-(BOOL)isEqualProduct:(NSString *)productCode;

+(id)product:(NSString *)name code:(NSString*)code price:(NSString *)price image:(NSString *)image;

@end
