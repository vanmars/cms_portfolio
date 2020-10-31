require 'rails_helper'

describe Post do
  # Association Tests
  it { should have_many :comments }
  it { should belong_to :user }
  # Validation Tests
  it { should validate_presence_of :title}
  it { should validate_presence_of :body}
end