Rails.application.config.after_initialize do
  begin
    Project.where(finished: false).each do |project|
      begin
        ProjectFinilizerJob.set(wait_until: project.expiration_time).perform_later(project.id)
      rescue
        ProjectFinilizerJob.perform_now(project.id)
      end
    end
  rescue
  end
end