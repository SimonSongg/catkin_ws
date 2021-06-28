
"use strict";

let Skeleton2D = require('./Skeleton2D.js');
let RGBDSensors = require('./RGBDSensors.js');
let Keypoint2Df = require('./Keypoint2Df.js');
let Keypoint2Di = require('./Keypoint2Di.js');
let ObjectsStamped = require('./ObjectsStamped.js');
let BoundingBox3D = require('./BoundingBox3D.js');
let Keypoint3D = require('./Keypoint3D.js');
let BoundingBox2Di = require('./BoundingBox2Di.js');
let Object = require('./Object.js');
let Skeleton3D = require('./Skeleton3D.js');
let BoundingBox2Df = require('./BoundingBox2Df.js');

module.exports = {
  Skeleton2D: Skeleton2D,
  RGBDSensors: RGBDSensors,
  Keypoint2Df: Keypoint2Df,
  Keypoint2Di: Keypoint2Di,
  ObjectsStamped: ObjectsStamped,
  BoundingBox3D: BoundingBox3D,
  Keypoint3D: Keypoint3D,
  BoundingBox2Di: BoundingBox2Di,
  Object: Object,
  Skeleton3D: Skeleton3D,
  BoundingBox2Df: BoundingBox2Df,
};
