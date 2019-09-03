require 'rails_helper'

RSpec.describe Api::V1::ProductsController, :type => :controller do
  describe "get all product list" do
    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["data", "message", "status"])
    end
  end

  describe "POST #create" do
    before do
      post :create, params: {:product =>  {:name =>  Faker::Commerce.product_name, :price =>  40.0, :quantity =>  10}}
    end

    it "returns http success" do
      expect(response.status).to eq(201)
    end
  end
end
