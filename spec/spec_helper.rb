require "project"
require "volunteer"
require "rspec"
require "pry"
require "pg"

DB = PG.connect({:dbname => 'project_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM projects *;')
    DB.exec('DELETE FROM volunteers *;')
  end
end