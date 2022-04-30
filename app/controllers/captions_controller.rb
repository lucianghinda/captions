# frozen_string_literal: true

class CaptionsController < ApplicationController
  def index
    captions = [
      {
        id: 1,
        url: "https://example.com/image.png",
        text: "Caption on image",
        caption_url: "https://localhost:3000/image.png"
      }
    ]
    render json: { captions: captions }
  end

  def create
    caption = {
      id: 1,
      url: "http://example.com/image.png",
      text: "caption text",
      caption_url: "http://localhost:3000/image.png"
    }
    render json: { caption: caption }, status: :created
  end
end
