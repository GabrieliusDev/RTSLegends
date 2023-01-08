/// @description Insert description here
// You can write your code in this editor

objectId = undefined;

currentIndex = -1;
path = undefined;
playerId = undefined;
eType = entityType.minion;
moveCompleteDistance = 60;

moveX = x;
moveY = y;

//stats
maxHp = 150;
hp = maxHp;

//Combat
attacking = undefined;
inCombat = false;
focusRadius = 150;
combatRadius = 36;