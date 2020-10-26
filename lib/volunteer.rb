class Volunteer
  attr_reader :id
  attr_accessor :title, :project_id

  @@volunteers = {}
  @@total_rows = 0

  def initialize(title, project_id, id)
    @title = title
    @project_id = project_id
    @id = id || @@total_rows += 1
  end

  def ==(volunteer_to_compare)
    (self.title() == volunteer_to_compare.title()) && (self.project_id() == volunteer_to_compare.project_id())
  end

  def self.all()
    @@volunteers.values()
  end

  def save
    @@volunteers[self.id] = Volunteer.new(self.title, self.project_id, self.id)
  end

  def self.find(id)
    @@volunteers[id]
  end

  def update(title, project_id)
    self.title = title
    self.project_id = project_id
    @@volunteers[self.id] = Volunteer.new(self.title, self.project_id, self.id)
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