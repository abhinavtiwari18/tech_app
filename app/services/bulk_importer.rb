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

  # 26.787049, 79.029181
  # 26.787007, 79.030051



  # 26.790086, 79.033926


  # User.create({name: 'etw1', location: "POINT(#{79.033926} #{26.790086})"})
  # User.create({name: 'etw2', location: "POINT(#{79.030051} #{26.787007})"})
  # User.create({name: 'etw3', location: "POINT(#{79.029181} #{26.787049} )"})
  # User.create({name: 'etw4', location: "POINT(#{79.085152} #{26.843041})"})

end
