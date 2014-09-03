class Rentee < ActiveRecord::Base

  attr_accessor :email
  has_many :engineers
  belongs_to :user

end
