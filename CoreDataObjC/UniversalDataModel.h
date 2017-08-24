//
//  UniversalDataModel.h
//  CoreDataObjC
//
//  Created by Rushikesh Kulkarni on 23/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface UniversalDataModel : NSObject {
    NSString *mUserName;
    NSString *mDeviceToken;
    NSString *mUserId;
    NSMutableArray *mUserNameArray;
}
@property (strong) NSManagedObject *userDataModel;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *userId;
@property (copy, nonatomic) NSString *deviceToken;

@property (copy, nonatomic) NSMutableArray *userNameArray;

+ (UniversalDataModel *)getUniversalDataModel;
//+ (UniversalDataModel *)getSavedArrayDataModel;
- (void) clearUserDataModel;
- (void) saveData:(NSString *)userName andDeviceToken:(NSString *)devicertoken andUserId:(NSString *)userId;
- (void)saveArrayOfData:(NSMutableArray *)userNameArray;

@end
