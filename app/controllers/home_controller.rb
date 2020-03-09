class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @countries = Country.all.order(:name)
    @popular_countries = @countries.first(3)
    @popular_country_mentors = @popular_countries.collect {|c| c.users.mentors.first}

    p "<<<<<<<<<<<<<<<<<"
    p @popular_countries
    p @popular_country_mentors
    p "<<<<<<<<<<<<<<<<<"

    @blogs = Blog.last(3)
  end

  def contact ;end

  def faq ;end

  def about_us ;end

  def privacy_and_policy; end
  def refund_policy; end
  def terms_and_condition; end

end
