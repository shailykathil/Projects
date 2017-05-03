class Project < ApplicationRecord
	has_many :comments, dependent: :destroy
	mount_uploader :document, DocumentUploader
	belongs_to :category
	has_many :members
	has_many :users
end
