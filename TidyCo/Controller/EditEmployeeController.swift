//
//  EditEmployeeController.swift
//  TidyCo
//
//  Created by NUTALAPATI ROHIT  on 11/20/15.
//  Copyright © 2015 Team Silver. All rights reserved.
//


import UIKit

class EditEmployeeController: UIViewController {
    
    
    
    let employeeOps = ParseEmployeeStorageAdapter()
    let serviceOps = ParseServiceStorageAdapter()
    var selectedRowIndex : Int = -1;
    var headerHeight : CGFloat = 50
    var selectedEmployee = Employee()
    
    @IBOutlet weak var firstNameOutlet: UITextField!
    
    @IBOutlet weak var middleInitialOutlet: UITextField!
    
    @IBOutlet weak var LastNameOutlet: UITextField!
    
    @IBOutlet weak var employeeIDOutlet: UITextField!
    
    @IBOutlet weak var storeNumberOutlet: UITextField!
   
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func EditAction(sender: UIButton) {
        
        // Check if any edited first name middle name last name
        if firstNameOutlet.text != selectedEmployee.firstName || middleInitialOutlet!.text != selectedEmployee.middleInitial || LastNameOutlet!.text != selectedEmployee.lastName
        {
           
            print("Changed")
            
            ///Insert code to modify database accordingly
            
            // Go back
            navigationController?.popViewControllerAnimated(true)
            
        }else
        {
            print("No change")
        }
        
    }
    
    
    var allEmployees: [Employee]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         allEmployees = employeeOps.getAllItems()!
        
        let currentEmployee = allEmployees![0]
        selectedEmployee = allEmployees![0]
        
        firstNameOutlet.text = currentEmployee.firstName
        middleInitialOutlet.text = currentEmployee.middleInitial
        LastNameOutlet.text = currentEmployee.lastName
        employeeIDOutlet.text = currentEmployee.employeeId
        storeNumberOutlet.text = currentEmployee.storeNumber
        passwordOutlet.text = "Password" // (Get Pasword?)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allEmployees!.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        let currentEmployee = allEmployees![row]
        
        //let employeeStatus = self.getEmployeeProgress(currentEmployee)
        
        let name : String = "\(currentEmployee.lastName.uppercaseString), \(currentEmployee.firstName)"
        
        return name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        let currentEmployee = allEmployees![row]
        selectedEmployee = currentEmployee
        
        //let employeeStatus = self.getEmployeeProgress(currentEmployee)
        
        let name : String = "\(currentEmployee.lastName.uppercaseString), \(currentEmployee.firstName)"

        firstNameOutlet.text = currentEmployee.firstName
        middleInitialOutlet.text = currentEmployee.middleInitial
        LastNameOutlet.text = currentEmployee.lastName
        employeeIDOutlet.text = currentEmployee.employeeId
        storeNumberOutlet.text = currentEmployee.storeNumber
        passwordOutlet.text = "Password" // (Get Pasword?)
        
        
        
        print("Selected : \(name)")
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    
    
}