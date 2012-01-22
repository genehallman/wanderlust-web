class UserSession < Authlogic::Session::Base
  self.single_access_allowed_request_types = :all
  self.params_key = "token"

  # specify configuration here, such as:
  # logout_on_timeout true
  # ...many more options in the documentation
end
