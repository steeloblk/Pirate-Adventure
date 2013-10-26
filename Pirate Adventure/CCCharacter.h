//
//  CCCharacter.h
//  Pirate Adventure
//
//  Created by Warren Deshazo on 10/21/13.
//  Copyright (c) 2013 Warren Deshazo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCArmor.h"
#import "CCWeapon.h"

@interface CCCharacter : NSObject

@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
