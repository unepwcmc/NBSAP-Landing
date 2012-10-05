class User < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i;
  attr_accessible :email, :identify_peers, :learn_about_aichi_targets, :notes, :participate_in_learning_group, :tech_support, :workshops_and_study_tours
end
