class Appointment < ApplicationRecord
  belongs_to :user
  validates :title, :appointment_date, :user_id, presence: true
end
