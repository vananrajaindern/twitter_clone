require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  before { sign_in user1 }

  describe 'POST #create' do

    context 'follower and followee are separate users' do

      before { post :create, params: { username: user2.username, id: user2.id } }

      it { expect(Following.first).to have_attributes(follower_id: user1.id, followee_id: user2.id) }
      it { expect(response).to redirect_to profile_path(user2.username) }

    end

    context 'follower and followee are the same user' do

      before { post :create, params: { username: user1.username, id: user1.id } }

      it { expect(Following.count).to eq(0) }
      it { expect(response).to redirect_to profile_path(user1.username) }

    end

  end

  describe 'DELETE #destroy' do

    let!(:following) { create(:following, followee: user2, follower: user1) }

    before { delete :destroy, params: { username: user2.username, id: user2.id } }

    it { expect(Following.count).to eq(0) }
    it { expect(response).to redirect_to profile_path(user2.username) }

  end

end
