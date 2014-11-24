class Contact < ActiveRecord::Base
  validates :name, :address, presence: true
end
