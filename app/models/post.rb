require 'redcarpet'
require 'pygmentize'

class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :tags
end
