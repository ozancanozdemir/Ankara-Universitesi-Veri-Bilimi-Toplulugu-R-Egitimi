
############### R Programlamaya Giriş Gün 2 #######################
###############    Ozancan Ozdemir ##########################

##### Gün 1 Devam ####

##### Faktörler #####

answers <- c("Strognly Disagree","Disagree",
             "Neither Disagree nor Agree",
             "Agree",
             "Strongly Agree")

print(answers)

class(answers)

# Faktöre dönüştür 
answers <- factor(answers)

answers

levels(answers)

# Seviyelerinizi yeniden sıralayın 

myorder <-  c("Strognly Disagree","Disagree",
              "Neither Disagree nor Agree",
              "Agree",
              "Strongly Agree")

answers <- factor(answers, levels = myorder, ordered = TRUE)

levels(answers)

##### Tarih ##### 



date<-"11111994"

class(date)

is.Date(date)

as.Date(date)  

install.packages("lubridate")
library(lubridate)

new_date <- dmy(date)
new_date

class(new_date)

information <- data.frame( age = c(20,25,28),
                           height = c(160, 175, 183),
                           birth_date  = c("20020301","19970315","19940407")
)


information1 <- data.frame( age = c(20,25,28),
                            height = c(160, 175, 183),
                            birth_date  = c("2002_03_01","1997_03_15","1994_04_07")
)

information2 <- data.frame( age = c(20,25,28),
                            height = c(160, 175, 183),
                            birth_date  = c("01032002","15031997","07041994")
)


str(information)


information$birth_date <- ymd(information$birth_date)

information

str(information)

###### Alıştırma 3.4 ###### 

## information1 ve information2 veri çerçevelerindeki birth_date sütunlarını tarih nesnesine dönüştürün

information1$birth_date <- ymd(information1$birth_date)

information2$birth_date <- dmy(information2$birth_date)

str(information1)

str(information2)

#### 4. Özel Uygulamalar ####

################ Örnek 1 #################

# bazı yerleşik fonksiyonlar

x=c(1,9,0,5,1,9,5,6)

print(x)

which(x==6)#x vektöründe 6'nın konumunu gösterir

which.max(x)#x vektöründeki maksimum elemanın konumunu gösterir

which.min(x)#x vektöründeki minimum elemanın konumunu gösterir

length(x) #vektörün uzunluğunu görmek için

max(x) #bir vektörün maksimum değeri

min(x) #bir vektörün minimum değeri

range(x)#vektörlerin minimum ve maksimum değerleri

max(x)-min(x) #Aralık değerini verir

sum(x)#bir vektördeki tüm elemanların toplamı

cumsum(x)#vektörün kümülatif toplamı

mean(x)#vektörün ortalaması

median(x)#vektörün medyanı

var(x)#vektörün varyansı

sd(x)#vektörün standart sapması

sort(x)#artan sırayla sıralama

sort(x,decreasing = T)#azalan sırayla sıralama

diff(x)#i ve (i+1). elemanın farkını al

################ Örnek 2 ######################

### Birden çok öğenin kombinasyonu

first_word <- "ali"

second_word <-"ata"

third_word <-"bak"

print(first_word, second_word, third_word) #hata!

print(first_word);print(second_word);print(third_word)

cat(first_word, second_word, third_word) #birden çok öğeyi birleştirir.

cat("odtü", 1956, "yılında","kuruldu.")

# paste ve paste0

x = 8

paste0("This is", x, "hours", "R Course")
paste("This is", x, "hours", "R Course")
# paste() ve paste0() arasındaki fark, 
# paste() için sep argümanının varsayılan olarak " " ve paste0() için "" olmasıdır.

################ Örnek 3 ######################

set.seed(158) # tohumları belirtmek için önerilen yol.

x = rnorm(100) #standart normal dağılımdan 100 sayı üretin.

head(x) #ilk 6 öğeyi gösterir

x = rnorm(100)

head(x)

set.seed(158)

x = rnorm(100) 

head(x) 

#### 0. Swirl Paketi #### 

install.packages("swirl")

library(swirl)

swirl() # swirl'ı başlat

# Pipe Operatörü `|>`
# Pipe operatörü `|>`, bir değeri veya nesneyi bir fonksiyona doğrudan geçirmenizi sağlar. 
# Bu operatör, kodunuzu daha okunabilir hale getirir ve işlemleri ardışık olarak uygulamanızı kolaylaştırır. 
# `|>` operatörü, solundaki ifadeyi sağındaki fonksiyonun ilk argümanı olarak geçirir.

#### Örnek:
# Bir vektör oluşturma
vct <- c(4, 5, -9, 6, 7, 12, -3)

# Her elemanın mutlak değerini alıp, sonuçları yazdırma
vct |> abs() |> print()

print(abs(vct))

# Ortalama hesaplama
mean_result <- vct |> abs() |> mean()

#### Kontrol Yapıları ####

## Kontrol yapıları, R kodunuza her seferinde aynı kodu yürütmek yerine 
## biraz "mantık" eklemenize olanak tanır. 
## Yaygın olarak kullanılan kontrol yapıları şunlardır:

# if ve else: bir koşulu test etme ve buna göre hareket etme.

# for: bir döngüyü belirli sayıda çalıştırma.

# while: bir koşul doğru olduğu sürece bir döngüyü çalıştırma.

# repeat: sonsuz bir döngü çalıştırma (durdurmak için döngüden çıkılmalıdır).

# break: bir döngünün yürütülmesini durdurma.

# next: bir döngünün bir yinelemesini atlama.

### Hatırlatma 

# <	küçüktür
# <=	küçük veya eşittir
# >	büyüktür
# >=	büyük veya eşittir
# ==	tam olarak eşittir
# !=	eşit değildir
# !x	Not x
# x | y:	x VEYA y
# x & y:	x VE y
# isTRUE(x):	X'in TRUE olup olmadığını test et

#### 1. If ifadeleri #####

