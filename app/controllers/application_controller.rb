class ApplicationController < ActionController::Base
  protect_from_forgery
  include BookmarksHelper
  include SessionsHelper
  include ApplicationHelper
end
