//
//  FeedViewController.swift
//  restyle
//
//  Created by anjini shukla on 11/17/15.
//  Copyright © 2015 anjini shukla. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController :UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var tableView: UITableView!
    @IBOutlet var navigationBar: UINavigationBar?
    
    
    var theImageView: UIImageView?
    
    var items: [String] = ["dress4.jpg", "dress3.jpg", "dress2.jpg", "closet1.jpg"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationBar?.tintColor = UIColor(red:0.91, green:0.95, blue:0.95, alpha:1.0)
        navigationBar?.barTintColor = UIColor(red:0.91, green:0.95, blue:0.95, alpha:1.0)
        //navigationBar?.titleTextAttributes
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        print("cell height is =  #\(self.tableView.estimatedRowHeight)!")
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items.count;
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let image: UIImage = UIImage(named: self.items[indexPath.row])!
        theImageView = UIImageView(image: image)
        theImageView!.frame = CGRectMake(0, 0, screenSize.width, screenSize.width)
    
    
        cell.contentView.addSubview(theImageView!)
        
        let reserve = UIButton()
        reserve.setTitle("reserve", forState: .Normal)
        reserve.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        
        let buyButtonImage: UIImage = UIImage(named: "buttonImage.jpg")!
        reserve.setBackgroundImage(buyButtonImage, forState: .Normal)
        
        reserve.frame = CGRectMake( (screenSize.width-80), (cell.frame.size.height-35), 80, 28)
        reserve.addTarget(self, action: "reserveItem", forControlEvents: .TouchUpInside)
        
        cell.contentView .addSubview(reserve)
        
        return cell
    }
    
    func reserveItem(sender: UIButton!)
    {
        let alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "title";
        alertView.message = "message";
        alertView.show();
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        return (screenSize.width+40);
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
    }
    
}