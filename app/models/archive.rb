class Archive < ApplicationRecord
  belongs_to :user

  validates :title, :description, :document, presence: true

  mount_uploader :document, DocumentUploader
end
