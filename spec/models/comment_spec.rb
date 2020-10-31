require 'rails_helper'

describe Comment do
  # Association Tests
  it { should belong_to :post }
  it { should belong_to :user }
  #Validation Tests
  it { should validate_presence_of :body }
end