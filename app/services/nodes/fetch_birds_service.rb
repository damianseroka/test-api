# frozen_string_literal: true

module Nodes
  class FetchBirdsService
    attr_reader :node_ids, :response

    def initialize(node_ids)
      @node_ids = node_ids.map(&:to_i)
      @response = {}
    end

    def call
      while node_ids.present?
        node_id = node_ids.shift
        next if node_present_in_response?(node_id)

        add_node_to_response(node_id)
      end

      fetch_bird_ids(response)
    end

    def add_node_to_response(id)
      node = Node.find_by(id:)
      node_child_ids = node&.child_ids || []

      response.merge!(id => { birds: node&.bird_ids || [], descendants: node_child_ids })
      node_ids.push(*node_child_ids).uniq!
    end

    def node_present_in_response?(id)
      response.key?(id)
    end

    def fetch_bird_ids(response)
      response.map { |_id, data| data[:birds] }.flatten
    end
  end
end
