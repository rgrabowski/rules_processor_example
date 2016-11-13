class RulesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]

  # GET /rules
  # GET /rules.json
  def index
    @rules = Rule.all
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
  end

  # GET /rules/new
  def new
    @rule = Rule.new
  end

  # GET /rules/1/edit
  def edit
  end

  # POST /rules
  # POST /rules.json
  def create
    @rule = Rule.new(rule_params)

    respond_to do |format|
      if @rule.save
        format.html { redirect_to @rule, notice: 'Rule was successfully created.' }
        format.json { render :show, status: :created, location: @rule }
      else
        format.html { render :new }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.html { redirect_to @rule, notice: 'Rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @rule }
      else
        format.html { render :edit }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule.destroy
    respond_to do |format|
      format.html { redirect_to rules_url, notice: 'Rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_condition_fields
    prepare_condition
  end

  def handle_condition_fields
    prepare_condition
    @index = params[:index]
  end

  def add_action_fields
    prepare_action
  end

  def handle_action_fields
    prepare_action
    @index = params[:index]
  end

  private

  def prepare_condition
    @rule = Rule.new
    @condition = Rule::ConditionBuilder.new(field: params[:field], logical_group: params[:logical_group], rule: @rule).build
    @logical_group = params[:logical_group].to_s.parameterize.underscore.to_sym
  end

  def prepare_action
    @rule = Rule.new
    @action = Rule::ActionBuilder.new(action_name: params[:action_name], rule: @rule).build
  end

  def rule_params
    params.require(:rule).permit(:name, :order, :active,
                                 meet_all_attributes: [:field, :operator, :value, :_destroy, value: []],
                                 meet_any_attributes: [:field, :operator, :value, :_destroy, value: []],
                                 actions_attributes: [:action_name, :value, :_destroy, value: []])
  end


    def set_rule
      @rule = Rule.find(params[:id])
    end

end
