require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  before do
    driven_by(:rack_test)
  end

  context 'レイアウトのリンク確認' do
    it 'リンクの遷移が正常に行えること' do
      # TOPに移動する
      visit root_path
      expect(page).to have_link('Home', href: root_path )
      expect(page).to have_link('sample app', href: root_path )
      expect(page).to have_link('Help', href: help_path )
      expect(page).to have_link('About', href: about_path )
      expect(page).to have_link('Contact', href: contact_path )
    end
  end
end
