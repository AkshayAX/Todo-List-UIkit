//
//  SaveVC.swift
//  projcd
//
//  Created by Akshaya Kumar N on 11/23/19.
//  Copyright © 2019 Akshaya Kumar N. All rights reserved.
//

import UIKit
import CoreData


class SaveVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
    
    let colorArray = [UIColor.red , UIColor.orange, #colorLiteral(red: 0.1629562871, green: 0.6244940091, blue: 0.07178007325, alpha: 1)]

    
    var ref = 0

    
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var newTask: UITextField!
    
    @IBOutlet weak var priority: UITextField!
    
    let pickerArray = ["High","Medium","Low"]
    
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        field.delegate = self
        picker.isHidden = true
        

     

}
    
    
    
    
    @IBAction func addTask(_ sender: Any)
    
    {
        if newTask.text != "" && priority.text != ""
        {
      
        let ourModel = MyList(context: context)
        ourModel.task = newTask.text
        ourModel.date = Date()
        ourModel.priority = priority.text
        
        ourModel.color = colorArray[ref]
        if priority.text == "Low"
        {
            ourModel.order = 0
        }
        if priority.text == "Medium"
        {
            ourModel.order = 1
        }
        if priority.text == "High"
        {
            ourModel.order = 2
        }
       saveContext()
        
        self.navigationController?.popViewController(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "Incomplete Field", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return  pickerArray.count
    }
 
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        priority.text = pickerArray[row]
        priority.textColor = colorArray[row]
       // picker.isHidden = true
        ref = row

    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let atb1 = NSAttributedString(string: pickerArray[row], attributes:[NSAttributedString.Key.foregroundColor : colorArray[row]])
   
        return atb1
    }
    
  
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        picker.isHidden = false
    }
    
    
}
