# frozen_string_literal: true

class Post < ApplicationRecord
  self.per_page = 5

  belongs_to :user

  has_many :posts_categories
  has_many :categories, through: :posts_categories
  accepts_nested_attributes_for :categories

  validates :title, :content, :category_ids, presence: true
end
