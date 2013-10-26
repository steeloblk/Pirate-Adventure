//
//  CCViewController.h
//  Pirate Adventure
//
//  Created by Warren Deshazo on 10/20/13.
//  Copyright (c) 2013 Warren Deshazo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCViewController : UIViewController


//Instance Variables

@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) CCCharacter *character;
@property (strong, nonatomic) CCBoss *boss;



//IBOutlets

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *healthLabel;

@property (strong, nonatomic) IBOutlet UILabel *damagaeLabel;

@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;

@property (strong, nonatomic) IBOutlet UILabel *armorLabel;

@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;

@property (strong, nonatomic) IBOutlet UIButton *northButton;

@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) IBOutlet UIButton *southButton;


@property (strong, nonatomic) IBOutlet UIButton *eastButton;


// IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender;

- (IBAction)northButtonPressed:(UIButton *)sender;

- (IBAction)westButtonPressed:(UIButton *)sender;

- (IBAction)southButtonPressed:(UIButton *)sender;


- (IBAction)eastButtonPressed:(UIButton *)sender;

- (IBAction)resetButtonPressed:(UIButton *)sender;




@end
