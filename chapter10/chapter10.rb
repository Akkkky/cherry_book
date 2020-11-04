# Procオブジェクト内で引数やローカル変数を参照すると、メソッドの実行が完了してもProcオブジェクトは引き続き引数やローカル変数にアクセスし続けることができる
def generate_proc(array)
  counter = 0
  # Procオブジェクトをメソッドの戻り値とする
  Proc.new do
    # ローカル変数のcounterを加算する
    counter += 10
    # メソッド引数のarrayにcounterの値を追加する
    array << counter
  end
end

values = []
sample_proc = generate_proc(values)
# generate_procメソッドを呼び出した直後はvaluesの中身は当然空のまま
p values # => []

# Procオブジェクトを実行するとgenerate_procメソッドの引数だったvaluesの中身が書き換えられる
sample_proc.call
p values # => [10]
# generate_procメソッド内のローカル変数counterも加算され続ける
sample_proc.call
p values # => [10,20]

# このようにメソッド（関数）が生成されたときのコンテキスト（変数情報など）を保持しているメソッドのことをプログラミング用語でクロージャ（closure、関数閉包）と言う
# RubyのブロックやProcオブジェクトはクロージャとして振る舞う
