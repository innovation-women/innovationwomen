require 'csv'

class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end
  
  def bulk
    render and return if request.get?
    
    csv = CSV.parse(person_params[:csv], :headers => true)

    csv.each do |row|
      csv_attributes = row.to_hash
      phonenumber = csv_attributes['Cell Phone'].gsub(/\s/, '').gsub(/\-/, '')
      next if Person.find_by_phonenumber(phonenumber).present?
      puts phonenumber
      Person.create!(
        phonenumber: phonenumber,
        firstname: csv_attributes['First Name'],
        lastname: csv_attributes['Lsat Name'],
        email: csv_attributes['Email'],
        ticket: csv_attributes['Ticket Type']        
      )
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:phonenumber, :csv)
    end
end
