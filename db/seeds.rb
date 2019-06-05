Job.destroy_all
Company.destroy_all

jobs = GitHubJobs.new.fetch_jobs

jobs.each do |job|
    Job.create(title: job["title"], description: job["description"])
    Company.find_or_create_by(name: job["company"])
end