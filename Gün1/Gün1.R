############### R Programlamaya Giriş #######################
###############    Ozancan Ozdemir ##########################


#### 0. İlk Adımlar... ####

# function_name(input_argument) -> Tipik bir R kodu bu şekilde görünür. 

#### 1. Temel Fonksiyonlar ####

### R scriptinden kodunuzu çalıştırmak için Ctrl + Enter tuşlarına basın. 

getwd() #çalışma dizinini öğrenmek için

setwd("/Users/ozancanozdemir/Desktop") #çalışma dizininizi ayarlamak için.

dir() #çalışma dizinindeki dosyaları listele

sessionInfo()

### Veri analizi süreci için önemli.

##### Güçlü Bir Hesap Makinesi ######

#+	(toplama)
#-	(çıkarma)
#*	(çarpma)
# /	(bölme)
#^ veya ** (kuvvet alma / üstelme)
#x %% y	mod (x mod y)
#log  (ln) 
#log10 (taban 10'luk logaritma)
#exp() (üstel kuvvet) 
#sqrt sayının karekökünü hesaplar

5+3 

5-3

7*8 

88/2 

5^2 

3**4

18%%4 # 18 (mod 4)

log(5) #ln

log10(1000) #log10

sqrt(4)


# Bonus 

pi

### Ctrl + L konsolunuzu temizler

##### Bir Değişkene Atama #####

x <- 5 

x <<- 5 

x = 5

5 -> x 

5 ->> x 

X = 4

## Genellikle x <- 5 veya x = 5 kullanmayı tercih ederiz

## Değişkenlere ne ad verilir

### İsim bir harf ile başlamalı
### Harfler, sayılar, nokta veya alt çizgi karakterleri ile devam edebilir
### Büyük/küçük harf önemlidir. Yani a ve A farklı isimlerdir

metu<-1956

stat<-1975

ozan<-1994

print(metu) #print değişkeninizi konsolda görüntüler

print(stat)

print(ozan)

ls() #çalışma alanında hangi nesneler ve fonksiyonların kaydedildiğini görmek için
rm("ozan") #çalışma alanından ozan nesnesini kaldırır
rm(list=ls()) #çalışma alanındaki her şeyi kaldırır


##### Alıştırma 1 ######

## 2*4 - (2/7) ve 2*(4 -(2/7)) hesaplayın

2*4 - (2/7)

2*(4 -(2/7))

## 7^2 + (4*40/5) - 3 hesaplayın

7^2 + (4*40/5) - 3 

## x = 5 iken x^2 + 2x + 6 hesaplayın

x = 5

x^2 + 2*x + 6


####### Yardım Almak ###### 

?mean #veya

help(median)

#Komutun tam şeklini bilmiyorsanız, çeşitli yollarla yardım alabilirsiniz.

??mean

help.search("mean")


##### Paket Yükleme #####

### CRAN'dan indirin

## https://cran.r-project.org/web/packages/available_packages_by_name.html

install.packages()

install.packages("DamiaNN")

install.packages(dependencies = TRUE) #paketi bağımlılıkları ile birlikte indirir

### GitHub'dan indirin

devtools::install_github("DeveloperName/PackageName")

# veya 

remotes::install_github("DeveloperName/PackageName")

remotes::install_github("ozancanozdemir/ggpowerbi")

##### Paket Yükleme / Ekleme #####

library()

library(ggplot2)

require()

require(ggplot2)

#### 2. Veri/Nesne Türleri ####


### R'de 5 ana nesne türü vardır. 

# numeric  = (3, 11.6, 159786452)
# integer (1L, 11L, 999L, "L" harfi bunun bir tam sayı olduğunu belirtir)
# complex (1+ 4i, burada "i" sanal kısmıdır)
# character/string ("Ozancan", "FALSE", "11.11", "Galatasaray")
# logical/booleans (TRUE veya FALSE) & (T veya F) #sadece baş harfler

