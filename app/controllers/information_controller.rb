class InformationController < ApplicationController

  def about
    @about = About.first
  end

  def contact
    @contact = Contact.all
  end
end
