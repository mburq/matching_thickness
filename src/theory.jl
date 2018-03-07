###############################
##     Theoretical times     ##
###############################

"""
Computes the theoretical waiting times based on the results in Theorems 1 2 and 3
"""
# Priority to H
function theory_prioH(λ_E, λ_H, p_E, p_H)
  if λ_H < λ_E
      return log(λ_E/(λ_E - λ_H))/(λ_H * p_E * p_H)
  elseif λ_H > λ_E
      return log(2*λ_H/(λ_E + λ_H))/(λ_H * p_H^2)
  else
    error("Cannot find theory for λ_E, = $λ_E, λ_H = $λ_H,")
  end
end

# Priority to E
function theory_prioE_lower(λ_E, λ_H, p_E, p_H)
  return theory_prioH(λ_E, λ_H, p_E, p_H)
end


function theory_prioE_upper(λ_E, λ_H, p_E, p_H)
  if λ_H < λ_E
      return log(2*λ_E/(λ_E - λ_H))/(p_E * p_H*λ_H)
  elseif λ_H > λ_E
      return log(2*λ_H/(λ_E + λ_H))/(λ_H * p_H^2)
  else
      error("Cannot find theoretical upper bound for λ_E, = $λ_E, λ_H = $λ_H,")
  end
end

function conj_prioE(λ_E, λ_H, p_E, p_H)
  if λ_H < λ_E
      return log((λ_E + λ_H)/(λ_E - λ_H))/(p_E * p_H * λ_H)
  elseif λ_H > λ_E
      return log(2*λ_H/(λ_E + λ_H))/(λ_H * p_H^2)
  else
    error("Cannot find conjecture for λ_E, = $λ_E, λ_H = $λ_H,")
  end
end


# Chains
function theory_chains_upper(λ_E, λ_H, p_E, p_H, d)
    return log(λ_H/(λ_E * (1 - (1 - p_E)^d))+1)/(p_H*λ_H)
end

function conj_chains(λ_E, λ_H, p_E, p_H, d)
    return log((λ_H + λ_E )/(λ_H * (1 - (1 - p_H)^(d)) + λ_E))/(p_H*λ_H)
end
