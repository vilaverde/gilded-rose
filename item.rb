class Item
  SPECIALIZED_CLASS = {
    'default' => 'DefaultItem',
    'aged' => 'AgedItem',
    'backstage' => 'BackstageItem',
    'legendary' => 'LegendaryItem'
  }.freeze

  DEFAULT_CATEGORY = 'default'.freeze

  PRODUCT_CATEGORY = {
    'Aged Brie' => 'aged',
    'Backstage passes to a TAFKAL80ETC concert' => 'backstage',
    'Sulfuras, Hand of Ragnaros' => 'legendary'
  }.freeze

  def self.for(name, sell_in, quality)
    item_category = PRODUCT_CATEGORY[name] || DEFAULT_CATEGORY
    item_class = SPECIALIZED_CLASS[item_category]

    Object.const_get(item_class).new(name, sell_in, quality)
  end

  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_h
    { name: @name, sell_in: @sell_in, quality: @quality }
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality
    raise NoMethodError
  end
end
