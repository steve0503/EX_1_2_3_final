//
//  Catalog.m
//  EX_1_2_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "Catalog.h"

#import "Product.h"

@implementation Catalog
    



//Singleton method

static Catalog* _instance = nil;

+(id)defaultCatalog{
    
    if(nil == _instance)
    {
        
        _instance = [[Catalog alloc]init];
    }
    
    return _instance;
    
}

-(id)init{
    
    self = [super init];
    
    if (self) {
        data = @[[Product product:@"BaseBall" code:@"baseball" price:@"100" image:@"baseball.jpeg"],
                 [Product product:@"BasketBall" code:@"basketball" price:@"200" image:@"Basketball.png"],
                 [Product product:@"FootBall" code:@"football" price:@"250" image:@"football.jpeg"],
                 [Product product:@"RugbyBall" code:@"rugbyball" price:@"300" image:@"rugbyball.jpeg"],
                 [Product product:@"WillSon" code:@"volleyball" price:@"999" image:@"volleyball.jpeg"]];
    }
    
    return self;
}

-(id)productAt:(int)index{
    
    return [data objectAtIndex:index];
}

-(int)numberOfProducts{
    
    return (int)[data count];
}

@end