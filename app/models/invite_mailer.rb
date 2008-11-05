class InviteMailer < ActionMailer::Base
  
  def message(drop, coordinator, topic, time, emails, message)
    emails << coordinator
    recipients emails
    from "\"Collab.io\" <no-reply@collab.io>"
    subject "Let's collaborate about #{topic} on #{time.strftime("%m/%d/%Y at %I:%M%p")}"
    body :drop => drop, :coordinator => coordinator, :topic => topic, :time => time, :message => message
    content_type "text/html"
  end
  
end