# Bir if ifadesi, yalnızca belirli bir koşul doğruysa bir kod bloğunu çalıştırır.

#if (koşul){
#koşul doğruysa bir şey yap
#}

x <- 1

if (x == 1){
  
  print("x eşittir 1")
  
}

a <- 6 

b <- 8 

if(a <= b){
  a <- a^2
}

a

#if (koşul){
#koşul doğruysa bir şey yap
#}
#else{
#koşul doğru değilse bir şey yap
#}

a <- 19

if(a > 23) {
  
  print("büyük")
  
} else{
  
  print("küçük")
}

# veya 

a <- 25

ifelse(a > 23, "büyük", "küçük")

#if (koşul){
#koşul doğruysa bir şey yap
#} else if (koşul2) {
#koşul2 doğruysa bir şey yap
#} else {
#koşul1 ve koşul2 doğru değilse bir şey yap
#}

age <- 28 

if (age < 23){
  print("Lisans öğrencisi.")
} else if (age >= 23 & age <= 25){
  print("Yüksek lisans öğrencisi.")
} else {
  print("Doktora öğrencisi.")
}

#### if else merdiveni 

# if (koşul){
# şart doğruysa bir şey yap
# } else if (koşul2) {
# şart2 doğruysa bir şey yap
# } else if (koşul3) {
# şart3 doğruysa bir şey yap
# } else {
# şart 1, şart 2 ve şart 3 doğru değilse bir şey yap
# }


###### Alıştırma 1.1 ######

## Elemanları 4,5,-9,6,7,12,-3 olan bir vektör için. 
## Lütfen ifelse kullanarak bunları tek ve çift olarak sınıflandırın

vct <- c(4,5,-9,6,7,12,-3)

ifelse(vct %% 2 == 0, "çift", "tek")


#### 2. for döngüleri ####
# R'de for döngüleri bir iterator değişkeni alır ve 
# ona bir diziden veya vektörden ardışık değerler atar.
# En yaygın olarak bir nesnenin elemanları üzerinde yinelenmek için kullanılır.

# For döngüsünün genel formu

#for(index in vector){
#  buradaki herhangi bir kodu çalıştır
#}

for (i in 1:10) {
  print(i)
}

x <- c("elma", "portakal", "muz", "çilek")

for (i in 1:length(x)) {
  print(x[i])
}

for (i in x){
  print(i)
}

## öğeleri işlemek

sum <- 0 

for (i in 1:10) {
  sum <- sum + i 
  cat("Mevcut toplam değeri", sum,".")
}

print(sum)

###### Alıştırma 2.1 #######

# Elemanları 4,5,-6,2,0,-2,4 olan bir vektör v için bir yapı yazın
# hangi sayının negatif, hangi sayının pozitif olduğunu belirler. 
# Vektörden seçilen bir giriş pozitifse, 
# "pozitif bir sayı" yazdırın, 
# negatifse, "negatif bir sayı" yazdırın. 
# Eğer sıfıra eşitse, "sıfıra eşittir" yazdırın.

v <- c(4,5,-6,2,0,-2,4)

for (i in 1:length(v)) {
  if (v[i] > 0) {
    print("Pozitif bir sayıdır.")
  } else if (v[i] < 0) {
    print("Negatif bir sayıdır.")
  } else {
    print("Sıfıra eşittir.")
  }
}

##### İç içe for döngüleri #####

## for döngüleri birbirinin içine yerleştirilebilir.

#for(index in vector){
#  for(index1 in vector1){
#  buradaki herhangi bir kodu çalıştır
#  }
#}

# Genellikle çok boyutlu veya hiyerarşik veri yapıları için kullanılırlar.
# Ancak iç içe döngülerle dikkatli olun. 2 veya 3 seviyeden fazla iç içe geçmek 
# kodun okunmasını/anlaşılmasını zorlaştırır.

m <- matrix(1:10, 2)
print(m)
for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    print(m[i, j])
  }
}

##### Alıştırma 2.2 #####

# Satır ve sütun numarasının toplamına eşit olan 
# 6'ya 6 boyutunda bir matris oluşturun.

m <- matrix(0, 6, 6)

m

for (i in 1:nrow(m)) {
  for (j in 1:ncol(m)) {
    m[i, j] = i + j
  }
}

m

#### 3. While döngüsü ####

# While döngüleri bir koşulu test ederek başlar. 
# Eğer doğruysa, döngü gövdesini yürütürler. 
# Döngü gövdesi yürütüldükten sonra, koşul tekrar test edilir, 
# ve bu şekilde, koşul yanlış olana kadar devam eder, 
# ardından döngü sona erer.

#while(döngükoşulu){
#  buradaki herhangi bir kodu çalıştır
#}



count<-0

while(count<10){
  count<-count+1
  cat("\n'mycount' is now",count,"\n")
  cat("'mycondition' is now",count<10,"\n")
}


invest <- 5 

while(invest >= 5 && invest <=10){
  
  earning_a_money = rbinom(1,1,0.5) 
  
  if (earning_a_money == 1){
    
    invest <- invest + earning_a_money
    cat("\n'my invest' is now",invest,"\n")
    cat("'mycondition' is now",invest >= 5 && invest <=10,"\n")
  }
  
  else{
    
    invest <- invest - earning_a_money
    cat("\n'my invest' is now",invest,"\n")
    cat("'mycondition' is now",invest >= 5 && invest <=10,"\n")
  }
  
}

## next, bir döngünün bir yinelemesini atlamak için kullanılır.

for(i in 1:100) {
  if(i <= 20) {
    ## İlk 20 yinelemeyi atla
    next
  }
  print(i)
}

x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}

##### Alıştırma 3.2 #####

# 1 ile 1000 arasındaki kaç değer tam olarak 4'e bölünür?

number <- 0 

for(i in 1:1000){
  if(i %% 4 == 0) {
    number <- number + 1
  } else {
    next
  }
}

