class BackstageItem < Item
  def update_quality
    @sell_in = @sell_in - 1

    if @sell_in < 0
      @quality = 0
    else
      if @quality < 50
        @quality = @quality + 1
        @quality = @quality + 1 if @sell_in <= 10 && @sell_in < 50
        @quality = @quality + 1 if @sell_in <=  5 && @sell_in < 50
      end
    end
  end
end
