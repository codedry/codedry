# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview
  def contact_received
    Notifier.contact_received(Contact.first)
  end
end
