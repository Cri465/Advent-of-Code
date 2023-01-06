require '../helpers/helpers'
class Day2
  SCORES = { 'X' => 1, 'Y' => 2, 'Z' => 3, 'win' => 6, 'draw' => 3, 'loss' => 0 }.freeze


  def initialize
    @puzzle_input = Helpers.read_puzzle_input.split("\n")
    p result_p1
  end

  def check_result(game)
    case game
    when "A Z", "B X", "C Y", 'X'
      'loss'
    when "A Y", "B Z", "C X", 'Z'
      'win'
    else
      'draw'
    end
  end

  def result_p1
    @puzzle_input.map do |game|
      SCORES[check_result(game)] + SCORES[game.chars.last]
    end.sum
  end

  def get_desired_move(game)
    my_moves =             [ 'X', 'Y', 'Z' ]
    opponent_moves =       [ 'A', 'B', 'C' ]
    move_lookup = { 'win' => 1, 'loss' => -1, 'draw' => 0 }
    my_moves[opponent_moves.index(game[:opponent_move])]
  end

  def result_p2
    @puzzle_input.map do |game|
    end
  end
end

Day2.new
