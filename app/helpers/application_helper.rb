module ApplicationHelper
  def current_language
    cookies[:language] ||= 'en'    
    case cookies[:language]
    when 'en' then 'English'
    when 'ru' then 'Russian'
    end
  end

  def languages
    cookies[:language] ||= 'en'
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
