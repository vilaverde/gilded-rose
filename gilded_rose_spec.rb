require_relative 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    context 'when the item is "normal"' do
      it 'reduces the quality by 1' do
        sell_in = 10
        quality = 5
        item = Item.new('foo', sell_in, quality)

        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(quality - 1)
      end

      it 'reduces quality by 2' do
        sell_in = 0
        quality = 4
        item = Item.new('foo', sell_in, quality)

        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(quality - 2)
      end

      it 'does not reduce quality below 0' do
        sell_in = 0
        quality = 0
        item = Item.new('foo', sell_in, quality)

        GildedRose.new([item]).update_quality

        expect(item.quality).to eq(0)
      end

      it 'reduces sell_in by 1' do
        sell_in = 0
        quality = 0
        item = Item.new('foo', sell_in, quality)

        GildedRose.new([item]).update_quality

        expect(item.sell_in).to eq(sell_in - 1)
      end
    end

    context 'when the item is "special"' do
      context 'and behaves like "Aged Brie"' do
        it 'increases quality by 2' do
          sell_in = 0
          quality = 0
          item = Item.new('Aged Brie', sell_in, quality)

          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(quality + 2)
        end

        it 'does not increase quality of item above 50' do
          sell_in = 0
          quality = 50
          item = Item.new('Aged Brie', sell_in, quality)

          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(50)
        end

        it 'decreases sell_in by 1' do
          sell_in = 2
          quality = 50
          item = Item.new('Aged Brie', sell_in, quality)

          GildedRose.new([item]).update_quality

          expect(item.sell_in).to eq(sell_in - 1)
        end
      end

      context 'and behaves like "Sulfuras"' do
        it 'does not decrease quality' do
          sell_in = 0
          quality = 80
          item = Item.new('Sulfuras, Hand of Ragnaros', sell_in, quality)

          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(quality)
        end

        it 'does not change sell_in value' do
          sell_in = 0
          quality = 80
          item = Item.new('Sulfuras, Hand of Ragnaros', sell_in, quality)

          GildedRose.new([item]).update_quality

          expect(item.sell_in).to eq(sell_in)
        end
      end

      context 'and behaves like "Backstage passes to a TAFKAL80ETC concert"' do
        it 'increases quality by 2 when sell_in <= 10 and sell_in > 5' do
          sell_in = 10
          quality = 10
          item = Item.new(
            'Backstage passes to a TAFKAL80ETC concert',
            sell_in,
            quality
          )

          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(quality + 2)
        end

        it 'increases quality by 3 when sell_in < 5 and sell_in >= 0' do
          sell_in = 0
          quality = 10
          item = Item.new(
            'Backstage passes to a TAFKAL80ETC concert',
            sell_in,
            quality
          )

          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(0)
        end

        it 'drops quality to 0' do
          sell_in = 0
          quality = 10
          item = Item.new(
            'Backstage passes to a TAFKAL80ETC concert',
            sell_in,
            quality
          )

          GildedRose.new([item]).update_quality

          expect(item.quality).to eq(0)
        end

        it 'decreases sell_in by 1' do
          sell_in = 2
          quality = 50
          item = Item.new(
            'Backstage passes to a TAFKAL80ETC concert',
            sell_in,
            quality
          )

          GildedRose.new([item]).update_quality

          expect(item.sell_in).to eq(sell_in - 1)
        end
      end
    end
  end
end
