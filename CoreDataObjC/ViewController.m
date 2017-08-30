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
    
    
    UniversalDataModel *objUniversalModel = [UniversalDataModel getUniversalDataModel];
    NSLog(@"Data of array %@",objUniversalModel.userNameArray);
    
    
    self.arrayTblView.dataSource = self;
    self.arrayTblView.delegate = self;
    [self.arrayTblView reloadData];
}


- (void)viewDidAppear:(BOOL)animated {
//    NSLog(@"%@, %@, %@", [UniversalDataModel getUniversalDataModel].userName, [UniversalDataModel getUniversalDataModel].userId, [UniversalDataModel getUniversalDataModel].deviceToken);
//    self.userNameTxtFld.text = [UniversalDataModel getUniversalDataModel].userName;
//    self.userIdTxtFld.text = [UniversalDataModel getUniversalDataModel].userId;
//    self.deviceTokenTxtFld.text = [UniversalDataModel getUniversalDataModel].deviceToken;
    
    
    UniversalDataModel *objUniversalModel = [UniversalDataModel getUniversalDataModel];
    NSLog(@"Data of array %@",objUniversalModel.userNameArray);
}

- (IBAction)InsertBtnAction:(id)sender {
    // Storing textfiled values into coredata
    UniversalDataModel *objUniversalDataModel = [UniversalDataModel getUniversalDataModel];
//    [objUniversalDataModel saveData:self.userNameTxtFld.text andDeviceToken:self.deviceTokenTxtFld.text andUserId:self.userIdTxtFld.text];
    self.tempArray = [[NSMutableArray alloc]init];
    [self.tempArray addObjectsFromArray:objUniversalDataModel.userNameArray];
    
    [self.tempArray addObject:self.userNameTxtFld.text];
    [self.tempArray addObject:self.userIdTxtFld.text];
    [self.tempArray addObject:self.deviceTokenTxtFld.text];
    
    [objUniversalDataModel saveArrayOfData:self.tempArray];
    
    // Tableview loading
    self.arrayTblView.dataSource = self;
    self.arrayTblView.delegate = self;
    [self.arrayTblView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [UniversalDataModel getUniversalDataModel].userNameArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [self.arrayTblView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [[UniversalDataModel getUniversalDataModel].userNameArray objectAtIndex:indexPath.row];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UniversalDataModel *objUniversalModel = [UniversalDataModel getUniversalDataModel];
    NSLog(@"Data of array %@",objUniversalModel.userNameArray);// objUniversalModel.userNameArray
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}











@end
