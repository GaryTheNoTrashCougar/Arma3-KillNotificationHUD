player addEventhandler ["killed",{[[_this select 0,_this select 1],"Kill_Reward\Kill_Reward.sqf"] remoteExec ["execVM", clientOwner];}];
