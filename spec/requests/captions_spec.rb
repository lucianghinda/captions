# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Captions", type: :request do
  describe "GET /captions" do
    it "responds with 200" do
      get captions_path

      expect(response).to have_http_status(:ok)
    end

    it "responds with correct body" do
      get captions_path

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response).to eq({
                                    captions: [
                                      {
                                        id: 1,
                                        url: "https://example.com/image.png",
                                        text: "Caption on image",
                                        caption_url: "https://localhost:3000/image.png"
                                      }
                                    ]
                                  })
    end
  end

  describe "POST /captions" do
    let(:url) { "http://example.com/image.png" }
    let(:text) { "caption text" }

    it "responds with 201" do
      post captions_path
      expect(response).to have_http_status(:created)
    end

    it "responds with correct body" do
      post captions_path, params: {
        caption: {
          url: url,
          text: text
        }
      }
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to eq({
                                    caption: {
                                      id: 1,
                                      url: url,
                                      text: text,
                                      caption_url: "http://localhost:3000/image.png"
                                    }
                                  })
    end
  end
end
