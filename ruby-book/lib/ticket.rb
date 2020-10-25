class Ticket
  # 読み取り用のメソッドだけを自動的に定義する
  attr_reader :fare, :stampd_at

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    @stampd_at = name
  end
end