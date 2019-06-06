require_relative '../../config/environment.rb'

module GitHubJobs

    class Search

        attr_reader :description, :location

        def initialize(description, location)
            @description, @location = description, location
        end
    end

    class Adapter
        BASE_URL = "https://jobs.github.com/positions.json?"

        SEARCH = Search.new("ruby", "new+york")


        def fetch_jobs
            jobs = JSON.parse(RestClient.get(url(SEARCH)))
        end

        private

        def url(search)
            "#{BASE_URL}description=#{search.description}&location=#{search.location}"
        end
    end

end
#jobs = GitHubJobs.new.fetch_jobs
#binding.pry