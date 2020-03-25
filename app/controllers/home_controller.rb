class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @countries = Country.all.order(:name)
    @popular_countries = @countries.first(3)
    @popular_country_mentors = @popular_countries.collect {|c| c.users.mentors.first}
    @blogs = Blog.last(3)
  end

  def contact ;end

  def submit_contact_info
    ContactUsMailer.welcome_email(contact_params).deliver
    flash[:success] = 'Message has sent successfully!'
    redirect_to '/contact'
  end

  def faq ;end

  def about_us ;end

  def privacy_and_policy; end
  def refund_policy; end
  def terms_and_condition; end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :subject, :message)
  end

end
