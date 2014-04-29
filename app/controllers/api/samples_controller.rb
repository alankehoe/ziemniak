module Api
  class SamplesController < BaseController
    doorkeeper_for :all

    resource_description do
      short_description 'Samples resource'
      full_description 'A sample is translated from Polish to English with bing and yandex'
    end

    def_param_group :sample do
      param :sample, Hash, :required => true do
        param :body, String, :required => true
        param :reference, String
      end
    end

    before_action :set_variables, only: [:show, :update, :destroy]

    #######################################################################################

    api :GET, '/samples'
    description 'Returns all samples in the database'
    example File.read("#{Rails.root}/doc/api/samples/index.json")
    example File.read("#{Rails.root}/doc/api/samples/index.xml")

    def index
      @samples = current_user.samples.order 'ID DESC'
      respond_with @samples
    end

    #######################################################################################

    api :GET, '/samples/:id'
    description 'Returns specified sample from the database'
    example File.read("#{Rails.root}/doc/api/samples/show.json")
    example File.read("#{Rails.root}/doc/api/samples/show.xml")
    param :id, :number, :required => true

    def show
      respond_with @sample
    end

    #######################################################################################

    api :POST, '/samples'
    description 'Creates a sample in the database'
    example File.read("#{Rails.root}/doc/api/samples/create.json")
    example File.read("#{Rails.root}/doc/api/samples/create.xml")
    param_group :sample

    def create
      @sample = Sample.create! sample_params
      current_user.samples << @sample
      respond_with @sample
    end

    #######################################################################################

    api :PUT, '/samples/:id'
    description 'Updates the specified sample in the database'
    example File.read("#{Rails.root}/doc/api/samples/update.json")
    example File.read("#{Rails.root}/doc/api/samples/update.xml")
    param :id, :number, :required => true
    param_group :sample

    def update
      @sample.update! sample_params
      @sample.update_scores
      @sample.save!
      respond_with @sample
    end

    #######################################################################################

    api :DELETE, '/samples/:id'
    description 'Deletes the specified sample from the database'
    example File.read("#{Rails.root}/doc/api/samples/destroy.json")
    example File.read("#{Rails.root}/doc/api/samples/destroy.xml")
    param :id, :number, :required => true

    def destroy
      @sample.destroy!
      respond_with @sample
    end

    #######################################################################################

    private

    def set_variables
      @sample = current_user.samples.find params[:id]
    end

    def sample_params
      params.required(:sample).permit :body, :reference
    end
  end
end
