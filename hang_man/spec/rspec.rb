require "lib/hangman"
game = Hangman.new

describe "Hangman" do
  it 'hangman.rb file should exist' do
    expect(hangman.file_exists?).to be(true)
  end

  it '`Hangman` class should be defined' do
    expect(game.class_defined?).to be(true)
  end
end
