class BinaryTree
	attr_accessor :payload, :left, :right

	def initialize(payload, left, right)
		@payload = payload
		@left = left
		@right = right
	end

	def insert(value)
		if value < @payload && @left == nil
			@left = BinaryTree.new(value, nil, nil)
		elsif value >= @payload && @right == nil
			@right = BinaryTree.new(value, nil, nil)
		elsif value < @payload
			@left.insert(value)
		elsif value >= @payload
			@right.insert(value)				
		end
	end

	def pull(parent) ###pulls smallest number off tree-recursive
		if @left != nil 
			#puts "recursing"
			return @left.pull(self)
		else
			parent.left = @right
			#puts "returning #{@payload}"
			return @payload
		end
	end
end

array=[7, 4, 9, 1, 6, 14, 10]
a = BinaryTree.new(array.shift, nil, nil)
array.each do |element|
	a.insert(element)
end

b=BinaryTree.new(nil, a, nil)
array=[]
while b.left != nil
	array.push(b.left.pull(b))
	#puts "looping"
end

puts array