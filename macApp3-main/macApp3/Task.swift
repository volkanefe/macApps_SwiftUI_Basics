//
//  Task.swift
//  macApp3
//
//  Created by VOLKAN EFE on 13.07.2025.
//

import Foundation

struct Task: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    var createdAt: Date
}
