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

    contactus_email = ActionMailer::Base.deliveries.find {|email| email.subject = "Message from John Doe" }
    assert_not_nil contactus_email

    assert_equal ['john.doe@example.com'],  contactus_email.from
    assert_equal ['test@example.com'],      contactus_email.to
    assert_match(/Hello/,                   contactus_email.body.to_s)
  end
end
