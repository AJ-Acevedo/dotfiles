require 'rake'
require 'erb'
require 'rbconfig'

# Verify if host OS is either macOS or Linux, otherwise exit
@os = RbConfig::CONFIG['host_os']

case
when @os.downcase.include?('linux')
  @os = 'linux'
when @os.downcase.include?('darwin')
  @os = 'darwin'
else
  puts 'macOS and Linux are the only supported platforms.'
  puts 'exiting...'
  exit
end

# Start the dotfiles installation
desc "Setting up dotfiles in user's home directory"
task :install do
  replace_all = false
  files = Dir['*'] - %w[config init LICENSE.md Rakefile README.md]
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [y]es, [n]o, [o]verwrite all, [q]uit "
        case $stdin.gets.chomp
        when 'o'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
  make_bin
  source_files
end

task :default => [:install]

task :source do
  source_files
end

task :make_bin do
  make_bin
end

# Methods
def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    # Create the symbolic links in the user's home directory.
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def make_bin
  # Add ~/bin if it does not already exist
  system %Q{mkdir -p $HOME/bin}
end

def source_files
  system %Q{
    source $HOME/.bash_profile
    vim -S $HOME/.vimrc -c 'q'
  }
  puts 'Sourced bash and vim'
end
