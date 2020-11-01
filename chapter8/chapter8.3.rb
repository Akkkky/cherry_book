# モジュールをextendする
# extendを使うと、モジュール内のメソッドをそのクラスの特異メソッド（つまりクラスメソッド）にすることができる

# モジュールの定義はincludeするときと同じ
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end
  
class Product
  #Loggableモジュールのメソッドを特異メソッド（クラスメソッド）としてミックスインする
  extend Loggable

  def self.create_products(names)
    # logメソッドをクラスメソッド内で呼び出す
    # （つまりlogメソッド自体もクラスメソッドになっている）
    log 'create_productsiscalled.'
    # ほかの実装は省略
  end
end

# クラスメソッド経由でlogメソッドが呼び出される
Product.create_products([]) # => [LOG] create_productsiscalled.

# Productクラスのクラスメソッドとして直接呼び出すことも可能
Product.log('Hello.') # => [LOG] Hello.


