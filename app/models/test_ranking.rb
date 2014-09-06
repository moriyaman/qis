class TestRanking

  def self.setup(category_id)
    TestResult.category_id_is(category_id).each do |test_result|
      redis.zadd("ranking-#{category_id}", test_result.point, test_result.user_id)
    end
  end
 
  # 現在の順位
  def rank(test_result)
    Rankable.redis.zrevrank("ranking-#{category_id}", self.id) + 1
  end
 
  # 現在のスコア（この例だとユーザの保持するポイント）
  def score(category_id)
    Rankable.redis.zscore("ranking-#{category_id}", self.id)
  end
 
  # スコアの更新
  def update_score(category_id, user_id)
    Rankable.redis.zincrby('ranking', got_point, self.id)
  end
 
  private
 
  def self.redis
    @redis ||= Redis.new
  end
