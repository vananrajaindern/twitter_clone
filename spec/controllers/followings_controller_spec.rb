require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  before { sign_in user1 }

  describe 'POST #create' do


    context 'followee and follower are not the same user' do

      before { post :create, params: { follower: user1, followee: user2 } }

      it { expect(Following.count).to eq(1) }
      it { expect(response).to redirect_to profile_path(user2) }

    end

    context 'followee and follower are the same user' do

      before {}

    end

  end

end
