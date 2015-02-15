module CommentDecorator
  def my_note?
    user == current_user
  end
end