number

##### repeat ##### 

## repeat, baştan itibaren sonsuz bir döngü başlatır. 
## Bunlar istatistiksel veya veri analizi uygulamalarında yaygın olarak kullanılmaz, 
## ancak bazı kullanımları vardır. Bir repeat döngüsünden çıkmanın tek yolu break kullanmaktır.

#repeat{
#  burada herhangi bir kodu çalıştır
#}

x <- 0
repeat{
  x <- x + 1 
  print(x)
  if(x == 100){
    break
  }
}

#### 4. Kendi fonksiyonlarınızı yazma #### 

## R'de birçok yerleşik fonksiyon olmasına rağmen, kendi 
## fonksiyonlarınızı oluşturmanız gerekir. Bir R fonksiyonu oluşturmak için function anahtar kelimesini kullanırsınız.

# function_name <- function(var){
#   Bir şey yap
#   yeni_değişkeni_döndür
# }

square <- function(x){
  y <- x^2
  return(y)
}

square(2)

square(-2)

## birden fazla girdi verebilirsiniz.

sum.of.square <- function(x,y){
  z <- (x^2) + (y^2)
  return(z)
}

##### Alıştırma 4.1 ##### 

# Verilen iki girdi arasında büyük olan sayıyı gösteren bir fonksiyon yazın.

larger <- function(number1, number2){
  ifelse(number1 > number2, number1, number2)
}

larger(5,8)

##### Alıştırma 4.2 #####

# Birim matris yazdıran bir fonksiyon yazın.

iden_matrix <- function(dim_no){
  m <- matrix(0, dim_no, dim_no)
  for(i in 1:nrow(m)){
    for(j in 1:ncol(m)){
      if(i == j){
        m[i,j] = 1
      } else {
        m[i,j] = 0
      }
    }
  }
  return(m)
}

iden_matrix(5)

iden_matrix(8)

#### 5. Veri Setlerini R'de Okuma ####

# Verilerinizi R'ye yüklemeden önce, verilerinizi doğru bir şekilde 
# R'ye aktarmayı kolaylaştıracak aşağıdaki kontrol listesini gözden geçirmek 
# faydalı olabilir:

## Elektronik tablolarla çalışıyorsanız, genellikle ilk satır başlık için ayrılır,
## ilk sütun ise örnekleme birimini tanımlamak için kullanılır;

## Boşluklu isimler, değerler veya alanlardan kaçının, aksi takdirde her kelime ayrı bir değişken olarak yorumlanır 
## ve veri setinizde satır başına eleman sayısı ile ilgili hatalar oluşur;

## Kelimeleri birleştirmek isterseniz, boşluk yerine kelimelerin arasına nokta ekleyin.

## Kısa isimler, uzun isimlere tercih edilir;

## ?, $,%, ^, &, *, (, ), -,#, ?,,,<,>, /, |, \, [ ,] ,{, ve } gibi semboller içeren isimler kullanmaktan kaçının;

## Ekstra sütunlar veya NA'ların dosyanıza eklenmemesi için Excel dosyanızdaki yorumları silin; ve 
## veri setinizdeki eksik değerlerin NA ile belirtildiğinden emin olun.

##### R çalışma alanınızı hazırlama #####

## Genel olarak, veri setinizi okurken, veri dosyanız 
## çalışma dizininizde olmalıdır, böylece işlem daha kolay olur. 

## Çalışma dizinini nasıl değiştireceğinizi hatırlıyorsanız, tamam. 
## Aksi takdirde, önceki ders dosyasına bakabilirsiniz.

##### R'de mevcut olan veri setini yükleme #####

## R ve R Studio birçok veri seti içerir. 
## Böyle bir veri setini görüntülemek için, 
## R konsolunda veri setinin adını yazmanız yeterlidir.  

## Veri setlerinin listesini görmek için aşağıdaki sayfayı ziyaret edebilirsiniz.
## https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html

library(help = "datasets")

mtcars

attitude

##### TXT dosyalarını read.table() ile okuma ##### 

## Bir .txt veya sekme ile ayrılmış bir metin dosyanız varsa, 
## bunu temel R fonksiyonu read.table() ile kolayca içe aktarabilirsiniz.

## Veri setinizde sütun adları varsa,

data <- read.table("grade.txt", header = TRUE)
data

## Eğer yoksa,

data1 <- read.table("grade1.txt")
data1

colnames(data1)<-c("hour","grade")

data1

##### CSV Excel Dosyalarını R'ye Okuma #####

## Değerleri , veya ; ile ayıran bir dosyanız varsa, genellikle bir .csv dosyası ile çalışıyorsunuzdur.

## Bu dosyayı R'ye başarıyla yüklemek için, ayırıcı karakteri belirttiğiniz read.table() fonksiyonunu 
## kullanabilir veya read.csv() veya read.csv2() fonksiyonlarını kullanabilirsiniz. İlk fonksiyon 
## ayırıcı olarak , kullanıldığında, ikincisi ; kullanıldığında kullanılır.

## read.csv() ve read.csv2() fonksiyonlarının read.table() fonksiyonuna neredeyse 
## özdeş olduğunu unutmayın. Başka bir deyişle, csv dosyalarını okumak için read.table() 
## komutunu kullanabilirsiniz, ancak önerilmez.

riskgamble <- read.csv("riskgamble.csv")
head(riskgamble) # veri setinin ilk 6 gözlemini gösterir

head(riskgamble, 4) # veri setinin ilk 4 gözlemini gösterir

# ```read.delim()``` ile Sınırlandırılmış Dosyaları Okuma

## read.delim fonksiyonu genellikle bir veri matrisinde düzenlenmiş metin dosyalarını okumak için kullanılır,
## satırlar vakaları, sütunlar ise değişkenleri temsil eder.

d <- read.delim("annual.txt", header = TRUE, sep = "\t")
d

