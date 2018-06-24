require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module DynacanNew
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join("vendor","assets", "fonts")
    config.to_prepare do
	  	# Configure single controller layout
	  	Devise::SessionsController.layout "login"
	    Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application"   : "login" }
	    Devise::ConfirmationsController.layout "login"
	    Devise::UnlocksController.layout "login"            
	    Devise::PasswordsController.layout "login" 

	  	# Or to configure mailer layout
	  	Devise::Mailer.layout "email" # email.haml or email.erb

	 
	end
  end
end
