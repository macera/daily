class Report < ActiveRecord::Base
  belongs_to :user
  has_many :timereports, -> { order('id asc') }, dependent: :destroy
  has_many :comments, -> { order('id asc') }, as: :target
  has_many :good_counters, as: :target
  has_many :notices, as: :target
  accepts_nested_attributes_for :timereports, allow_destroy: true
end
