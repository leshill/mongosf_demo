Mongoid.configure do |config|
  config.use_object_ids = true
  config.persist_types = true
  old_connection = config.master.connection
  old_db = config.master
  config.master = Mongo::Connection.new(old_connection.host, old_connection.port, :logger => Rails.logger).db(old_db.name)
end
