class Treatment < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :medicines

  validates :dosis, :user_id, presence: true
  
end
