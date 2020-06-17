# ハッシュのキーをシンボルにする
currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupeee' }
# p currencies

# => ではなく"シンボル: 値"の記法でハッシュを作成する

currencies = { japan: 'yen', us: 'dollar', india: 'rupeee' }
# p currencies

# ** でハッシュを展開させる
# ** をハッシュの前につけるとハッシュリテラル内で他のハッシュのキーと値を展開することができる
h = { us: 'dollar', india: 'rupeee' }
# p h
h = { japan: 'yen', **h }
p h

# ハッシュの初期値を理解する
h = {}
p h[:foo]
# ハッシュニ対して存在しないキーを指定するとnilが返る。
# nil以外の値を返したいときは、Hash.newでハッシュを作成し、引数に初期値となる値を指定する。
h = Hash.new('hello')
p h[:foo]
# ただし、配列の初期値と同様、newの引数として初期値を指定した場合は、初期値として毎回同じオブジェクトが返る。
# そのため初期値に対して破壊的な変更を適用すると、他の変数の値も一緒に変わってしまう。
a = h[:foo]
b = h[:bar]
p a.equal?(b)
a.upcase!
p a
p b
# 文字列や配列などミュータブルなオブジェクトを初期値として返す場合はHash.newとブロックを組み合わせて初期値を返すことでこのような問題を避けることができる。
h = Hash.new{'hello'}
a = h[:foo]
b = h[:bar]
p a.equal?(b)
a.upcase!
p a
p b