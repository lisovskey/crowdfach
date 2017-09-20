class IndexUpdaterJob < ApplicationJob
  queue_as :low_priority

  def perform(projects)
    # Do something later
  end
end
