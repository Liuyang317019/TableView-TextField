//
//  FirstTableViewCell.h
//  TableView-UITextField
//
//  Created by LBJames on 2019/2/25.
//  Copyright © 2019年 LBJames. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FirstTableViewCellDelegate<NSObject>

@optional;
- (void)selectFirstTableViewCellWithTextField:(NSString *)text indexPath:(NSIndexPath *)indexPath;

@end

@interface FirstTableViewCell : UITableViewCell
@property(nonatomic, strong) NSIndexPath *indexPath; //!< <#name#>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic, weak) id <FirstTableViewCellDelegate> delegate; //!< <#name#>

@end
