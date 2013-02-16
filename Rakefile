#coding:utf-8
SVN_CONFIG_FILETYPES = %w(rb sh coffee js scss css html erb)
SVN_CONFIG_PATH = "#{ENV['HOME']}/.subversion/config"
VIM_BUNDLE_PATH = "#{ENV['HOME']}/.vim/bundle"
VIMRC_PATH = "#{ENV['HOME']}/.vimrc"

namespace :vim do
  desc "[副作用] 共通vim設定ファイルのシンボリックリンクを張り、neobundleプラグインを入れ、NeoBundleInstallを実行します。"
  task :install_common_setting => %w(
    vim:symlink
    vim:clone_neobundle
    vim:neobundleinstall
  )

  desc "--"
  task :symlink do
    link_to_home %w(.vimrc, .vim)
    touch "#{ENV['HOME']}/.vimrc.local"
  end

  desc "--"# Shougoさんのneobundleプラグインをクローンします。
  task :clone_neobundle do
    rm_r VIM_BUNDLE_PATH if File.exist? VIM_BUNDLE_PATH
    mkcd VIM_BUNDLE_PATH do
      sh "git clone http://github.com/Shougo/neobundle.vim.git"
    end
  end

  desc "--"# ターミナルからNeoBundleInstallを実行します。
  task :neobundleinstall do
    sh "vim -N -u NONE -i NONE -V1 -e -s --cmd 'source #{VIMRC_PATH}' --cmd NeoBundleInstall! --cmd qall!"
  end
end

namespace :install do
  desc "[副作用] gitからrvmをcloneしてinstallを実行します。"
  task :rvm do
    cd ENV['HOME'] do
      sh "git clone --depth 1 git://github.com/wayneeseguin/rvm.git"
      cd "rvm" do
        sh "./install"
      end
    end
  end
end

namespace :svn do
  desc "コミット時に$id$を更新するようなSVNコンフィグ設定例を標準出力します。"
  task :print_config do
    exit_unless_file_exist(SVN_CONFIG_PATH)
    file_str = File.read(SVN_CONFIG_PATH)
    file_str.gsub!(/^# enable-auto-props = yes$/,"enable-auto-props = yes")
    SVN_CONFIG_FILETYPES
      .map{|_|"*.#{_}"}
      .reject{|_|file_str.match(/^#{additional_keywords(Regexp.escape(_))}/)}
      .reverse.each do |_|
        file_str.gsub!(/^\[auto-props\]$/,"[auto-props]\n#{additional_keywords(_)}")
      end
    print file_str
  end
end

namespace :daichi do
  namespace :print do
    %w(.vimrc .zshrc).each do |_|
      desc "個人で管理している#{_}を標準出力します。"
      task _ do
        verbose false do
          sh wgetp("https://raw.github.com/da1hk/dotfiles/master/#{_}")
        end
      end
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
