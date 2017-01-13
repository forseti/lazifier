/*
 * Copyright 2010 Donny A. Wijaya
 *  
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License. 
 */
package com.googlecode.lazifier.scaffold.annotation;

/**
 * The ValidationConstants class. This class contains a number of annotations used for validation
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class ValidationConstants {
	// Annotation from Bean Validation
	public static final String MAX = "javax.validation.constraints.Max";
	public static final String MIN = "javax.validation.constraints.Min";
	public static final String NOT_NULL = "javax.validation.constraints.NotNull";
	public static final String SIZE = "javax.validation.constraints.Size";
	
	// Annotation from Hibernate Validator
	public static final String EMAIL = "org.hibernate.validator.constraints.Email";
	public static final String LENGTH = "org.hibernate.validator.constraints.Length";
	public static final String NOT_EMPTY = "org.hibernate.validator.constraints.NotEmpty";
	public static final String RANGE = "org.hibernate.validator.constraints.Range";
}