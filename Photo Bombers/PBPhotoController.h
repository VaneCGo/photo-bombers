//
//  PBPhotoController.h
//  Photo Bombers
//
//  Created by Vanessa Cantero Gómez on 29/03/14.
//  Copyright (c) 2014 Vanessa Cantero Gómez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PBPhotoController : NSObject

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion;

@end
