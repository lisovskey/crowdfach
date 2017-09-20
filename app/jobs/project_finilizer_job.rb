class ProjectFinilizerJob < ApplicationJob
  queue_as :default

  def perform(id)
    project = Project.find(id)
    Project.update(id, finished: true, successful: project.balance >= project.target)
  end
end
