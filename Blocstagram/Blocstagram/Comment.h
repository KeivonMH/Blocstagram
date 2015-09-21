//
//  Comment.h
//  Blocstagram
//
//  Created by Keivon Hobeheidar on 9/20/15.
//  Copyright © 2015 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;


@end
