Rails.application.routes.draw do

  root 'welcome#convention'
  # get 'welcome/index'
  get '/console', to: 'welcome#console'
  get '/convention', to: 'welcome#convention'
  get '/editor', to: 'welcome#editor'
  get '/help', to: 'welcome#help'
  get '/rails', to: 'welcome#rails'
  get '/ruby', to: 'welcome#ruby'
  get '/rails-erb', to: 'welcome#rails_erb'
  get '/rails-commands', to: 'welcome#rails_commands'
  get '/rails-folder-structure', to: 'welcome#rails_folder_structure'
  get '/ruby-arrays', to: 'welcome#ruby_arrays'
  get '/ruby-concepts', to: 'welcome#ruby_concept'
  get '/ruby-strings', to: 'welcome#ruby_strings'
  get '/ruby-numbers', to: 'welcome#ruby_numbers'
  get '/ruby-hashes', to: 'welcome#ruby_hashes'


  # For deta111ils on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
