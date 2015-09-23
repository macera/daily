class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, polymorphic: true
  def user_name
    user.username
  end
end
