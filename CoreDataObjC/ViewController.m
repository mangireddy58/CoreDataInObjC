//
//  ViewController.m
//  CoreDataObjC
//
//  Created by Rushikesh Kulkarni on 23/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@, %@, %@", [UniversalDataModel getUniversalDataModel].userName, [UniversalDataModel getUniversalDataModel].userId, [UniversalDataModel getUniversalDataModel].deviceToken);
    self.userNameTxtFld.text = [UniversalDataModel getUniversalDataModel].userName;
    self.userIdTxtFld.text = [UniversalDataModel getUniversalDataModel].userId;
    self.deviceTokenTxtFld.text = [UniversalDataModel getUniversalDataModel].deviceToken;
}

- (IBAction)InsertBtnAction:(id)sender {
    // Storing textfiled values into coredata
    UniversalDataModel *objUniversalDataModel = [UniversalDataModel getUniversalDataModel];
//    [objUniversalDataModel saveData:self.userNameTxtFld.text andDeviceToken:self.deviceTokenTxtFld.text andUserId:self.userIdTxtFld.text];
    userNamesArray = [[NSMutableArray alloc]init];
    [userNamesArray addObject:self.userNameTxtFld.text];
    
    [objUniversalDataModel saveArrayOfData:userNamesArray];
    
    NSLog(@"%@",userNamesArray);
    
    
}
@end