## Numeric ve integer arasındaki ana fark 
## integer türünün sadece tam sayıları içerebilmesi,
## numeric türünün ise ondalıklı sayıları içerebilmesidir.


## Nesne türünü class() fonksiyonunu kullanarak öğrenebilirsiniz.


adim <- "Ozancan"

class(adim)

adim_soyadim <- "Ozancan Ozdemir"

class(adim_soyadim)

yasim <- 28

class(yasim)

yasim_2 <- 28L

class(yasim_2)

denklem <- 4+8i

class(denklem)

karar <- TRUE

class(karar)

## Nesnelerinizin türünü as.type_name() kullanarak değiştirebilirsiniz

print(yasim_2)

yasim_3 <- as.numeric(yasim_2)

class(yasim_3)

as.character(yasim)

as.integer(adim) #NA döner

number_but_character <- "28"

print(number_but_character)

class(number_but_character)

as.numeric(number_but_character)

## Nesnenizin türünü is.type_name() ile kontrol edebilirsiniz

is.integer(yasim)

is.character(adim)


#### İlişkisel ve Mantıksal Operatörler ####

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

### Bunlar her zaman bir boolean değeri döner. (TRUE veya FALSE)


6 > 7

9 != 6

3<5&6>7

3<5|6>7

x <- 9 

x < 8

sq <- 1:10 #1 ile 10 arasında bir dizi oluşturun.

print(sq)

class(sq)

sq[sq > 6] #sq nesnesinde 6'yı aşan değerleri döndürür.

#### 3. Nesnelerinizi Oluşturmak #### 

##### Dizi #####

### Sayı dizileri, grafiklerin eksenlerini çizmekten simüle edilmiş veri üretmeye kadar birçok farklı görevde kullanılır. 
### R'de bir dizi oluşturmanın iki yolu vardır.

#### İlk yol : operatörünü kullanmaktır.


1:20 #1'den 20'ye kadar varsayılan artış değeri 1 olan bir dizi

seq(1,20)#1'den 20'ye kadar varsayılan artış değeri 1 olan bir dizi
#seq(ilk değer,son değer, artış miktarı)

#Bu komutun başka bir kullanımı şu şekildedir;

seq(from = 1, to = 10)

#1'den 10'a kadar artış 2 olan bir dizi istesem ne olur?**

seq(1,10,2) 
#seq(ilk değer,son değer, artış miktarı)

###### Dizinizin Tekrarlanması #####


## rep(x) : x içindeki değerleri yineler

a<-seq(1,9,3)
a
rep(seq(1,9,3),4) #dizinin kendisini 4 kez tekrarlar.

#Ayrıca,

rep(a,4)

rep(seq(1,9,3),each=4) #dizideki sayıları 4 kez tekrarlar

###### Alıştırma 3.1 #####

### 9, 18, 27, 36, 45 dizisini oluşturmak için seq() fonksiyonunu kullanın.

seq(9,45,9)

###### Alıştırma 3.2 #####

### Lütfen aşağıdaki dizileri oluşturun

##### 0'dan 9'a ve 30'dan 10'a kadar bir dizi.

0:9

seq(30,10,-1)

##### 0'dan 20'ye kadar 2 artışla bir dizi.

seq(0,20,2)

##### Her bir öğenin 4 kez tekrarlandığı, 3 artışla 1'den 10'a kadar bir dizi.

rep(seq(1,10,3),each =4)

##### 1'den 10'a kadar 4 kez tekrar eden bir dizi.

rep(seq(1,10,1),4)

##### Vektörler #####

# Vektörler, sayısal veriler, 
# karakter verileri veya mantıksal veriler tutabilen tek boyutlu dizilerdir. 
# Vektörü oluşturmak için birleştirme işlevi c() kullanılır. 

a <- c(1, 2.8, 5, 3, 6, -2, 4.6)

print(a)
class(a)

b <- c("one", "two", "three")

print(b)
class(b)

c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

print(c)
class(c)

metu<- c("odtu", 1956,  "yilinda","kuruldu")

