//
//  Model.swift
//  macApp9
//
//  Created by VOLKAN EFE on 16.07.2025.
//

import Foundation

struct FileItem: Identifiable {
    var id = UUID()
    var name: String
    var isFolder: Bool
    var children: [FileItem]?
}
