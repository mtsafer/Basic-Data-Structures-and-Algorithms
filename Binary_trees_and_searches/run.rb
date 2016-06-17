require_relative 'tree'

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

#returns the node of the binary tree where the root is n
def breadth_first_search( n, b_tree)
	working = b_tree.tree
	q = []
	visited = [working]
	until working.nil? || working.root == n
		if working.left
			q << working.left
			visited << working.left
		end
		if working.right
			q << working.right
			visited << working.right
		end
		working = q.delete_at(0)
	end
	working
end

#returns the node of the binary tree where the root is n
def depth_first_search( n, cursor )
	stack = [cursor]
	visited = [cursor]
	until cursor.root == n || stack.empty?
		if cursor.left && !(visited.include? cursor.left)
			stack << cursor.left
			visited << cursor.left
		elsif cursor.right && !(visited.include? cursor.right)
			stack << cursor.right
			visited << cursor.right
		else
			stack.pop
		end
		cursor = stack.last
	end
	cursor
end

#runs a depth_first_search recursively
def dfs_rec(n, working)
	working = working.tree if working.is_a? Tree # has to do with the tree class
	return working if working && working.root == n # base case
	result = dfs_rec( n, working.left) if working.left
	result = dfs_rec( n, working.right) if working.right && result.nil?
	result
end

#some output to interpret the result of the method call
node = dfs_rec( 5, t )
puts node.inspect
if node.nil?
	puts "That number isn't in the tree"
else
	puts "root = #{node.root}"
	node.left.nil? ? (puts "left = nil") : (puts "left = #{node.left.root}")
	node.right.nil? ? (puts "right = nil") : (puts "right = #{node.right.root}")
end