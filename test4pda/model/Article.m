//
//  Article.m
//  test4pda
//
//  Created by Alexey Golygin on 07/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import "Article.h"

@implementation Article

- (id) initWithTFHppleElement:(TFHppleElement *)element
{
    self = [super init];
    
    if(self != nil)
    {
        TFHppleElement *visual = [element firstChildWithClassName:@"visual"];
        if(visual != nil)
        {
            TFHppleElement *image = [[visual firstChildWithTagName:@"a"] firstChildWithTagName:@"img"];
            if(image != nil)
            {
                _title = [image objectForKey:@"title"];
                _image = [image objectForKey:@"src"];
                
            }

            TFHppleElement *pdescr = [[visual firstChildWithClassName:@"v-panel"] firstChildWithClassName:@"p-description"];
            _author = [[[pdescr firstChildWithClassName:@"autor"] firstChildWithTagName:@"a"] content];
        }

        TFHppleElement *description = [element firstChildWithClassName:@"description"];
        if(description != nil)
        {
            _descr = [[[description firstChildWithTagName:@"div"] firstChildWithTagName:@"p"] content];
        }

        TFHppleElement *morebox = [element firstChildWithClassName:@"more-box"];
        if(morebox != nil)
        {
            _url = [[morebox firstChildWithTagName:@"a"] objectForKey:@"href"];
        }
    }
    
    return self;
}

@end
