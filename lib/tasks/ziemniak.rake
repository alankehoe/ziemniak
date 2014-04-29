namespace :ziemniak do

  desc 'Generate stubs for api documentation examples'
  task generate_docs: :environment do
    Rails.application.eager_load!

    views_available = Dir.entries("#{Rails.root}/app/views/api/")
    views_available -= %w(. ..)

    collection_actions = %w(index)
    object_actions = %w(show update create destroy)

    ActiveRecord::Base.descendants.each do |model|
      resource_name = model.new.class.name.downcase.pluralize
      factory = model.new.class.name.downcase
      next unless views_available.include? resource_name

      FileUtils.mkdir_p "#{Rails.root}/doc/api/#{resource_name}"

      view_files = Dir.entries "#{Rails.root}/app/views/api/#{resource_name}"
      view_files.each do |file|
        if (action = file.match /index|show|create|update|destroy/)
          @instance = if collection_actions.include? action.to_s
                        FactoryGirl.build_list factory, 2
                      elsif object_actions.include? action.to_s
                        FactoryGirl.build factory
                      end

          %w(json xml).each do |format|
            resource_path = "#{resource_name}/#{action}"
            rabler = Rabl::Renderer.new "api/#{resource_path}", @instance, {:format => format, :view_path => 'app/views'}

            File.open "#{Rails.root}/doc/api/#{resource_path}.#{format}", 'w+' do |stub|
              stub.write JSON.pretty_generate(JSON.parse rabler.render) if format == 'json'
              stub.write Nokogiri::XML(rabler.render).to_xml if format == 'xml'
              puts "Created Documentation Stub #{File.expand_path stub}"
            end
          end
        end
      end
    end
  end

end
