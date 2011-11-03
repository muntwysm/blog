module ApplicationHelper
  
  def games(user,season)
  	Post.joins(:participants).where("user_id = ? and season_id = ?", user,season).count.to_i
  end

  def wins(user,season)
  	Post.joins(:participants => :score).where("result = 'win' and user_id = ? and season_id = ?", user,season).count
  end
  
  def losses(user,season)
  	Post.joins(:participants => :score).where("result = 'loss' and user_id = ? and season_id = ?", user,season).count
  end
  
  def draws(user,season)
  	Post.joins(:participants => :score).where("result = 'draw' and user_id = ? and season_id = ?", user,season).count
  end
  
  def moms(user,season)
  	Post.joins(:participants => :score).where("mom = true and user_id = ? and season_id = ?", user,season).count
  end
  
  def noshows(user,season)
  	Post.joins(:participants => :score).where("result = 'noshow' and user_id = ? and season_id = ?", user,season).count
  end
  
  def points(user,season)
  	Post.joins(:participants => :score).where("user_id = ? and season_id = ?", user,season).sum("score").to_i
  end
  
  def progressive_points(user,season,post)
  	Post.joins(:participants => :score).where("user_id = ? and season_id = ? and game_date <= ?", user,season,post).sum("score").to_i
  end
  
  def total_points(user,season)
  	pts = points(user,season)
  	moms = moms(user,season)
  	total = pts.to_i + moms.to_i
  end
  
  def win_ratio(user,season)
  	p=0
  	p.to_f
  	g = games(user,season).to_f
  	w = wins(user,season).to_f
  	if g > 0
  		p = w.to_f/g.to_f*100
  	end
  	return p
  end
    
	def calc_stats(collection,season)
	details = Array.new()
	collection.each { |user|
		details <<
		{:user => user,
		:rank => 0,
		:array_id => 0,
		:id => user.id,
		:mnfname => user.mnfname,	
		:img => user.img,	
		:games => games(user,season),	
		:wins => wins(user,season),	
		:losses => losses(user,season),	
		:draws => draws(user,season),	
		:moms => moms(user,season),	
		:noshows => noshows(user,season),	
		:total_points => total_points(user,season),	
		:win_ratio => win_ratio(user,season)}
	}
	details.sort! { |a, b| [b[:total_points],b[:win_ratio]] <=> [a[:total_points],a[:win_ratio]] }
	i = 1
	details.each do |r|
		r[:array_id] = i
		i +=1
	end
	return details
	end
	
	def getPlayersWhoHavePlayed(array)
	  users = Array.new()
	  array.each do |user|
	    u = User.find(user)
	    users << u
    end
    return users
  end
  
	def setRank(sortedArray)
		a = sortedArray
		b = sortedArray
    
		a.each do | row |   
			b.each do | check_row |
			  row[:rank] = check_row[:array_id]
				if check_row[:array_id] > row[:array_id]
					if check_row[:total_points] < row[:total_points]
						  # different points 
  						row[:rank] = check_row[:array_id] - 1 
  						break
					elsif check_row[:win_ratio] < row[:win_ratio]
						  # different pct after same points
  						row[:rank] = check_row[:array_id] - 1 
  						break
				  end
				end
			end # b.each
    end # a.each
  end
  
  
  
  def career_games(user)
  	Post.joins(:participants).where("user_id = ?", user).count.to_i
  	#a = Archive.find(user)
  	#a = a. + p.played
  end

  def career_wins(user)
  	Post.joins(:participants => :score).where("result = 'win' and user_id = ?", user).count
  end
  
  def career_moms(user)
  	Post.joins(:participants => :score).where("mom = true and user_id = ?", user).count
  end
  
  def career_win_ratio(user)
  	p=0
  	p.to_f
  	g = career_games(user).to_f
  	w = career_wins(user).to_f
  	if g > 0
  		p = w.to_f/g.to_f*100
  	end
  	return p
  end
  
  def results(user,season)
    Post.joins('LEFT JOIN participants ON participants.post_id = posts.id AND user_id = ?',user).where("season_id = ?",season)
    Participant.joins('LEFT JOIN posts ON post.id = participants.post_id AND user_id = ?',user).where("season_id = ?",season)
  end

end
