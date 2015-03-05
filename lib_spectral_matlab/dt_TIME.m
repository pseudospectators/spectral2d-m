function dt = dt_TIME(time, time_end)
%% dt = dt_TIME(time,time_end) maximum dt to avoid jumping past time "time_end"
% requires params.CFL, params.dx
    global params
    dt = time_end-time;
end