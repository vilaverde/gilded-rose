class AgedItem < Item
  def update_quality
    @sell_in = @sell_in - 1

    if @sell_in < 0 && @quality < 49
      @quality = @quality + 2
    end
  end
end
