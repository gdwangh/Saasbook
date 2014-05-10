# 作业1-3：石头剪刀布

class RockPaperScissors
  @@AwinB=Array[['R','S'],['S','P'],['P','R'],['R','R'],['S','S'],['P','P']]

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  
  # 1. 游戏胜者：创建一个类RockPaperScissors，它拥有一个类方法winner，
  # 该方法接受像上面那样的两元素数组作为参数，并返回表示胜者的数组
  def self.winner(player1, player2)
    raise NoSuchStrategyError.new("Strategy must be one of R,P,S") unless  /\A[PRS]\Z/.match(player1[1]) && /\A[PRS]\Z/.match(player2[1])

    @@AwinB.include?([player1[1],player2[1]]) ? player1 : player2
  end

  #  锦标赛：一场石头剪子布锦标赛被表示为一个的游戏序列，序列的每一个元素自己也可以看成一场锦标赛。
  def self.tournament_winner(tournament)
    return tournament if !Array.try_convert(tournament[0])
    
    game_a = self.tournament_winner(tournament[0])
    game_b = self.tournament_winner(tournament[1])
    self.winner(game_a, game_b)
  end
end

