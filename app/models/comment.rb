class Comment < ActiveRecord::Base
  belongs_to :post
  validates :author, :presence => true, length: {:maximum => 40}
  validates :author_website, :length => {:maximum => 40}
  validates :body, :presence => true, :length => {:maximum => 400}

  before_create :set_posted_datetime

  private
  def set_posted_datetime
    self.posted = Time.now
  end
end
