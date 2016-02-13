if Rails.env.test? || Rails.env.development?
  require Rails.root.join('db', 'seed', 'clear_tables')
  require Rails.root.join('db', 'seed', 'users')
  require Rails.root.join('db', 'seed', 'notes')
  require Rails.root.join('db', 'seed', 'languages')
else
  fail 'Do not execute `rake db:seed` at production.'
end
