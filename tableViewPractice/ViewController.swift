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
    @IBOutlet weak var editButton: UIBarButtonItem!
    var superheroes : [SuperHeroClass] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        
        superheroes.append(SuperHeroClass(Name: "Batman", Ailias: "Bruce Wayne", Power: 70, Image: "batman_arkham_knight")!);)
        superheroes.append(SuperHeroClass(Name: "SpiderMan", Ailias: "Peter Parker", Power: 69, Image: "spoderman")!))
        superheroes.append(SuperHeroClass(Name: "Flash", Ailias: "BBarry Allen", Power: 70, Image: "flash image")!))
        superheroes.append(SuperHeroClass(Name: "Wonder Woman", Ailias: "Diana", Power: 70, Image: "wundahwuman")!))
        superheroes.append(SuperHeroClass(Name: "Super Man", Ailias: "Clark Kent", Power: 70, Image: "supamen")!))
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell: AnyObject = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!!.text = superheroes[indexPath.row].name
        myCell.detailTextLabel!!.text = superheroes[indexPath.row].ailias
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
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superHeroTF = myAlert.textFields![0] as! UITextField
            let aliasTF = myAlert.textFields![1] as! UITextField
            self.superheroes.append(SuperHeroClass(Name: superHeroTF.text!, Ailias: aliasTF.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let superhero = superheroes[sourceIndexPath.row]
        superheroes.removeAtIndex(sourceIndexPath.row)
        superheroes.insert(superhero, atIndex: destinationIndexPath.row)
            }
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow()!.row
        detailView.superhero = superheroes(selectedRow)
    }

}

