# Ayakkabı Avcısı Skills

Ayakkabı araştırması, canlı fiyat ve stok doğrulaması, kullanıcı yorumu sentezi ve satın alma kararı için hazırlanmış yedi taşınabilir Agent Skill.

## İçerik

- `shoe-analyzer`: Teknik özellik, kullanım ve zemin uygunluğu analizi.
- `product-matcher`: Ürün, varyant, cinsiyet ve beden eşleştirmesi.
- `price-hunter`: Canlı mağaza, pazaryeri, beden ve stok araştırması.
- `deal-evaluator`: Fiyatı bütçe ve piyasa koşullarıyla karşılaştırarak al / izle / bekle kararı.
- `shoe-recommender`: Koşucu profiline ve kullanım amacına göre alternatif öneriler.
- `review-summarizer`: Reddit, YouTube, mağaza yorumları ve bağımsız incelemeleri sentezleme.
- `weekly-market-report`: Güncel pazar ve fiyat raporu oluşturma.

## Windows'ta kolay kurulum

1. Bu sayfadaki `Code → Download ZIP` seçeneğiyle depoyu indirin.
2. İndirdiğiniz ZIP dosyasını klasöre çıkarın.
3. `KURULUM.cmd` dosyasına çift tıklayın.
4. Codex, Claude, Gemini, Copilot, ortak Agent Skills veya tümünü seçin.
5. İlgili yapay zekâ uygulamasını yeniden başlatın.

PowerShell üzerinden doğrudan kurulum:

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1 -Target all
```

| Hedef | Global kurulum dizini |
|---|---|
| Codex | `%USERPROFILE%\.codex\skills` |
| Claude Code | `%USERPROFILE%\.claude\skills` |
| Gemini CLI | `%USERPROFILE%\.gemini\skills` |
| GitHub Copilot | `%USERPROFILE%\.copilot\skills` |
| Agent Skills ortak dizini | `%USERPROFILE%\.agents\skills` |

## macOS / Linux kurulumu

```bash
chmod +x install.sh
./install.sh all
```

Tek uygulamaya kurmak için `all` yerine `codex`, `claude`, `gemini`, `copilot` veya `agents` yazın.

## Kaldırma

```powershell
powershell -ExecutionPolicy Bypass -File .\uninstall.ps1 -Target all
```

Kaldırıcı yalnızca bu pakette adı geçen yedi skill klasörünü hedefler.

## Kullanım örneği

```text
Adidas Adizero Evo SL modelini analiz et.
Beden 43 veya 43⅓, bütçe 5.500 TL.
Türkiye'deki güncel stokları doğrula; Reddit, YouTube, mağaza yorumları
ve bağımsız incelemelerden olumlu ve olumsuz görüşleri ayrı göster.
Sonunda al / izle / bekle kararı ver.
```

## Önemli not

Bu paket araştırma yöntemini ve karar kurallarını taşır. Canlı web taraması, tarayıcı otomasyonu, Reddit veya YouTube erişimi hedef yapay zekâ uygulamasının sağladığı araçlara bağlıdır. Araç erişimi olmayan bir sohbet uygulaması skill talimatlarını izleyebilir, ancak canlı fiyat ve stok doğrulaması yapamayabilir.

## Güvenlik

- Paket API anahtarı, parola, oturum çerezi veya kişisel hesap bilgisi içermez.
- Kurulum betikleri yalnızca seçilen uygulamanın kullanıcı düzeyindeki `skills` klasörüne kopyalama yapar.
- Var olan aynı adlı skill dosyaları kopyalama sırasında güncellenir; diğer skill'lere dokunulmaz.
