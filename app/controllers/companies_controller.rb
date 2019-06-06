class CompaniesController < Sinatra::Base

  set :views, "app/views/companies"
  set :method_override, true
  layout = :'../layout'

  #READ
  get '/companies' do
    @companies = Company.all
    erb :index, :layout => layout
  end

  #CREATE
  get '/companies/new' do
    erb :new, :layout => layout
  end

  post '/companies' do
    @company = Company.create(
      name: params[:name]
    )
    redirect "/companies/#{@company.id}"
  end

  #READ
  get '/companies/:id' do
    @company = Company.find_by_id(params[:id])
    erb :show, :layout => layout
  end

  #UPDATE
  get '/companies/:id/edit' do
    @company = Company.find_by_id(params[:id])
    erb :edit, :layout => layout
  end

  patch '/companies/:id' do
    @company = Company.find_by_id(params[:id])
    @company.update(
      name: params[:name]
    )
    redirect "/companies/#{@company.id}"
  end

  #DELETE
  delete '/companies/:id' do
    @company = Company.find_by_id(params[:id])
    @company.jobs.each do |job|
      job.delete
    end
    @company.delete
    redirect '/companies'
  end

end