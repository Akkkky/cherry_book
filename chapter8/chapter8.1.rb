# is-aの関係にはなくても、複数のクラスにまたがって同じような機能が必要になるケースが存在する。
class Product
  def title
    log 'title is called.'
    'A great movie'
  end
    
  private
  
  def log(text)
    puts "[LOG] #{text}"
  end
end

class User
  def name
    log 'name is called.'
    'Alice'
  end
  
  private
  
  # このメソッドの実装はProductクラスのlogメソッドとまったく同じ  
  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new
puts product.title # => [LOG] title is called.
# "A great movie"
user = User.new
puts user.name # => [LOG] name is called.
# "Alice"

puts '---------------------------------'

# ログ出力用のメソッドを提供するモジュール
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end
  
class Product
  # 上で作ったモジュールをincludeする
  include Loggable
  
  def title
    log 'title is called.'
    'A great movie'
  end
end
    
class User
  #こちらも同じようにincludeする
  include Loggable

  def name
    #Loggableモジュールのメソッドが使える
    log 'name is called.'
    'Alice'
  end
end

product = Product.new
puts product.title # => [LOG] title is called.
# "A great movie"

user = User.new
puts user.name # => [LOG] name is called.
# "Alice"





