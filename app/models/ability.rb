class Ability
  include CanCan::Ability

  def initialize(user)
    if user.samples.length < user.sample_limit
      can :create_sample, Sample
    end
  end
end
