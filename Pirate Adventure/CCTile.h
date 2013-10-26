//
//  CCTile.h
//  Pirate Adventure
//
//  Created by Warren Deshazo on 10/20/13.
//  Copyright (c) 2013 Warren Deshazo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCTile : NSObject

@property (strong, nonatomic)NSString *story;
@property (strong, nonatomic)UIImage *backgroundImage;
@property (strong, nonatomic)NSString *actionButtonName;
@property (strong, nonatomic)CCWeapon *weapon;
@property (strong, nonatomic)CCArmor *armor;
@property (nonatomic) int healtheffect;


@end
