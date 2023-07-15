// Auto-generated. Do not edit!

// (in-package home_monitoring_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PredictionMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.label_mask = null;
      this.label_mask_prob = null;
      this.x_start = null;
      this.x_end = null;
      this.y_start = null;
      this.y_end = null;
      this.label_pose = null;
      this.label_pose_prob = null;
      this.x_pose = null;
      this.y_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('label_mask')) {
        this.label_mask = initObj.label_mask
      }
      else {
        this.label_mask = '';
      }
      if (initObj.hasOwnProperty('label_mask_prob')) {
        this.label_mask_prob = initObj.label_mask_prob
      }
      else {
        this.label_mask_prob = '';
      }
      if (initObj.hasOwnProperty('x_start')) {
        this.x_start = initObj.x_start
      }
      else {
        this.x_start = 0;
      }
      if (initObj.hasOwnProperty('x_end')) {
        this.x_end = initObj.x_end
      }
      else {
        this.x_end = 0;
      }
      if (initObj.hasOwnProperty('y_start')) {
        this.y_start = initObj.y_start
      }
      else {
        this.y_start = 0;
      }
      if (initObj.hasOwnProperty('y_end')) {
        this.y_end = initObj.y_end
      }
      else {
        this.y_end = 0;
      }
      if (initObj.hasOwnProperty('label_pose')) {
        this.label_pose = initObj.label_pose
      }
      else {
        this.label_pose = '';
      }
      if (initObj.hasOwnProperty('label_pose_prob')) {
        this.label_pose_prob = initObj.label_pose_prob
      }
      else {
        this.label_pose_prob = '';
      }
      if (initObj.hasOwnProperty('x_pose')) {
        this.x_pose = initObj.x_pose
      }
      else {
        this.x_pose = 0.0;
      }
      if (initObj.hasOwnProperty('y_pose')) {
        this.y_pose = initObj.y_pose
      }
      else {
        this.y_pose = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredictionMsg
    // Serialize message field [label_mask]
    bufferOffset = _serializer.string(obj.label_mask, buffer, bufferOffset);
    // Serialize message field [label_mask_prob]
    bufferOffset = _serializer.string(obj.label_mask_prob, buffer, bufferOffset);
    // Serialize message field [x_start]
    bufferOffset = _serializer.int64(obj.x_start, buffer, bufferOffset);
    // Serialize message field [x_end]
    bufferOffset = _serializer.int64(obj.x_end, buffer, bufferOffset);
    // Serialize message field [y_start]
    bufferOffset = _serializer.int64(obj.y_start, buffer, bufferOffset);
    // Serialize message field [y_end]
    bufferOffset = _serializer.int64(obj.y_end, buffer, bufferOffset);
    // Serialize message field [label_pose]
    bufferOffset = _serializer.string(obj.label_pose, buffer, bufferOffset);
    // Serialize message field [label_pose_prob]
    bufferOffset = _serializer.string(obj.label_pose_prob, buffer, bufferOffset);
    // Serialize message field [x_pose]
    bufferOffset = _serializer.float32(obj.x_pose, buffer, bufferOffset);
    // Serialize message field [y_pose]
    bufferOffset = _serializer.float32(obj.y_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredictionMsg
    let len;
    let data = new PredictionMsg(null);
    // Deserialize message field [label_mask]
    data.label_mask = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [label_mask_prob]
    data.label_mask_prob = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [x_start]
    data.x_start = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [x_end]
    data.x_end = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [y_start]
    data.y_start = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [y_end]
    data.y_end = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [label_pose]
    data.label_pose = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [label_pose_prob]
    data.label_pose_prob = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [x_pose]
    data.x_pose = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_pose]
    data.y_pose = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.label_mask.length;
    length += object.label_mask_prob.length;
    length += object.label_pose.length;
    length += object.label_pose_prob.length;
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'home_monitoring_pkg/PredictionMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '715dc63a1702758b9d710539c966074b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string label_mask
    string label_mask_prob
    int64 x_start
    int64 x_end
    int64 y_start
    int64 y_end
    string label_pose
    string label_pose_prob
    float32 x_pose
    float32 y_pose
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PredictionMsg(null);
    if (msg.label_mask !== undefined) {
      resolved.label_mask = msg.label_mask;
    }
    else {
      resolved.label_mask = ''
    }

    if (msg.label_mask_prob !== undefined) {
      resolved.label_mask_prob = msg.label_mask_prob;
    }
    else {
      resolved.label_mask_prob = ''
    }

    if (msg.x_start !== undefined) {
      resolved.x_start = msg.x_start;
    }
    else {
      resolved.x_start = 0
    }

    if (msg.x_end !== undefined) {
      resolved.x_end = msg.x_end;
    }
    else {
      resolved.x_end = 0
    }

    if (msg.y_start !== undefined) {
      resolved.y_start = msg.y_start;
    }
    else {
      resolved.y_start = 0
    }

    if (msg.y_end !== undefined) {
      resolved.y_end = msg.y_end;
    }
    else {
      resolved.y_end = 0
    }

    if (msg.label_pose !== undefined) {
      resolved.label_pose = msg.label_pose;
    }
    else {
      resolved.label_pose = ''
    }

    if (msg.label_pose_prob !== undefined) {
      resolved.label_pose_prob = msg.label_pose_prob;
    }
    else {
      resolved.label_pose_prob = ''
    }

    if (msg.x_pose !== undefined) {
      resolved.x_pose = msg.x_pose;
    }
    else {
      resolved.x_pose = 0.0
    }

    if (msg.y_pose !== undefined) {
      resolved.y_pose = msg.y_pose;
    }
    else {
      resolved.y_pose = 0.0
    }

    return resolved;
    }
};

module.exports = PredictionMsg;
