require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it 'do some math' do
    expect(1+1).to eq(2)
  end

  it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

end
