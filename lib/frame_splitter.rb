class FrameSplitter
  def initialize(game)
    @game = game
  end

  def frames
    @game.scan(/../)
  end
end
