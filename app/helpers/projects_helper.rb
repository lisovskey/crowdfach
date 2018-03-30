module ProjectsHelper
  def to_markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def reward_class(finished)
    'fade default-cursor' if finished
  end

  def remain(project)
    time = project.expiration_time - Time.zone.now
    if time < 1.minute
      I18n.t('datetime.few')
    elsif time / 1.minute < 60
      (time / 1.minute).round.to_s << I18n.t('datetime.minutes')
    elsif time / 1.hour < 24
      (time / 1.hour).round.to_s << I18n.t('datetime.hours')
    elsif time / 1.day < 30
      (time / 1.day).round.to_s << I18n.t('datetime.days')
    elsif time / 1.day / 30 < 12
      (time / 1.day / 30).round.to_s << I18n.t('datetime.months')
    else
      (time / 1.day / 30 / 12).round.to_s << I18n.t('datetime.years')
    end
  end

  def finish_status(project)
    if project.finished
      project.successful ? I18n.t('project.successfully') : I18n.t('project.poorly')
    end
  end

  def progress(project)
    project.progress.round.to_s << '%'
  end

  def limited_progress(project)
    [project.progress.round, 100].min.to_s << '%'
  end

  def qrcode_size
    7
  end
end
