require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:tweets) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

  it { should have_many(:is_following).class_name('Following').with_foreign_key('follower_id') }
  it { should have_many(:is_followed).class_name('Following').with_foreign_key('followee_id') }

end
