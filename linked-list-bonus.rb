class LinkedListNode
	attr_accessor :value, :next_node

	def initialize(value, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

def floyd_cycle(loopnode)
	hare=LinkedListNode.new(loopnode.value, loopnode.next_node)
	tortoise=LinkedListNode.new(loopnode.value, loopnode.next_node)
	begin	
		if hare==nil
			puts "false-no loop"
			return
		elsif tortoise==nil
			puts "false-no loop"
			return
		elsif hare == tortoise
			puts "true-loop"
			return
		end
		if tortoise.next_node != nil && tortoise.next_node.next_node != nil
			tortoise=tortoise.next_node.next_node
			hare=hare.next_node
		else
			puts "No Loop"
			return
		end
	end until hare ==nil || tortoise ==nil
end

def print_values(list_node)
	print "#{list_node.value} --> "
	if list_node.next_node.nil?
		print "nil\n"
		return
	else
		print_values(list_node.next_node)
	end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

floyd_cycle(node1)

#print_values(node3)

