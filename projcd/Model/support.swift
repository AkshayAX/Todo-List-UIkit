//
//  support.swift
//  projcd
//
//  Created by Akshaya Kumar N on 12/2/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import Foundation
import CoreData
import UIKit


func saveContext()
{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    if context.hasChanges
    {
        do{
        try context.save()
    }
    catch
    {
        print(error)
    }
    
    }
}
