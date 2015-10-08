# encoding: utf-8

Refinery::I18n.configure do |config|
  config.enable = true
  config.default_locale = :es

  config.current_locale = :es

  config.default_frontend_locale = :es

  config.frontend_locales = [:es, :en, :pt]

  config.locales = {:es=>"Español", :en=>"English", :pt=>"Português"}
end
