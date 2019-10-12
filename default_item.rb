class DefaultItem < Item
  def update_quality
    @sell_in = @sell_in - 1

    if @quality > 0
      @quality = @quality - 1
      @quality = @quality - 1 if @sell_in < 0 && @quality > 0
    end
  end
end
