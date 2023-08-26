require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get new_session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post session_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      delete session_path
      expect(response).to have_http_status(:success)
    end
  end
end
