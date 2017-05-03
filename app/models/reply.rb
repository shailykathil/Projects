class Reply < ApplicationRecord
  belongs_to :comment
  mount_uploader :image, DocumentUploader
end
