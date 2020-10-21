require "spec_helper"

# describe project do
#   describe '#name' do
#     it 'returns the name of the project' do
#       test_project = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       expect(test_project.name).to eq 'Jane'
#     end
#   end

#   describe '#project_id' do
#     it 'returns the project_id of the project' do
#       test_project = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       expect(test_project.project_id).to eq 1
#     end
#   end

#   describe '#==' do
#     it 'checks for equality based on the name of a project' do
#       project1 = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       project2 = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       expect(project1 == project2).to eq true
#     end
#   end

#   context '.all' do
#     it 'is empty to start' do
#       expect(project.all).to eq []
#     end

#     it 'returns all projects' do
#       project1 = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       project1.save
#       project2 = project.new({:name => 'Joe', :project_id => 1, :id => nil})
#       project2.save
#       expect(project.all).to eq [project1, project2]
#     end
#   end

#   describe '#save' do
#     it 'adds a project to the database' do
#       project1 = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       project1.save
#       expect(project.all).to eq [project1]
#     end
#   end

#   describe '.find' do
#     it 'returns a project by id' do
#       project1 = project.new({:name => 'Jane', :project_id => 1, :id => nil})
#       project1.save
#       project2 = project.new({:name => 'Joe', :project_id => 1, :id => nil})
#       project2.save
#       expect(project.find(project1.id)).to eq project1
#     end
#   end
# end