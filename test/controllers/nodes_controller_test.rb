# frozen_string_literal: true

require 'test_helper'

class NodesControllerTest < ActionDispatch::IntegrationTest
  test 'should return a successful response for 1st test case' do
    get common_ancestor_path, params: { a: 5_497_637, b: 2_820_230 }

    assert_equal(
      { root_id: 130, lowest_common_ancestor: 125, depth: 2 },
      JSON.parse(response.body, symbolize_names: true)
    )
  end

  test 'should return a successful response for 2nd test case' do
    get common_ancestor_path, params: { a: 5_497_637, b: 130 }

    assert_equal(
      { root_id: 130, lowest_common_ancestor: 130, depth: 1 },
      JSON.parse(response.body, symbolize_names: true)
    )
  end

  test 'should return a successful response for 3rd test case' do
    get common_ancestor_path, params: { a: 5_497_637, b: 130 }

    assert_equal(
      { root_id: 130, lowest_common_ancestor: 130, depth: 1 },
      JSON.parse(response.body, symbolize_names: true)
    )
  end

  test 'should return nil for all fields if no common node match' do
    get common_ancestor_path, params: { a: 9, b: 4_430_546 }

    assert_equal(
      { root_id: nil, lowest_common_ancestor: nil, depth: nil },
      JSON.parse(response.body, symbolize_names: true)
    )
  end

  test 'should return itself if a and b are equal' do
    get common_ancestor_path, params: { a: 4_430_546, b: 4_430_546 }

    assert_equal(
      { root_id: 130, lowest_common_ancestor: 4_430_546, depth: 3 },
      JSON.parse(response.body, symbolize_names: true)
    )
  end

  test 'should return bad_request when param is missing' do
    assert_raises(ActionController::ParameterMissing) { get common_ancestor_path, params: { a: 4_430_546 } }
  end
end
