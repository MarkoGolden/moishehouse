module ActiveRecord
  class External < ActiveRecord::Base
    # establish_connection(
    #   :adapter => 'mysql2',
    #   :encoding => 'utf8',
    #   :database => 'mintranet',
    #   :host => '75.103.111.68',
    #   :username => 'someguy',
    #   :password => 'tah1t1SOO4',
    #   :port => 3306
    # )

    establish_connection(
      :adapter => 'postgresql',
      :encoding => 'utf8',
      :url => ENV['DATABASE_URL']
    )

  end

  class ExternalMigration < ActiveRecord::Migration
    def connection
      ActiveRecord::External.connection 
    end
  end

end