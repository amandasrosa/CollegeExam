//
//  MenuViewController.swift
//  CollegeExam
//
//  Created by MacStudent on 2017-11-13.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let navScene = segue.destination as! UINavigationController
        let nextScene = navScene.topViewController as! TableViewController
    
        switch segue.identifier ?? ""{
        case "departments":
            nextScene.lastScene = "Departments"
        case "programs":
            nextScene.lastScene = "Programs"
        case "employees":
            nextScene.lastScene = "Employees"
        case "courses":
            nextScene.lastScene = "Courses"
        case "students":
            nextScene.lastScene = "Students"
        case "studentClasses":
            nextScene.lastScene = "Student Classes"
        case "schedule":
            nextScene.lastScene = "Schedule"
        case "report1":
            nextScene.lastScene = "Report1"
        case "report2":
            nextScene.lastScene = "Report2"
        case "report3":
            nextScene.lastScene = "Report3"
        case "report4":
            nextScene.lastScene = "Report4"
        default:
            fatalError("Unexpected Segue Identifier: \(String(describing: segue.identifier))")
        }
    }
            
}

