//
//  ContentView.swift
//  macApp2
//
//  Created by VOLKAN EFE on 8.07.2025.
//

import SwiftUI



struct ContentView: View {
    @State private var buttonHovering = false
    @State private var sayi1 = ""
    @State private var sayi2 = ""
    @State private var sonuc: String = ""
    @State private var hataMesaji: String = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Basit Hesap Makinesi")
                .font(.title2)
                .bold()
                .onHover { hovering in
                    NSCursor.arrow.push()
                    if !hovering {
                        NSCursor.pop()
                    }
                }
            
            TextField("Sayı 1", text:$sayi1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                .onChange(of: sayi1) {
                    let filtered = sayi1.filter { "0123456789.-".contains($0) }
                    if filtered != sayi1 {
                        sayi1 = filtered
                    }
                    if sayi1.isEmpty {
                        sonuc = ""
                        hataMesaji = ""
                    }
                }
                .onHover { hovering in
                    NSCursor.arrow.push()
                    if !hovering {
                        NSCursor.pop()
                    }
                }
                
            
            TextField("Sayı 2", text:$sayi2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                .onChange(of: sayi2) {
                    let filtered = sayi2.filter { "0123456789.-".contains($0) }
                    if filtered != sayi2 {
                        sayi2 = filtered
                    }
                    if sayi2.isEmpty {
                        sonuc = ""
                        hataMesaji = ""
                    }
                }
                .onHover { hovering in
                    NSCursor.arrow.push()
                    if !hovering {
                        NSCursor.pop()
                    }
                }
            
            HStack(spacing: 20) {
                Button("Topla"){
                    hesapla(islem: .topla)
                }
                .handCursor(isHovering: $buttonHovering)
                Button("Çıkar"){
                    hesapla(islem: .cikar)
                }
                .handCursor(isHovering: $buttonHovering)
                Button("Çarp"){
                    hesapla(islem: .carp)
                }
                .handCursor(isHovering: $buttonHovering)
                Button("Böl"){
                    hesapla(islem: .bol)
                }
                .handCursor(isHovering: $buttonHovering)
            }
            
            if !sonuc.isEmpty {
                Text("Sonuç : \(sonuc)")
                    .font(.title3)
                    .onHover { hovering in
                        NSCursor.arrow.push()
                        if !hovering {
                            NSCursor.pop()
                        }
                    }
                    
            }
            
            if !hataMesaji.isEmpty {
                Text(hataMesaji)
                    .foregroundColor(.red)
                    .onHover { hovering in
                        NSCursor.arrow.push()
                        if !hovering {
                            NSCursor.pop()
                        }
                    }
            }
            
        }
        .padding()
        .frame(width: 300, height: 300)
        .onHover { hovering in
            NSCursor.arrow.push()
            
        }
        
    }
    
    enum Islem {
        case topla, cikar, carp, bol
    }
    
    func hesapla(islem: Islem){
        hataMesaji = ""
        let temizSayi1 = sayi1.trimmingCharacters(in: .whitespaces)
        let temizSayi2 = sayi2.trimmingCharacters(in: .whitespaces)

        if let sayi1 = Double(temizSayi1), let sayi2 = Double(temizSayi2) {
            switch islem {
            case .topla:
                sonuc = String(sayi1 + sayi2)
            case .cikar:
                sonuc = String(sayi1 - sayi2)
            case .carp:
                sonuc = String(sayi1 * sayi2)
            case .bol:
                if sayi2 != 0 {
                    sonuc = String(sayi1 / sayi2)
                } else {
                    sonuc = ""
                    hataMesaji = "Bölme işlemi için sıfır olamaz!"
                }
                
            }
        } else {
            sonuc = ""
            hataMesaji = "Lütfen kontrol ediniz!"
        }
    }
}

#Preview {
    ContentView()
}
