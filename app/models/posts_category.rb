# frozen_string_literal: true

class PostsCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category
end
