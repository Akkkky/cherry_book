# 定数はミュータブルなオブジェクトに注意する
class Product
    NAME = 'Aproduct'
    SOME_NAMES = ['Foo','Bar','Baz']
    SOME_PRICES = {'Foo' => 1000,'Bar' => 2000,'Baz' => 3000}
    
    def self.names_without_foo(names = SOME_NAMES)
      # namesがデフォルト値だと、以下のコードは定数のSOME_NAMESを破壊的に変更していることになる
      names.delete('Foo')
      names
    end
end

# 文字列を破壊的に大文字に変更する
Product::NAME.upcase!
puts Product::NAME # => "APRODUCT"
# 配列に新しい要素を追加する
Product::SOME_NAMES << 'Hoge'
p Product::SOME_NAMES # => ["Foo","Bar","Baz","Hoge"]
# ハッシュに新しいキーと値を追加する
Product::SOME_PRICES['Hoge'] = 4000
puts Product::SOME_PRICES #=> {"Foo"=>1000, "Bar"=>2000, "Baz"=>3000, "Hoge"=>4000}

# 定数の中身が変わる
Product.names_without_foo
p Product::SOME_NAMES # => [Bar","Baz","Hoge"]

# クラスインスタンス変数
# インスタンス変数はクラスをインスタンス化（クラス名.newでオブジェクトを作成）した際に、オブジェクトごとに管理される変数
# クラスインスタンス変数はインスタンスの作成とは無関係に、クラス自身が保持しているデータ（クラス自身のインスタンス変数）
# クラス構文の直下や、クラスメソッドの内部で@で始まる変数を操作すると、クラスインスタンス変数にアクセスしていることになる
class Product
  # クラスインスタンス変数
  @name = 'Product'
  
  def self.name
    # クラスインスタンス変数
    @name
  end
  
  def initialize(name)
    # インスタンス変数
    @name = name
  end
  
  #attr_reader:nameでもいいが、@nameの中身を意識するためにあえてメソッドを定義する
  def name
    # インスタンス変数
    @name
  end
end

puts Product.name # => "Product"
product = Product.new('A great movie')
puts product.name # => "A great movie"
puts Product.name # => "Product"

puts '------------------------------------------------'

class DVD < Product
  @name = 'DVD'
  
  def self.name
    #クラスインスタンス変数を参照
    @name
  end
  
  def upcase_name
    #インスタンス変数を参照
    @name.upcase
  end
end

puts Product.name # => "Product"
puts DVD.name # => "DVD"
product = Product.new('A great movie')
puts product.name # => "A great movie"
dvd = DVD.new('An awesome film')
puts dvd.name # => "An awesome film"
puts dvd.upcase_name # => "AN AWESOME FILM"
puts Product.name # => "Product"