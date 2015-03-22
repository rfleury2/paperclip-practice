require 'rails_helper'

RSpec.describe Team, :type => :model do

  it { should have_attached_file(:shield) }

  it { should validate_attachment_presence(:shield) }

  it { should validate_attachment_content_type(:shield).
                allowing('image/jpeg', 'image/png', 'image/svg').
                rejecting('text/plain', 'text/xml') }

  it { should validate_attachment_size(:shield).
                less_than(2.megabytes) }

end
