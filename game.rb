class Game

	require './board.rb'
	require './player.rb'

	attr_accessor :current_board, :player_one, :player_two

	def initialize
		@current_board = Board.new(3,3)
		@player_one = Player.new("X")
		@player_two = Player.new("O")
	end

	def play
		while true

			@current_board.display
			if !current_board.is_over?
				player_one.play(@current_board)
			else
				puts "Player 2 has won!"
				break
			end

			@current_board.display
			if !current_board.is_over?
				player_two.play(@current_board)
			else
				puts "Player 1 has won!"
				break
			end
		end
	end


end

game = Game.new.play