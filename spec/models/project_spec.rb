require 'rails_helper'

describe Project do
  it { should belong_to :user }
end