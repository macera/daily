class Report < ActiveRecord::Base
  belongs_to :user
  has_many :timereports, -> { order('id asc') }, dependent: :destroy
  has_many :comments, -> { order('id asc') }, as: :target
  has_many :good_counters, as: :target
  has_many :notices, as: :target
  accepts_nested_attributes_for :timereports, allow_destroy: true

  def copy
    report = self.class.new
    report.user_id = user_id
    timereport_size = self.timereports.size
    timereport_size.times do
      report.timereports.build()
    end
    report.attributes = self.attributes
    report.timereports.each_with_index do |new_timereport, n|
      new_timereport.attributes = self.timereports[n].attributes
    end
    report
  end
end
