SeoAuditor::Application.routes.draw do

  resources :projects do
    resources :audits,    :only => [:new, :create, :show]
    resources :keywords,  :only => [:index, :new, :create, :destroy]
  end

  root :to => 'home#index'
end
