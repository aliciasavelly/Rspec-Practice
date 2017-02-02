class Towers
  attr_accessor :game

  def initialize
    @game = [[3,2,1],[],[]]
  end

  def display
    puts game_render
  end

  def game_render
    'Tower 0:  ' + @game[0].join('  ') + "\n" +
    'Tower 1:  ' + @game[1].join('  ') + "\n" +
    'Tower 2:  ' + @game[2].join('  ') + "\n"
  end

  def play
    until won?
      while true
        display
        puts "Choose a pile to move from: "
        from_pile = gets.chomp.to_i
        puts "Choose a pile to move to: "
        to_pile = gets.chomp.to_i
        break if valid_move?(from_pile, to_pile)
        puts "Try a different selection!"
      end
      move_disc(from_pile, to_pile)
    end
    puts "Congratulations!"
  end

  def move_disc(pile1, pile2)
    game[pile2] << game[pile1].pop
  end

  def valid_move?(pile1, pile2)
    return false if game[pile1].empty?
    #to do
    return true if game[pile2].empty?
    return game[pile1].last < game[pile2].last ? true : false
  end

  def won?
    game == [[],[],[3,2,1]]
  end

end
