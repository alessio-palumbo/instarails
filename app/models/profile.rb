class Profile < ApplicationRecord
  include ImageUploader::Attachment.new(:avatar)

  validates :name, :username, presence: true
  validates :name, uniqueness: true
  belongs_to :user
end
