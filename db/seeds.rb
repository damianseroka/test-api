# frozen_string_literal: true

require 'csv'

p '--------- Create nodes ---------'
CSV.foreach(Rails.root.join('db', 'seeds_data', 'nodes.csv'), headers: true) do |row|
  p Node.create!(id: row['id'], parent_id: row['parent_id'].presence)
end

p '--------- Create random birds ---------'
MAX_NUMBER_OF_BIRDS_FOR_NODE = 4

Node.all.each do |node|
  rand(0..MAX_NUMBER_OF_BIRDS_FOR_NODE).times { p node.birds.create! }
end
