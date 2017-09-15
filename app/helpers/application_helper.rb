module ApplicationHelper
  def flash_toast
    messages = []
    flash.each do |type, message|
      messages << "<script>Materialize.toast('#{message}', 3000);</script>"
    end
    messages.join('\n').html_safe
  end

  def app_name
    'Crowdfach'
  end

  def app_developer
    'lisovskey'
  end
end
