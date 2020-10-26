class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(project_to_compare)
    self.title() == project_to_compare.title()
  end

  def self.clear
    @@projects = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@projects[id]
  end

  def update(title)
    @title = title
  end

  def delete
    @@projects.delete(self.id)
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end
end