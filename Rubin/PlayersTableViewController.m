//
//  PlayersTableViewController.m
//  Rubin
//
//  Created by user on 23.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "PlayersTableViewController.h"

@interface PlayersTableViewController ()

@end

@implementation PlayersTableViewController {
    NSArray *players;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *player1 = [UIImage imageNamed:@"player1"];
    UIImage *player2 = [UIImage imageNamed:@"player2"];
    UIImage *player3 = [UIImage imageNamed:@"player3"];
    UIImage *player4 = [UIImage imageNamed:@"player4"];
    UIImage *player5 = [UIImage imageNamed:@"player5"];
    UIImage *player6 = [UIImage imageNamed:@"player6"];
    UIImage *player7 = [UIImage imageNamed:@"player7"];
    UIImage *player8 = [UIImage imageNamed:@"player8"];
    UIImage *player9 = [UIImage imageNamed:@"player9"];
    UIImage *player10 = [UIImage imageNamed:@"player10"];
    UIImage *player11 = [UIImage imageNamed:@"player11"];
    UIImage *player12 = [UIImage imageNamed:@"player12"];
    UIImage *player13 = [UIImage imageNamed:@"player13"];
    UIImage *player14 = [UIImage imageNamed:@"player14"];
    UIImage *player15 = [UIImage imageNamed:@"player15"];
    UIImage *player16 = [UIImage imageNamed:@"player16"];
    
    
    players = [NSArray arrayWithObjects:player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player11, player12, player13, player14, player15, player16, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PlayerCell";
    
    PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PlayerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.player.image = [players objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
