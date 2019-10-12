require_relative 'item'
require_relative 'default_item'
require_relative 'aged_item'
require_relative 'backstage_item'
require_relative 'legendary_item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.update_quality
    end
  end
end
