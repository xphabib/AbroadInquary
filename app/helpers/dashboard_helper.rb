module DashboardHelper
  def current_class?(test_path)
    return 'is-active' if request.path == test_path
  end

  def current_class_same_path?(test_path, set_param, send_param )
    return 'is-active' if request.path == test_path && set_param == send_param
  end

  def header_class_define
    if controller.controller_name == 'users' && controller.action_name == 'request_for_new_mentorship'
      return ''
    else
      return 'o-page__content'
    end
  end

end
