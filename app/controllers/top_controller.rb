# = トップメニュー処理クラス
# Author:: Taichi.Kanaya
# Copyright:: © 2018 Taichi.Kanaya
class TopController < ApplicationController
  
  public
  #=　初期表示
  def index
    @informations = Information.new
    @informations_list = Information.all
  end
end
