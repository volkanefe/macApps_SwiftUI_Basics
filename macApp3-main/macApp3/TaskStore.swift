//
//  TaskStore.swift
//  macApp3
//
//  Created by VOLKAN EFE on 13.07.2025.
//

import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
           saveTasks()
        }
    }
    
    private let tasksKey = "SavedTasks"
    
    init(){
        loadTasks()
    }
    
    func addTask(title: String){
        let newTask = Task(title: title, createdAt: Date())
        tasks.append(newTask)
        tasks.sort { $0.createdAt > $1.createdAt }
    }
    
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func deleteCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
    
    func toggleTask(_ task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: tasksKey)
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: tasksKey),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            self.tasks = savedTasks.sorted { $0.createdAt > $1.createdAt }
        }
        
    }
    
}
