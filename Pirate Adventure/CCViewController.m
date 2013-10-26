//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by Warren Deshazo on 10/20/13.
//  Copyright (c) 2013 Warren Deshazo. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CCFactory *factory = [[CCFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake (0,0);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
    
   // NSLog(@"%@", self.tiles);
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    CCTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    if (tile.healtheffect == -15) {self.boss.health = self.boss.health - self.character.damage;}
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healtheffect];
    [self updateTile];
    if (self.character.health <= 0){
        UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Game End" message:@"You have been terminated, please restart game" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alertview show];
    }
    else if(self.boss.health <= 0){
        UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"Victory" message:@"You have defeated the evil pirate boss!"delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alertview show];
    }
    [self updateTile];
}



- (IBAction)northButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1 );
    [self updateButtons];
    [self updateTile];
    
    NSLog(@"%f,%f",self.currentPoint.x, self.currentPoint.y);
    
}



- (IBAction)westButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
    NSLog(@"%f,%f",self.currentPoint.x, self.currentPoint.y);
    
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
    
    NSLog(@"%f,%f",self.currentPoint.x, self.currentPoint.y);
    
}



- (IBAction)eastButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
    NSLog(@"%f,%f",self.currentPoint.x, self.currentPoint.y);
    
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}


// Helper method

#pragma mark - Helpers Method

-(void)updateTile;

{
    CCTile *tileModel =[[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damagaeLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName  forState:UIControlStateNormal];
    
}


-(void)updateButtons
{
    
    self.westButton.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    
    
}


-(BOOL)tileExistAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x]count]){
        return NO;
        
    }
    else {
        return YES;
    }
    
}

-(void)updateCharacterStatsForArmor:(CCArmor *)armor withWeapons: (CCWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor !=nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon !=nil){self.character.damage = self.character.damage - self.character.weapon.damage +weapon.damage;
        self.character.weapon = weapon;
}
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }

}

@end
