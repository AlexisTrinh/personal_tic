class Player

	attr_accessor :marker_type

	def initialize(str)
		@marker_type = str
	end

	def play(board)
		played = false

		while played == false
			puts "Please enter x:"
			x = gets.chomp.to_i
			puts "Please enter y:"
			y = gets.chomp.to_i
			if board.mark_down!(x,y,@marker_type)
				puts "Played!"
				played = true
			end
		end
	end
end