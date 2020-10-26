require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer_integration')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/projects/new') do
  erb(:new_project)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)  
end

post ('/projects') do
  title = params[:project_title]
  project = Project.new(title, nil)
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  @projects = Project.all
  erb(:projects)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @projects = Project.all
  erb(:projects)
end

get('/custom_route') do
  "Create custom routes."
end

post('/projects') do
  title = params[:project_title]
  project = Project.new(title, nil)
  project.save()
  @projects = Projects.all()
  erb(:projects)
end

get('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new(params[:volunteer_title], @project.id, nil)
  volunteer.save()
  erb(:project)
end

patch('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:title], @project.id)
  erb(:project)
end

delete('/projects/:id/volunteers/:volunteer_id') do
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.delete
  @project = Project.find(params[:id].to_i())
  erb(:project)
end