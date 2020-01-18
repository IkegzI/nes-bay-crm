class MachineController < ApplicationController

  def show
    @machine = Machine.find(params_id)
  end

  def edit
    @machine = Machine.find(params_id)
  end


  def create
    machine = Machine.new(params_machine)
    machine.save
    redirect_to machine_path(machine.id)
  end

  private

  def params_id
    params.require(:id)
  end


  def params_machine
    params.require(:machine).permit(
                                    :name,
                                    :instrument_id,
                                    :type_machine_id,
                                    :landing1,
                                    :landing2,
                                    :turnovers1,
                                    :turnovers2
                                    )
  end

end
