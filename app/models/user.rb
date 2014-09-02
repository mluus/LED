class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :rentee

  def is_admin?
    current_user.email == 'morne.luus@gmail.com' unless current_user.blank?
  end
end
