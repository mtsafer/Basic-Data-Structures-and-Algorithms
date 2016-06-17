class Node
	attr_accessor :root, :left, :right
	def initialize( root = nil, left = nil, right = nil )
		@root = root
		@left = left
		@right = right
	end
end