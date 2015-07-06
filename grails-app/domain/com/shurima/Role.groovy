package com.shurima

class Role {

  String authority

  Role(String authority) {
     this()
     this.authority = authority
  }

  @Override
  int hashCode() {
     authority?.hashCode() ?: 0
  }

  @Override
  boolean equals(other) {
     is(other) || (other instanceof Role && other.authority == authority)
  }

  @Override
  String toString() {
     authority
  }

  static mapping = {
     cache true
  }

  static constraints = {
     authority blank: false, unique: true
  }

}
