task :default => [
  :backup,
  :link
]

VIM_FILES = %w[vimrc]
JANUS_VIM_FILES = %w[vimrc.before vimrc.after gvimrc.before gvimrc.after]
OTHER_FILES = %w[gitignore gitconfig rdebugrc zshrc gemrc]
DOT_FILES = VIM_FILES + OTHER_FILES

desc "Create links for all dot files"
task :link do
  puts "Creating links..."
  DOT_FILES.each do |file_name|
    new_link = File.expand_path("~/.#{file_name}")
    if File.symlink?(new_link) || File.exist?(new_link)
      warn "Ignored: #{new_link}"
    else
      ln_s(File.expand_path("../.#{file_name}", __FILE__ ), new_link)
    end
  end
end

desc "Remove created links"
task :unlink do
  puts "Removing links..."
  DOT_FILES.each do |file_name|
    file = File.expand_path("~/.#{file_name}")
    if File.symlink?(file) && File.readlink(file) == File.expand_path(".#{file_name}")
      rm File.expand_path(file)
    end
  end
end

desc "Backup"
task :backup do
  puts "Backing up..."
  DOT_FILES.each do |file_name|
    old_file = File.expand_path("~/.#{file_name}")
    if File.symlink?(old_file)
      warn "Ignored: #{old_file} -> #{File.readlink(old_file)}"
    elsif File.exist?(old_file)
      sh "mv #{File.expand_path(old_file)} #{File.expand_path(old_file)}.backup"
    end
  end
end

desc "Clean"
task :clean do
  sh "git clean -dfx"
end

desc "Update"
task :update do
  sh "git pull"
end
