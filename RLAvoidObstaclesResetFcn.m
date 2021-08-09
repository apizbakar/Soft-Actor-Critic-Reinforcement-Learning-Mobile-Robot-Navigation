function in = RLAvoidObstaclesResetFcn(in,~,maxRange,mapName1)
% Reset function for reinforcement learning based obstacle avoidance
% Copyright 2019 The MathWorks, Inc.

    % Load map and lidar sensor (to generate valid pose)..
    persistent map lidar
   % random =randperm(2,1);
    if isempty(map) && isempty(lidar)
         map = binaryOccupancyMap(mapName1);
   
   %     if random == 1
   %         map = binaryOccupancyMap(mapName1);
   %     end        
   %     if random == 2
   %         map = binaryOccupancyMap(mapName2);
   %     end        
        lidar = rangeSensor('HorizontalAngle', [0, 2*pi], 'HorizontalAngleResolution', 2*pi/35, 'RangeNoise', 0.01, 'Range', [0 maxRange]);
    
    end
   % if random == 1
   %     map = binaryOccupancyMap(mapName1);
   %     mapMatrix1=mapName1;
   % end        
  %  if random == 2
  %      map = binaryOccupancyMap(mapName2);
  %      mapMatrix1=mapName2;    
  %  end    
     mapMatrix1=mapName1;
     in = setVariable(in,'mapMatrix', mapMatrix1);
   
    % Randomly generate pose inside the map. 
    % If the pose is in an unoccupied space and there are no range readings
    % nearby, assign this pose to the new simulation run
%    posFound = false;   
%     while(~posFound)
%         pos = [diff(map.XWorldLimits)*rand + map.XWorldLimits(1); ...
%                diff(map.YWorldLimits)*rand + map.YWorldLimits(1); ... 
%                2*pi*rand];  
%         ranges = lidar(pos', map);
%         if ~checkOccupancy(map,pos(1:2)') && all(ranges(~isnan(ranges)) >= 0.5)
%             posFound = true;
%             in = setVariable(in,'initX', pos(1));
%             in = setVariable(in,'initY', pos(2));
%             in = setVariable(in,'initTheta', pos(3));
% %             in = setVariable(in,'goalX', pos(1));
% %             in = setVariable(in,'goalY', pos(2));
% %             in = setVariable(in,'goalTheta', pos(3));
%         end
%     pos2Found = false;       
%      while(~pos2Found)
%          pos2 = [diff(map.XWorldLimits)*rand + map.XWorldLimits(1); ...
%                 diff(map.YWorldLimits)*rand + map.YWorldLimits(1); ... 
%                 2*pi*rand];  
%          ranges = lidar(pos2', map);
%          if ~checkOccupancy(map,pos2(1:2)') && all(ranges(~isnan(ranges)) >= 0.5)
%              pos2Found = true;
%              in = setVariable(in,'goalX', pos2(1));
%              in = setVariable(in,'goalY', pos2(2));
%              in = setVariable(in,'goalTheta', pos2(3));
%          end
%      end
    in = setVariable(in,'lidarNoiseSeeds',randi(intmax, lidar.NumReadings, 1));
    end