## sep="\t" R'ye dosyanın sekme ile ayrıldığını söyler
## (boşluk ile ayrılmış için " " ve virgül ile ayrılmış için "," kullanın)

##### xlsx Excel Dosyalarını R'ye Okuma #####

## Bu dosyayı R'ye başarıyla yüklemek için, readxl kütüphanesini 
## bir kez yüklemelisiniz, ardından ayırıcı karakteri belirttiğiniz 
## read_excel() fonksiyonunu kullanabilirsiniz.

#install.packages("readxl") # kütüphaneyi yükleyin
library(readxl)

labour <- read_excel("labourforce.xlsx", sheet = 1)
head(labour)

## sheet, okumak istediğiniz veri setinin sayfa numarasını belirtir
## col_names İlk satırı sütun adları olarak kullanmak için TRUE, 
## sütunları X1'den Xn'ye kadar sıralamak için FALSE veya her sütuna bir ad veren bir karakter vektörü

## JSON Dosyalarını R'ye Okuma

## Bir JSON dosyası, basit veri yapıları ve nesneleri depolayan bir dosyadır. 
## Verileri, hafif, metin tabanlı ve insan tarafından okunabilir olan 
## standart bir veri değişim formatında içerir. JSON dosyaları başlangıçta JavaScript'in bir alt kümesine dayanıyordu,
## ancak dil bağımsız bir format olarak kabul edilir. JSON dosyalarını R'ye almak için, önce rjson paketini yüklemeniz veya 
## yüklemeniz gerekir. Bunu yaptıktan sonra, fromJSON() fonksiyonunu kullanabilirsiniz. 
## Burada iki seçeneğiniz var:

#install.packages("rjson")
library(rjson)

JsonData <- fromJSON(file = "world_bank.json") # json dosyasından veri içe aktarın

# JSON dosyanız bir URL aracılığıyla kullanılabilir:

#install.packages("rjson")
library(rjson)
JsonData <- fromJSON(file = "https://chronicdata.cdc.gov/api/views/g4ie-h725/rows.json?accessType=DOWNLOAD") # json dosyasından veri içe aktarın

##### SPSS Dosyalarını R'ye Okuma #####

## SPSS yazılımı kullanıcısıysanız ve SPSS dosyalarınızı R'ye içe aktarmak istiyorsanız, 
## önce foreign paketini yükleyin. Paketi yükledikten sonra, içinde bulunan read.spss() fonksiyonunu çalıştırın ve 
## kullanıma hazır olmalısınız!

#install.packages("foreign")
library(foreign)

birth <- read.spss("birth.sav")
head(birth)

birth_dataframe <- data.frame(birth$gender,birth$birthweight,birth$age)

##### İnternetten bir dosya okuma #####

## İnternetten dosya içe aktarmak için read.delim(), read.csv() ve read.table() fonksiyonlarını kullanabilirsiniz.

my_data <- read.delim("http://www.sthda.com/upload/boxplot_format.txt")
head(my_data)

##### R'den veri seti dışa aktarma #####

## R, veri setlerini R çalışma alanından CSV ve sekme ile ayrılmış dosya formatlarına dışa aktarmanıza olanak tanır.

## Bir veri setini CSV dosyasına dışa aktarmak için write.csv fonksiyonunu kullanın.

write.csv(dataset, "filename.csv")

write.csv(labourforce, "filename.csv")

## Bir veri setini txt dosyasına dışa aktarmak için write.table fonksiyonunu kullanın.

write.table(labourforce, "filename.txt", sep = "\t")

## Bir veri setini xlsx dosyasına dışa aktarmak için bir pakete ihtiyacınız var.

#install.packages("openxlsx")

library(openxlsx)

write.xlsx(labourforce, "filename.xlsx")

patientID <- c(1, 2, 3, 4)

age <- c(25, 34, 28, 52)

diabetes <- c("Type1", "Type2", "Type1", "Type1")

level <- c(120, 80, 75, 130)

stage <- c("Poor", "Improved", "Excellent", "Poor")

patientdata <- data.frame(patientID, age, diabetes, level, stage)
patientdata

write.csv(patientdata, "patientdata.csv")

write.table(patientdata, "patientdata.txt", sep = "\t")

write.xlsx(patientdata, "patientdata.xlsx")

# Sonra, çalışma dizininize bakın! :) 

#### 0. R'de Grafikler #### 

# Grafikler, verilerinizi ve sonuçlarınızı özlü bir şekilde sunmanın güçlü bir yoludur. 
# Ne tür verileriniz olursa olsun, bunları grafiksel olarak gösterebileceğiniz bir yol vardır. 
# Bir grafik, kelimeler ve sayılardan daha kolay anlaşılır ve iyi grafikler üretmek 
# önemli bir beceridir. Bazı grafikler ayrıca veri incelerken kullanışlıdır, 
# bu da size var olabilecek kalıplar hakkında bir fikir verebilir; bu da sizi doğru istatistiksel analize yönlendirebilir.

# R, güçlü ve esnek grafik yeteneklerine sahiptir. Genel anlamda, 
# R'nin iki tür grafik komutu vardır: bazı komutlar temel bir grafiğin 
# bir türünü üretir ve diğer komutlar çıktı üzerinde ince ayar yapmak ve daha özelleştirilmiş bir bitiş üretmek için kullanılır.

##### Nokta Grafiği ##### 

# İstatistiksel bir grafik olup, oldukça basit bir ölçek üzerinde çizilen veri noktalarından oluşur. 
# Genellikle küçük veri setleri için kullanılır ve sıra dışı gözlemler ve boşluklar gibi durumları gözlemlemeye yardımcı olur. 

# plot(x)

# R'deki mtcars veri setini düşünelim.

head(mtcars)

summary(mtcars)

str(mtcars)

# Araştırma Sorusu 0

# mpg (mil başına galon) değerleri aralığında nasıl dağılıyor?

plot(mtcars$mpg)

