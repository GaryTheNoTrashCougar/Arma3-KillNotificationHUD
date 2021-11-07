//=========================OPTIONS==================================================================================================================================================================================================================================================================================================================

// Notification Style
KC_fontN = "PuristaSemibold"; // Select Font - Bitstream, Caveat, EtelkaMonospacePro, EtelkaMonospaceProBold, EtelkaNarrowMediumPro, LCD14, LucidaConsoleB, PuristaBold, PuristaLight, PuristaMedium, PuristaSemibold, RobotoCondensed, RobotoCondensedBold, RobotoCondensedLight, TahomaB, Zeppelin32, Zeppelin32Mono, Zeppelin33, Zeppelin33Italic

// Notification Size
KC_sizeN = 1.25; // Numerical value - 0 = Disabled

// Score Style
KC_fontS = "PuristaBold"; // Select Font - Bitstream, Caveat, EtelkaMonospacePro, EtelkaMonospaceProBold, EtelkaNarrowMediumPro, LCD14, LucidaConsoleB, PuristaBold, PuristaLight, PuristaMedium, PuristaSemibold, RobotoCondensed, RobotoCondensedBold, RobotoCondensedLight, TahomaB, Zeppelin32, Zeppelin32Mono, Zeppelin33, Zeppelin33Italic

// Score Size
KC_sizeS = 1.4; // Numerical value - 0 = Disabled

// Score Colour
KC_colourS = [1, 1, 0]; // Array [R, G, B] each value range 0 - 1

// Notification Position X
KC_posX = 0.62; // Numerical value (range 0 - 1) - 0 = Left, 1 = Right

// Notification Position Y
KC_posY = 0.51; // Numerical value (range 0 - 1) - 0 = Top, 1 = Bottom

// Hit Markers
KC_HitMarkers = false; // Boolean - true = enabled, false = disabled

// Hit Marker Style
KC_HitMarkerStyle = 1; // Select Style - 1, 2, 3, 4 or 5

// Hit Sounds
KC_HitSounds = false; // Boolean - true = enabled, false = disabled

// Kill Markers
KC_KillMarkers = false; // Boolean - true = enabled, false = disabled

// Kill Sounds
KC_KillSounds = false; // Boolean - true = enabled, false = disabled

// HUD Scoreboard
KC_showScore = false; // Boolean - true = enabled, false = disabled

// Kill Feed
KC_KillFeed = false; // Boolean - true = enabled, false = disabled

// Player Health Status HUD
KC_HealthStatus = false; // Boolean - true = enabled, false = disabled

// Health Status Style
KC_HealthStyle = "HealthIcon"; // Select Style - HealthIcon or HealthBar

// First Aid Kit Counter
KC_showFAK = false; // Boolean - true = enabled, false = disabled

// First Aid Kit (Class Name)
KC_classFAK = "FirstAidKit"; // Enter class name of the FAKs to be counted

// Compass HUD Display
KC_CompDisp = false; // Boolean - true = enabled, false = disabled

// Require Compass?
KC_reqComp = false; // Boolean - true = yes, false = no

// Required Compass Class Name
KC_classComp = "ItemCompass"; // Enter class name of the compass required

//==================================================================================================================================================================================================================================================================================================================================================

#include "\Kill_Confirmed\Kill_Confirmed.sqf"

#include "\Kill_Confirmed\KC_EntityKilled.sqf"

#include "\Kill_Confirmed\KC_HitPart.sqf"

#include "\Kill_Confirmed\KC_HandleDamage.sqf"