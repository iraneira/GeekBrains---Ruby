#Итак, отправляемся на поиски методов:

#Для модуля Base64:

#Методы модуля для кодирования/декодирования строки в base64

require 'base64'
str = 'VGhpcyBpcyBsaW5lIG9uZQpUaGlzIG' +
      'lzIGxpbmUgdHdvClRoaXMgaXMgbGlu' +
      'ZSB0aHJlZQpBbmQgc28gb24uLi4K'
puts Base64.decode64(str) # => This is line one
#                              This is line two
#                              This is line three
#                              And so on...

require 'base64'
Base64.encode64("Now is the time for all good coders\nto learn Ruby") # => Tm93IGlzIHRoZSB0aW1lIGZvciBhbGwgZ29vZCBjb2RlcnMKdG8gbGVhcm4gUnVieQ==


#Для модуля Benchmark:

#Метод модуля, принимающий блок и вычисляющий время его выполнения
require 'benchmark'

n = 1000000

time = Benchmark.measure do
  n.times { a = "1" }
end
puts time # => 0.170000   0.000000   0.170000 (  0.168369)

#Для модуля Find:

#Метод модуля для рекурсивного обхода дерева каталогов относительно имени заданного каталога (передаётся в качестве аргумента)
find(*paths, ignore_error: true)

#Для класса Digest::MD5:

#Метод класса, вычисляющий md5 хэш от строки

require 'digest'

md5 = Digest::MD5.new
md5.update 'message1'
md5 << 'message2'                     # << is an alias for update

md5.hexdigest                         #=> "94af09c09bb9..."

#Для модуля Timeout:

#Метод модуля, выкидывающий исключение, если код исполняемый в блоке вычисляется более N секунд

require 'timeout'
status = Timeout::timeout(5) {
  # Something that should be interrupted if it takes more than 5 seconds...
}