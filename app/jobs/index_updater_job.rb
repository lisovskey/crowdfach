class IndexUpdaterJob < ApplicationJob
  queue_as :low_priority

  def perform(projects)
    # TODO SUKA
  end
end
