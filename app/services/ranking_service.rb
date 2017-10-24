class RankingService
  def call
    ranking = Hash.new

    Game.all.each do |game|
      # Get top 5 players of each game
      top5 = game.scores.select("player_email, MAX(score) AS score").group(:player_email).order(score: :desc).limit(5)

      # Transform with the table
      points = top5.map(&:player_email).zip([25,18,15,12,10]).to_h

      # Combine in global ranking
      ranking.merge!(points){|_,o,n| o+n}
    end

    # Sort the global ranking and take top 10 scores
    result = ranking.sort_by{|_,v| v}.reverse.take(10).map.with_index do |e,i|
      OpenStruct.new(:position => i+1, :player_email => e[0], :score => e[1])
    end

  end
end
