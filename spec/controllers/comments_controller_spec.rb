require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }
  before { sign_in user }

  describe 'GET #new' do

    before { get :new, params: { tweet_id: tweet } }

    it { expect(assigns(:comment)).to be_a_new_record }

  end

  describe 'POST #create' do

    before { post :create, params: { comment: params, user_id: user, tweet_id: tweet } }

    context 'when comment#save passes' do

      let(:params) { attributes_for(:comment) }

      it { expect(Comment.count).to eq(1) }
      it { expect(response).to redirect_to tweet_path(tweet) }

    end

    context 'when comment#save fails' do

      let(:params) { attributes_for(:comment, :invalid) }

      it { expect(Comment.count).to eq(0) }
      it { expect(response).to render_template(:new) }

    end

  end

end
