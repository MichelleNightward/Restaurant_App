class User

  def pass(status)
    true
  end
  
  def score(grade)
    if(grade = "A" || grade = "B" || grade = "C" || grade = "D")
      true
    else
      false
    end
  end
end
