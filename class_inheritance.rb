class Employee 
    attr_accessor :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @title = title 
        @name = name 
        @salary = salary 
        @boss = boss 
        
    end

    def bonus(multiplier)
        salary * multiplier
    end

end

class Manager < Employee 
    attr_accessor :employees

    def initialize(name, title, salary, boss)
       super
       @employees = []        
    end

    def bonus(multiplier)
        (employees.map{|person| person.salary}.sum)*multiplier
    end

end

ned = Manager.new("Ned","Founder",1000000,nil)
darren = Manager.new("Darren","TA manager",78000,"Ned")
shawna = Employee.new("Shawna","TA",12000,"Darren")
#shawna = Employee.new("Shawna","TA",12000,darren)

david = Employee.new("David","TA",10000,"Darren")

ned.employees += [darren,shawna,david]
darren.employees += [shawna,david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
