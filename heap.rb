class Heapsort
	attr_accessor :a
	def initialize(a)
		@a=a
	end

	def hsort
		length=@a.length
		self.heapify(@a, length)

		e = length - 1
		while e > 0  
			@a[e], @a[0] = @a[0], @a[e]
			e = e - 1
			self.siftdown(@a, 0, e)
		end
		puts @a
	end

	def heapify(a, length)
		start = (length-2)/2

		while start >= 0 
			self.siftdown(a, start, length-1)
			start=start-1
		end
	end

	def siftdown(a, start, e) 
		root = start
		while root * 2 + 1 <= e 
			child = root * 2 + 1
			if child + 1 <= e && a[child] < a[child +1]
				child = child + 1
			end
			if a[root] < a[child]
				a[root], a[child]=a[child], a[root]
				root = child
			else
				return
			end
		end
	end
end

	array = [7, 6, 2, 12, 5, 9, 1, 4, 3, 8, 0]
	#a = [5, 3, 7, 12, 17, 2, 1]
	h = Heapsort.new(array)
	h.hsort
	#hp = Heapsort.new(a)
	#hp.hsort