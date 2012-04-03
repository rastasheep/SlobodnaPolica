class Book < ActiveRecord::Base
  attr_accessible :author, :info, :title, :webpage
  validates :author, presence: true 
  validates :info, presence: true 
  validates :title, presence: true
  validates :webpage, presence: true
end
