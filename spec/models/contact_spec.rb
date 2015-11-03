require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should validate_presence_of :name}
  it { should validate_presence_of :phone_number}
  it { should_not allow_value('123ae12345').for(:phone_number) }
end
