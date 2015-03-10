#It will output the element it is searching for but it checks through all the nodes.
#It doesn't stop once it finds the element.  It should to lower computational load, but how?


 class Tree
    attr_accessor :payload, :children

    def initialize(payload, children)
        @payload = payload
        @children = children
    end


 #depth check
	def depth_check(element)
		if self.payload == element
			#puts self.payload
			return self.payload 
		else
			#puts self.payload
			self.children.each do |child|
				a=child.depth_check(element)
				if a != nil
					return a
				end
			end
			return nil
		end
	end

end


# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

puts trunk.depth_check(4)
