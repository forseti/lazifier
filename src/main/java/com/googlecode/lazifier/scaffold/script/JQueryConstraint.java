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
package com.googlecode.lazifier.scaffold.script;

import static com.googlecode.lazifier.generate.PatternConstants.DATE_TYPE;
import static com.googlecode.lazifier.scaffold.annotation.AnnotationUtils.checkIfAnnotationIsValid;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.COLUMN;
import static com.googlecode.lazifier.scaffold.annotation.PersistenceConstants.ID;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.EMAIL;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.LENGTH;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.MAX;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.MIN;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.NOT_EMPTY;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.NOT_NULL;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.RANGE;
import static com.googlecode.lazifier.scaffold.annotation.ValidationConstants.SIZE;

import com.thoughtworks.qdox.model.Annotation;
import com.thoughtworks.qdox.model.JavaField;

/**
 * The JQueryConstraint class. This class contains jQuery constraints required for scaffolding process
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class JQueryConstraint extends Constraint {
	/**
	 * Instantiate new JQueryConstraint object.
	 * 
	 * @param name
	 * @throws Exception
	 */
	public JQueryConstraint(String name) throws Exception {
		// TODO Auto-generated constructor stub
		super(name);
	}
	
	/**
	 * Add annotation as Id constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsId(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, ID)) {
			String message = (String) annotation.getNamedParameter("message");
			addAttribute("required", new ConstraintValue(true, message));
		}
	}

	/**
	 * Add annotation as Max constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsMax(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, MAX)) {
			Long max = null;
			
			String value = (String) annotation.getNamedParameter("value");
			String message = (String) annotation.getNamedParameter("message");
			
			max = (value != null)? Long.valueOf(value) : new Long(9223372036854775807L);
			
			addAttribute("max", new ConstraintValue(max, message));
		}
	}

	/**
	 * Add annotation as Min constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsMin(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, MIN)) {
			Long min = null;

			String value = (String) annotation.getNamedParameter("value");
			String message = (String) annotation.getNamedParameter("message");
			
			min = (value != null)? Long.valueOf(value) : new Long(0);
			
			addAttribute("min", new ConstraintValue(min, message));
		}
	}

	/**
	 * Add annotation as NotNull constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsNotNull(Annotation annotation) throws Exception {
		boolean required = false;
		String message = null;
		
		if (checkIfAnnotationIsValid(annotation, COLUMN)) {
			String nullable = (String) annotation.getNamedParameter("nullable");
			required = (nullable != null)? !Boolean.valueOf(nullable) : required;
		} else if (checkIfAnnotationIsValid(annotation, NOT_NULL)) {
			required = true;
			message = (String) annotation.getNamedParameter("message");
		}
		
		if (required)
			addAttribute("required", new ConstraintValue(true, message));
	}

	/**
	 * Add annotation as Email constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsEmail(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, EMAIL)) {
			String message = (String) annotation.getNamedParameter("message");
			addAttribute("email", new ConstraintValue(true, message));
		}
	}

	/**
	 * Add annotation as Length constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsLength(Annotation annotation) throws Exception {
		Integer maxlength = null;
		Integer minlength = null;
		String message = null;
			
		if (checkIfAnnotationIsValid(annotation, COLUMN))  {
			String length = (String) annotation.getNamedParameter("length");
			maxlength = (length != null)? Integer.valueOf(length) : new Integer(255);
		} else if (checkIfAnnotationIsValid(annotation, LENGTH)) {
			String max = (String) annotation.getNamedParameter("max");
			String min = (String) annotation.getNamedParameter("min");
			message = (String) annotation.getNamedParameter("message");
			
			maxlength = (max != null)? Integer.valueOf(max) : Integer.valueOf(2147483647);
			minlength = (min != null)? Integer.valueOf(min) : Integer.valueOf(0);
		}
		
		if (maxlength != null)
			addAttribute("maxlength", new ConstraintValue(maxlength, message));
		
		if (minlength != null) {
			if (minlength > 0)
				addAttribute("required", new ConstraintValue(true, message));
			
			addAttribute("minlength", new ConstraintValue(minlength, message));
		}
	}

	/**
	 * Add annotation as NotEmpty constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsNotEmpty(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, NOT_EMPTY)) {
			String message = (String) annotation.getNamedParameter("message");
			addAttribute("required", new ConstraintValue(true, message));
		}
	}
	
	/**
	 * Add annotation as Range constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsRange(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, RANGE)) {
			Long maximum = null;
			Long minimum = null;
			
			String max = (String) annotation.getNamedParameter("max");
			String min = (String) annotation.getNamedParameter("min");
			String message = (String) annotation.getNamedParameter("message");
			
			maximum = (max != null)? Long.valueOf(max) : new Long(9223372036854775807L);
			minimum = (min != null)? Long.valueOf(min) : new Long(0L);
			
			if (minimum > 0)
				addAttribute("required", new ConstraintValue(true, message));
			
			String range = "[" + minimum + ", " + maximum + "]";				
			addAttribute("range", new ConstraintValue(range, message));			
		}
	}
	
	/**
	 * Add annotation as Size constraint
	 * 
	 * @param annotation
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addAnnotationAsSize(Annotation annotation) throws Exception {
		if (checkIfAnnotationIsValid(annotation, SIZE)) {
			Integer maximum = null;
			Integer minimum = null;
			
			String max = (String) annotation.getNamedParameter("max");
			String min = (String) annotation.getNamedParameter("min");
			String message = (String) annotation.getNamedParameter("message");
			
			maximum = (max != null)? Integer.valueOf(max) : new Integer(2147483647);
			minimum = (min != null)? Integer.valueOf(min) : new Integer(0);
			
			if (minimum > 0)
				addAttribute("required", new ConstraintValue(true, message));
			
			String range = "[" + minimum + ", " + maximum + "]";				
			addAttribute("rangelength", new ConstraintValue(range, message));
		}
	}

	/**
	 * Add annotation as Date constraint
	 * 
	 * @param field
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	private void addFieldAsDate(JavaField field) throws Exception {
		if (field.getType().getFullQualifiedName().matches(DATE_TYPE))
			addAttribute("date", new ConstraintValue(true, ""));
	}
}