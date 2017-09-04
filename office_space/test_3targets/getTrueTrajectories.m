%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright (c) 2014
% The University of Utah
% Sensing and Processing Across Networks (SPAN) Lab
% All rights reserved.
% 
% Redistribution and use, with or without modifications, are permitted
% provided that the following conditions are met:
%
% 1. Redistributions must retain the above copyright notice, this list of
%    conditions, and the following disclaimer in the documentation and/or
%    other materials provided with the distribution.
% 2. Neither the name of the University nor the names of its contributors
%    may be used to endorse or promote products derived from this software
%    without specific prior written permission.
% 
% DISCLAIMER:
%
% THIS SOFTWARE IS PROVIDED BY THE UNIVERSITY AND CONTRIBUTORS ''AS IS'' AND
% ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
% OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
% HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
% OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
% SUCH DAMAGE.
% --------------------------------------------------------------------------
%
% Author(s) : Maurizio Bocca, Neal Patwari
% Created   : 2014-01-15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function getTrueTrajectories()
% A function displaying the true trajectories of the targets during the
% test.

close all; clc;

load('targets_coordinates');
RFsensorLocsFt = [...
    [0,2];[0,6];[0,10];[0,14];[0,18]; ...
    [0,22];[0,26];[0,30];[0,34];[2,36]; ...
    [6,36];[10,36];[14,36];[18,36];[20,32]; ...
    [20,25];[20,22];[20,18];[20,14];[20,10]; ...
    [20,6];[20,2];[18,0];[14,0];[10,0]; ...
    [6,0];[2,0];[8,32];[6,20];[9,14]; ...
    [9,10];[9,6]]';
RFsensorLocsMt = RFsensorLocsFt*0.3048;

for cycleCounter = 1:length(x_coord_t1)
    try
        set(titleHandle,'String',['Cycle counter: ' num2str(cycleCounter)]);
        set(t1Handle,'Xdata',x_coord_t1(cycleCounter), ...
            'YData',y_coord_t1(cycleCounter));
        set(t2Handle,'Xdata',x_coord_t2(cycleCounter), ...
            'YData',y_coord_t2(cycleCounter));
        set(t3Handle,'Xdata',x_coord_t3(cycleCounter), ...
            'YData',y_coord_t3(cycleCounter));
    catch    
        figure();
        hold on;
        plot(RFsensorLocsMt(1,:),RFsensorLocsMt(2,:),'k.','markerSize',20);
        labels = cellstr(num2str([1:length(RFsensorLocsMt)]'));
        text(RFsensorLocsMt(1,:),RFsensorLocsMt(2,:),labels, ...
            'VerticalAlignment','bottom','HorizontalAlignment','right');
        plot_margin = 0.5;
        axis([min(RFsensorLocsMt(1,:))-plot_margin ...
              max(RFsensorLocsMt(1,:))+plot_margin ...
              min(RFsensorLocsMt(2,:))-plot_margin ...
              max(RFsensorLocsMt(2,:))+plot_margin]);
        daspect([1,1,1]);
        xlabel('X-axis [m]','FontSize',20);
        ylabel('Y-axis [m]','FontSize',20);
        grid;
        titleHandle = title(['Cycle counter: ' num2str(cycleCounter)]);
        t1Handle = plot(x_coord_t1(cycleCounter), ...
            y_coord_t1(cycleCounter), ...
            'b.','markerSize',40);
        t2Handle = plot(x_coord_t2(cycleCounter), ...
            y_coord_t2(cycleCounter), ...
            'r.','markerSize',40);
        t3Handle = plot(x_coord_t3(cycleCounter), ...
            y_coord_t3(cycleCounter), ...
            'g.','markerSize',40);
    end
    drawnow
    pause(0.05)
end


