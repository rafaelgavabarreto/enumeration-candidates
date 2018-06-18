# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
      if candidate[:id] == id
        return candidate
      end
  end
  return nil
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def qualified_candidates(candidates)
  candidate.select do |candidate|
    experienced?(candidate) && github(candidate) && language(candidate) && day(candidate) && age(candidate)
  end
end

def github(candidates)
  candidate[:github_points] >= 100
end

def language(candidate)
  candidate[:language].include?("Ruby") || candidate[:language].include?("Python")
end

def day(candidate)
  candidate[:date_applied] >= 15.days.ago.to_date
end

def age(candidate)
  candidate[:age] > 17
end

def order_by_qualifications(candidates)
  candidates.sort_by {|candidate| [candidate[:years_of_experience], candidate[:github_points]]}.reverse
end