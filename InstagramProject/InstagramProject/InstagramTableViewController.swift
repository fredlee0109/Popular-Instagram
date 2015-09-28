//
//  InstagramTableViewController.swift
//  InstagramProject
//
//  Created by FLee on 9/26/15.
//  Copyright © 2015 Fred Lee. All rights reserved.
//

import UIKit

class InstagramTableViewController: UITableViewController {
    
    var directory: [String: InstagramOrganization.Media]!
    var cachedImages = [String: UIImage]()
    var medias: [InstagramOrganization.Media] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InstagramOrganization().fetchPopularMediaDetails { (medias: [InstagramOrganization.Media]) -> () in
            self.medias = medias
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
//
//        for media in self.medias {
//            let poster = media.username
//            directory[poster] = media
//        }

        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return medias.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + (medias[section].comments.count)
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderCell
        let current = medias[section]
        cell.header = current
        return cell
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row == 0){
            tableView.rowHeight = 600
            let cell = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! PhotoCell
            cell.media = medias[indexPath.section]
            return cell
        } else {
            tableView.rowHeight = 20
            tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            let cell = tableView.dequeueReusableCellWithIdentifier("commentCell", forIndexPath: indexPath) as! CommentCell
            let current = medias[indexPath.section].comments[indexPath.row - 1]
            cell.comment = current
            return cell
            
        }
    }
    
//    func loadOrFetchImageFor(login: String, avatarUrl: String, cell: UITableViewCell) -> Void {
//        if let image = cachedImages[login] { // already in cache
//            cell.imageView?.image = image
//        } else {
//            if let url = NSURL(string: avatarUrl) { // need to fetch
//                dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0))  {
//                    if let data = NSData(contentsOfURL: url) {
//                        if let avatarSquare = UIImage(data:data) {
//                            let avatarCircle = UIImage.roundedRectImageFromImage(avatarSquare, imageSize: avatarSquare.size, cornerRadius: avatarSquare.size.width / 2)
//                            self.cachedImages.updateValue(avatarCircle, forKey: login)
//                            
//                            // Because this happens asynchronously in the background, we need to check that by the time we get here
//                            // that the cell that requested the image is still the one that is being displayed.
//                            // If it is not, we would have cached the image for the future but we will not display it for now.
//                            if(cell.textLabel?.text == login) {
//                                dispatch_async(dispatch_get_main_queue()) {
//                                    cell.imageView?.image = avatarCircle
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
}

//    // http://stackoverflow.com/questions/7399343/making-a-uiimage-to-a-circle-form
//    extension UIImage {
//        
//        class func roundedRectImageFromImage(image: UIImage, imageSize: CGSize, cornerRadius: CGFloat)->UIImage {
//            UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
//            let bounds = CGRect(origin: CGPointZero, size: imageSize)
//            UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).addClip()
//            image.drawInRect(bounds)
//            let finalImage = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//            
//            return finalImage
//        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


