(getPos player nearestObject "LandVehicle") setVectorUp [0, 0, 1];
_temp = (getPos player nearestObject "LandVehicle");
_type_of = typeOf _temp;
titleText ["Vehicle flipped.", "PLAIN DOWN"];titleFadeOut 3;