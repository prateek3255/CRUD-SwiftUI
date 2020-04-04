//
//  Parsing.swift
//  CRUD app
//
//  Created by Prateek Surana on 04/04/20.
//  Copyright © 2020 Prateek Surana. All rights reserved.
//

import Foundation



// MARK: - Employee
struct Employee: Codable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}

struct Employees: Codable {
    let status: String
    let data: [Employee]
}

struct ModelWrapper<T: Codable>: Codable {
    let status: String
    let data: [T]
}

class EmployeeViewModel: ObservableObject {
    @Published var employees = [Employee]()
    
    func fetchEmployees() {
        let url = APIService(endpoint: .getEmployees).apiEndpoint
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            let decodedEmployees = try? JSONDecoder().decode(ModelWrapper<Employee>.self, from: data)
            
            if let decodedEmployees = decodedEmployees {
                DispatchQueue.main.async {
                    self.employees = decodedEmployees.data
                }
            }
            
        }.resume()
    }
    
    
}