print(metu)
class(metu)

###### Vektör Manipülasyonları #####

## a adlı vektör nesnesini düşünün.

print(a)

#Vektör a'nın uzunluğunu öğrenmek için

length(a)

#Nesnenizin vektör olup olmadığını kontrol etmek için

is.vector(a)

#Vektör a'nın 3. girişini çıkarmak için

a[3]

#Vektör a'nın 1., 3. ve 5. girişlerini çıkarmak için

a[seq(1,5,2)]


#VEYA


a[c(1,3,5)]


#Bir vektörün 3. girişini kaldırmak için


a[-3]


#Vektör a'nın 1., 3. ve 5. girişlerini kaldırmak için

a[-seq(1,5,2)] #VEYA


a[-c(1,3,5)]

a1 =  a[-c(1,3,5)]

#a'da 3'e eşit olmayan öğeleri görüntülemek için 

a[a != 3]


#a'da en az 4 olan öğeleri görüntülemek için

a[a>=4]

#Öğelerinizi küçükten büyüğe doğru görüntülemek için

sort(a)

#Öğelerinizi büyükten küçüğe doğru görüntülemek için

sort(a, decreasing = TRUE)

## Matematiksel işlemler vektördeki her bir elemana uygulanır

#a'daki öğeleri üstel kuvvet olarak hesaplamak için

exp(a)

#Logaritma hesaplamak için 

log(a)

#Vektördeki her bir elemanın iki katını hesaplamak için

a*2

#metu adlı vektör nesnesini düşünün.

print(metu)

#metu vektöründe odtu'ya eşit olan girişi çıkarmak için

metu[metu == "odtu"]

#metu vektöründe odtu'nun indeksi nedir? 

# which(): Bir mantıksal nesnenin TRUE indekslerini verir

which(metu=="odtu")



###### Alıştırma 3.3 #####

### (0,1,1,2,3,5,8,13,21,34) vektörünü oluşturun

vct <- c(0,1,1,2,3,5,8,13,21,34) 

#üçüncü eleman 

vct[3]

#ilk, ikinci ve üçüncü eleman 

vct[1:3]

#1,2,4 ve 8 numaralı indekslere karşılık gelen elemanlar  

vct[c(1,2,4,8)]

#vektörde 34'ün indeksi nedir? 

which(vct == 34)

#ilk elemanın sonuncu, ikinci elemanın sondan ikinci olduğu şekilde vektörü yeniden düzenleyin, ve böylece devam eder. Doğal olarak, sonuncu birinci elemandır. 

vct[seq(length(vct),1,-1)]

#Mantıksal TRUE ve FALSE değerlerini kullanarak tek numaralı indekslere karşılık gelen elemanlar. 

vct[1:length(vct)%%2 ==0]

#5 ile 20 arasındaki tüm elemanlar.

vct[vct>=5 & vct<=20]

#5'ten küçük veya 20'den büyük tüm elemanlar.

vct[vct<5 | vct>20]

###### Vektör İşlemleri ######

takim = c("Galatasaray","Fenerbahce","Besiktas")

gol = c(30,10,10)

rbind(takim,gol) #her iki nesne de eşit uzunlukta olmalıdır

cbind(takim,gol)

##### Matrisler ##### 

## Matris iki boyutlu bir dizidir.
## Matrisler genellikle matrix ve c fonksiyonları ile oluşturulur. 

mat1 <-matrix(1:6, nrow= 3, ncol=2)

# nrow = 3 satır sayısını temsil eder
# ncol = 2 sütun sayısını temsil eder

mat1

class(mat1)

is.matrix(mat1)

mat2 <-matrix(1:6, ncol=2)
mat2

matrix(0,5,5) # 5x5 tüm elemanları 0 olan matris 

matrix(1,4,4) # 4x4 tüm elemanları 1 olan matris 

diag(1,4,4) # 4x4 birim matris 

###### Matris Manipülasyonu ve İşlemleri ##### 

