module ApplicationHelper
  def flash_toast(message=nil)
    scripts = Array.new
    (message ? {notice: message} : flash).each do |type, msg|
      scripts << "<script>Materialize.toast('#{msg}', 3000);</script>" if msg
    end
    scripts.join('\n').html_safe
  end

  def app_name
    'Crowdfach'
  end

  def app_developer
    'lisovskey'
  end
end
