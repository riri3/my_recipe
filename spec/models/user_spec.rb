# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字は×' do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
      it '50文字以下であること: 50文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 50)
        is_expected.to eq true
      end
      it '50文字以下であること: 51文字は×' do
        user.introduction = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
      it '一意であること' do
        #
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Recipeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:recipes).macro).to eq :has_many
      end
    end
    context 'DailyMenuモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:daily_menus).macro).to eq :has_many
      end
    end
    context 'ShoppingListモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:shopping_lists).macro).to eq :has_many
      end
    end
    context 'Contactモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:contacts).macro).to eq :has_many
      end
    end
  end
end
