//
//  API.swift
//  CRUD app
//
//  Created by Prateek Surana on 04/04/20.
//  Copyright © 2020 Prateek Surana. All rights reserved.
//

import Foundation

struct APIService {
    let baseURL = URL(string: "http://dummy.restapiexample.com/api/v1")!
    
    var endpoint: Endpoint

    enum Endpoint {
        case getEmployees
        case getEmployee(id: String)

        func path() -> String {
            switch self {
            case .getEmployees:
                return "employees"
            case let .getEmployee(id):
                return "employee/\(id)"
            }
        }
    }
    
    var apiEndpoint: URL {
        baseURL.appendingPathComponent(endpoint.path())
    }
}
