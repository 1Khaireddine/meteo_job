class EnableUuid < ActiveRecord::Migration[7.1]
  def change
    ## UUID
    # execute "CREATE SCHEMA hstore;"
    # execute "CREATE EXTENSION IF NOT EXISTS hstore SCHEMA hstore;"
    # execute "CREATE SCHEMA uuid; CREATE EXTENSION \"uuid-ossp\" SCHEMA uuid;"
    # # enable_extension 'hstore' unless extension_enabled?('hstore')
    # # enable_extension 'pgcrypto'

    # TODO:  deadcode ?
    # ## UUID
    execute %Q{
      CREATE SCHEMA IF NOT EXISTS uuid;
      CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA uuid;
    }

    ## HSTORE
    execute %Q{
      CREATE SCHEMA IF NOT EXISTS hstore;
      CREATE EXTENSION IF NOT EXISTS hstore SCHEMA hstore;
    }

    ## UNACCENT()
    execute( "CREATE EXTENSION IF NOT EXISTS unaccent SCHEMA pg_catalog;" )
  end
end
