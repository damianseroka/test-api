# frozen_string_literal: true

require 'test_helper'

class BirdsControllerTest < ActionDispatch::IntegrationTest
  test 'should return a successful response when the node_ids param is provided' do
    expected_response = [1, 2, 3, 5, 6, 7, 4]

    get birds_path, params: { node_ids: [130, 4_430_546] }

    assert_response :success
    assert_equal expected_response, JSON.parse(response.body, symbolize_names: true)
  end

  test 'should return bad_request when node_ids param is missing' do
    assert_raises(ActionController::ParameterMissing) { get birds_url }
  end
end
