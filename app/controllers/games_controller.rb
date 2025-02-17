class GamesController < ApplicationController

def new

  # describe "#generate_@" do
  #   let(:grid) { generate_grid(10) }

  #   it "should generate grid of required size" do
  #     expect(grid.size).to eq 10
  #   end

  #   it "should generate random grid" do
  #     expect(grid).not_to eq generate_grid(9)
  #   end

  #   it "should allow for repetitive letters" do
  #     long_grid = generate_grid(27)
  #     expect(long_grid.uniq.length).not_to eq long_grid.length
  #   end
  # end
  alphabet = ('A'..'Z').to_a;

  @letters = (10.times.map {alphabet.sample}).join(" ")
end

def score
  if params[:word]

    sentence = params[:word].upcase.chars
    if @letters
      @grid = @letters.join('')
    end

    sentence.each do |letter|
      @grid = @grid.sub(letter, '') if @grid.include?(letter)
    end

    if @grid.size != 10 - array.size
      @ans =  "Sorry but #{params[:word]} can't be built out of #{@letters}..."
    elsif @grid.size == 10 - array.size
      url = "https://dictionary.lewagon.com/#{params[:word]}"
      user_serialized = URI.parse(url).read
      user = JSON.parse(user_serialized)
      if user[:found]
        @ans = "Congratulations, #{params[:word]} is a valid English word"
      else
        @ans = "Sorry but #{params[:word]} is not an valid English word..."
      end
    end
  else
    @ans = "Enter word"
  end

  # raise
end

def index
end

end
