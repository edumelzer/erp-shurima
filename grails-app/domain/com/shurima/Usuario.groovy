package com.shurima

class Usuario {

  transient springSecurityService

  String username
  String password
  boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

  static constraints = {
    username blank: false, unique: true
		password blank: false
    enabled defaultValue: true
  }

  Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

  def beforeInsert() {
		encodePassword()
    enabled = true
	}
	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}
	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

}
