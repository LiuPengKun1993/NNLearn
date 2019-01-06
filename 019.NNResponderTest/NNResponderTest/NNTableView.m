//
//  NNTableView.m
//  NNResponderTest
//
//  Created by 刘朋坤 on 2019/1/5.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "NNTableView.h"
#import "NNTableViewCell.h"

@interface NNTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation NNTableView
static NSString *NNTableViewCellID = @"NNTableViewCellID";

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [UIView new];
        self.rowHeight = 100;
        [self registerClass:[NNTableViewCell class] forCellReuseIdentifier:NNTableViewCellID];
        [self registerNib:[UINib nibWithNibName:@"NNTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NNTableViewCellID];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NNTableViewCellID forIndexPath:indexPath];
    cell.indexPath = indexPath;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
