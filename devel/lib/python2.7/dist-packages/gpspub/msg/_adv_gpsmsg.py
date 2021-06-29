# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from gpspub/adv_gpsmsg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class adv_gpsmsg(genpy.Message):
  _md5sum = "7044bd9f13e700cf1742e5c8e5794818"
  _type = "gpspub/adv_gpsmsg"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """uint8 Flag
float32 Latitude
float32 Longitude
float32 Accuracy
float32 Speed"""
  __slots__ = ['Flag','Latitude','Longitude','Accuracy','Speed']
  _slot_types = ['uint8','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       Flag,Latitude,Longitude,Accuracy,Speed

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(adv_gpsmsg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.Flag is None:
        self.Flag = 0
      if self.Latitude is None:
        self.Latitude = 0.
      if self.Longitude is None:
        self.Longitude = 0.
      if self.Accuracy is None:
        self.Accuracy = 0.
      if self.Speed is None:
        self.Speed = 0.
    else:
      self.Flag = 0
      self.Latitude = 0.
      self.Longitude = 0.
      self.Accuracy = 0.
      self.Speed = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_B4f().pack(_x.Flag, _x.Latitude, _x.Longitude, _x.Accuracy, _x.Speed))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.Flag, _x.Latitude, _x.Longitude, _x.Accuracy, _x.Speed,) = _get_struct_B4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_B4f().pack(_x.Flag, _x.Latitude, _x.Longitude, _x.Accuracy, _x.Speed))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 17
      (_x.Flag, _x.Latitude, _x.Longitude, _x.Accuracy, _x.Speed,) = _get_struct_B4f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B4f = None
def _get_struct_B4f():
    global _struct_B4f
    if _struct_B4f is None:
        _struct_B4f = struct.Struct("<B4f")
    return _struct_B4f