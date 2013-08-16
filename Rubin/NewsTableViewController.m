//
//  NewsTableViewController.m
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsViewController.h";

@interface NewsTableViewController ()

@end

@implementation NewsTableViewController
@synthesize dataArray;


- (void)viewDidLoad
{
    [super viewDidLoad];
    dataArray = [NSArray arrayWithObjects:@"в Казани стартовал зональный турнир Кубка РФС", @"Футболисты рубина сыграли за свои сборные", nil];
    self.tableView.separatorColor = [UIColor colorWithRed:165.0/255.0 green:42.0/255.0 blue:42.0/255.0 alpha:1];
}

- (void)viewDidUnload{
    [super viewDidUnload];
    [self setTableView:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed: @"rubin_icon.png"];
    cell.textLabel.text = @"news";
    cell.detailTextLabel.text = [dataArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
    NewsViewController* newsViewController = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    newsViewController.string = [dataArray objectAtIndex:path.row];
    
    //newsViewController.newsText.text = [dataArray objectAtIndex:path.row];
}



@end
