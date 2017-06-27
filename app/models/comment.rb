class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user
  has_many :pictures
  has_many :user
end
