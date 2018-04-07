class FrameSplitter
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def frames
    index = game.index('/')
    if index
      return game[0,index - 1].scan(/../) + [game[index - 1, 3]] + game[(index + 1)..-1].scan(/../)
    end
    game.scan(/../)
  end
end
