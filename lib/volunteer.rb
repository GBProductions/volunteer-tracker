class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  @@volunteers = {}
  @@total_rows = 0

  def initialize(name, project_id, id)
    @name = name
    @project_id = project_id
    @id = id || @@total_rows += 1
  end

  def ==(volunteer_to_compare)
    (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
  end

  def self.all()
    @@volunteers.values()
  end

  def save
    @@volunteers[self.id] = Volunteer.new(self.name, self.project_id, self.id)
  end

  def self.find(id)
    @@volunteers[id]
  end

  def update(name, project_id)
    self.name = name
    self.project_id = project_id
    @@volunteers[self.id] = Volunteer.new(self.name, self.project_id, self.id)
  end

  def delete
    @@volunteers.delete(self.id)
  end

  def self.clear
    @@volunteers = {}
  end

  def self.find_by_project(wo_id)
    volunteers = []
    @@volunteers.values.each do |volunteer|
      if volunteer.project_id == wo_id
        volunteers.push(volunteer)
      end
    end
    volunteers
  end

  def project
    Project.find(self.project_id)
  end
end