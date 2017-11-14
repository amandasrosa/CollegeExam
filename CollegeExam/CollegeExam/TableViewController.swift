//
//  ViewController.swift
//  CollegeExam
//
//  Created by MacStudent on 2017-11-13.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var lastScene: String = ""
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = lastScene
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.numberOfLines = 3
        return cell
            
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func loadData() {
        let college = College()
        college.createCollege()
        let reports = CollegeReports()
        
        switch lastScene {
        case "Departments":
            let object = college.getDepartments()
            for i in object {
                let head = i.getHead().getName()
                data.append("ID: \(i.getDepartmentId())  Head: \(head)  Name: \(i.getName())")
            }
        case "Programs":
            let object = college.getPrograms()
            for i in object {
                let head = i.getHead().getName()
                let department = i.getdepartment().getName()
                data.append("ID: \(i.getProgramId())  Head: \(head)  Name: \(i.getName())  Department: \(department)  )")
            }
        case "Employees":
            let object = college.getEmployees()
            for i in object {
                data.append("ID: \(i.getEmployeeId())  Name: \(i.getName())  Function: \(i.getMainFunction())  Start Date: \(i.getStartDate())  End Date: \(i.getEndDate()) )")
            }
        case "Courses":
            let object = college.getCourses()
            for i in object {
                let head = i.getHead().getName()
                let program = i.getProgram().getName()
                data.append("ID: \(i.getCourseId())  Name: \(i.getName())  Head: \(head)  Credit hour: \(i.getCreditHour())  Program: \(program)")
            }
        case "Students":
            let object = college.getStudents()
            for i in object {
                data.append("ID: \(i.getStudentId())  Name: \(i.getName())  Country: \(i.getOriginCountry())  Start Date: \(i.getStartDate())  End Date: \(i.getEndDate())  Status: \(i.getStatus())")
            }
        case "Student Classes":
            let object = college.getStudentClasses()
            for i in object {
                let student = i.getStudent().getName()
                let classe = i.getClasse().getClasseId()
                data.append("ID: \(i.getStudentClassId())  ClassID: \(classe)  Student: \(student)  Grade Assig: \(i.getGradeAssig())  Grade Test: \(i.getGradeTest())  Grade Project: \(i.getGradeProject())")
            }
        case "Schedule":
            let object = college.getSchedules()
            for i in object {
                let classe = i.getClasse().getClasseId()
                data.append("ID: \(i.getScheduleId())  Class: \(classe)  Weekday: \(i.getWeekday())  Start Hour: \(i.getStartHour())   End Hour: \(i.getEndHour())  Start Date: \(i.getStartDate())  End Date: \(i.getEndDate())")
            }
        case "Report1":
            navigationItem.title = "Instructors by classes and average student grades"
            data = reports.instructorsByClasses()
        case "Report2":
            navigationItem.title = "Number of students by country"
            data = reports.studentsByCountry()
        case "Report3":
            navigationItem.title = "Top 3 courses with worst average grades"
            data = reports.coursesByWorstAverage()
        case "Report4":
            navigationItem.title = "Number of classes per instructor per weekday"
            data = reports.classesByInscructorsPerWeek()
            
        default:
            fatalError("lastScene: \(lastScene)")
        }
    }

}

