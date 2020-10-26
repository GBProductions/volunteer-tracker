class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all()
    @@projects.values()
  end

  def save
    @@projects[self.id] = Project.new(self.name, self.id)
  end

  def ==(project_to_compare)
    self.name() == project_to_compare.name()
  end

  def self.clear
    @@projects = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@projects[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@projects.delete(self.id)
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end
end