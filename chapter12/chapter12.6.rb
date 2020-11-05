# evalメソッドは受け取った文字列をRubyのコードとして実行する
# 文字列としてRubyのコードを記述する
code = '[1,2,3].map{ |n| n*10 }'
# evalメソッドに渡すと、文字列がRubyのコードとして実行される
p eval(code) # => [10,20,30]

# バッククオートリテラルはバッククオート（`）で囲まれた文字列をOSコマンドとして実行する
# OSのcatコマンドでテキストファイルの中身を表示する
puts `cat ../ruby-book/lib/fizz_buzz.rb`
puts `ruby ../ruby-book/lib/fizz_buzz.rb`