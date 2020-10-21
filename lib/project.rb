class Project
  attr_reader :id
  attr_accessor :name, :volunteer_id

  @@projects = {}
  @@total_rows = 0

  def initialize(name, volunteer_id, id)
    @name = name
    @volunteer_id = volunteer_id
    @id = id || @@total_rows += 1
  end

  def ==(project_to_compare)
    (self.name() == project_to_compare.name()) && (self.volunteer_id() == project_to_compare.volunteer_id())
  end

  def self.all()
    @@projects.values()
  end

  def save
    @@projects[self.id] = project.new(self.name, self.volunteer_id, self.id)
  end

  def self.find(id)
    @@projects[id]
  end

  def update(name, volunteer_id)
    self.name = name
    self.volunteer_id = volunteer_id
    @@projects[self.id] = project.new(self.name, self.volunteer_id, self.id)
  end

  def delete
    @@projects.delete(self.id)
  end

  def self.clear
    @@projects = {}
  end

  def self.find_by_volunteer(wo_id)
    projects = []
    @@projects.values.each do |project|
      if project.volunteer_id == wo_id
        projects.push(project)
      end
    end
    projects
  end

  def volunteer
    volunteer.find(self.volunteer_id)
  end
end