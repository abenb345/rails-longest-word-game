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

  not_letters = (10.times.map {alphabet.sample})
  @letters = not_letters.join(" ")
  @grid = not_letters.join("")
end

def score
# ISSUE - uri parse read wont work
  # raise
  # @grid = params[:grid]

  if params[:word]

    sentence = params[:word].upcase.chars.to_a
    # if @letters
      # @grid = @letters.join("")
    # end

    if params[:grid]
      # params[:grid] = @letters.join('')
      sentence.each do |letter|
        params[:grid] = params[:grid].sub(letter, '') if params[:grid].include?(letter)
      end

      if params[:grid].size != 10 - sentence.size
        @ans =  "Sorry but #{params[:word]} can't be built out of #{@letters}..."
      elsif params[:grid].size == 10 - sentence.size
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
    end

  #
  #  raise
end

def index
end

end
