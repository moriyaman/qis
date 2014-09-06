module TestRanking

  # 現在の順位
  def rank
    TestRanking.redis.zrevrank("ranking-#{category_id}", user_id) + 1 
  end 
 
  def score
    TestRanking.redis.zscore("ranking-#{category_id}", user_id)
  end 
 
  # スコアの更新
  def update_score
    TestRanking.redis.zincrby("ranking-#{category_id}", point, user_id)
  end 

  class << self
    def setup(category_id)
      self.category_id_is(category_id).each do |test_result|
        redis.zadd("ranking-#{category_id}", test_result.point, test_result.user_id)
      end 
    end 
 
    def redis
      @redis ||= Redis.new
    end
  end
end
