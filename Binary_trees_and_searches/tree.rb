require_relative 'node'

class Tree

	attr_reader :tree

	def initialize(array, index = 0)
		@tree = build_tree array
	end

	private

		def build_tree array
			tree = Node.new(array.delete_at(0)) unless array.empty?
			until array.empty?
				new_node = Node.new(array.delete_at(0))
				tree = add(new_node, tree)
			end
			tree
		end

		def add( node, tree )
			if node.root > tree.root
				tree.right.nil? ? tree.right = node : add( node, tree.right )
			else
				tree.left.nil? ? tree.left = node : add( node, tree.left )
			end
			tree
		end

end