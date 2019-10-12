#!/usr/bin/ruby -w

require 'terminal-table'
require File.join(File.dirname(__FILE__), 'gilded_rose')

puts 'Welcome to the Gilded Rose!'

items = [
  Item.for('+5 Dexterity Vest', 10, 20),
  Item.for('Aged Brie', 2, 0),
  Item.for('Elixir of the Mongoose', 5, 7),
  Item.for('Sulfuras, Hand of Ragnaros', 0, 80),
  Item.for('Sulfuras, Hand of Ragnaros', -1, 80),
  Item.for('Backstage passes to a TAFKAL80ETC concert', 15, 20),
  Item.for('Backstage passes to a TAFKAL80ETC concert', 10, 49),
  Item.for('Backstage passes to a TAFKAL80ETC concert', 5, 49),
  # This Conjured item does not work properly yet
  Item.for('Conjured Mana Cake', 3, 6) # <-- :O
]

days = 10
days = ARGV[0].to_i + 1 if ARGV.size.positive?

gilded_rose = GildedRose.new(items)
(0...days).each do |day|
  puts Terminal::Table.new(
    title: "Day #{day}",
    headings: ['Name', 'Sell in', 'Quality'],
    rows: items.map { |i| i.to_h.values }
  )

  puts
  gilded_rose.update_quality
end
