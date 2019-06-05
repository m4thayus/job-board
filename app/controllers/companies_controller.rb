class CompaniesController < Sinatra::Base

    set :views, "app/views/companies"
    set :method_override, true

    get '/companies' do
        @companies = Company.all
        erb :index
    end
    
end