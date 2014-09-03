
updateTokenEngineer = (renteeTokens, engineerTokens, addedTokens) ->
  if addedTokens < renteeTokens
    renteeTokens = renteeTokens - addedTokens
    engineerTokens = engineerTokens + addedTokens
  else
    alert "Not enought tokens to distribute. Please purchase more"

