# Truth Checker

## based on the single responsibility principle.
## object or class should have one job

# Job: 1. Check truthiness of things and
# =>   2. Maintain state, tell you last truthiness inside (last check was truthy)

class TruthChecker
  def initialize
    @last_check = false
  end

  def check(thing)
    @last_check = if thing
                    true
                  else
                    false
                  end
  end

  def last_truth
    @last_check
  end
end
