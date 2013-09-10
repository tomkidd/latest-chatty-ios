//
//  TableCellFromNib.m
//  LatestChatty2
//
//  Created by Alex Wayne on 3/16/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TableCellFromNib.h"

@implementation TableCellFromNib

+ (CGFloat)cellHeight {
    return 44.0;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil {
    if ([[LatestChatty2AppDelegate delegate] isPadDevice]) {
        nibName = [nibName stringByAppendingString:@"-iPad"];
    }
    
    UIViewController *cellFactory = [[[UIViewController alloc] initWithNibName:nibName bundle:nibBundleOrNil] autorelease];
    self = (TableCellFromNib *)cellFactory.view;
    [self retain];
    
    // create a custom selection view with a blue color
    if ([nibName containsString:@"Root"]) {
        UIView *selectionView = [[UIView alloc] initWithFrame:CGRectMake(self.frameX, self.frameY, self.frameWidth, self.frameHeight-1)];
        selectionView.backgroundColor = [UIColor lcSelectionGrayColor];
        self.selectedBackgroundView = selectionView;
        [selectionView release];
    } else {
        UIView *selectionView = [[UIView alloc] initWithFrame:CGRectMake(self.frameX, self.frameY, self.frameWidth, self.frameHeight)];
        selectionView.backgroundColor = [UIColor lcSelectionBlueColor];
        self.selectedBackgroundView = selectionView;
        [selectionView release];
    }

    return self;
}

@end
