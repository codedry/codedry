# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  html = %(<div class="has-error">#{html_tag}</div>).html_safe
end
