class User < ActiveRecord::Base
   has_many :crew
   has_many :journey
   has_many :outcome, through: :journey

   def crew_array
    Crew.where("user_id = #{self.id}")
  end

   # def self.crew_num
   #  User.last.num_of_crew
   # end
end
