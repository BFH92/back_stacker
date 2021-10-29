require 'json'
namespace :stacks_import do
  desc "IMPORT JSON TO CREATE/UPDATE STACKS ON DB"
    task new_data: :environment  do
      def config_json
        file_path = (File.dirname(__FILE__) + "/data/slugified_stacks.json")  
        @file = File.read(file_path)
      end
      def add_existing_stacks_to(list)
        existing_stacks = Stack.all
        existing_stacks.each do |stack|
          hash = Hash.new
          hash.store(:created_at,stack["created_at"])
          hash.store(:updated_at,stack["updated_at"])
          hash.store(:name, stack["name"])
          hash.store(:slug, stack["name"])
  
          list << hash
        end
      end
      def add_new_stacks_to(list)
        puts "add json to list"
        new_stacks = JSON.parse(@file)
  
        new_stacks.each do |stack|  
            now = Time.now
            value = Hash.new
            value.store(:name,stack)
            value.store(:slug,stack)
            value.store(:created_at,now)
            value.store(:updated_at,now)
            list << value
          end
        end
    
      def add_stacks_to_db_from(list)
        list.uniq!{ |p| p[:name] }
        begin
        Stack.delete_all
        Stack.upsert_all(list)
        rescue
          puts "error"
        end
      end
      def import_data
        list =[]
        config_json()
        add_existing_stacks_to(list)
        add_new_stacks_to(list)
        add_stacks_to_db_from(list)
        puts "#{list.length} stacks added to db"
      end
      import_data()
      #Rake::Task["json_import:data:update_cities"].execute
    end

  end


