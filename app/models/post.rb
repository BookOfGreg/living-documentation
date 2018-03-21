class Post < ApplicationRecord
  belongs_to :categories
  validates :title, :content, :category_id, presence: true
end
