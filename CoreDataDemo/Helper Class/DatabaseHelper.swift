//
//  DatabaseHelper.swift
//  CoreDataDemo
//
//  Created by MacBook on 25/03/2022.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var shareInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    //MARK: - save(object: [String: String]) 
    func save(object: [String: String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do {
            try context?.save()
        } catch {
            print("Data is not Save")
        }
        
        
    }
    
    //MARK: - getStudentData()
    func getStudentData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try context?.fetch(fetchRequest) as! [Student]
        } catch {
            print("Can not Get Data")
        }
        return student
    }
    
    //MARK: - deleteData()
    func deleteData(index: Int) -> [Student] {
        
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do {
            try context?.save()
        } catch {
         print("Can not delete Data")
        }
        return student
    }
    
    //MARK: - editData()
    func editData(object: [String: String], index: Int) {
        var student = getStudentData()
        student[index].name = object["name"]
        student[index].address = object["address"]
        student[index].city = object["city"]
        student[index].mobile = object["mobile"]
        
        do {
            try context?.save()
        }catch {
            print("Data is not updated")
        }
    }
    
    
}
