module CommentDecorator
  def this_my_note?
    user == current_user
  end
end
