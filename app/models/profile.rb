class Profile < ApplicationRecord
  include ImageUploader::Attachment.new(:avatar)

  belongs_to :user
end