##### Dağılım Grafiği #####
# Dağılım grafikleri, iki veri örneği arasındaki ilişkiyi belirlemenize yardımcı olabilir. 
# Bir dağılım grafiği, bir değişkenin diğerine karşı basit bir grafiğidir. 
# Dağılım grafiği çizmek için şu komut kullanılır.

# plot(x,y) #x bir rastgele değişken, y bir rastgele değişken 

# Araştırma Sorusu 1

# mpg (mil başına galon) değerleri ile hp (beygir gücü) arasında ne tür bir ilişki var?

plot(mtcars$hp, mtcars$mpg)


###### Grafiği Özelleştirme ######

# Eksen isimleri ve başlık eklemek

plot(mtcars$hp,mtcars$mpg,xlab = "Beygir Gücü",
     ylab="Mil Başına Galon",main="Beygir Gücü ve Mil Başına Galon Arasındaki İlişki")
#main komutu grafiğinize başlık eklemek için kullanılır
#xlab komutu x ekseninin adını değiştirmek için kullanılır
#ylab komutu y ekseninin adını değiştirmek için kullanılır

# Sembolleri Çizmek ve Renklendirmek

# Temel dağılım grafiğinizi pch ve col komutlarını kullanarak değiştirebilirsiniz.

plot(mtcars$hp,mtcars$mpg,xlab = "Beygir Gücü",
     ylab="Mil Başına Galon",main="Beygir Gücü ve Mil Başına Galon Arasındaki İlişki",pch=5)
#pch grafikteki noktaların şeklini değiştirir.

plot(mtcars$hp,mtcars$mpg,xlab = "Beygir Gücü",
     ylab="Mil Başına Galon",main="Beygir Gücü ve Mil Başına Galon Arasındaki İlişki",
     pch=5,col="red")
#pch grafikteki noktaların şeklini değiştirir.

# Çizgiler Eklemek ve Eksen Sınırlarını Ayarlamak

# Grafiklerinize çizgi eklemek için,

#abline(a = NULL, b = NULL, h = NULL, v = NULL...)
#a, b kesişim noktası ve eğim, tek değerler.
#h yatay çizgi(ler) için y-değeri(ler).
#v dikey çizgi(ler) için x-değeri(ler).

# Eksen sınırlarını ayarlamak için

xlim = c(başlangıç, bitiş)
ylim = c(başlangıç, bitiş)

# Örneğin, bir grafiği kare yapmak veya bir grafiğin belirli bir bölümüne "yakınlaştırmak" veya bir ekseni vurgulamak için kullanabilirsiniz.

plot(mtcars$hp,mtcars$mpg,xlab = "Beygir Gücü",
     ylab="Mil Başına Galon",main="Beygir Gücü ve Mil Başına Galon Arasındaki İlişki",
     pch=5,col="red",xlim=c(0,200),ylim=c(0,30))
abline(h=c(15,25),v=c(50,150))

##### Alıştırma 0.1  #####

# Lütfen beerhall.txt dosyasını okuyun.
# Ardından, doğru okuyup okumadığınızı kontrol etmek için head(command) kullanın.

beer <- read.table("beerhall.txt", header = TRUE, sep = "\t")
beer$Region_Name[4] <- "South_Eastern"

head(beer)

# Suç ve kamu katılımı arasındaki ilişki nedir?
# Suç ve kamu katılımının dağılım grafiğini çizin.

##### Çizgi Grafiği #####

# Çizgi grafiği, bir değişkendeki değişiklikleri zaman içinde veya iki değişken arasındaki ilişkiyi incelemek için kullanılır.
# Her iki durumda da, x ekseni bağımsız değişkeni (zaman, günler vb.), y ekseni bağımlı değişkeni (sıcaklık, gelir vb.) temsil eder.
# Çizgi grafiği oluşturmak için R'deki plot() fonksiyonu kullanılır.

# Grafik için verileri oluşturun.
rain <- c(7,12,28,3,41)

# Çubuk grafiği çizin.
plot(rain, type = "l")
#	type: plot fonksiyonunda çizgi türünü tanımlar
#type = p Yalnızca noktalar.
#type = b Noktalar arasında çizgi segmentleri.
#type = l Yalnızca çizgi segmentleri, noktalar yok.
#type = o Noktalarla çakışan çizgiler, yani çizgi segmentleri arasında boşluk yok.
#type = c Yalnızca noktaların olacağı yerlerde küçük boşluklarla çizgi segmentleri.

# Bu grafiği güzelleştirelim!

# Daha önce verilen komutları kullanarak çizgi grafiğinizi özelleştirebilirsiniz.

# Çubuk grafiği çizin.
plot(rain, type = "l", col = "red", xlab = "Ay", ylab = "Yağış",
     main = "Yağış Grafiği")
#main->başlık ekler
#xlab ve ylab -> etiket adlarını ekler
#col-> çizgi rengini değiştirir

# Çizgi türlerinizi özelleştirme

# Grafikteki çizgiyi değiştirmek için lty komutunu kullanabilirsiniz.

plot(rain, type = "l", col = "red", xlab = "Ay", ylab = "Yağış",
     main = "Yağış Grafiği", lty = 6)
#lty hakkında daha fazla örnek:
#lty = "solid" veya lty = 1
#lty = "dashed" veya lty = 2
#lty = "dotted" veya lty = 3
#lty = "dotdash" veya lty = 4
#lty = "longdash" veya lty = 5
#lty = "twodash" veya lty = 6

##### Alıştırma 0.2 #####

# Aşağıdaki iki ilgili fonksiyonu çizin: y1 = 2 cos(x), y2 = 0.5 * cos(x),
# aralık 0 < x < 2pi

x <- seq(0, 2 * pi, 0.01)
y1 <- 2 * cos(x)
y2 <- 0.5 * cos(x)

##### Histogram: #####

# Histogramlar, bir sürekli değişkenin dağılımını göstermek için kullanılır.
# Histogram oluşturmak için hist(x) fonksiyonu kullanılır, burada x bir sayısal değerler vektörüdür.

