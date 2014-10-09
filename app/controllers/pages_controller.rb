class PagesController < ApplicationController

  def index
    @contact = Contact.new
  end

end
