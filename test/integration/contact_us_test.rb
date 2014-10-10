class ContactUsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test 'send a message' do
    visit '/'
    click_link 'Contact'

    within('#contact-form') do
      fill_in 'contact_name',     with: 'John Doe'
      fill_in 'contact_email',    with: 'john.doe@example.com'
      fill_in 'contact_message',  with: 'Hello'

      click_button 'Send Message'
    end

    expected_message = "Thanks John! We will be in touch shortly..."
    assert page.has_content?(expected_message), "'#{expected_message}' was not found"

    contactus_email = find_email!(subject: /Message from John Doe/)

    assert_equal ['john.doe@example.com'],  contactus_email.from
    assert_equal ['test@example.com'],      contactus_email.to
    assert_match(/Hello/,                   contactus_email.body.to_s)

    contactus_acknowledgement_email = find_email!(subject: /We have received your message John/)

    assert_equal ['test@example.com'],      contactus_acknowledgement_email.from
    assert_equal ['john.doe@example.com'],  contactus_acknowledgement_email.to
    assert_match(/Hi John/,                 contactus_acknowledgement_email.body.to_s)
    assert_match(/Thank you for taking the time to send us a message. We will be in touch shortly./,
                                            contactus_acknowledgement_email.body.to_s)
    assert_match(/Hello/,                   contactus_acknowledgement_email.body.to_s)
  end

  private def find_email!(subject:)
    @email = ActionMailer::Base.deliveries.find {|email| email.subject.match(subject) }
    raise "Unable to find email with subject '#{subject}'" unless @email
    @email
  end
end
