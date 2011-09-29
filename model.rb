class Comment
  include DataMapper::Resource
  property :id, Serial
  property :text, Text
end

DataMapper.setup(:default, 'sqlite::memory:')
DataMapper.auto_migrate!