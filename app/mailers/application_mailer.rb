class ApplicationMailer < ActionMailer::Base
  default from: 'mail@crowdfach.herokuapp.com'
  layout 'mailer'
end
