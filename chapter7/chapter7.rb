class User
  def initialize(name)
    @name = name
  end

  # @name を外部から参照するためのメソッド
  def name
    @name
  end

  # @name を外部から変更するためのメソッド
  # Rubyは`=`で終わるメソッドを定義すると、変数に代入するような形式でそのメソッドを呼び出すことができる
  def name=(value)
    @name = value
  end
end

user = User.new('Alice')
# 変数に代入しているのではなく、実際はname=メソッドを呼び出している
user.name = 'Bob'
puts user.name # => 'Bob'

# 上記のようにインスタンス変数の値を読み書きするメソッドのことを「アクセサメソッド」と呼ぶ
# Rubyの場合、単純にインスタンス変数の内容を外部から読み書きするのであれば、attr_accessorというメソッドを使って退屈なメソッド定義を省略することができる
class User2
  #@nameを読み書きするメソッドが自動的に定義される
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  #nameメソッドやname=メソッドを明示的に定義する必要がない
  # def name
  #   @name
  # end

  # def name=(value)
  #   @name = value
  # end
end

user2 = User2.new('Alice')
# @nameを変更する
user2.name = 'Bob'
# @nameを参照する
puts user2.name # => 'Bob'

# インスタンス変数の内容を読み取り専用にしたい場合はattr_accessorの代わりにattr_readerメソッドを使う
class User3
  # 読み取り専用のメソッドだけを自動的に定義する
  attr_reader :name

  def initialize(name)
    @name = name
  end

  #nameメソッドやname=メソッドを明示的に定義する必要がない
  # def name
  #   @name
  # end

  # def name=(value)
  #   @name = value
  # end
end

user3 = User3.new('Alice')
# @nameの参照はできる
puts user3.name # => 'Alice'
# @nameを変更しようとするとエラーになる
# user3.name = 'Bob'
# => Traceback (most recent call last): chapter7.rb:72:in `<main>': undefined method `name=' for #<User3:0x00007fc2b083e760 @name="Alice"> (NoMethodError) Did you mean?  name