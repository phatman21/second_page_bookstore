class About < ActiveRecord::Base
  validates :title, :about, presence: true
end
