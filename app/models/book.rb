class Book < ActiveRecord::Base
  attr_accessible :author, :info, :title, :webpage, :lang, :categories, :image, :remote_image_url
  validates :author, presence: true 
  validates :info, presence: true 
  validates :title, presence: true
  validates :webpage, presence: true

  mount_uploader :image, ImageUploader

end
