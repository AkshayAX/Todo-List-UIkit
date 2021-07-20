//
//  model.swift
//  projcd
//
//  Created by Akshaya Kumar N on 11/23/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import Foundation
import CoreData
import UIKit
public class MyList:NSManagedObject
{
    
    @NSManaged var task:String?
    @NSManaged var date:Date
    @NSManaged var priority:String?
    @NSManaged var color:UIColor
    @NSManaged var order:Int16

    
    
}

