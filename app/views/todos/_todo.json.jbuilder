json.extract! todo, :id, :title, :content, :deleted, :finished, :finished_at, :project_id, :creator_id, :assignee_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)