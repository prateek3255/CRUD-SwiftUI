//
//  ContentView.swift
//  CRUD app
//
//  Created by Prateek Surana on 04/04/20.
//  Copyright © 2020 Prateek Surana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var employeesVM = EmployeeViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(self.employeesVM.employees, id: \.id) { employee in

                    VStack(alignment: .leading) {
                        Text("\(employee.employeeName)")
                            .font(.headline)
                        Text("Salary: \(employee.employeeSalary) | Age: \(employee.employeeAge)")
                            .font(.subheadline)
                    }
                }
            }
        }.onAppear(perform: employeesVM.fetchEmployees)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
