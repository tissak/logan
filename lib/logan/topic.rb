require 'logan/HashConstructed'
require 'time'

# An individual topic. Can be message or todo item being discussed.
module Logan
  class Topic
    include HashConstructed

    attr_accessor :project_id
    attr_accessor :id
    attr_accessor :title
    attr_accessor :excerpt
    attr_accessor :created_at
    attr_accessor :updated_at
    attr_accessor :attachments
    attr_accessor :last_updater
    attr_accessor :topicable

    def initialize(h)
      super
    end

    def last_updated_by
      self.last_updater["name"]
    end

    def last_updated_at
      self.updated_at
    end

    def since_update
      Time.now - Time.parse(self.updated_at)
    end

    def topic_type
      self.topicable["type"]
    end

    def web_url
      self.topicable["url"].gsub('/api/v1','').gsub('.json','')
    end
  end
end