require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

  it { should validate_length_of(:text).is_at_most(140).on(:create) }
  it { should validate_presence_of(:text) }

end
