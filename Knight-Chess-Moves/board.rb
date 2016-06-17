require_relative 'knight'

class Board

	attr_accessor :knight

	def initialize
		@knight = Knight.new
	end
end