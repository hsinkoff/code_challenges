class Image

	def initialize(image)
		@image=image
	end


    def blur(n)
    	@image.each_index do |x|
    		@image[x].each_index do |y|
    		  	value = @image[x][y]
    		  	a = n 
                b = n
                if value ==1
                    while a > -1 
                        while b > -1    
                            if a+b<=n && (x+a)<@image[y].length && (y+b)<@image[x].length
                                @image[x+a][y+b] = 2
                            end
                            if a+b<=n && (x-a)>=0 && (y-b)>=0
                                @image[x-a][y-b] = 2
                            end
                            if a+b<=n && (x-a)>=0 && (y+b)<@image[x].length
                                @image[x-a][y+b] = 2
                            end
                            if a+b<=n && (x+a)<@image[y].length && (y-b)>=0
                                @image[x+a][y-b] = 2
                            end        
                            b=b-1
                        end  
                        b=n     
                        a=a-1     
                    end 
                end
            end
        end	
        @image.each_index do |x|
            @image[x].each_index do |y|
                value2 = @image[x][y]
                if value2==2
                    @image[x][y]=1
                end
            end
        end
    end

    def output_image
		@image.each do |row|
			puts row.join
		end
	end
	
end

image = Image.new ([
[0,0,0,0,0,0,0],
[0,0,0,0,0,0,0],
[0,0,0,0,0,0,0],
[0,0,0,1,0,0,0],
[0,0,0,0,0,0,0],
[0,0,0,0,0,0,0],
[0,0,0,0,0,0,0],
])


image.blur(3)

image.output_image