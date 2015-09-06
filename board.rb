class Board
	attr_accessor :height, :width, :marks

	def initialize(height, width)
		@height = height
		@width = width
		@marks = Array.new(height) { Array.new(width, 0) }
	end

	def mark_down!(x,y,type)
		if legal_move(x,y)
			@marks[x][y] = type
			return true
		else
			puts "I am sorry, illegal."
			return false
		end
	end

	def legal_move(x,y)
		if x < width && y < height && @marks[x][y]==0
			true
		else
			false
		end
	end

	def any_equal_line?(matrix)
		matrix.each do |line|
			return true if completed_set?(line)
		end
		false
	end

	def any_complete_diagonal?(array)
		if !array[0].nil?
			s = array[0].length-1 
		else 
			return false
		end
		result_diag1 = []
		result_diag2 = []
		for i in 0..s
			result_diag1 << array[i][i]
			result_diag2 << array[i][s-i]
		end
		return true if completed_set?(result_diag1) || completed_set?(result_diag2)
		false
	end

	def is_over?
		return true if any_equal_line?(marks) || any_equal_line?(marks.transpose) || any_complete_diagonal?(marks)
		false
	end

	def completed_set?(set)
		return true if set.uniq.length == 1 && set[0]!=0
		false
	end

	def display
		@marks.each {|l|p l}
	end

end