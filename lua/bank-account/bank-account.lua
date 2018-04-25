BankAcount = {}

BankAcount.__index = BankAcount

function BankAcount:new()
  local new = {}

  setmetatable(new, BankAcount)

  new._balance = 0
  new.open = true

  return new
end

function BankAcount:balance()
  if not self.open then error() end

  return self._balance
end

function BankAcount:deposit(ammount)
  if not self.open or ammount <= 0 then error() end

  self._balance = self._balance + ammount
end

function BankAcount:withdraw(ammount)
  if not self.open or self._balance < ammount or ammount <= 0 then error() end

  self._balance = self._balance - ammount
end

function BankAcount:close(ammount)
  self.open = false
end

return BankAcount
