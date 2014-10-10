class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validates :email, email: true, allow_blank: true

  def first_name
    name.split.first
  end
end
