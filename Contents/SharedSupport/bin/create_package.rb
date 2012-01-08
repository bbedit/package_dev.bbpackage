#!/usr/bin/env ruby
#-*- encoding: utf-8; x-soft-wrap-text: false; x-auto-expand-tabs: true; x-typographers-quotes: false; tab-width: 2; indent-tabs-mode: nil; -*-

require 'logger'

@log = Logger.new(STDOUT)
@log.level = Logger::INFO

def bbedit_package_root
  dropbox_path = "#{File.expand_path('~/')}/Dropbox/Application Support/BBEdit"
  @log.debug dropbox_path

  exists_in_dropbox = File.exist?( dropbox_path )
  if exists_in_dropbox
    dropbox_package_path = "#{dropbox_path}/Packages"
    unless File.exist?( dropbox_package_path )
      Dir.mkdir dropbox_package_path
    end

    return dropbox_package_path
  else
    # No BBEdit support folder in the Dropbox. Check the Library

    application_support_path = "#{File.expand_path('~/')}/Library/Application Support/BBEdit"

    if File.exist?(application_support_path)
      libary_package_path = "#{application_support_path}/Packages"
      Dir.mkdir(libary_package_path) unless File.exist?(libary_package_path)

      return libary_package_path
    else
      @log.error "Could not find BBEdit folder in dropbox or in Library/Application Support"
      exit 1
    end
  end

end


def create_package_name_in(package_name, package_root, extension)
  new_package_dir = "#{package_root}/#{package_name}.bbpackage"
  contents_dir = "#{new_package_dir}/Contents"
  Dir.mkdir new_package_dir

  File.new("#{new_package_dir}/README.markdown", "w+").close() # no File.touch. ARG!
  Dir.mkdir contents_dir
  Dir.mkdir "#{contents_dir}/Clippings"
  Dir.mkdir "#{contents_dir}/Clippings/#{package_name}#{extension}"

  Dir.mkdir "#{contents_dir}/Text Filters/"
  Dir.mkdir "#{contents_dir}/Text Filters/#{package_name}"

  Dir.mkdir "#{contents_dir}/Scripts/"
  Dir.mkdir "#{contents_dir}/Scripts/#{package_name}"

  new_package_dir
end

package_root = bbedit_package_root
language_name = ARGV[0] #"Lua"
extension = ARGV[1] #.lua

full_path_to_package = create_package_name_in(language_name, package_root, extension)

@log.info "Successfully created #{language_name}.bbpackage in #{full_path_to_package}"
