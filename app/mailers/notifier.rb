class Notifier < ActionMailer::Base
  default from: "no-reply@codedry.com"

  def contact_received(contact)
    @contact = contact

    options = {
      reply_to: "#{@contact.name} <#{@contact.email}>",
      from:     "#{@contact.name} <#{contact_email}>",
      to:       "Codedry <#{contact_email}>",
      subject:  "Message from #{@contact.name}"
    }

    mail(options)
  end

  def contact_received_acknowledgement(contact)
    @contact = contact

    options = {
      to:       "#{@contact.name} <#{@contact.email}>",
      from:     "Codedry <#{contact_email}>",
      subject:  "We have received your message #{@contact.first_name}"
    }

    mail(options)
  end

  private def contact_email
    @contact_email ||= Rails.application.config.contact_email
  end

end
