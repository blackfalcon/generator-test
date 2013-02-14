class ModuleGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  def create_module
    empty_directory 'app/views/shared/modules/foo/'
    copy_file "module.sass", "app/assets/stylesheets/modules/foo/#{file_name}/_#{file_name}.sass"
  end
end
