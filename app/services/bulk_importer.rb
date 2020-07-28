require 'csv'
class BulkImporter

  class << self

    # method to bulk import user data from csv
    def user_import(file_data)
      users = []
      CSV.foreach(file_data, headers: true) do |row|
        user = get_row_data row.to_h
        users << user
      end
      User.import(users)
    end

    # method to prepare single user data bases on lat and long
    def get_row_data data
      {name: data['name'], location: "POINT(#{data['longitude']} #{data['latitude']})"}
    end

  end

end
