//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Bennett Stern on 2/20/24.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items: [AssignmentItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentItem].self, from: data) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
