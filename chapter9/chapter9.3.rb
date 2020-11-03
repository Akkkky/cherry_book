# 例外は捕捉するだけでなく、コードの中で意図的に発生させることができる
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 意図的に例外を発生させる
    raise "無効な国名です。#{country}"
  end
end

currency_of(:japan) # => "yen"
currency_of(:italy) # => RuntimeError:無効な国名です。italy