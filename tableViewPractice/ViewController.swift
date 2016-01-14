//
//  ViewController.swift
//  tableViewPractice
//
//  Created by kpritchett on 1/13/16.
//  Copyright (c) 2016 kpritchett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var superheroes = ["Batman", "Superman", "Wonder Woman", "The Flash", "Spiderman"]
    var realNames = ["Bruce Wayne", "Clark Kent", "Arthur Curry", "Diana", "Barry Allen", "Peter Parkar"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell: AnyObject = myTableView.dequeueReusableCellWithIdentifier("myCekk", forIndexPath: indexPath)
        myCell.textLabel!!.text = superheroes[indexPath.row]
        myCell.detailTextLabel!!.text = realNames[indexPath.row]
        return myCell as! UITableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superheroes.count
    }

    


}

