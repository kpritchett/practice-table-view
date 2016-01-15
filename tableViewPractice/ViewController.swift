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
        let myCell: AnyObject = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!!.text = superheroes[indexPath.row]
        myCell.detailTextLabel!!.text = realNames[indexPath.row]
        return myCell as! UITableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheroes.count
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheroes.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Super Hero", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{ (nameTextField) -> Void in
            nameTextField.placeholder = "Add Super Hero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler{ (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add Super Hero Alias"
        }
        var cancelAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superHeroTF = myAlert.textFields![0] as! UITextField
            let aliasTF = myAlert.textFields![1] as! UITextField
            self.superheroes.append(superHeroTF.text)
            self.realNames.append(aliasTF.text)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }


}

