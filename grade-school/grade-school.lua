School = {}
School.__index = School

function School:new()
  local new = setmetatable({}, School)

  new.students = {}

  return new
end

function School:roster()
  return self.students
end

function School:grade(grade_number)
  return self.students[grade_number] or {}
end

function School:add(student, grade_number)
  local grade_table = self:grade(grade_number)

  grade_table[#grade_table+1] = student

  table.sort(grade_table)

  self.students[grade_number] = grade_table
end

return School
