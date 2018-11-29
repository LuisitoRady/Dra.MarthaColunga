class Pacient < User
	validates :category_id, presence: true
	validates :init_preg_week, presence: true, if: :is_pregnant?
	validates :init_preg_week, numericality: { only_integer: true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 40}

	def is_pregnant?
		category_id == 1
	end

	def whole_name
		"#{names} #{lastnames}"
	end
end