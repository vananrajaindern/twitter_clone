require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #index' do

    let!(:tweets) { create_list(:tweet, 3, user: user) }

    before { get :index }

    it { expect(assigns(:tweets)).to eq(tweets) }

  end

  describe 'GET #new' do

    before { get :new }

    it { expect(assigns(:tweet)).to be_a_new_record }

  end

  describe 'POST #create' do

    before { post :create, params: { tweet: params } }

    context 'when tweet#save passes' do

      let(:params) { attributes_for(:tweet) }

      it { expect(response).to redirect_to tweets_path }

    end

    context 'when tweet#save fails' do

      let(:params) { attributes_for(:tweet, :invalid) }

      it { expect(response).to render_template(:new) }

    end

  end

  describe 'GET #edit' do

    let(:owner) { create(:user) }
    let(:tweet) { create(:tweet, user: owner) }

    before { get :edit, params: { id: tweet } }

    context 'when nonowner accesses edit' do

      it { expect(response).to redirect_to tweets_path }

    end

  end

  describe 'PUT #update' do

    let(:tweet) { create(:tweet, user: user) }

    before { put :update, params: { id: tweet, tweet: { text: tweet.text + 'Edited' } } }

    it { expect(Tweet.find(tweet.id).text.last(6)).to eq('Edited') }
    it { expect(response).to redirect_to tweets_path }

  end

end
