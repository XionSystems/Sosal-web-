class ApplicationController < ActionController::Base
  protect_from_forgery
  include MessagesHelper
  include BookmarksHelper
  include SessionsHelper
  include ApplicationHelper
end
