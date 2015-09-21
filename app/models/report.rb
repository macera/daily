class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments, -> { order('id asc') }, as: :target, dependent: :destroy
end
