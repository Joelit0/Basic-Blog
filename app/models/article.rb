class Article < ApplicationRecord
  has_many :images
  validates :name, :content, presence: true
end
