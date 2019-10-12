class AgedItem < Item
  def update_quality
    @sell_in -= 1

    return unless @sell_in.negative? && @quality < 49

    @quality += 2
  end
end