# mtcars veri setini tekrar düşünün.

# Araştırma Sorusu 2

# mtcars veri setindeki mpg değişkeninin dağılımını görsel olarak tanımlayabilir misiniz?

# Bu grafiği güzelleştirelim!

# Daha önce verilen komutları kullanarak histogramınızı özelleştirebilirsiniz.

hist(mtcars$mpg, breaks = 12, col = "red", xlab = "Mil Başına Galon", 
     main = "12 Bölmeli Renkli Histogram")
#breaks seçeneği, bölme sayısını kontrol eder.

##### Bir pencerede birden fazla grafik gösterme #####

# par(mfrow = c(satır, sütun))

par(mfrow = c(1, 2))
hist(mtcars$mpg)
hist(mtcars$mpg, breaks = 12, col = "red", xlab = "Mil Başına Galon", 
     main = "12 Bölmeli Renkli Histogram")

# Ek Örnek: Yoğunluk çizgili histogram

x <- mtcars$mpg
h <- hist(x, breaks = 12, col = "red", xlab = "Mil Başına Galon",
          main = "Histogram ve Normal Eğri")
xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col = "blue", lwd = 2)

##### Alıştırma 0.3 ##### 

# beerhall.txt veri setini tekrar düşünün. 

# Okul katılımı ve kamu katılımı histogramını çizin.

##### Bar grafikleri ##### 

# Bar grafikleri, bir kategorik değişkenin dağılımını (frekansları) dikey veya yatay çubuklar aracılığıyla gösterir.
# En basit haliyle, barplot() fonksiyonunun formatı

#  barplot(table(height)) burada table(height) bir vektör veya matristir.

# Araştırma Sorusu 3#

# mtcars veri setinde hangi silindir türünün en yüksek frekansa sahip olduğunu gösterebilir misiniz?

counts <- table(mtcars$cyl) #table komutu bir frekans tablosu oluşturur
counts

barplot(counts) #basit bar grafiği

barplot(counts, horiz= FALSE) #basit yatay bar grafiği

# Bu grafiği güzelleştirelim!

# Daha önce verilen komutları kullanarak bar grafiğinizi özelleştirebilirsiniz.

barplot(counts, main = "Araba Dağılımı", xlab = "Silindir Sayısı",
        ylab = "Silindir Frekansı", col = c("red", "yellow", "white"),
        legend = c("4 = 4 silindir", "6 = 6 silindir", "8 = 8 silindir"))
#legend grafiğinize bilgi kutusu eklemek için kullanılır.

# Bilgi kutusunun konumunu args.legend kullanarak değiştirebilirsiniz.

barplot(counts, main = "Araba Dağılımı", 
        xlab = "Silindir Sayısı", ylab = "Silindir Frekansı",
        col = c("red", "yellow", "white"), legend = c("4 = 4 silindir", "6 = 6 silindir", "8 = 8 silindir"), 
        args.legend = list(x = "topleft"))
#legend grafiğinize bilgi kutusu eklemek için kullanılır.

##### Alıştırma 0.4 ###### 

# beerhall.txt veri setini tekrar düşünün.

# Bölgelerin frekanslarının bar grafiğini çizin.
# Hangi bölge en yüksek frekansa sahiptir?

##### Box grafikleri #####

# "box-and-whiskers" grafiği, bir sürekli değişkenin dağılımını 
# beş sayılı özetini çizerek açıklar:
# minimum, alt çeyrek (25. yüzde), medyan (50. yüzde), 
# üst çeyrek (75. yüzde) ve maksimum.
# Ayrıca sıra dışı gözlemleri (çeyrekler arası aralığın 1.5 katı dışındaki değerler)
# gösterebilir.

# mtcars veri setini düşünün.

# Araştırma Sorusu 4:#
# mtcars veri setindeki mpg değişkeninde sıra dışı bir gözlem var mı?

boxplot(mtcars$mpg)

# Bu grafiği güzelleştirelim!

# Daha önce verilen komutları kullanarak box grafiğinizi özelleştirebilirsiniz.

boxplot(mtcars$mpg, main = "mpg'nin Box Grafiği", col = "orange")

# Grupları karşılaştırmak için paralel box grafikleri kullanma

# Araştırma Sorusu 5: # 
# Araçların ağırlığı (wt), motor türüne (vs) göre değişiklik gösteriyor mu?

boxplot(mtcars$wt ~ mtcars$vs,
        main = "vs'ye Göre Ağırlıkların Karşılaştırılması", col = c("red", "yellow"))

# Box grafikleri çok yönlüdür. notch=TRUE ekleyerek, notched box grafikleri elde edersiniz.


boxplot(mtcars$wt~mtcars$vs,
        main="Comparison of weights in terms of vs",col=c("red","yellow"),
        notch=TRUE)


# Ek öneri, Google'de Violin Plot in R sorgusunu aratabilirsiniz. 

##### Alıştırma 0.5 ######

# Her bölge için suçluların box grafiğini oluşturun.

##### Pasta grafikleri: #####

# Pasta grafikleri iş dünyasında yaygın olmasına rağmen, çoğu istatistikçi, 
# R belgelerinin yazarları dahil, tarafından küçümsenir. 
# Pasta grafikler yerine çubuk veya nokta grafikleri önerirler çünkü insanlar 
# uzunluğu hacimden daha doğru bir şekilde yargılayabilir. Belki de bu nedenle, 
# R'deki pasta grafik seçenekleri diğer istatistik yazılımlarıyla karşılaştırıldığında oldukça sınırlıdır.
# Pasta grafikler, pie(x, labels) fonksiyonu ile oluşturulur, 
# burada x, her dilimin alanını gösteren negatif olmayan bir sayısal vektördür ve 
# labels, dilim etiketlerini sağlayan bir karakter vektörüdür.

