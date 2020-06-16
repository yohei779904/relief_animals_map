require 'rails_helper'

RSpec.describe "RescuerMembers", type: :request do

  describe "GET /dashboard" do
    it "returns http success" do
      get "/rescuer_members/dashboard"
      expect(response).to have_http_status(:success)
    end
  end

end
