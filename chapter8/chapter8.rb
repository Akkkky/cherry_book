# モジュールの定義
#helloメソッドを持つGreeterモジュールを定義
module Greeter
  def hello
    'hello'
  end
end

# モジュールのインスタンスは作成できない
greeter = Greeter.new # => Traceback (most recent call last):chapter8.rb:10:in `<main>': undefined method `new' for Greeter:Module (NoMethodError)

#ほかのモジュールを継承して新しいモジュールを作ることはできない
module AwesomeGreeter < Greeter
end
# => chapter8.rb:13: syntax error, unexpected '<' module AwesomeGreeter < Greeter

