# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User 'DailyMenuモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { daily_menu.valid? }

    let!(:other_daily_menu) { create(:daily_menu) }
    let(:daily_menu) { build(:daily_menu) }

    context 'recipe_idカラム' do
      it '空欄でないこと' do
        daily_menu.recipe_id = ''
        is_expected.to eq false
      end
    end

    context 'meal_time_idカラム' do
      it '空欄でないこと' do
        daily_menu.meal_time_id = ''
        is_expected.to eq false
      end
    end

    context 'recipe_idカラム' do
      it '空欄でないこと' do
        daily_menu.recipe_id = ''
        is_expected.to eq false
      end
    end

    context 'start_timeカラム' do
      it '空欄でないこと' do
        user.start_time = ''
        is_expected.to eq false
      end
    end
  end
end