class ContactUsTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = Capybara.javascript_driver
  end

  test 'send a message' do
    visit '/'
    click_link 'Contact'

    within('#contact-form') do
      fill_in 'contact_name',     with: 'Marcel Morgan'
      fill_in 'contact_email',    with: 'marcel.morgan@example.com'
      fill_in 'contact_message',  with: 'Hello'
    end

    click_button 'Send Message'

    expected_message = "Your message was successfully sent"
    assert page.has_content?(expected_message), "'#{expected_message}' was not found"
  end
end
