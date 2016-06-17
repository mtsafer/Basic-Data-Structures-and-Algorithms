#Behaves like a regular Array except the push method adds to the front
#in order to simulate a queue
class MyQueue < Array
	def push(elem)
		self.unshift(elem)
	end
end

class Board
	def initialize
		@max_x = 7
		@max_y = 7
	end

	#returns true if the toke is on the board, false otherwise
	def on_board?(token)
		token.x <= @max_x && token.y <= @max_y
	end
end

class Knight
	attr_accessor :x, :y, :history
	def initialize(position, history = [])
		@x = position[0]
		@y = position[1]
		@history = history + [ position ] #add current position to the record
	end

	#returns the position of a knight
	def position
		[ @x, @y ]
	end

	#returns an array of knights at the 8 possible positions from
	#the current knights position
	def children
		moves = [ [@x+2, @y+1], [@x+2, @y-1], [@x-2, @y+1], [@x-2, @y-1],
              [@x+1, @y+2], [@x+1, @y-2], [@x-1, @y+2], [@x-1, @y-2] ]
    moves.map { |position| Knight.new( position, @history ) }
	end
end

#returns the steps taken for a knight to get from start to stop
#in the least turns
def knight_moves(start, stop)
	knight = Knight.new(start)
	board = Board.new
	q = MyQueue.new

	q.push knight

	until knight.position == stop
		knight = q.pop #select the knight from queue
		#Set children to all valid moves
		children = knight.children.select { |k| board.on_board?(k) } #k for knight
		#add each valid child move to the queue
		children.each { |k| q.push(k) }
	end
	knight.history #returns the array of all moves made
end

#Accepts a start and stop and prints useful info to the user
def find_moves(start, stop)
	moves = knight_moves(start, stop)
	puts "You made it in #{moves.length - 1} moves! Here's you path:"
	puts moves.inspect
end

find_moves( [3,3], [4,3] )