require 'rails_helper'

describe Project do
  # Association Test
  it { should belong_to :user }
  # Validation Tests
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end