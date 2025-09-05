//
//  ContentView.swift
//  macApp3
//
//  Created by VOLKAN EFE on 10.07.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskStore = TaskStore()
    @State private var newTaskTitle = ""
    @State private var showDeleteConfirmation = false
    @State private var showClearCompletedConfirmation = false
    @State private var taskToDelete: Task?
    
    var body: some View {
        VStack {
            HStack {
                TextField("Yeni Görev Ekle...", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Ekle"){
                    guard !newTaskTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                    taskStore.addTask(title: newTaskTitle)
                    newTaskTitle = ""
                }
            }
            .padding()
            
            List {
                ForEach(taskStore.tasks) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                            .onTapGesture {
                                taskStore.toggleTask(task)
                            }
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                            Text(dateFormatter.string(from: task.createdAt))
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .contextMenu {
                        Button {
                            taskStore.toggleTask(task)
                        } label: {
                            HStack {
                                Image(systemName: "checkmark.circle")
                                Text("Tamamlandı olarak işaretle")
                            }
                        }
                        Button {
                            taskToDelete = task
                            showDeleteConfirmation = true
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                                Text("Görevi Sil")
                            }
                        }
                        Button {
                            showClearCompletedConfirmation = true
                        } label: {
                            HStack {
                                Image(systemName: "trash.slash")
                                Text("Tamamlanmışları Temizle")
                            }
                        }
                    }
                }
                
            }
            
        }
        .padding()
        .frame(width: 400, height: 500)
        .confirmationDialog("Bu görevi silmek istediğinize emin misiniz?", isPresented: $showDeleteConfirmation, titleVisibility: .visible) {
            Button("Görevi Sil", role: .destructive) {
                if let task = taskToDelete,
                   let index = taskStore.tasks.firstIndex(of: task) {
                    taskStore.deleteTask(at: IndexSet(integer: index))
                }
                taskToDelete = nil
            }
            Button("İptal", role: .cancel) {
                taskToDelete = nil
            }
        }
        .confirmationDialog("Tüm tamamlanmış görevleri silmek istediğinize emin misiniz?", isPresented: $showClearCompletedConfirmation, titleVisibility: .visible) {
            Button("Tamamlanmışları Sil", role: .destructive) {
                taskStore.deleteCompletedTasks()
            }
            Button("İptal", role: .cancel) { }
        }
    }
}

#Preview {
    ContentView()
}


private var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}
