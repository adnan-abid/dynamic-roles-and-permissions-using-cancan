# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
#Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/dist/*"].sort_by { |dir| -dir.size }
#Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf|woff2|truetype)
types = %w( *.png *.gif *.jpg *.eot *.woff *.ttf login.css login.js dashboard2.js dashboard.js agent.css agent.js traveler.css traveler.js profile.css profile.js mailboxes.css mailboxes.js errors.css errors.js)
Rails.application.config.assets.precompile += types