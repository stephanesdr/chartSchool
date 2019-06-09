# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w(menu-toggle.js)

Rails.application.config.assets.precompile += %w(courses/show.js)
Rails.application.config.assets.precompile += %w(progressbar/progressbar_student.js)
Rails.application.config.assets.precompile += %w(progressbar/progressbar_teacher.js)
Rails.application.config.assets.precompile += %w(progressbar/loading-bar.js)
Rails.application.config.assets.precompile += %w(loading-bar.css)
Rails.application.config.assets.precompile += %w(general_questions/_general_questions_index.css)
Rails.application.config.assets.precompile += %w(courses/show.css)
Rails.application.config.assets.precompile += %w(courses/attendees.css)

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
