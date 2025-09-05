# 🎨 macApp6 – SwiftUI ile Renk Seçici Uygulaması (macOS)

Bu SwiftUI macOS uygulaması, kullanıcıya bir renk listesinden seçim yapma imkânı tanır. Seçilen renk ismi ve görsel temsili detay görünümde gösterilir. `NavigationSplitView` kullanılarak modern bir arayüz sunulmuştur.

## 🧩 Özellikler

- Renk listesinden seçim yapılabilir.
- Seçilen rengin ismi ve rengi büyük bir kutuda gösterilir.
- Responsive (esnek) yapı: pencere boyutuna uyum sağlar.
- SwiftUI `NavigationSplitView` ile sidebar + detail arayüzü.

## 🖼️ Ekran Görüntüsü



https://github.com/user-attachments/assets/433bb55c-428c-4eae-bb00-4d370d417b1a



## 🛠️ Kullanılan Teknolojiler

- Swift
- SwiftUI
- macOS AppKit arayüzü (SwiftUI ile)
- `NavigationSplitView`, `List`, `@State`, `VStack`, `Rectangle` bileşenleri

## 📁 Dosya Yapısı

- `ContentView.swift`: Ana kullanıcı arayüzü ve veri modeli.
- `ColorItem`: Renk adı ve SwiftUI rengi içeren model (Identifiable & Hashable).
- `sampleColors`: Örnek veri seti.

## 🚀 Nasıl Çalışır?

1. Uygulama başlatıldığında renk listesi görünür.
2. Kullanıcı listedeki bir rengi seçtiğinde, sağ bölümde bu rengin adı ve büyük bir kutu içinde görünümü yer alır.
3. Hiçbir seçim yapılmazsa kullanıcıya bir seçim yapması istenir.

## 🔧 Kurulum

Bu repository’yi klonlayın:
   ```bash
   git clone https://github.com/volkanefe/macApp6.git


