class BowlingGame
  def initialize(hits)
    @hits = hits
  end

  def score
    return @hits.chars.map(&:to_i).reduce(:+) unless @hits.include?('/')
    return 10 + @hits[2].to_i + @hits.chars[2..-1].map(&:to_i).reduce(:+)
  end
end
