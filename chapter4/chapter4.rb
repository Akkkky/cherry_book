# inject メソッドの動き
numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n }
p sum # => 10

# 上のコードは inject メソッドを使うと次のように書ける
numbers = [1, 2, 3, 4]
sum = numbers.inject(0) { |result, n| result + n }
p sum

=begin
ブロックの第1引数（上のコードのresult）は初回のみinjectメソッドの引数（上のコードでは0）が入ります。2回目以降は前回のブロックの戻り値が入ります。
ブロックの第2引数（上のコードのn）は配列の各要素（1、2、3、4）が順番に入ります。ブロックの戻り値は次の回に引き継がれ、ブロックの第1引数（result）に入ります。
繰り返し処理が最後まで終わると、ブロックの戻り値がinjectメソッドの戻り値になります。
=end

numbers = [1, 2, 3, 4]
sum = numbers.inject(0) do |result, n|
  result + n
end
p sum

# 配列の連結にはconcatメソッドか+演算子を使う
# 違いは元の配列を変更するかどうか（破壊的かどうか）という点
a = [1]
b = [2, 3]
a.concat(b)
p a # 破壊的
p b # 変更されない

# 可変長引数は配列として受け取ることができる
def greeting(*names)
  "#{names.join('と')}、こんにちは！"
end

p greeting('aaa','bbb','ccc')
p greeting(['ddd','eee','fff'])

# 繰り返し処理をしつつ、処理している要素の添え字も取得したい場合はeach_with_indexメソッドを使うと便利
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index do |fruit, i|
  puts "#{i}: #{fruit}"
end

# 配列がブロック引数に渡される場合
dimensions=[[10,20],[30,40],[50,60],]
areas = []
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end

p areas

# ブロック引数の数を2個にすると、縦と横の値を別々に受け取ることができよりシンプルに書ける
areas = []
# 配列の要素文だけブロック引数を用意すると、各要素の値が別々の変数に格納される
dimensions.each do |length, width|
  areas << length * width
end

p areas

# upto
a = []
10.upto(14) { |n| a << n }
p a