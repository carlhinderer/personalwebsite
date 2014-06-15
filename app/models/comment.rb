class Comment < ActiveRecord::Base
  belongs_to :post
  validates :author, presence: true
  validates :body, presence: true

  before_create :set_posted_datetime

  private
  def set_posted_datetime
    self.posted = Time.now
  end
end
