class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  # def create_haml_file
  #   directory "module_example_dir", "app/views/shared/modules/foo/#{file_name}"
  #   copy_file "module.html.haml", "app/views/shared/modules/foo/#{file_name}.html.haml"
  # end
  def create_haml_module
    directory "example_haml_dir", "app/views/shared/modules/foo/"
    copy_file "module.html.haml", "app/views/shared/modules/foo/_#{file_name}.html.haml"
  end
  def create_sass_module
    directory "example_sass_dir", "app/assets/stylesheets/modules/foo/#{file_name}"
    copy_file "module.sass", "app/assets/stylesheets/modules/foo/#{file_name}/_#{file_name}.sass"
    #copy_file "_modules.sass", "app/assets/stylesheets/_modules.sass"
    append_to_file "app/assets/stylesheets/_modules.sass", "@import 'modules/foo/#{file_name}/#{file_name}'\n"
  end
end
