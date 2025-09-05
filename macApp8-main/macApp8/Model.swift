//
//  Model.swift
//  macApp8
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import Foundation

struct Item: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let detail: String
}
