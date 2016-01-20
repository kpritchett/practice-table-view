//
//  DetailViewController.swift
//  tableViewPractice
//
//  Created by kpritchett on 1/19/16.
//  Copyright (c) 2016 kpritchett. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var aliasTextField: UITextField!
   
    @IBOutlet weak var powerTextField: UITextField!
    var superhero : SuperHeroClass!
    override func viewDidLoad() {
        nameTextField.text = superhero.name
        aliasTextField.text = superhero.ailias
        powerTextField.text = String(superhero.power)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        superhero.name = nameTextField.text!
        superhero.ailias = aliasTextField.text!
        superhero.power = Int(powerTextField.text!);]
    }
}
