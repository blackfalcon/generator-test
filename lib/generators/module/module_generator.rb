class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  def create_module
    directory "example", "app/views/shared/modules/#{file_name}"
    copy_file "module.sass", "app/assets/stylesheets/modules/category/#{file_name}/_#{file_name}.sass"
  end
end
