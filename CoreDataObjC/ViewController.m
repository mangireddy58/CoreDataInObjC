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
    
    userNamesArray = [[NSMutableArray alloc]init];
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
    
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    
    [tempArray addObject:self.userNameTxtFld.text];
    [tempArray addObject:self.userIdTxtFld.text];
    [tempArray addObject:self.deviceTokenTxtFld.text];
    
    [userNamesArray addObjectsFromArray:tempArray];
//    NSArray *finalArray = [NSArray arrayWithArray:tempArray];
//    [[UniversalDataModel getUniversalDataModel].userNameArray addObjectsFromArray:finalArray];
    
    [objUniversalDataModel saveArrayOfData:userNamesArray];
    
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













@end
