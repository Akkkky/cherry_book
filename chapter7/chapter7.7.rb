# publicメソッドはクラスの外部からでも自由に呼び出せるメソッド
# initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになる
class User
  def hello
    'Hello!'
  end
end

user = User.new
# publicメソッドなのでクラスの外部から呼び出せる
puts user.hello # => 'Hello!'

# privateメソッドは名前のとおりに説明するなら「クラスの外からは呼び出せず、クラスの内部でのみ使えるメソッド」だと言える
# クラス内でprivateキーワードを書くと、そこから下で定義されたメソッドはprivateメソッドになる
class User2
  # ここから下で定義されたメソッドはprivate
  private

  def hello
    'Hello!'
  end
end

user2 = User2.new
# privateメソッドなのでクラスの外部から呼び出せない
# user2.hello
# => Traceback (most recent call last): chapter7.7.rb:26:in `<main>': private method `hello' called for #<User2:0x00007f967005be10> (NoMethodError)

# 厳密に言うとprivateメソッドは「レシーバを指定して呼び出すことができないメソッド」になる
# user.helloと書いた場合はuserがhelloメソッドのレシーバになるが、helloメソッドがprivateメソッドであればレシーバを指定できないので、
# user.helloのように呼び出すとエラーになる。これがクラスの外から呼び出せない正確な理由
# 
# 「privateメソッドはレシーバを指定できない」というルールはクラスの内部でも有効
# privateメソッドではself付きで呼び出すとエラーになる。なぜならselfというレシーバを指定してメソッドを呼び出ていることになるから

# 2.7からprivateメソッドもselfを付けて呼び出せるようになったため、以下のコードはエラーにならない
class User3
  def hello
    # nameメソッドはprivateなのでselfを付けるとエラーになる
    "Hello,Iam#{self.name}."
  end
  
  private

  def name
    'Alice'
  end
end

user3 = User3.new
puts user3.hello