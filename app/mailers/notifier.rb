class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def contact_received(contact)
    @contact = contact

    options = {
      to:       "contact@example.com",
      reply_to: @contact.email,
      subject:  "Message from #{@contact.name}"
    }

    mail(options)
  end
end
