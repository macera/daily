class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, polymorphic: true

  def user_name
    user.last_name + user.first_name
  end

end