# matrix_name[row_index,column_index]

# mat3'ü düşünün

mat3 <- matrix(1:9,3,3)

print(mat3)

# Matrisin boyutunu öğrenmek için 

dim(mat3)

nrow(mat3) #satır sayısını döndürür

ncol(mat3) #sütun sayısını döndürür

# İlk sütunu görüntülemek için 

mat3[,1]

# 2. satırı görüntülemek için

mat3[2,]

# mat3 matrisinde örneğin 2,1. girişi çıkarmak için

mat3[2,1]

# mat3'ün ilk iki satırını ve ilk iki sütununu çıkarmak için

mat3[c(1,2),c(1,2)]

# Girişleri değiştirmek için 

mat3[1,] = c(1.1,4.4,7.7)
mat3

# 3. sütunu kaldırmak için 

mat3[,-3]

# 1. satırı kaldırmak için

mat3[-1,]

# 1,1'deki girişi kaldırmak için

mat3[1,1] <- NA

mat3

# Matrislerin satırlarına ve sütunlarına isimler verebiliriz. 

rownames(mat3)=c("istanbul","beyoglu","taksim")
colnames(mat3)=c("galata","saray","takimi")

print(mat3)

mat3["istanbul","galata"]

# Matrislerinize yeni girişler eklemek için 

m <- matrix(c(1,2,3,4) , 2,2,T)
m

m[ ,3] <- c(1,2) # Üçüncü sütun yok! 

cbind(m , c(1, 2))
rbind(m , c(1, 2))

cbind(m , c(1, 2, 3))
rbind(m , c(1, 2, 3))

####### Cebirsel İşlemler ve detaylar #######

A <- matrix(c( 6, 1, 0, -3,-1, 2),3, 2, byrow = TRUE)
print(A)
B <- matrix(c( 4, 2, 0, 1, -5, -1),3, 2, byrow = TRUE)
print(B)

dim(A) == dim(B)

A + B

A - B


A * B # bu bileşen-bileşen çarpımıdır, matris çarpımı değildir


t(A) #matrisin transpozunu almak

C<-matrix(c(2,4,2,8),nrow=2)
C

ncol(A) == nrow(C)

A%*%C #matris çarpımı

det(C) #matrisin determinantı 

solve (C) #matrisin tersini almak

##### Diziler #####

# Diziler matrislere benzer ancak ikiden fazla boyuta sahip olabilir.
# KULLANIM: myarray <- array(vektor, boyutlar, boyut isimleri)
help(array)

myarray <- array(c(1:80), c(2, 5, 10))
myarray[1, 2:3, 5]
myarray[1, , ]

class(myarray[1, , ])


dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
z
z[, , "C4"]

thisarray <- c(1:24)
# İlk matristen birinci satırdaki tüm öğelere erişin

multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray
multiarray[c(1), , 1]

2 %in% myarray
200 %in% myarray

which(2 %in% multiarray)

which(32 %in% multiarray)

dim(multiarray)
length(multiarray)

##### Veri Çerçeveleri #####

# Veri Çerçeveleri Bir veri çerçevesi, bir matristen daha geneldir,
# çünkü farklı sütunlar farklı veri modlarını içerebilir
# (sayısal, karakter vb.). 

# R'de en sık karşılaşacağınız veri yapılarıdır.

# Veri çerçevesi nesnesi, data.frame(col1, col2, col3,.) fonksiyonu ile oluşturulur 
# burada col1, col2, col3, . herhangi bir türdeki sütun vektörleridir (karakter, sayısal veya mantıksal gibi). Her sütun için isimler names fonksiyonu ile sağlanabilir.

patientID <- c(1, 2, 3, 4)

age <- c(25, 34, 28, 52)

diabetes <- c("Type1", "Type2", "Type1", "Type1")

level <- c(120, 80, 75, 130)

stage <- c("Poor", "Improved", "Excellent", "Poor")

patientdata <- data.frame(patientID, age, diabetes, level, stage)
patientdata

