
"use strict";

let RenameMap = require('./RenameMap.js')
let DeleteAnnotations = require('./DeleteAnnotations.js')
let SaveMap = require('./SaveMap.js')
let SaveAnnotationsData = require('./SaveAnnotationsData.js')
let GetAnnotations = require('./GetAnnotations.js')
let YAMLExport = require('./YAMLExport.js')
let ResetDatabase = require('./ResetDatabase.js')
let PubAnnotationsData = require('./PubAnnotationsData.js')
let ListMaps = require('./ListMaps.js')
let GetAnnotationsData = require('./GetAnnotationsData.js')
let EditAnnotationsData = require('./EditAnnotationsData.js')
let SetRelationship = require('./SetRelationship.js')
let DeleteMap = require('./DeleteMap.js')
let ListWorlds = require('./ListWorlds.js')
let SetKeyword = require('./SetKeyword.js')
let PublishMap = require('./PublishMap.js')
let YAMLImport = require('./YAMLImport.js')

module.exports = {
  RenameMap: RenameMap,
  DeleteAnnotations: DeleteAnnotations,
  SaveMap: SaveMap,
  SaveAnnotationsData: SaveAnnotationsData,
  GetAnnotations: GetAnnotations,
  YAMLExport: YAMLExport,
  ResetDatabase: ResetDatabase,
  PubAnnotationsData: PubAnnotationsData,
  ListMaps: ListMaps,
  GetAnnotationsData: GetAnnotationsData,
  EditAnnotationsData: EditAnnotationsData,
  SetRelationship: SetRelationship,
  DeleteMap: DeleteMap,
  ListWorlds: ListWorlds,
  SetKeyword: SetKeyword,
  PublishMap: PublishMap,
  YAMLImport: YAMLImport,
};
