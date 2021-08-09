function AvoidObstaclesPosePlot(u, mapMatrix, mapScale, range, scanAngles, ax)
%POSEPLOT Summary of this function goes here
%   Detailed explanation goes here
cla(ax);
show(binaryOccupancyMap(mapMatrix, mapScale), "Parent", ax);
hold(ax, "on");
plotTransforms([u(1), u(2), 0], eul2quat([u(3), 0, 0]), "MeshFilePath", "groundvehicle.stl", "View", "2D", "Parent", ax);
scan = lidarScan(range, scanAngles);
scan = transformScan(scan, u);
plot(ax, scan.Cartesian(:, 1), scan.Cartesian(:, 2), 'rX');
hold(ax, "off");
drawnow;