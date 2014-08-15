require 'timeout'

class LiveHumanBot < BaseBot
  INPUT_MAPPINGS = Hash.new("Stay").merge({
    'w' => "North",
    'a' => "West",
    's' => "South",
    'd' => "East",
  })
  
  # API allows 2 seconds for response; give player less to be safe
  PLAYER_INPUT_TIMEOUT = 1.0
  
  def move(state)
    game = Game.new(state)
    
    move = begin
      Timeout::timeout(PLAYER_INPUT_TIMEOUT) do
        input = gets.chomp # await typed text, sent by a Return/Enter keypress
        INPUT_MAPPINGS[input]
      end
    rescue Timeout::Error => e
      "Stay"
    end
    
    move
  end

end
