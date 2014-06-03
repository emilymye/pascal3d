class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def render_401
    raise ActionController::BadRequest.new('Bad Request')
  end
end
