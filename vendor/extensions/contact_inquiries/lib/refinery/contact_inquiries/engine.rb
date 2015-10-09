module Refinery
  module ContactInquiries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::ContactInquiries

      engine_name :refinery_contact_inquiries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contact_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contact_inquiries_admin_contact_inquiries_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ContactInquiries)
      end
    end
  end
end
