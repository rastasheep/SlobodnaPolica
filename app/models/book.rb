class Book < ActiveRecord::Base
  attr_accessible :author, :info, :title, :webpage, :lang, :categories, :image, :remote_image_url, :remove_image
  validates :author, presence: true 
  validates :info, presence: true 
  validates :title, presence: true
  validates :webpage, :format =>{ :with => /^((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix, :message => " is not valid" }

  mount_uploader :image, ImageUploader

before_validation :smart_add_url_protocol

protected

def smart_add_url_protocol
   unless self.webpage[/^http?s:\/\//]
    self.webpage = 'http://' + self.webpage
  end
end

  include PgSearch
    pg_search_scope :search_by_book, 
    				:against => [:author, :info, :title, :lang, :categories],
                    :using => {
                        :tsearch => {:prefix => true, :any_word => true}
                      }


end