par(mfrow = c(1, 2))
slices <- c(10, 12, 4, 16, 8)
lbls <- c("ABD", "İngiltere", "Avustralya", "Almanya")
pie(slices, labels = lbls,
    main = "Basit Pasta Grafiği")

library(plotrix)
pie3D(slices, labels = lbls, explode = 0.1,
      main = "3D Pasta Grafiği")

##### Kuantil-Kuantil Grafiği (QQ Plot) #####

# Q-Q grafiği, verilerin bir teorik dağılımdan (örneğin Normal veya üstel dağılım) 
# gelip gelmediğini değerlendirmek için kullanılan bir grafik aracıdır.
# Bu laboratuvar için sadece verilerin Normal dağılımdan gelip gelmediğini 
# değerlendirmekle ilgileniyoruz. Diğer dağılımlar için nasıl kullanıldığını 
# inceleyebilirsiniz.

x <- rnorm(100, 2, 4)
y <- rpois(100, 5)

par(mfrow = c(1, 2))
qqnorm(x) # Normal qq grafiği çizmeye yardımcı olur
qqline(x) # teorik çizgi eklemek için
qqnorm(y) # Normal qq grafiği çizmeye yardımcı olur
qqline(y) # teorik çizgi eklemek için

#### 1. ggplot2 Nedir? #####

# ggplot2, grafiklerin dilbilgisine dayanan R için bir grafik sistemidir, 
# temel ve kafes grafiklerin iyi yönlerini almaya çalışır ve kötü yönlerini almaz. 

# Grafiklerin zahmetli ayrıntılarının çoğunu (örneğin, efsane çizme gibi) halleder
# ve aynı zamanda karmaşık çok katmanlı grafikler oluşturmayı kolaylaştıran 
# güçlü bir grafik modeli sağlar.

# Bu özel paket hakkında daha fazla bilgi almak için 
# [http://ggplot2.org/] adresini ziyaret edebilirsiniz.

# Ayrıca, bu paketle ilgili birçok video, kitap ve sayfa vardır. 

# ggplot2, bir grafiğin şu temel parçalara bölünebileceği ilkesine inanan 
# "Grafiklerin Dilbilgisi" ni ifade eder 

# Grafik = veri + Estetik + Geometri

# veri bir veri çerçevesini (veri seti) ifade eder.

# Estetik, x ve y değişkenlerini belirtir. Ayrıca R'ye verilerin bir grafikte nasıl görüntüleneceğini söyler, örneğin, 
# renk, nokta boyutu ve şekli vb.

# Geometri, grafik türünü ifade eder (çubuk grafik, histogram, box plot, 
# çizgi grafiği, yoğunluk grafiği, nokta grafiği vb.)

# Neden ggplot2 daha iyidir?

# Mükemmel temalar tek bir komutla oluşturulabilir.
# Renkleri, normal grafiklerden daha güzel ve daha hoş.
# Birden fazla değişkenle verileri görselleştirmek kolay.
# Çok fazla bilgi sağlayan basit grafikler oluşturmak için bir platform sağlar.


install.packages("ggplot2") # ggplot2 grafiksel gösterim için
install.packages("gcookbook") # gcookbook bazı özel veri setleri için

library(ggplot2) # ggplot2 kütüphanesini çağırma
library(gcookbook) # gcookbook kütüphanesini çağırma

###### Dağılım Grafiği #####

qplot(mtcars$wt, mtcars$mpg) # İlk yöntem

qplot(wt, mpg, data=mtcars) # Diğer bir yöntem

# Önerilen yöntem
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() # geom_point fonksiyonu, grafiğinizi bir dağılım grafiği olarak oluşturur.

##### Alıştırma 1.1 #####

# Suç oranı ve halk katılımı arasındaki ilişki nedir?
# Suç oranı ve halk katılımının dağılım grafiğini çizin.

# Etiket İsimleri ve Başlık Ekleme

# Grafiğinize başlık ve etiket isimleri eklemek için labs komutu kullanılır. Önceki grafiği düşünün.
ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point() + labs(title="Ağırlık ve Yakıt Tüketimi Dağılım Grafiği", 
                      x="Ağırlık", y="Yakıt Tüketimi") 
# title başlık eklemek için kullanılır
# x x ekseninin adını değiştirir
# y y ekseninin adını değiştirir

# labs komutu, başlık vb. eklemek için yalnızca dağılım grafiğinde değil, diğer grafiklerde de kullanılabilir.

# Bir kategorik değişken üzerinde koşullandırılmış iki sürekli değişkenin dağılım grafiğini çizme

head(mtcars)

table(mtcars$cyl) # frekans tablosu oluşturur

ggplot(data = mtcars, aes(x=wt, y=mpg, colour=factor(cyl))) + 
  geom_point() + labs(title="Silindir Sayısına Göre Ağırlık ve Yakıt Tüketimi Dağılım Grafiği", x="Ağırlık", y="Yakıt Tüketimi") 

# Renk Skalası Değiştirme

library(ggplot2)
c <- ggplot(mtcars, aes(x=mpg, y=disp, color=cyl)) + geom_point()
c + scale_color_gradient2(low="yellow", high="red")

# scale_color_gradient2 komutunu kullandığınızda, grafiğinizdeki renklendirme için factor() kullanmayın.

# Çoklu Dağılım Grafiği Çizme

# facet_wrap komutu kullanılarak kolayca çoklu dağılım grafiği üretilebilir.

ggplot(data=mtcars, aes(x=mpg, y=disp)) + 
  geom_point() + labs(title="Silindir Sayısına Göre Ağırlık ve Yakıt Tüketimi Dağılım Grafiği", 
                      x="Ağırlık", y="Yakıt Tüketimi") + facet_wrap("cyl")

##### Alıştırma 1.2 #####

# Beer veri setini düşünün. 
# Suç oranı ve halk katılımı arasındaki ilişkiyi bölge kodu üzerinde koşullandırarak grafiğini çizin.

##### Çizgi Grafiği #####

