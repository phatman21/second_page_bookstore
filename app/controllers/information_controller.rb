class InformationController < ApplicationController
  def about
    @about = About.first
    @category = Category.all
  end

  def contact
    @contact = Contact.all
    @category = Category.all
  end
end
