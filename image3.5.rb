class Image

	def initialize(image)
		@image=image
	end


    def blur(n)
    	@image.each_index do |x|
    		@image[x].each_index do |y|
                @copy=@image[0..-1]
    		  	value = @image[x][y]
    		  	a = n 
                b = n
                
                while a > -1 
                    while b > -1    
                        if value == 1 && a+b<=n 
                            @copy[x+a][y+b] = 2
                            @copy[x-a][y-b] = 2
                            @copy[x-a][y+b] = 2
                            @copy[x+a][y-b] = 2
                        end        
                        b=b-1
                    end  
                b=n     
                a=a-1     
                end 
            end
        end	
        puts @copy
        #@image=@copy
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