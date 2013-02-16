#coding:utf-8
#-----------------------------------------------------------------------------------------------------
# 定数
#-----------------------------------------------------------------------------------------------------
USAGE = <<-EOF
------------------------------------------
クイックスタートガイド
------------------------------------------
なにはともあれ`rake -T`を実行してください。

説明が
  [副作用]を含む場合 => ファイルの変更があります。注意して実行してください。
  "--"の場合         => 他のタスクから呼ばれるタスクなので、通常は単体で呼ばれることはないタスクです。
EOF
SVN_CONFIG_FILETYPES = %w(rb sh coffee js scss css html erb)
SVN_CONFIG_PATH = "#{ENV['HOME']}/.subversion/config"
VIM_BUNDLE_PATH = "#{ENV['HOME']}/.vim/bundle"
VIMRC_PATH = "#{ENV['HOME']}/.vimrc"


#-----------------------------------------------------------------------------------------------------
# メソッド
#-----------------------------------------------------------------------------------------------------
# githubからwgetして標準出力するタスクを動的に定義します。
#
def define_wget_to_stdout_task(name, repository, files)
  namespace name do
    namespace :print do
      files.each do |_|
        desc "個人で管理している#{_}を標準出力します。"
        task _ do
          verbose false do
            sh wgetp("https://raw.github.com/#{name}/#{repository}/master/#{_}")
          end
        end
      end
    end
  end
end

# svn:keywordsを設定したSVNコンフィグを標準出力します。
#
def print_svn_config(path)
  exit_unless_file_exist(path)
  file_str = File.read(path)
  file_str.gsub!(/^# enable-auto-props = yes$/,"enable-auto-props = yes")
  SVN_CONFIG_FILETYPES.map{|_|"*.#{_}"}.reject{|_|file_str.match(/^#{additional_keywords(Regexp.escape(_))}/)}.reverse.each do |_|
    file_str.gsub!(/^\[auto-props\]$/,"[auto-props]\n#{additional_keywords(_)}")
  end
  print file_str
end

# neobundle.vimをクローンします。
#
def clone_neobundle(path)
  rm_r path if File.exist? path
  mkcd path do
    sh "git clone http://github.com/Shougo/neobundle.vim.git"
  end
end

# コンソールからNeoBundleInstallを実行します。
#
def neobundleinstall(path)
  "vim -N -u NONE -i NONE -V1 -e -s --cmd 'source #{path}' --cmd NeoBundleInstall! --cmd qall!"
end

# RVMをインストールします。
#
def install_rvm(path)
  cd path do
    return nil if File.exist? "#{pwd}/rvm"
    sh "git clone --depth 1 git://github.com/wayneeseguin/rvm.git"
    cd "rvm" do
      sh "./install"
    end
  end
end

# 追加キーワードを返します。
#
def additional_keywords(extname)
  "#{extname} = svn:keywords=Id"
end

# 引数に渡したファイルリストのそれぞれに対してHOMEにシンボリックリンクを張ります。
#
def link_to_home(files, path = pwd)
  files.each do |f|
    ln_sf "#{path}/#{f}", "#{ENV['HOME']}/#{f}"
  end
end

# wgetして標準出力に出力します
#
def wgetp(path)
  "wget -q -O - #{path}"
end

# ファイルが無い場合にメッセージを出力してexitします。
#
def exit_unless_file_exist(file)
  unless File.exist?(file)
    puts "#{file} not found."
    exit 1
  end
end

# mkdirしたディレクトリにそのままcdします。
#
def mkcd(path)
  mkdir_p path
  cd path do
    yield
  end
end

# desc に"--"を指定してタスクを定義します。
#
def sub_task(taskname)
  desc "--"
  task(taskname) do
    yield
  end
end


#-----------------------------------------------------------------------------------------------------
# タスク
#-----------------------------------------------------------------------------------------------------
desc "rakeで引数を指定しない場合に呼ばれるデフォルトタスクです。使用例を表示します。"
task(:default){print USAGE}

namespace :vim do
  desc "[副作用] 共通vimの設定ファイルのシンボリックリンクを張り、neobundleプラグインを入れ、NeoBundleInstallを実行します。"
  task :install_common_setting => %w(vim:symlink vim:touch vim:clone_neobundle vim:neobundleinstall)
  sub_task(:symlink){link_to_home %w(.vimrc, .vim)}
  sub_task(:touch){touch "#{ENV['HOME']}/.vimrc.local"}
  sub_task(:clone_neobundle){clone_neobundle(VIM_BUNDLE_PATH)}
  sub_task(:neobundleinstall){sh neobundleinstall(VIMRC_PATH)}
end

namespace :install do
  desc "[副作用] gitからrvmをcloneしてinstallを実行します。"
  task(:rvm){install_rvm(ENV['HOME'])}
end

namespace :svn do
  desc "コミット時に$id$を更新するようなSVNコンフィグ設定例を標準出力します。"
  task(:print_config){print_svn_config(SVN_CONFIG_PATH)}
end

define_wget_to_stdout_task("da1hk", "dotfiles", %w(.vimrc .zshrc))
