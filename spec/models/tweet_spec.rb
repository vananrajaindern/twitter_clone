require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it { should belong_to(:user) }

end
