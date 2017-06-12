require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should belong_to (:user) }
  it { should belong_to (:tweet) }

  it { should validate_presence_of(:text) }
  it { should validate_length_of(:text).is_at_most(140).on(:create) }

end
