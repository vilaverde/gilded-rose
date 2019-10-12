class BackstageItem < Item
  def update_quality
    @sell_in -= 1

    if @sell_in.negative?
      @quality = 0
    elsif @quality < 50
      increase_quality
    end
  end

  private

  def increase_quality
    @quality += 1
    @quality += 1 if @sell_in <= 10 && @sell_in < 50
    @quality += 1 if @sell_in <= 5 && @sell_in < 50
  end
end
