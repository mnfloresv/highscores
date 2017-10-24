class RankingService
  def call
    ranking = Hash.new

    # Fetch max score of players in all games
    max_scores = Score.select("game_id, player_email, MAX(score) AS score").group(:game_id, :player_email).order(:game_id, score: :desc)

    # For each game
    max_scores.group_by(&:game_id).each do |_,scores|

      # Transform top 5 players with the table
      points = scores.take(5).pluck(:player_email).zip([25, 18, 15, 12, 10]).to_h

      # Combine in global ranking
      ranking.merge!(points){|_,o,n| o+n}
    end

    # Sort the global ranking and take top 10 scores
    result = ranking.sort_by{|_,v| v}.reverse.take(10).map.with_index do |e,i|
      OpenStruct.new(:position => i+1, :player_email => e[0], :score => e[1])
    end

  end
end
