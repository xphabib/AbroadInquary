class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def contact ;end

  def faq ;end

  def about_us ;end

  def privacy_and_policy; end

end
