class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reports, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :good_counters, dependent: :destroy
  has_many :notices, dependent: :destroy

  def username
    last_name + first_name
  end
end
