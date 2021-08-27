# frozen_string_literal: true
 
require 'rails_helper'
 
RSpec.describe Recipe, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:recipe)).to be_valid
    end
	  end
	  context "空白のバリデーションチェック" do
	    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	      recipe = Recipe.new(name: '', genre_id:'hoge')
	      expect(recipe).to be_invalid
	      expect(recipe.errors[:name]).to include("can't be blank")
	    end
	    it "genre_idが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	      book = Recipe.new(name: 'hoge', body:'')
	      expect(book).to be_invalid
	      expect(book.errors[:body]).to include("can't be blank")
	    end
	  end
	end