
module Filter

  def filter
    @sorted_results={}
    User.all.each do |u|
      to_add = {u.id.to_s => calculate_score(u) }
      @sorted_results = @sorted_results.merge(to_add)  
    end
    puts @sorted_results
    @sorted_results = @sorted_results.sort_by{ |k,v| -v}
    puts "======================================================== RESULTS ================================================================="
    puts @sorted_results
  end    
  
  private
  
  def calculate_score(user) 
    score=0;
    score += location_score( (current_user.location.to_f - user.location.to_f).abs )
    score += age_score((current_user.age.to_f - user.age.to_f).abs)
    score += language_score( current_user.language, user.language)
    score += nationality_score( current_user.nationality, user.nationality)
    score
  end
  
  def location_score(distance)
    case distance.to_f
    when 0..1
      return 10
    when 1..3
      return 8
    when 4..6
      return 6
    when 6..8
      return 5
    when 8..12
      return 4.5
    when 12..15
      return 4
    when 15..25
      return 3
    else
      return 0
    end
  end
  
  def age_score(age_diff)
    case age_diff.to_f
    when 0..3
      return 3
    when 4..7
      return 2
    when 8..10
      return 1
    else
      return 0
    end
  end
  
  def language_score(user1, user2)
    return 0 if (user1.nil? || user2.nil?)
    score = ( user1.scan(/\w+/) & user2.scan(/\w+/) ).count
    return score * 3 
  end
  
  def nationality_score (user1, user2)
    return 0 if (user1.nil? || user2.nil?)
    if user1 == user2
      return 3 
    else
      return 0
    end
  end

end
