//
//  Article.h
//  test4pda
//
//  Created by Alexey Golygin on 07/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHppleElement.h"

@interface Article : NSObject

- (id) initWithTFHppleElement:(TFHppleElement *)element;

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *descr;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *image;

@end
