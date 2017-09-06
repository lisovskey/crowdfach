module ApplicationHelper
  def current_language
    case cookies[:language]
    when 'en' then 'English'
    when 'ru' then 'Russian'
    end
  end

  def languages
    case cookies[:language]
    when 'en' then ['Russian', 'English']
    when 'ru' then ['English', 'Russian']
    end
  end

  def app_name
    'crowdfach'
  end

  def app_developer
    'lisovskey'
  end
end