# R'de mevcut olan pressure veri setini düşünelim.

head(pressure) # İlk 6 gözlemi gösterir

qplot(pressure$temperature, pressure$pressure, geom="line")

qplot(temperature, pressure, data=pressure, geom="line") # Etiket ismi ile

# Diğer bir yöntem

ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() # geom_line grafiğinizi çizgi grafiğine dönüştürür.

ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point() # Noktalar eklemek için

##### Alıştırma 1.3 #####

# x'in aşağıdaki iki ilişkili fonksiyonunu çizin: y1 = 2 cos(x), y2 = 0.5 * cos(x),
# 0 ≤ x ≤ 2π aralığında.

# (İpucu: Bu grafikleri çizmek için data.frame fonksiyonunu kullanarak yeni bir veri seti oluşturmanız gerekmektedir.)

x <- seq(0, 2*pi, 0.01)
y1 <- 2*cos(x)
y2 <- 0.5*cos(x)
data <- data.frame(x, y1, y2)

##### Histogram #####

qplot(mtcars$mpg)

library(ggplot2)
qplot(mpg, data=mtcars) 

# Diğer bir yöntem

ggplot(mtcars, aes(x=mpg)) + 
  geom_histogram() # geom_histogram grafiğinizi histogram yapar

ggplot(mtcars, aes(x=mpg)) + 
  geom_histogram(binwidth=1.5) # binwidth, bin sayısını ayarlar

# Histogram için bazı detaylar

ggplot(mtcars, aes(x=mpg)) + geom_histogram(bins=10, colour="red", fill="yellow")
# bins histogramdaki bin sayısını ayarlar
# fill histogramın içini doldurur
# colour çerçevenin rengini belirler

# Çoklu Histogram Çizimi

# facet_wrap komutu kullanılarak kolayca çoklu histogram üretilebilir.

ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=4, colour="red", fill="yellow") + 
  facet_wrap("cyl")

##### Alıştırma 1.4 #####

# Halk katılımının histogramını çizin.

##### Kutu Grafiği (Box Plot) #####

qplot(as.factor(mtcars$cyl), mtcars$mpg, geom="boxplot")

qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot")

# Diğer bir yöntem

ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_boxplot()

# Kutu Grafiğini Özelleştirme

ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_boxplot(outlier.colour="red", 
                                                            outlier.shape=8, outlier.size=4, 
                                                            fill="yellow", colour="red") +
  labs(title="Silindir Sayısına Göre Yakıt Tüketimi Kutu Grafiği", x="Silindir", y="Yakıt Tüketimi") + 
  theme_minimal()

# Notchlu Kutu Grafiği

ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_boxplot(notch=TRUE)

# Keman Kutu Grafiği

ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_violin()
ggplot(mtcars, aes(x=as.factor(cyl), y=mpg)) + geom_violin(fill="yellow", colour="red")

##### Alıştırma 1.5 #####

# Her bölge için suç oranının kutu grafiğini çizin.

##### Çubuk Grafiği (Bar Plot) #####

ggplot(mtcars, aes(x=cyl)) + geom_bar(stat="count")

# Grafiğinizi Özelleştirin

ggplot(mtcars, aes(x=cyl)) + geom_bar(fill="red", col="yellow")
ggplot(mtcars, aes(x=cyl)) + geom_bar(fill=c("yellow", "blue", "red"))
ggplot(mtcars, aes(x=cyl)) + geom_bar(fill=c("yellow", "blue", "red")) +
  labs(title="Silindir Sayısının Çubuk Grafiği", x="Silindir Sayısı")

# Bir kategorik değişkenin seviyelerine göre sayısal değişkenin çubuk grafiğini çizme

library(gcookbook)
BOD
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity") # Time'ı faktör olarak kullanarak ayrık (kategorik) bir değişkene dönüştürün.
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity", 
                                                    fill="lightblue", colour="black")


ggplot(mtcars,aes(x=cyl))+geom_bar(stat="count")

##### Alıştırma 1.6 #####

# Beerhall.txt veri setini tekrar düşünün. 
# Bölgelerin frekansları için bir çubuk grafik oluşturun. Hangi bölgenin en yüksek frekansa sahip olduğunu belirleyin.

##### Kuantil-Kuantil Grafiği #####

qplot(sample=mpg, data=mtcars)

ggplot(mtcars, aes(sample=mpg)) + stat_qq()

ggplot(mtcars, aes(sample=mpg)) + stat_qq(col="red") # Kırmızı renkle

# Gruplara göre qq plot renklerini değiştirme

ggplot(mtcars) + stat_qq(aes(sample=mpg, colour=factor(cyl)))

# NOT: ggplot'ta doğrusallık çizgisini doğrudan grafiğe ekleyemeyiz, ancak bu amaçla yazılmış birçok fonksiyon internet üzerinde bulunmaktadır ve "Google Amca'ya" sorarak kolayca bulabilirsiniz.

##### Pasta Grafiği #####

# ggplot2'de bir pasta grafiği çizmek için önce bir çubuk grafik oluşturmanız gerekmektedir. Ardından, çubuk grafiğinizi pasta grafiğine dönüştürmelisiniz.

df <- data.frame(slices=c(10, 12, 4, 16, 8), labels=c("US", "UK", "Avustralya", "Almanya", "Fransa"))
df
# Veriyi görselleştirmek için bir çubuk grafik kullanın:
library(ggplot2)
# Çubuk grafik
bp <- ggplot(df, aes(x="", y=slices, fill=labels)) + geom_bar(width=1, stat="identity")
bp # ggplot2 pasta grafiği veri görselleştirmesi için
# Bir pasta grafiği oluşturun:
bp + coord_polar("y", start=0)

### ggplot2 için daha fazla örnek

# https://bookdown.org/ozancanozdemir/introduction-to-ggplot2/

### R Markdown için bir döküman

# https://ozancanozdemir.github.io/markdownforclassreports.pdf

