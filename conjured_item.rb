class ConjuredItem < Item
  def update_quality
    @sell_in -= 1

    return unless @quality.positive?

    @quality -= 2
    @quality -= 2 if @sell_in.negative?
    @quality = 0 if @quality.negative?
  end
end
