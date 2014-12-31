module PublicActivity::Common
  class << self
    def activity_count
      @@activity_count ||= 0
    end

    def activity_count=(activity_count)
      @@activity_count = activity_count
    end
  end

  def create_activity(*args)
  end

  def create_activity_with_activity_count(*args)
    @@activity_count = @@activity_count.to_i
    @@activity_count += 1

    return unless self.public_activity_enabled?
    options = prepare_settings(*args)

    if call_hook_safe(options[:key].split('.').last)
      return PublicActivity::Adapter.create_activity(self, options)
    end

    nil
  end

  alias_method_chain :create_activity, :activity_count
end
