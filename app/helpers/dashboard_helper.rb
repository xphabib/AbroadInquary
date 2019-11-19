module DashboardHelper
  def current_class?(test_path)
    return 'is-active' if request.path == test_path
  end

  def current_class_same_path?(test_path, set_param, send_param )
    return 'is-active' if request.path == test_path && set_param == send_param
  end

end
