//
//  ContentView.swift
//  CRUD app
//
//  Created by Prateek Surana on 04/04/20.
//  Copyright © 2020 Prateek Surana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var employees: [Employee] = []

    var body: some View {
        VStack {
            List {
                ForEach(employees, id: \.id) { employee in

                    VStack(alignment: .leading) {
                        Text("\(employee.employeeName)")
                            .font(.headline)
                        Text("Salary: \(employee.employeeSalary) | Age: \(employee.employeeAge)")
                            .font(.subheadline)
                    }
                }
            }
        }.onAppear(perform: fetchEmployees)
    }
    
    func fetchEmployees() {
        let task = URLSession.shared.employeesTask(with: APIService(endpoint: .getEmployees).apiEndpoint) { employees, response, error in
         if let employees = employees {
            self.employees = employees.data
         }
       }
       task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
