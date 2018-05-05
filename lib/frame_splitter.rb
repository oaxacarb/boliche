class FrameSplitter
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def frames
    if game[3] == '/' &&  game[15] == '/'
      return game[0, 2].scan(/../) + [game[2, 3]] + game[4, 10].scan(/../) + [game[14,3]] + game[16..-1].scan(/../)
    end

    if game[1] == '/' &&  game[17] == '/'
      return [game[0,3]] + game[2, 14].scan(/../) + [game[16, 3]] + game[18..-1].scan(/../)
    end

    if game[15] == '/' &&  game[17] == '/'
      return game[0, 14].scan(/../) + [game[14, 3], game[16, 3]] + game[18..-1].scan(/../)
    end
    index = game.index('/')
    if index
      return game[0,index - 1].scan(/../) + [game[index - 1, 3]] + game[(index + 1)..-1].scan(/../)
    end
    game.scan(/../)
  end
end