class(patientdata) #sınıfı kontrol et

is.data.frame(patientdata) #nesne adını doğrula 

str(patientdata) #fonksiyonun detaylarını gösterir 

###### Veri Çerçevesi Manipülasyonları ###### 

# İlk iki değişkeni çıkarmak için 

patientdata[1:2]

# İkinci ve dördüncü hastaların bilgilerini çıkarmak için 

patientdata[c(2,4),]

# Sütunları isimleriyle çıkarmak için 

patientdata[c("diabetes", "stage")]

# veya 

attach(patientdata)

age # age kolonunun elde edilmesi. 

# Üçüncü hastanın yaşını çıkarmak için 

patientdata[3,"age"]

patientdata[3,2]

# Veri çerçevesinde bir girişi değiştirmek için 

patientdata[3,2] = 27

# Şarta dayalı gözlemleri çıkarmak için

patientdata[patientdata$age>30,]

# Belirli bir değişkeni çıkarmak için 

patientdata$age #vektör nesnesi döner

patientdata$age[patientdata$age>30]

# Yeni bir sütun eklemek için 

patientdata$diab_index = patientdata$level/patientdata$age

print(patientdata)

# Birden fazla sütun eklemek için 

patientpersonal <- data.frame(gender = c("Male",
                                         "Female",
                                         "Female","Male"),
                              status = c("Married","Single",
                                         "Single","Married"))
print(patientpersonal)

patientdata1 <- data.frame(patientdata,patientpersonal)

print(patientdata1)

patientpersonal1 <- data.frame(patientID  =  c(1, 2, 3, 4),
                               gender = c("Male",
                                          "Female",
                                          "Female","Male"),
                               status = c("Married","Single",
                                          "Single","Married"))

# Vektörünüzü veri çerçevesinde oluşturuyorsanız, <- yerine = kullanın

print(patientpersonal1)

patientdata2<-merge(patientdata,patientpersonal1,by ="patientID")

print(patientdata2)


##### Listeler #####

### Listeler, R veri türlerinin en karmaşığıdır. 
### Temelde, bir liste, nesnelerin (bileşenlerin) sıralı bir koleksiyonudur. 
### Bir liste, çeşitli (muhtemelen ilgisiz) nesneleri 
### tek bir ad altında toplamanıza olanak tanır.

x <- c(6,8,10)
x
class(x)

is.list(x)

list1 <- list(6,8,c(10,4))
list1
class(list1)

is.list(list1)

length(list1) #nesnenin uzunluğunu döner 

unlist(list1) #vektör döner 

###### Liste Manipülasyonları #####

## Liste nesnesi oluşturma ## 

j <- list(c("Joe","Marry","Michael"), 
          c(55000,12000,7000),
          c(46,28,20))

print(j)

length(j)

str(j)

### Liste öğelerini konum veya ad ile bulma

j[[1]]


j[[2]]


j[[1]][2]

j1 <- list(name=c("Joe","Marry","Michael"), 
           salary=c(55000,12000,7000),
           age=c(46,28,20))

print(j1)

j1$name

j1$name[2]

names(j) <- c("name","salary","age")

print(j)



### Listede bir elemanı kontrol etme 

"Marry" %in% j1

"Marry" %in% j1[[1]]

### Listeye yeni nesne ekleme 

append(j1, "ozan")

j1[[1]][4] = "ozan"

j1

append(j1, "ozan", after = 2)

j1[-1]


# önceki komutlarınızla çalışın
history() # son 25 komutu görüntüle

# komut geçmişinizi kaydedin
savehistory(file="mycodes") 

# çalışma alanını geçerli çalışma dizinindeki .RData dosyasına kaydedin
save.image("Day1Data")

ls() #geçerli çalışma alanındaki R nesnelerini listele
rm(x) #çalışma alanından x'i kaldır
rm(list=ls()) #çalışma alanındaki tüm değişkenleri kaldır

q() #R programınızı kapatın. 
