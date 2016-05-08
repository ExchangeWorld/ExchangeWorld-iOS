//
//  CategoryListViewController.swift
//  UIPageViewController Post
//
//  Created by 王志尹 on 2016/4/25.
//  Copyright © 2016年 Seven Even. All rights reserved.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    let categoryName = ["全部", "書籍", "教科書", "電子產品", "3C配件", "服飾", "化妝品", "飾品", "食物", "家庭用品", "體育用品", "電玩遊戲", "其他"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryName.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "categoryCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CategoryTableViewCell
        cell.nameLabel.text = categoryName[indexPath.row]
        return cell
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
