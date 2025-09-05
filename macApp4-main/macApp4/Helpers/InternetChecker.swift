//
//  InternetChecker.swift
//  macApp4
//
//  Created by VOLKAN EFE on 14.07.2025.
//

import Foundation
import Network

class InternetChecker {
    static func check(completion: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetMonitor")
        monitor.pathUpdateHandler = { path in
            completion(path.status == .satisfied)
            monitor.cancel()
        }
        monitor.start(queue: queue)
    }
}

