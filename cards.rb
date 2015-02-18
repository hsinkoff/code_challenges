class Card
	attr_accessor :rank, :suit

	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end

	def output_card
		puts "#{@rank} of #{@suit}"
	end
	
	def display_card
		puts "#{self.rank} of #{self.suit}"
	end
	
	#def self.random_card
	#	Card.new(rand(10), :spades)
	#end
end

class Deck
	def initialize
		@cards=[]
		@rank =["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
		for item in @rank
			@cards << Card.new(item, :spades)
			@cards << Card.new(item, :clubs)
			@cards << Card.new(item, :hearts)
			@cards << Card.new(item, :diamonds)
		end
	end

	def shuffle
		@cards.shuffle!
	end

	def deal
		@cards.shift
	end

	def output
		@cards.each do |card|
			card.output_card
		end
	end
end

deck = Deck.new
deck.shuffle
card = deck.deal
card.display_card

