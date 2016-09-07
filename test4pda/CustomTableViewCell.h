//
//  CustomTableViewCell.h
//  test4pda
//
//  Created by Alexey Golygin on 07/09/16.
//  Copyright © 2016 Alexey Golygin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@end
