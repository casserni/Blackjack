require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  attr_reader :player, :computer, :deck

  def initialize
    @deck = Deck.new
    @player = Hand.new(@deck.deal(2))
    @computer = Hand.new(@deck.deal(2))
  end

  def play
    intro_dialouge
    score_board
    puts "Dealer shows: [#{@computer.view[0]}, unknown]"

    if @player.calculate_hand == 21
      puts "Winner Winner Chicken Dinner!!! Player wins with 21"
    end

    if @computer.calculate_hand == 21
      puts "Oooooh tough loss, Dealer wins with a 21"
    end

    answer = hit_dialouge
    if answer == "S"
      while @computer.calculate_hand < 17
        @computer.add_card(@deck.deal(1)[0])
      end
      winner
    end
    while answer == "H"
      @player.add_card (@deck.deal(1)[0])
      score_board
      puts "Dealer shows: [#{@computer.view[0]}, unknown]"

      if @player.calculate_hand > 21
        puts "Player Busts, Dealer Wins"
        answer = "S"

      else
        answer = hit_dialouge
        if answer == "S"
          while @computer.calculate_hand < 17
            @computer.add_card(@deck.deal(1)[0])
          end
          winner
        end
      end
    end
  end

  private

  def intro_dialouge
    puts "Welcome to the Cassera Casino, lets play some blackjack!!"
    puts "Player was dealt two cards"
    puts "Dealer was dealt two cards"
  end

  def score_board
    puts "\nPlayer shows #{@player.view}"
    puts "Players score: #{@player.calculate_hand}"
  end

  def hit_dialouge
    puts "\nHit or stand (H/S):"
    answer = gets.chomp
    answer.upcase
  end

  def winner
    score_board
    puts "Dealer shows #{@computer.view}"
    puts "Dealers score: #{@computer.calculate_hand}"
    if @player.calculate_hand == @computer.calculate_hand
      puts "Player Ties with the Dealer"
    elsif @player.calculate_hand > @computer.calculate_hand || @computer.calculate_hand > 21
      puts "\nPlayer Wins!!!"
    else
      puts "\nDealer Wins!!!! sorry :("
    end
  end
end

game = Blackjack.new
game.play
