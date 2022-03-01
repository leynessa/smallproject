class Hangman
  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ''
    @word.first.size.times do
      @word_teaser += '_ '
    end
  end

  def words
    [
      ['cricket', 'a game played by men in all white'],
      ['jogging', 'people do this to loose weight'],
      ['water', 'you cant live without this beverage'],
      ['apple', 'this keeps the doctor away'],
      ['ruby', 'objective programming language']
    ]
  end

  def print_teaser(last_guess = nil)
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser(last_guess)
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      new_teaser[index] = last_guess if letter == '_' && @word.first[index] == last_guess
    end
    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts 'Enter a letter'
      guess = gets.chomp
      good_guess = @word.first.include? guess
      if guess == 'exit'
        puts 'Thank you for playing!'
      elsif guess.length > 1
        puts 'only guess 1 letter '
        make_guess
      elsif good_guess
        puts 'You are correct!'
        print_teaser(guess)
        if @word.first == @word_teaser.split.join
          puts 'Congratulations! you won'
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Sorry... you have #{@lives} lives left. Try again!"
        make_guess
      end
    else
      puts "Game over! you loose! the word was #{@word.first}"
    end
  end

  def begin
    puts "your word is #{@word.first.size} characters long"
    puts "To exit game at any point type 'exit'"
    print_teaser
    puts "Clue: #{@word.last}"
    make_guess
  end
end

game = Hangman.new
game.begin
