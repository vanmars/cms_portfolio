require 'rails_helper'

describe User do
  # Association Test
  it { should have_many :comments }
  # Validation Test
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
