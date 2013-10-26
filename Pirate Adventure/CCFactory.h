//
//  CCFactory.h
//  Pirate Adventure
//
//  Created by Warren Deshazo on 10/20/13.
//  Copyright (c) 2013 Warren Deshazo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject

-(NSArray *) tiles;
-(CCCharacter *)character;
-(CCBoss *)  boss;

@end
