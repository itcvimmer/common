#coding:utf-8
#
# 注意点
# ~/Git/

# githubユーザ名
#
USER = "itcvimmer"

# ユーザの持つレポジトリ名リスト
#
REPOS = %w(dotfiles .vim)

# git cloneする場所
#
CHECKOUT_DIR = "#{ENV['HOME']}/Git"

# レポジトリ名とパスワードを指定してクローンします。
#
def git_clone_command(repository_name, password)
  rm_r repository_name if File.exist? repository_name
  "git clone http://#{USER}:#{password}@github.com/#{USER}/#{repository_name}.git"
end

# メッセージを表示してEXITします。
#
def exit_with_message(message)
  p message
  exit 1
end

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

desc "ビムビムします"
task :vimvim do
  output_path = "/tmp"#ENV['HOME']
  pw = ENV['password'] || exit_with_message("passwordオプション指定してちょ")

  mkcd CHECKOUT_DIR do
    REPOS.each{|_| sh git_clone_command(_, pw)}

    [
      {src: "#{CHECKOUT_DIR}/dotfiles/.vimrc", dist: "#{output_path}/.vimrc"},
      {src: "#{CHECKOUT_DIR}/.vim",            dist: "#{output_path}/.vim"},
    ].each{|_| ln_sf _[:src], _[:dist]}

    clone_neobundle_plugin("#{output_path}/.vim/bundle")
    sh NeoBundleInstall("#{output_path}/.vimrc")
  end
end
