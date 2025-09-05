# macApp4 – Menü Çubuğu Ağ Gözlem Aracı (macOS için)

macOS menü çubuğunda çalışan hafif bir uygulamadır. Anlık olarak:

- Yerel IP adresinizi,
- MAC adresinizi,
- İnternet bağlantı durumunuzu

görüntülemenizi sağlar. Bilgiler her 2 saniyede bir otomatik olarak yenilenir.

## 🖥️ Ekran Görüntüsü



https://github.com/user-attachments/assets/7e6160c4-da6b-48aa-9609-7b3c6ebd62b6



## 🚀 Özellikler

- Menü çubuğunda "network" simgesi ile konumlanır.
- IP, MAC adresi ve internet durumu bilgilerini görsel olarak ayrıştırılmış biçimde sunar.
- Her 2 saniyede bir bilgileri otomatik olarak günceller.
- "Çıkış" seçeneğiyle uygulamayı hızlıca sonlandırma imkânı.

## 🔧 Kullanılan Teknolojiler

- **Swift**
- **SwiftUI** (ancak arayüz ağırlıklı değil, menü bazlı kullanım var)
- **AppKit / Cocoa**
- **NSTimer**, **NSStatusItem**, **DispatchQueue**, **NSMenu** API'leri

## 📁 Dosya Yapısı

<img width="591" height="192" alt="Ekran Resmi 2025-07-18 20 08 46" src="https://github.com/user-attachments/assets/2f8a20f2-14bf-4bbc-aabd-1d8982bf00b8" />


## ⚙️ Nasıl Çalışır?

- `AppDelegate.swift` içindeki `applicationDidFinishLaunching` fonksiyonu, menü çubuğu simgesini oluşturur.
- `setupMenu()` fonksiyonu menü öğelerini ayarlar.
- `yenile()` fonksiyonu IP, MAC ve internet durumu bilgilerini günceller.
- `Timer` nesnesi bu `yenile()` fonksiyonunu 2 saniyede bir çağırır.
- `updateMenu()` fonksiyonu, her yenilemede menüdeki yazıları günceller.

## 📦 Kurulum

> Bu uygulama Xcode ile geliştirilmiştir.

1. Bu repoyu klonlayın:
   ```bash
   git clone https://github.com/volkanefe/macApp4.git
   cd macApp4

2.	Xcode ile açın:

open macApp4.xcodeproj

3.	Gerekirse Signing & Capabilities kısmında kendi Apple hesabınızı seçin.

4.	Run butonuna tıklayarak uygulamayı başlatın.

🧪 **Geliştirme Notları**
 - MAC adresi elde etme işlemi bazı macOS sürümlerinde sandbox kısıtlamalarına takılabilir.
 - Uygulama, dock görünümüne sahip değildir, yalnızca sistem menüsünde çalışır.
 - Kod modüler yapıdadır: Ağ işlemleri ayrı dosyalara ayrılmıştır.




