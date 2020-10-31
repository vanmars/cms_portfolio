require 'rails_helper'

describe Project do
  # Validation Tests
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
end