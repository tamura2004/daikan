class Mura
  attr_reader :hito, :kome, :happy, :nen

  def initialize
    @hito = rand(1..6)
    @kome = rand(1..6)
    @happy = rand(1..6)
    @nen = 1
  end

  def nex
    puts "== 天正#{nen}年 =="
    @nen += 1
    puts "白川村：人口#{hito}人、米#{kome}俵、幸福度#{happy}"

    print "税率(0割-10割)? "
    par = gets.to_i

    # 作付けに回す
    tane = [hito, kome * par / 10].min
    print "米#{tane}俵を植え付け、"
    @kome -= tane

    # 食料に回す
    eat = [hito, kome * (10 - par) / 10].min
    print "米#{eat}俵を村人が食べた、"
    @kome -= eat

    # 人口の増減
    zougen = [hito, eat].min * 2 - hito * 3 / 2

    if zougen > 0
      puts "村人が#{zougen}人増えた"
      @happy += 1
    else
      puts "村人が#{zougen.abs}人減った"
      @happy -= 1
    end
    @hito += zougen

    # 収獲
    syukaku = tane * rand(1..6)
    puts "収穫：米#{syukaku}俵"
    @kome += syukaku

    # 人口がゼロ以下ならゲームオーバー
    hito > 0
  end

  def run
    puts "==== 悪代官 ===="
    while nex
    end
    puts "GAME OVER"
  end
end

Mura.new.run