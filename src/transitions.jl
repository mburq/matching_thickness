###############################
##  Markov chain simulation  ##
###############################

function tr_prioH(θ, N_H, N_E, p_H, p_E)
    if rand() < θ #incoming H
        if rand() > (1 - p_H^2)^N_H #can match to another H
            N_H -= 1
        elseif rand() > (1 - p_E*p_H)^N_E #can match to an E
            N_E -= 1
        else
            N_H += 1
        end
    else #incoming E
         if rand() > (1 - p_E*p_H)^N_H #can match to another H
            N_H -= 1
        elseif rand() > (1 - p_E^2)^N_E #can match to an E
            N_E -= 1
        else
            N_E += 1
        end
    end
    return (N_H, N_E)
end

function tr_random_prio(θ, N_H, N_E, p_H, p_E)
    if rand() < θ #incoming H
      n_E = N_E
      n_H = N_H
      while n_E > 0 || n_H > 0
        if rand() < n_E / (n_E + n_H) # probability that we pick an E next
          if rand() < p_E*p_H # can match to the E
            N_E -= 1
            break
          else
            n_E -= 1 # decrease pool of available matches
          end
        else
          if rand() < p_H^2
            N_H -= 1
            break
          else
            n_H -= 1 # decrease pool of available matches.
          end
        end
      end
      if n_E == 0 && n_H == 0
        N_H += 1
      end
    else #incoming E
      n_E = N_E
      n_H = N_H
      while n_E > 0 || n_H > 0
        if rand() < n_E / (n_E + n_H) # probability that we pick an E next
          if rand() < p_E^2 # can match to the E
            N_E -= 1
            break
          else
            n_E -= 1 # decrease pool of available matches
          end
        else
          if rand() < p_H * p_E
            N_H -= 1
            break
          else
            n_H -= 1 # decrease pool of available matches.
          end
        end
      end
      if n_E == 0 && n_H == 0
        N_E += 1
      end
    end
    return (N_H, N_E)
end

function tr_prioE(θ, N_H, N_E, p_H, p_E)
    if rand() < θ #incoming H
        if rand() > (1 - p_E*p_H)^N_E #can match to an E
            N_E -= 1
        elseif rand() > (1 - p_H^2)^N_H #can match to another H
            N_H -= 1
        else
            N_H += 1
        end
    else #incoming E
        if rand() > (1 - p_E^2)^N_E #can match to an E
            N_E -= 1
        elseif rand() > (1 - p_E*p_H)^N_H #can match to another H
            N_H -= 1
        else
            N_E += 1
        end
    end
    return (N_H, N_E)
end

function tr_chains(θ, N_H, N_E, p_H, p_E, d)
    continue_chain = false
    if rand() < θ #incoming H
        if rand() < 1 - (1 - p_H)^d #can match to another H
            continue_chain = true
        else
            N_H += 1
        end
    else #incoming E
         if rand() < 1 - (1 - p_E)^d
            continue_chain = true
        else
            N_E += 1
        end
    end
    while continue_chain
        if rand() < 1 - (1 - p_H)^N_H
            N_H -= 1
        elseif rand() < 1 - (1 - p_E)^N_E
            N_E -= 1
        else
            continue_chain = false
        end
    end
    return (N_H, N_E)
end

function tr_chains_prioE(θ, N_H, N_E, p_H, p_E, d)
    continue_chain = false
    if rand() < θ #incoming H
        if rand() < 1 - (1 - p_H)^d #can match to another H
            continue_chain = true
        else
            N_H += 1
        end
    else #incoming E
         if rand() < 1 - (1 - p_E)^d
            continue_chain = true
        else
            N_E += 1
        end
    end
    while continue_chain
        if rand() < 1 - (1 - p_E)^N_E
            N_E -= 1
        elseif rand() < 1 - (1 - p_H)^N_H
            N_H -= 1
        else
            continue_chain = false
        end
    end
    return (N_H, N_E)
end
