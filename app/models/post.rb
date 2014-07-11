class Post < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates :body, presence: true
  validates :posted, presence: true
  validates :category_id, presence: true

  extend FriendlyId
  friendly_id :title, :use => :slugged
end
