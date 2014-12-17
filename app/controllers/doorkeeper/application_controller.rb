module Doorkeeper
  class ApplicationController < ActionController::Base
    include Helpers::Controller
    protect_from_forgery with: :exception

    helper 'doorkeeper/form_errors'
  end
end
