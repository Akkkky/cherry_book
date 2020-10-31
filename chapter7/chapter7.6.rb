class User
end

user = User.new
# Userクラスにはメソッドを何一つ定義していないが、デフォルトでObjectクラスを継承しているのでto_sメソッドやnil?メソッドを呼び出せる
puts user.to_s # => #<User:0x00007ffdfc910738>
puts user.nil? # => flase

# 次のようにするとObjectクラスから継承したメソッドの一覧を確認できる
puts user.methods.sort

# 継承関係（is-a関係にあるかどうか）を含めて確認した場合はis_a?メソッドを使う
puts user.is_a?(User) # => true
puts user.is_a?(Object) # => true
puts user.is_a?(BasicObject) # => true

class Product
  attr_reader :name, :price
  
  def initialize(name,price)
    @name = name
    @price = price
  end

  # Productクラスでto_sをオーバーライドする
  def to_s
    "name:#{name},price:#{price}"
  end
end

class DVD < Product
  attr_reader :running_time
  
  def initialize(name, price, running_time)
    # スーパークラスのinitializeメソッドを呼び出す
    super(name,price)
    @running_time = running_time
  end

  def to_s 
    # superでスーパークラスのto_sメソッドを呼び出す
    # このようにすることでサブクラスではスーパークラスで用意されていない差分をコーディングするだけで目的の処理を実装できる
    "#{super},running_time:#{running_time}"
  end
end

product = Product.new('Agreatmovie',1000)
puts product.to_s # => "name:Agreatmovie,price:1000"

dvd = DVD.new('Anawesomefilm',3000,120) # => "name:Anawesomefilm,price:3000,running_time:120"
puts dvd.to_s

# クラスを継承するとクラスメソッドも継承される
class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

# Fooを継承したBarでもクラスメソッドのhelloが呼び出せる
puts Foo.hello # => 'hello'
puts Bar.hello # => 'hello'