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
    self.newsViewController = (NewsViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    feeds = [[NSMutableArray alloc] init];
    NSURL* myUrl = [NSURL URLWithString:@"http://fcrubin.ru/novosti-komandy/novosti/novosti-komandy/rss.html"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:myUrl];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    //self.tableView.separatorColor = [UIColor colorWithRed:165.0/255.0 green:42.0/255.0 blue:42.0/255.0 alpha:1];

    
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
    cell.textLabel.font = [ UIFont fontWithName: @"Arial" size: 10.0 ];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

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
    
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        [[segue destinationViewController] setSomeText: [feeds[indexPath.row] objectForKey: @"text"]];
        [[segue destinationViewController] setImgUrl: [feeds[indexPath.row] objectForKey:@"img"] ];
        [[segue destinationViewController] setLink: [feeds[indexPath.row] objectForKey:@"link"] ];
        [[segue destinationViewController] setTitle: [feeds[indexPath.row] objectForKey:@"title"] ];
    
}



@end
