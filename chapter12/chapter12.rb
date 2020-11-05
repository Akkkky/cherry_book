# Dateクラスは日付を扱うクラスで、TimeクラスとDateTimeクラスは日付と時刻を扱うクラス
# このうちTimeクラスだけが組み込みライブラリになっているので、requireせずに使うことができる
# 反対にDateクラスとDateTimeクラスは組み込みライブラリではないため、dateライブラリをrequireしないと使うことができない

# Timeクラスで日時を表すオブジェクトを作成する
p time = Time.new(2017,1,31,23,30,59) # => 2017013123:30:59+0900
# dateライブラリをrequireするとDateクラスとDateTimeクラスが使えるようになる
require 'date'
# Dateクラスで日付を表すオブジェクトを作成する
p date = Date.new(2017,1,31) # => #<Date:20170131((2457785j,0s,0n),+0s,2299161j)>
# DateTimeクラスで日時を表すオブジェクトを作成する
p date_time = DateTime.new(2017,1,31,23,30,59) # => #<DateTime:20170131T23:30:59+00:00

puts "--------------------------------------------"

# ファイルやディレクトリの扱い

# FileクラスとDirクラスは組み込みライブラリなので、requireなしで使うことができる
# カレントディレクトリに"secret.txt"が存在するか？
p File.exists?('./secret.txt')
# カレントディレクトリに"secret_folder"が存在するか？
p Dir.exists?('./secret_folder')

puts "--------------------------------------------"

# libディレクトリにあるfizz_buzz.rbの行数をターミナルに表示する
File.open('../ruby-book/lib/fizz_buzz.rb','r') do |f|
  puts f.readlines.count
end
# libディレクトリにhello_world.txtを作成して文字を書き込む
File.open('../ruby-book/lib/hello_world.txt','w') do |f|
  f.puts 'Hello,world!'
end
