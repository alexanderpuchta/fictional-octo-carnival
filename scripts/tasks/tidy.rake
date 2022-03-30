include HelperMethods

desc 'Tidy the codebase by cleaning up various common problems'
task :tidy => ['tidy:project_file']
namespace :tidy do
  desc 'Alphabetically sort Xcode project file'
  task :project_file do
    puts yellow_text('Sorting project file...')
    colored_system 'perl ./scripts/sort_xcode_project_file.perl Router.xcodeproj/project.pbxproj'
  end
end
