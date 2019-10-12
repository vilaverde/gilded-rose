class DefaultItem < Item
  def update_quality
    @sell_in -= 1

    return unless @quality.positive?

    @quality -= 1
    @quality -= 1 if @sell_in.negative? && @quality.positive?
  end
end
