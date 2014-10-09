class Notifier < ActionMailer::Base
  default from: "no-reply@codedry.com"

  def contact_received(contact)
    @contact = contact

    options = {
      from:     "#{@contact.name} <#{@contact.email}>",
      to:       Rails.application.config.admin_to_email,
      subject:  "Message from #{@contact.name}"
    }

    mail(options)
  end
end
