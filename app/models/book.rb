class Book < ActiveRecord::Base
  attr_accessible :author, :info, :title, :webpage, :lang, :categories, :image, :remote_image_url, :remove_image
  validates :author, presence: true 
  validates :info, presence: true 
  validates :title, presence: true
  validates :webpage, presence: true

  mount_uploader :image, ImageUploader

  include PgSearch
pg_search_scope :search_by_book, 
				:against => [:author, :info, :title, :lang, :categories],
                :using => {
                    :tsearch => {:prefix => true, :any_word => true}
                  }
end
