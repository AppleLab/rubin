//
//  NewsTableViewController.m
//  Rubin
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsViewController.h"
#import "HTMLParser.h"

@interface NewsTableViewController () {
    NSMutableArray *_objects;
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSMutableString *desc;
    NSString *element;
    NSMutableString *imgURL;
    NSMutableString *text;
}
@end

@implementation NewsTableViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.newsViewController = (NewsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    feeds = [[NSMutableArray alloc] init];
    NSURL* myUrl = [NSURL URLWithString:@"http://fcrubin.ru/novosti-komandy/novosti/novosti-komandy/rss.html"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:myUrl];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    self.tableView.separatorColor = [UIColor colorWithRed:165.0/255.0 green:42.0/255.0 blue:42.0/255.0 alpha:1];

    
}

- (void)viewDidUnload{
    [super viewDidUnload];
}


- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    return feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
        self.newsViewController.detailItem = object;
    }
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        desc    = [[NSMutableString alloc] init];
        imgURL  = [[NSMutableString alloc] init];
        text    = [[NSMutableString alloc] init];
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    } else if ([element isEqualToString:@"description"]){
        
        HTMLParser *p = [[HTMLParser alloc] initWithString:string error:nil];
        HTMLNode *bodyNode = [p body];
        //getting URL of image
        if([[bodyNode findChildTag:@"img"]getAttributeNamed:@"src"] != nil){
            [imgURL appendString:[[bodyNode findChildTag:@"img"]getAttributeNamed:@"src"]];
        } else {
            [imgURL appendString: @""];
        }
        
        //getting pure text
        
        NSRange r;
        NSString *s = [string copy];
        while ((r = [s rangeOfString:@"<[^>]*>" options:NSRegularExpressionSearch]).location != NSNotFound) {
            s = [s stringByReplacingCharactersInRange:r withString:@""];
        }
        // deleting &nbsp;
        while ((r = [s rangeOfString:@"&nbsp;" options:NSRegularExpressionSearch]).location != NSNotFound) {
            s = [s stringByReplacingCharactersInRange:r withString:@""];
        }
        [text appendString: s];
        
    }
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [item setObject:desc forKey:@"desc"];
        [item setObject:imgURL forKey:@"img"];
        [item setObject:text forKey:@"text"];
        [feeds addObject:[item copy]];
    }
}
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *string = [feeds[indexPath.row] objectForKey: @"text"];
        [[segue destinationViewController] setSomeText: string];
        
        string = [feeds[indexPath.row] objectForKey:@"img"];
        
    }
}



@end
