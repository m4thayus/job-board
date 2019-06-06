class CompaniesController < Sinatra::Base

    set :views, "app/views/companies"
    set :method_override, true

    get '/companies' do
        @companies = Company.all
        erb :index
    end

    get '/companies/new' do
        erb :new
    end
    
    post '/companies' do
        @company = Company.create(
            name: params[:name]
            )
        redirect "/companies/#{@company.id}"
    end

    get '/companies/:id' do
        @company = Company.find_by_id(params[:id])
        erb :show
    end
    
    get '/companies/:id/edit' do
        @company = Company.find_by_id(params[:id])
        erb :edit
    end
    
    patch '/companies/:id' do
        @company = Company.find_by_id(params[:id])
        Company.update(
            name: params[:name]
        )
        redirect "/companies/#{@company.id}"
    end

    delete '/companies/:id' do
        @company = Company.find_by_id(params[:id])
        @company.delete
        redirect '/companies'
    end
    
end