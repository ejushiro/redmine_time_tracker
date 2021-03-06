require_dependency 'context_menus_controller'

module TtContextMenusControllerControllerPatch
  def tt_overview
    entryClass = params[:entryClass] # specify either a TimeLog- or TimeBooking- ContextMenu was activated

    if entryClass == "TimeLog"
      @time_log_ids = params[:ids]
    elsif entryClass == "TimeBooking"
      @time_booking_ids = params[:ids]
      @time_booking = TimeBooking.where(:id => params[:ids][0]).first if params[:ids].length == 1
    end

    render :layout => false
  end

  def tt_bookings_list
    @time_booking_ids = params[:ids]

    render :layout => false
  end

  def tt_logs_list
    @time_log_ids = params[:ids]

    render :layout => false
  end
end

class ContextMenusController
  include TtContextMenusControllerControllerPatch
end
