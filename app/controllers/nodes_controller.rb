# frozen_string_literal: true

class NodesController < ApplicationController
  def common_ancestors
    render json: Nodes::FetchCommonAncestorService.new(param_a:, param_b:).call
  end

  private

  def param_a
    params.require(:a)
  end

  def param_b
    params.require(:b)
  end
end
