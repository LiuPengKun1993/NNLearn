//
//  NNTableViewCell.m
//  NNResponderTest
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "NNTableViewCell.h"
#import "UIResponder+responder.h"

@interface NNTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *row;
@property (weak, nonatomic) IBOutlet UILabel *section;

@end

@implementation NNTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)buttonClick:(UIButton *)sender {
    NSString *string = [NSString stringWithFormat:@"%@%@的第%ld个按钮被点击了", self.section.text, self.row.text, sender.tag];
    if (sender.tag == 1) {
        [self responderWithKey:@"1" value:string];
    } else {
        [self responderWithKey:@"2" value:string];
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    self.row.text = [NSString stringWithFormat:@"第%ld行", (long)indexPath.row];
    self.section.text = [NSString stringWithFormat:@"第%ld组", (long)indexPath.section];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
