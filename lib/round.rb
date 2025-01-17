class Round

  attr_reader :deck , :turns , :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @turn_count = 0


  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)

    turn = Turn.new(guess, current_card)
    turns << turn
    if turn.correct?
      @number_correct += 1
    end
    deck.cards.rotate!
    return turn
    # turn
  end



  # def number_correct
  #     if turns.correct?
  #       @number_correct += 1
  #     end
  #     return @number_correct
  # end



  def number_correct_by_category(category)
    number_correct_by_category = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        number_correct_by_category += 1
      end
    end
    return number_correct_by_category
  end

  def percent_correct
    (number_correct.to_f / turns.count.to_f)*100.0
  end

  def percent_correct_by_category(category)
    i = 0
    @turns.each do |turn|
      if turn.card.category == category
      i += 1
      end
    end
    return (number_correct_by_category(category).to_f / i.to_f)*100.0
  end

  def start
    x = 0
    while x < deck.count
      x += 1
    puts "This is card number #{x} out of #{deck.cards.count}."
    puts "Question: #{current_card.question}"
    puts take_turn(gets.chomp).feedback
    # y = 0
    # if take_turn(gets.chomp).correct? == true
    #   y += 1
    # else y + 0
    end
    end
  end

#
#     puts "This is card number 2 of #{deck.cards.count}"
#     puts "Question: #{current_card.question}"
#     puts take_turn(gets.chomp).feedback
#
#     puts "This is card number 3 of #{deck.cards.count}"
#     puts "Question: #{current_card.question}"
#     puts take_turn(gets.chomp).feedback
#
#     puts "This is card number 4 of #{deck.cards.count}"
#     puts "Question: #{current_card.question}"
#     puts take_turn(gets.chomp).feedback
#   end
# end
# end
    # puts "This is card number 2 of #{deck.cards.count}"
    # puts "Question: #{current_card.question}"
    # puts take_turn(gets.chomp).feedback
    # x = 0
    # if
    #
    # while deck.count > x
    #
    # @turns.each do |turn|
