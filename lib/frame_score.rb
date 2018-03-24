class FrameScore
  def initialize  hits
    @hits = hits
  end
  def score
    return 30 if @hits == 'xxx'
    return 20 + @hits[2].to_i if @hits.start_with? "xx"

    if @hits.chars.include?("x") && @hits.chars.include?("/")
      return 20
    end

    if @hits.start_with? "x"
      return 10 + @hits[1].to_i + @hits[2].to_i
    end

    if @hits.chars.include? "/"
      return 10 + @hits[2].to_i
    end
    @hits.chars.map(&:to_i).reduce(:+)
  end
end
