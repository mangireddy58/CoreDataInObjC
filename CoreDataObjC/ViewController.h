//
//  ViewController.h
//  CoreDataObjC
//
//  Created by Rushikesh Kulkarni on 23/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UniversalDataModel.h"

@interface ViewController : UIViewController {
    NSMutableArray *userNamesArray;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *userIdTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *deviceTokenTxtFld;

- (IBAction)InsertBtnAction:(id)sender;

@end

