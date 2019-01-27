package com.vongether.common.util.interceptor;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import com.vongether.common.util.interceptor.Auth.Role;

@Retention(RUNTIME)
@Target({TYPE, METHOD})
public @interface Auth {

    public enum Role {ADMIN, USER}

    public Role role() default Role.USER;
}
