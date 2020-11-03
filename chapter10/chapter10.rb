class WordSynth
  def initialize
    @effects = []
  end
    
  def add_effect(effect)
    @effects << effect
  end
    
  def play(original_words)
    @effects.inject(original_words) do |words,effect|
    #効果を適用する
      effect.call(words)
    end
  end
end