//
//  MacAddressFetcher.swift
//  macApp4
//
//  Created by VOLKAN EFE on 14.07.2025.
//

import Foundation

class MacAddressFetcher {
    static func getMacAddress() -> String? {
        let task = Process()
        task.launchPath = "/sbin/ifconfig"
        task.arguments = ["en0"]

        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            let lines = output.split(separator: "\n")
            for line in lines {
                if line.contains("ether") {
                    return line.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")[1]
                }
            }
        }
        return nil
    }
}
