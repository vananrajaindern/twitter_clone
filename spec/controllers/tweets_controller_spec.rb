require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe 'GET #index' do

    let(:user) { create(:user) }
    let!(:tweets) { create_list(:tweet, 3, user: user) }

    before { get :index }

    it { expect(assigns(:tweets)).to eq(tweets) }

  end

end
