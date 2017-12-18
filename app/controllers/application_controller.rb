class ApplicationController < ActionController::API
  json_response({ message: exception.message }, :not_found)
end
