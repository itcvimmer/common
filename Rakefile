#coding:utf-8
#-----------------------------------------------------------------------------------------------------
# 定数
#-----------------------------------------------------------------------------------------------------
USAGE = <<-EOF
------------------------------------------
クイックスタートガイド
------------------------------------------
説明(`rake -T`で表示)が
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
        desc "[#{name}] #{_}を標準出力します。[レポジトリ:#{repository}]"
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
  task :setup => %w(vim:symlink vim:touch vim:clone_neobundle vim:neobundleinstall)
  sub_task(:symlink){link_to_home %w(.vimrc .vim)}
  sub_task(:touch){touch "#{ENV['HOME']}/.vimrc.local"}
  sub_task(:clone_neobundle){clone_neobundle(VIM_BUNDLE_PATH)}
  sub_task(:neobundleinstall){sh neobundleinstall(VIMRC_PATH)}
end

namespace :install do
  desc "[副作用] gitからrvmをcloneしてinstallを実行します。"
  task(:rvm){install_rvm(ENV['HOME'])}

  #TODO
  # desc "[副作用] rubyリファレンスマニュアルの設定"
  # task(:rubyrefm) do
  #   src_dir="/usr/local/src"
  #   rubyrefm_dir="#{src_dir}/rubyrefm/"
  #   refe_exe="/usr/local/bin/refe"
  #   sh "wget -P #{src_dir} http://doc.okkez.net/archives/201208/ruby-refm-1.9.3-dynamic-20120829.tar.gz"
  #   sh "tar xvzf #{src_dir}/ruby-refm-1.9.3-dynamic-20120829.tar.gz -C #{src_dir}"
  #   sh "mv -f #{src_dir}/ruby-refm-1.9.3-dynamic-20120829 #{src_dir}/rubyrefm"
  #   sh %Q[
  #   cat <<-EOF > #{refe_exe}
  #   #!/bin/sh
  #   exec ruby -Ke -I #{rubyrefm_dir}/bitclust/lib #{rubyrefm_dir}/bitclust/bin/refe -d #{rubyrefm_dir}/db-1_9_3 "\$@"
  #   EOF
  #   ]
  #   sh "chmod 755 #{refe_exe}"
  # end
end

namespace :centos do
  namespace :install do
    #TODO
    # desc "ctags"
    # task :ctags do
    #   sh "rpm -qa | grep ctags"
    #   sh "wget http://prdownloads.sourceforge.net/ctags/ctags-5.8-1.src.rpm"
    #   sh "yum remove ctags"
    #   sh "rpmbuild --rebuild ctags-5.8-1.src.rpm"
    #   sh "rpm -ivh /usr/src/redhat/RPMS/x86_64/ctags-5.8-1.x86_64.rpm"
    #   # sh "rpm -ivh /usr/src/redhat/RPMS/i386/ctags-5.8-1.i386.rpm"
    #   sh "rpm -qa | grep ctags"
    # end

    #TODO
    # desc "vim"
    # tasi :vim do
    #   sh "yum -y remove vim vim-enhanced"
    #   sh "yum -y install hg"
    #   sh "yum -y install ncurses-devel"
    #   sh "mkdir -p ~/src"
    #   sh "hg clone https://vim.googlecode.com/hg/ ~/src/vim"
    #   sh "cd ~/src/vim"
    #   sh "./configure --enable-multibyte --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-fontset"
    #   sh "make"
    #   sh "make install"
    # end
  end
end

namespace :svn do
  desc "コミット時に$id$を更新するようなSVNコンフィグ設定例を標準出力します。"
  task(:print_config){print_svn_config(SVN_CONFIG_PATH)}
end

define_wget_to_stdout_task("da1hk", "dotfiles", %w(.vimrc .zshrc))
