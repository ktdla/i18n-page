Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :contact_inquiries do

    resources :contact_inquiries, :path => '', :only => [:index, :new, :create] do
      collection do
        get :thank_you
      end
    end
  end

  # Admin routes
  namespace :contact_inquiries, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}" do
      resources :contact_inquiries do 
  end

      scope :path => 'contact_inquiries' do
        resources :settings, :only => [:edit, :update]
      end
    end
  end
end

