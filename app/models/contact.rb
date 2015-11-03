class Contact < ActiveRecord::Base
  validates_presence_of :name, :phone_number
  validates :phone_number, length: {minimum: 10, maximum: 11}
  validates_format_of :phone_number, :with => /[0-9]/, :on => :create
end
