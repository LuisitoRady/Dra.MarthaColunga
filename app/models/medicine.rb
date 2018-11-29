class Medicine < ApplicationRecord
	has_and_belongs_to_many :treatments

	validates :name, :pills, presence: true
	validates :pills, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 40}

	def get_name
		name
	end
end
