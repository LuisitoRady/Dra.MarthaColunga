class Secretary < User
	validates :salary, presence: true
	validates :salary, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 10000}
end