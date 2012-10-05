class User < ActiveRecord::Base
  validates_presence_of :email
  attr_accessible :email, :identify_peers, :learn_about_aichi_targets, :notes, :participate_in_learning_group, :tech_support, :workshops_and_study_tours
end
