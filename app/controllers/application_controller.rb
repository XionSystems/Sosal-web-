class ApplicationController < ActionController::Base
  protect_from_forgery
  include StatusesHelper
  include SessionsHelper
end