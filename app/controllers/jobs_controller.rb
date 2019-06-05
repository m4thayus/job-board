class JobsController < Sinatra::Base

    set :views, "app/views/jobs"
    set :method_override, true

    get '/jobs' do
        @jobs = Job.all
        erb :index
    end
    
    
end