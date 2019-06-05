require_relative '../adapters/github_jobs.rb'
Job.destroy_all
Company.destroy_all

jobs = GitHubJobs.new.fetch_jobs

jobs.each do |job|
    company = Company.find_or_create_by(name: job["company"])
    Job.create(title: job["title"], description: job["description"], location: job["location"], company_id: company.id)
end