# macApp10

**macApp10**, SwiftUI kullanılarak geliştirilmiş basit bir macOS uygulamasıdır. Uygulama, kullanıcıların bir renk seçmesini sağlar ve seçilen rengi hem görsel olarak gösterir hem de RGB (Red, Green, Blue) bileşenlerini metin olarak ekranda listeler.

## Özellikler

- SwiftUI ile geliştirildi.
- Kullanıcı dostu renk seçici (ColorPicker) arayüzü.
- Seçilen rengin:
  - Görsel temsili (renk kutusu içinde)
  - RGB bileşen değerlerinin metin olarak gösterimi
- Canlı önizleme (Live Preview) desteği

## Ekran Görüntüsü



https://github.com/user-attachments/assets/70ad1ea0-274b-465a-b51c-caba9c2b4c37




## Kurulum

1. Xcode (15 veya üzeri) yüklü olmalıdır.
2. Bu repoyu klonlayın:

```bash
git clone https://github.com/volkanefe/macApp10.git

```

3.	Projeyi Xcode ile açın ve çalıştırın (Cmd + R).

## Koddan Notlar
	

 - @State private var selectedColor: Color kullanılarak renk durumu yönetiliyor.
	
 - ColorPicker ile kullanıcıdan renk alınıyor.
	
 - selectedColor.cgColor?.components ifadesi ile RGB bileşenleri okunuyor.
	
 - Rectangle().fill(selectedColor) ile renk kutusu oluşturuluyor.

## Gereksinimler
	

 - macOS 13+ 	
 - Xcode 15+ 	
 - Swift 5.9+


