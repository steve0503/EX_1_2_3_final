//
//  ViewController.m
//  EX_1_2_1
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "Catalog.h"
#import "Product.h"
#import "Cart.h"
#import "CartCell.h"
#import  "ProductDetailViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CartDelegate>
    


@property (weak, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) Cart *cart;

@end



@implementation ViewController


//카트 내 상품 수량 증가


-(void)incQuantity:(NSString *)productCode{
    
    [self.cart incQuantity:productCode];
    
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}


//카트 내 상품 수량 감소


-(void)decQuantity:(NSString *)productCode{
    
    [self.cart decQuantity:productCode];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


-(void)addItem:(id)sender{
    
    NSIndexPath* indexPath = [_table indexPathForCell:sender];
    
    Product *product = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
    
    [self.cart addProduct:product];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    
    [_table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if( 0 == section)
    {
        return [[Catalog defaultCatalog] numberOfProducts];
    }
    else
    {
        return [self.cart.items count];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section) {
        
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL"];
        
        cell.delegate = self;
        
        Product *product = [[Catalog defaultCatalog] productAt:(int)indexPath.row];
        
        [cell setProductInfo:product];
        
        return cell;
        
    } //두번째 셀은 카트용
    else
    {
        
        CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];
        
        cell.delegate = self;
    
        CartItem *cartItem = [self.cart.items objectAtIndex:indexPath.row];
                      
        [cell setCartItem:cartItem];
        
        return cell;
        
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (0 == section)
    {
        return @"Product";
    }
    else
    {
        return @"Items in Cart";
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    ProductDetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.table indexPathForCell:sender];
    
    Product *selectedProduct = [[Catalog defaultCatalog] productAt:indexPath.row];
    
    detailVC.productCode = selectedProduct.code;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    
    self.cart = [Cart defaultCart];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
