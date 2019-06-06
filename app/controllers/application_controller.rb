class ApplicationController < Sinatra::Base

    set :views, "app/views"
    set :method_override, true

    get '/' do
        @jobs = Job.all
        @companies = Company.all
        erb :home
    end
    
end
