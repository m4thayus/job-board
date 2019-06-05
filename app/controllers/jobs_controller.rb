class JobsController < Sinatra::Base

    set :views, "app/views/jobs"
    set :method_override, true

    get '/jobs' do
        @jobs = Job.all
        erb :index
    end

    get '/jobs/new' do
        @companies = Company.all
        erb :new
    end
    
    post '/jobs' do
        if !params[:new_company].empty?
            company = Company.find_or_create_by(name: params[:new_company])
        else
            company = Company.find_by_id(params[:company_id])
        end

        @job = Job.create(
            title: params[:title], 
            location: params[:location], 
            description: params[:description],
            company_id: company.id
        )

        redirect "/jobs/#{@job.id}"
    end

    get '/jobs/:id' do
        @job = Job.find_by_id(params[:id])
        erb :show
    end

    delete '/jobs/:id' do
        @job = Job.find_by_id(params[:id])
        @job.delete
        redirect '/jobs'
    end
    
    
    
    
    
end