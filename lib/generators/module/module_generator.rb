# This is looking pretty good, but the generator only takes one argument
# `rails g module bar`  will generate the necessary module files
# Currently hardcoded is the category directory of `foo`, need to make this an argument
# As a user I want enter at the CLI `rails g module foo bar`

class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  argument :category
  argument :name
  
  def create_haml_module
    directory "example_haml_dir", "app/views/shared/modules/#{category}/"
    copy_file "module.html.haml", "app/views/shared/modules/#{category}/_#{name}.html.haml"
  end
  def create_sass_module
    directory "example_sass_dir", "app/assets/stylesheets/modules/#{category}/#{name}"
    copy_file "module.sass", "app/assets/stylesheets/modules/#{category}/#{name}/_#{name}.sass"

    # Need this to happen, but if the file is already there it creates a conflict
    # Need to either bypass the overwrite or silent the conflict alert
    # ------------------------------------------------------------------------
    # create_file "app/assets/stylesheets/_modules.sass"

    append_to_file "app/assets/stylesheets/_modules.sass", "@import 'modules/#{category}/#{name}/#{name}'\n"
  end
end
