# frozen_string_literal: true

class Node < ApplicationRecord
  belongs_to :parent, class_name: name, optional: true
  has_many :children, class_name: name, foreign_key: :parent_id
  has_many :birds

  def path_to_root
    node = self
    path = [node]
    while node.parent
      path << node.parent
      node = node.parent
    end

    path
  end
end
