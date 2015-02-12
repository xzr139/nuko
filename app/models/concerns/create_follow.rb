module CreateFollow
  def create_follow(model)
    self.follow_type = model.class.name
    self.save
  end
end
