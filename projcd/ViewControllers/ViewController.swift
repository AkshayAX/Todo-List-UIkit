//
//  ViewController.swift
//  projcd
//
//  Created by Akshaya Kumar N on 11/23/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import UIKit
import CoreData

class ViewController:
UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var result:[MyList] = []
    
    
   




    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self

        
       
    }
    
  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         fetch()

        table.reloadData()
    }


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
    return result.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    
    let cell =  table.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! cell
    let res = result[indexPath.row]
  
    cell.task.text = res.task
    cell.priority.text = res.priority
    cell.priority.textColor = res.color

  
    
    
    return cell
}
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    func fetch()
    {
        let request = NSFetchRequest<MyList>(entityName: "MyList")
        let sort1 = NSSortDescriptor(key: "order", ascending: false)
        request.sortDescriptors = [sort1]
                                    do {
                                                result = try context.fetch(request)
                                              
                                
                                           } catch {
                                               
                                               print("Failed")
                                           }
               
              
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "") { _,_,_ in
            
            self.context.delete(self.result[indexPath.row])
            saveContext()
            self.fetch()

            self.table.deleteRows(at: [indexPath], with: .automatic)
            self.table.reloadData()
          
            
           
           

        }
        let swipe = UISwipeActionsConfiguration(actions: [delete])

        return swipe

    }
  
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "Tasks"
        
    }
}

