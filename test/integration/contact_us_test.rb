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

    assert_not ActionMailer::Base.deliveries.empty?, 'No email sent'
  end
end
