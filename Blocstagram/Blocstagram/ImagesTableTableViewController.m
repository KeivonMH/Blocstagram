//
//  ImagesTableTableViewController.m
//  Blocstagram
//
//  Created by Keivon Hobeheidar on 9/6/15.
//  Copyright (c) 2015 Bloc. All rights reserved.
//

#import "ImagesTableTableViewController.h"
#import "DataSource.h"
#import "Media.h"
#import "User.h"
#import "Comment.h"

@interface ImagesTableTableViewController ()

@end

@implementation ImagesTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"imageCell"];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self items].count;

}

    - (id)initWithStyle:(UITableViewStyle)style
    {
        self = [super initWithStyle:style];
        if (self) {
            // Custom initialization
            
        }
        return self;
    }

    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
        
        // Configure the cell...
        // #2
        
        static NSInteger imageViewTag = 1234;
        UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:imageViewTag];
        
        // #3
        if (!imageView) {
            // This is a new cell, it doesn't have an image view yet
            imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleToFill;
            
            imageView.frame = cell.contentView.bounds;
            imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            
            imageView.tag = imageViewTag;
            [cell.contentView addSubview:imageView];
        }
        
        Media *item = [self items][indexPath.row];
        imageView.image = item.image;
        
        return cell;
    }

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Media *item = [self items][indexPath.row];
    UIImage *image = item.image;
    
    return (CGRectGetWidth(self.view.frame) / image.size.width) * image.size.height;
}

-(NSArray *) items{
    return [DataSource sharedInstance].mediaItems;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.images removeObjectAtIndex:indexPath.row];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
