class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
end
