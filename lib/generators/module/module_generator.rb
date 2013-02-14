class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  def copy_module_file
    copy_file "module.sass", "app/assets/stylesheets/#{file_name}.sass"
  end
end
