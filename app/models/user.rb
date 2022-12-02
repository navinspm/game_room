class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:timeoutable
  has_many :messages

  def online?
     updated_at > 2.minutes.ago ? "On line" : "Off line"
  end

end
