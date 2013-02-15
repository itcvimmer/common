#coding:utf-8

# Shougoさんのneobundleプラグインをクローンします。
#
def clone_neobundle_plugin(path)
  rm_r path if File.exist? path
  mkcd path do
    sh "git clone http://github.com/Shougo/neobundle.vim.git"
  end
end

# ターミナルからNeoBundleInstallを実行します。
#
def NeoBundleInstall(path)
  "vim -N -u NONE -i NONE -V1 -e -s --cmd 'source #{path}' --cmd NeoBundleInstall! --cmd qall!"
end

# mkdirしたディレクトリにそのままcdします。
#
def mkcd(path)
  mkdir_p path
  cd path do
    yield
  end
end

# wgetして標準出力に出力します
#
def wgetp(path)
  "wget -q -O - #{path}"
end

desc "vimの共通設定をします。"
task :set_common do
  _pwd = pwd
  [
    {:src => "#{_pwd}/.vimrc", :dist => "#{ENV['HOME']}/.vimrc"},
    {:src => "#{_pwd}/.vim",   :dist => "#{ENV['HOME']}/.vim"},
  ].each{|_| ln_sf _[:src], _[:dist]}

  touch "#{ENV['HOME']}/.vimrc.local"

  clone_neobundle_plugin("#{ENV['HOME']}/.vim/bundle")
  sh NeoBundleInstall("#{ENV['HOME']}/.vimrc")
end

desc "rvmインストール"
task :install_rvm do
  cd ENV['HOME'] do
    sh "git clone --depth 1 git://github.com/wayneeseguin/rvm.git"
    cd "rvm" do
      sh "./install"
      sh "source ~/.rvm/scripts/rvm"
    end
  end
end

namespace :daichi do
  desc "zshrc上書き"
  task :write_zshrc do
    sh wgetp("https://raw.github.com/da1hk/dotfiles/master/.zshrc") + " >> #{ENV['HOME']}/.zshrc"
  end
end
