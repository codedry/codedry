require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    @contact = Contact.new
  end

  %w(name email message).each do |required_field|
    test "validates presence of #{required_field}" do
      @contact.validate
      assert_equal @contact.errors[required_field], ["can't be blank"]
    end
  end
end
