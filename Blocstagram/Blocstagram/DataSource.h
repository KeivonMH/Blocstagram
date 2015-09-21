//
//  DataSource.h
//  Blocstagram
//
//  Created by Keivon Hobeheidar on 9/20/15.
//  Copyright © 2015 Bloc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
