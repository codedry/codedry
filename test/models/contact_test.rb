require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    @contact = Contact.new
  end

  %w(name email message).each do |required_field|
    test "validates presence of #{required_field}" do
      @contact.validate
      assert_equal ["can't be blank"], @contact.errors[required_field]
    end
  end

  %w(invalid invalid@ invalid@x invalid@x.).each do |invalid_email|
    test "reject invalid email '#{invalid_email}'" do
      @contact.email = invalid_email
      @contact.validate
      assert_equal ["is not an email"], @contact.errors[:email]
    end
  end
end
