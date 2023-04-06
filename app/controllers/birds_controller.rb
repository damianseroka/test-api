# frozen_string_literal: true

class BirdsController < ApplicationController
  def index
    render json: Nodes::FetchBirdsService.new(node_ids_param).call
  end

  private

  def node_ids_param
    params.require(:node_ids)
  end
end
