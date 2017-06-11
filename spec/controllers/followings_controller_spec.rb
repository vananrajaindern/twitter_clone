require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  before { sign_in user1 }

  describe 'POST #create' do

    # before { post :create, params: { id: user2.id } }
    #
    # it { expect(Following.first).to have_attributes(follower_id: user1.id, followee_id: user2.id) }
    # it { expect(response).to redirect_to profile_path(user2) }

  end

end
