# frozen_string_literal: true

module Nodes
  class FetchCommonAncestorService
    attr_reader :param_a, :param_b

    def initialize(param_a:, param_b:)
      @param_a = param_a
      @param_b = param_b
    end

    def call
      {
        root_id: common_path_to_root.last&.id,
        lowest_common_ancestor: common_path_to_root.first&.id,
        depth: common_path_to_root.blank? ? nil : common_path_to_root.size
      }
    end

    private

    def common_path_to_root
      @common_path_to_root ||=
        same_params? ? path_to_the_root(param_a) : (path_to_the_root(param_a) & path_to_the_root(param_b))
    end

    def same_params?
      param_a == param_b
    end

    def path_to_the_root(id)
      Node.find_by(id:)&.path_to_root || []
    end
  end
end
