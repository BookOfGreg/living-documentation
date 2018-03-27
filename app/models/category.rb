# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user

  has_many :posts_categories
  has_many :posts, through: :posts_categories
end
