//
//  SuperHeroClass.swift
//  tableViewPractice
//
//  Created by kpritchett on 1/15/16.
//  Copyright (c) 2016 kpritchett. All rights reserved.
//

import UIKit

class SuperHeroClass: NSObject
{
    var name = ""
    var ailias = ""
    var power = 0
    var image = UIImage(named: "Default")
    
    
    init(Name: String, Ailias: String, Power: Int, Image: UIImage)
    {
        super.init()
        name = Name
        ailias = Ailias
        power = Power
        image = Image
    }
    init(Name: String, Ailias: String)
    {
        super.init()
        name = Name
        ailias = Ailias
    }
   
}
