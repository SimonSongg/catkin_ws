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

class adv_gpsmsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Flag = null;
      this.Latitude = null;
      this.Longitude = null;
      this.Accuracy = null;
      this.Speed = null;
    }
    else {
      if (initObj.hasOwnProperty('Flag')) {
        this.Flag = initObj.Flag
      }
      else {
        this.Flag = 0;
      }
      if (initObj.hasOwnProperty('Latitude')) {
        this.Latitude = initObj.Latitude
      }
      else {
        this.Latitude = 0.0;
      }
      if (initObj.hasOwnProperty('Longitude')) {
        this.Longitude = initObj.Longitude
      }
      else {
        this.Longitude = 0.0;
      }
      if (initObj.hasOwnProperty('Accuracy')) {
        this.Accuracy = initObj.Accuracy
      }
      else {
        this.Accuracy = 0.0;
      }
      if (initObj.hasOwnProperty('Speed')) {
        this.Speed = initObj.Speed
      }
      else {
        this.Speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type adv_gpsmsg
    // Serialize message field [Flag]
    bufferOffset = _serializer.uint8(obj.Flag, buffer, bufferOffset);
    // Serialize message field [Latitude]
    bufferOffset = _serializer.float32(obj.Latitude, buffer, bufferOffset);
    // Serialize message field [Longitude]
    bufferOffset = _serializer.float32(obj.Longitude, buffer, bufferOffset);
    // Serialize message field [Accuracy]
    bufferOffset = _serializer.float32(obj.Accuracy, buffer, bufferOffset);
    // Serialize message field [Speed]
    bufferOffset = _serializer.float32(obj.Speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type adv_gpsmsg
    let len;
    let data = new adv_gpsmsg(null);
    // Deserialize message field [Flag]
    data.Flag = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [Latitude]
    data.Latitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Longitude]
    data.Longitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Accuracy]
    data.Accuracy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [Speed]
    data.Speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'gpspub/adv_gpsmsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7044bd9f13e700cf1742e5c8e5794818';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 Flag
    float32 Latitude
    float32 Longitude
    float32 Accuracy
    float32 Speed
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new adv_gpsmsg(null);
    if (msg.Flag !== undefined) {
      resolved.Flag = msg.Flag;
    }
    else {
      resolved.Flag = 0
    }

    if (msg.Latitude !== undefined) {
      resolved.Latitude = msg.Latitude;
    }
    else {
      resolved.Latitude = 0.0
    }

    if (msg.Longitude !== undefined) {
      resolved.Longitude = msg.Longitude;
    }
    else {
      resolved.Longitude = 0.0
    }

    if (msg.Accuracy !== undefined) {
      resolved.Accuracy = msg.Accuracy;
    }
    else {
      resolved.Accuracy = 0.0
    }

    if (msg.Speed !== undefined) {
      resolved.Speed = msg.Speed;
    }
    else {
      resolved.Speed = 0.0
    }

    return resolved;
    }
};

module.exports = adv_gpsmsg;
