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

desc "vimの共通設定をします。"
task :set_common do
  _pwd = pwd
  [
    {src: "#{_pwd}/.vimrc", dist: "#{ENV['HOME']}/.vimrc"},
    {src: "#{_pwd}/.vim",   dist: "#{ENV['HOME']}/.vim"},
  ].each{|_| ln_sf _[:src], _[:dist]}

  touch "#{ENV['HOME']}/.vimrc.local"

  clone_neobundle_plugin("#{ENV['HOME']}/.vim/bundle")
  sh NeoBundleInstall("#{ENV['HOME']}/.vimrc")
end
