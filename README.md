# calc_interpreter Hasan Yiğit Sarı 231101050

Lex dosyasında önce okunan herhangi bir sayıdaki rakam karakterini birleştirip sayıya çevirip o sayıyı bir tokene atayan satırı,
sonra her işlem işareti ve parantez için ayrı bir token satırı yazdım.
Boş karakterler herhangi bir tokene atanmıyor ve kabul edilmeyen karakter gelirse hata verip koddan çıkıyor.
Eğer input'un sonuna gelinirse 1 dönülür ve biter.

Yacc dosyasında ise ilk bir global değişken oluşturdum, sonucu tutmak için
Sonra union'da num diye bir integer oluşturdum, sonradan da NUMBER tokenini int cinsinden olsun diye num'u kullandım
İşaretler için böyle birşey kullanmadım, ama expr "expression"'un türü de num (int)
İşaretler için öncelik ve yönleri sıraladım: Parantezler "sırasız" > Çarpı/Bölü "soldan sağa" > Artı/Eksi "soldan sağa"
Tek tek expression'ları yazdım ve çıkan sonuçları global değişkene eşitledim.
Mesela: expr plus expr ŞŞ = Ş1 + Ş3 olur. Burada $1 ilk gelen expr, $ 3 ise üçüncü yapı yani ikinci değişken
Sonuç ŞŞ oluyor ve bundan sonra result global değişkenine ŞŞ atanıyor
Bölmede ayrıca bir özel durum ekledim, bölen sıfır ise hata veriyor
Parantezli ve Numberli durumlarda gelen expr değişmeden yoluna devam ediyor. 
lparen expr rparen $ $ = $2, number ŞŞ = Ş1
main önce girdi işlemi istiyor, sonra parse'a başlıyor ve okuyor, bitirince ve işlemler bitince result'un son değeri sonuç olarak basılıyor
çünkü result ŞŞ'nin her değişmesinde güncelleniyor ve zaten son expr değeri aynı zamanda son ŞŞ ve son result değeri oluyor. yani işlemin sonucu
yyerror ise de başka bir hata çıkarsa diye var
 
