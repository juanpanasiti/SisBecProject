class User < ActiveRecord::Base
  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :initialize_access_level

  def is_non_student_user? # Pregunta si el usuario está registrado y NO ES estudiante
 		self.access_level == 0
 	end
 	def is_student? # Pregunta si el usuario está registrado y ES estudiante
 		self.access_level == 1
 	end

 	def is_admin? # Pregunta si el usuario está registrado y es ADMIN
 		self.access_level >= 2
 	end
 	def is_super_admin? # Pregunta si el usuario está registrado y es SUPER ADMIN
 		self.access_level >= 3
 	end

  ############ CALLBACKS
  def initialize_access_level
    if User.all.count == 0
      self.access_level = 3
    else
      self.access_level = 0
    end
  end

  ########### METHODS
  def is_student!
    self.access_level = 1
    self.save
  end
end
