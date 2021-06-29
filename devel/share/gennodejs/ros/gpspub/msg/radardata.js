// Auto-generated. Do not edit!

// (in-package gpspub.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class radardata {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.RadarData = null;
    }
    else {
      if (initObj.hasOwnProperty('RadarData')) {
        this.RadarData = initObj.RadarData
      }
      else {
        this.RadarData = new Array(32).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type radardata
    // Check that the constant length array field [RadarData] has the right length
    if (obj.RadarData.length !== 32) {
      throw new Error('Unable to serialize array field RadarData - length must be 32')
    }
    // Serialize message field [RadarData]
    bufferOffset = _arraySerializer.float64(obj.RadarData, buffer, bufferOffset, 32);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type radardata
    let len;
    let data = new radardata(null);
    // Deserialize message field [RadarData]
    data.RadarData = _arrayDeserializer.float64(buffer, bufferOffset, 32)
    return data;
  }

  static getMessageSize(object) {
    return 256;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gpspub/radardata';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3bdcd1bf0fe69ee97213b20c034863f7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[32] RadarData
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new radardata(null);
    if (msg.RadarData !== undefined) {
      resolved.RadarData = msg.RadarData;
    }
    else {
      resolved.RadarData = new Array(32).fill(0)
    }

    return resolved;
    }
};

module.exports = radardata;
