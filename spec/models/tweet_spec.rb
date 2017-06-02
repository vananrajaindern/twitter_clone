require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it { should belong_to(:user) }
  it { should validate_presence_of(:text) }
  it do
    should validate_length_of(:text).
      is_at_most(140).
      on(:create)
  end

end
