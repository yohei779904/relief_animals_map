require 'rails_helper'

RSpec.describe "SupporterItems", type: :request do

  describe "GET /dashboard" do
    it "returns http success" do
      get "/supporter_item/dashboard"
      expect(response).to have_http_status(:success)
    end
  end

end
