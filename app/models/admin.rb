class Admin < ActiveRecord::Base
  # Include default devise modules :registerable, :recoverable, 
  # :rememberable, :trackable, :validatable
  # Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable
end
