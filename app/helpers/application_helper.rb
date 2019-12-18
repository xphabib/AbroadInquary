module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      # flash[:success]
      # flash[:info]
      # flash[:warning]
      # flash[:error]
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  # def custom_notifier_flash
  #   flash_messages = []
  #   flash.each do |type, message|
  #     type = 'success' if type == 'notice'
  #     type = 'error'   if type == 'alert'
  #     # flash[:success]
  #     # flash[:info]
  #     # flash[:warning]
  #     # flash[:error]
  #     text = "<script>Notifier.#{type}('#{message}');</script>"
  #     flash_messages << text.html_safe if message
  #   end
  #   flash_messages.join("\n").html_safe
  # end
end
