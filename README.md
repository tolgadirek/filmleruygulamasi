# 🎯 Filmler Uygulaması

Bu proje, Flutter üzerinde **API'den veri çekme**, **Bloc (Cubit)** yapısını kullanarak bu verileri **ekranda yönetme** ve gösterme pratikleri üzerine geliştirilmiştir. 

Amaç; bir API key yardımıyla film ve dizi bilgilerini bir web servisinden çekmek, bu verileri `repository` ve `Cubit` katmanlarıyla işleyip, kullanıcı arayüzünde gösterebilmektir.

---

## 🧪 Proje Amacı

- 🔑 Bir **API key** kullanarak dış bir API'den canlı veri çekmek.
- 🔄 Verileri `Dio` paketiyle asenkron olarak almak.
- 📦 `Bloc (Cubit)` yapısını kullanarak durumu yönetmek.
- 🎥 Filmleri ve dizileri ayrı ayrı listeleyip detaylarını göstermek.
- 📚 Katmanlı mimari kullanımı: `data`, `ui`, `repo`, `services`.
