//
//  UniversalDataModel.m
//  CoreDataObjC
//
//  Created by Rushikesh Kulkarni on 23/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

#import "UniversalDataModel.h"

#define USER_ENTITY_NAME @"CoreDataObjC"

@implementation UniversalDataModel

static UniversalDataModel *sUniversalDataModel = nil;

@synthesize userId = mUserId;
@synthesize deviceToken = mDeviceToken;
@synthesize userName = mUserName;
@synthesize userNameArray = mUserNameArray;

+ (UniversalDataModel *)getUniversalDataModel {
    @synchronized (self) {
        if (sUniversalDataModel == nil) {
            sUniversalDataModel = [[UniversalDataModel alloc]init];
            sUniversalDataModel.userName = @"";
            sUniversalDataModel.deviceToken = @"";
            sUniversalDataModel.userId = @"";
            
            NSManagedObjectContext *context = nil;
            id delegate = [[UIApplication sharedApplication] delegate];
            if ([delegate performSelector:@selector(managedObjectContext)]) {
                context = [delegate managedObjectContext];
            }
            NSFetchRequest *request = [[NSFetchRequest alloc] init];
            [request setEntity:[NSEntityDescription entityForName:USER_ENTITY_NAME inManagedObjectContext:context]];
            NSError *error = nil;
            NSArray *results = [context executeFetchRequest:request error:&error];
            if ([results count] >= 1) {
                NSManagedObject *userDataManagedObject = [results lastObject];
                sUniversalDataModel.userName = [userDataManagedObject valueForKey:@"userName"];
                sUniversalDataModel.userId = [userDataManagedObject valueForKey:@"userId"];
                sUniversalDataModel.deviceToken = [userDataManagedObject valueForKey:@"deviceToken"];
                
                NSLog(@"Name: %@", sUniversalDataModel.userName);
                NSLog(@"UserId: %@", sUniversalDataModel.userId);
                NSLog(@"Device Token: %@", sUniversalDataModel.deviceToken);
            }
        }
    }
    return sUniversalDataModel;
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)saveData:(NSString *)userName andDeviceToken:(NSString *)devicertoken andUserId:(NSString *)userId {
    [self clearUserDataModel];
    
    mUserName = userName;
    mDeviceToken = devicertoken;
    mUserId = userId;
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.userDataModel) {
        [self.userDataModel setValue:mUserName forKey:@"userName"];
        [self.userDataModel setValue:mDeviceToken forKey:@"deviceToken"];
        [self.userDataModel setValue:mUserId forKey:@"userId"];
    }
    else {
        NSManagedObject *newuserDataModelData = [NSEntityDescription insertNewObjectForEntityForName:USER_ENTITY_NAME inManagedObjectContext:context];
        [newuserDataModelData setValue:mUserName forKey:@"userName"];
        [newuserDataModelData setValue:mDeviceToken forKey:@"deviceToken"];
        [newuserDataModelData setValue:mUserId forKey:@"userId"];
    }
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    else{
        NSLog(@"Data saved.");
    }
}
#pragma mark - Array of data saving
- (void)saveArrayOfData:(NSMutableArray *)userNameArray {
//    [self clearUserDataModel];
    NSLog(@"Array %@", userNameArray);
    mUserNameArray = userNameArray;
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.userDataModel) {
        [self.userDataModel setValue:mUserNameArray forKey:@"userNameArray"];
    }
    else {
        for (int i = 0; i < userNameArray.count; i++){
            NSManagedObject *newData = [NSEntityDescription insertNewObjectForEntityForName:USER_ENTITY_NAME inManagedObjectContext:context];
            [newData setValue:mUserNameArray forKey:@"userNameArray"];
//            [userNameArray addObject:newData];
        }
    }
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }else {
        NSLog(@"Data saved successfully ..");
    }
    
}
#pragma mark - Clearing the data
- (void)clearUserDataModel{
    self.userName = @"";
    self.deviceToken = @"";
    self.userId = @"";
//    self.userNameArray = nil;
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:USER_ENTITY_NAME inManagedObjectContext:context]];
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:request error:&error];
    NSInteger i = 0;
    while (i < [results count]) {
        [context deleteObject:[results objectAtIndex:0]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        }else{
            NSLog(@"Deleted");
        }
        i++;
    }
}
- (void)printUserData{
    NSLog(@"UserName: %@", mUserName);
    NSLog(@"UserId: %@", mUserId);
    NSLog(@"Devicetoken: %@", mDeviceToken);
}



@end
