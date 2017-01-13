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
package com.googlecode.lazifier.scaffold.form;

import com.googlecode.lazifier.scaffold.script.Constraint;
import com.thoughtworks.qdox.model.Type;

/**
 * The Input class.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class Input {
	// The valid ID Type
	private static final String ID_TYPE = "^(byte|char|int|long|short|java\\.(lang\\.(Byte|Character|Integer|Long|Short|String)|math\\.BigInteger|util\\.Date))$";

	// The name.
	private final String name;
	
	// The type.
	private final Type type;
	
	// The id
	private boolean id = false;
	
	// The generated value
	private boolean generatedValue = false;
	
	// The constraint.
	private Constraint constraint;
	
	/**
	 * Instantiate new Input object.
	 * 
	 * @param name
	 * @param type
	 * @throws Exception
	 */
	public Input(String name, Type type) throws Exception {
		this(name, type, false);
	}
	
	/**
	 * Instantiate new Input object.
	 * 
	 * @param name
	 * @param type
	 * @param id
	 * @throws Exception
	 */	
	public Input(String name, Type type, boolean id) throws Exception {
		this(name, type, id, false);
	}
	
	/**
	 * Instantiate new Input object.
	 * 
	 * @param name
	 * @param type
	 * @param id
	 * @param generatedValue
	 * @throws Exception
	 */
	public Input(String name, Type type, boolean id, boolean generatedValue) throws Exception {
		this.name = name;		
		this.type = type;
		
		if (id) {
			isIdType(type);
			this.id = id;
		}
	
		this.generatedValue = generatedValue;
	}
	
	/**
	 * Get name
	 * 
	 * @return name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * Get type
	 * 
	 * @return type
	 */
	public Type getType() {
		return type;
	}
		
	/**
	 * Get type class name
	 * 
	 * @return type class name
	 */
	public String getTypeClassName() {
		return type.getJavaClass().getName();
	}
	
	/**
	 * Get type qualified class name
	 * 
	 * @return type qualified class name
	 */	
	public String getTypeQualifiedClassName() {
		return type.getJavaClass().getFullyQualifiedName();
	}
	
	/**
	 * Get type qualified class name
	 * 
	 * @return type qualified class name
	 */
	public String getTypePackageName() {
		return type.getJavaClass().getPackage().getName();
	}

	/**
	 * Get Id
	 * 
	 * @return Id
	 */
	public boolean isId() {
		return id;
	}
	
	/**
	 * Get generated value
	 * 
	 * @return generated value
	 */
	public boolean isGeneratedValue() {
		return generatedValue;
	}
	
	/**
	 * Get constraint
	 * 
	 * @return constraint
	 */
	public Constraint getConstraint() {
		return constraint;
	}
	
	/**
	 * Set constraint.
	 * 
	 * @param constraint
	 */
	public void setConstraint(Constraint constraint) {
		this.constraint = constraint;
	}

	/**
	 * Get Id type
	 * 
	 * @param type
	 * @throws Exception
	 */
	protected void isIdType(Type type) throws Exception {
		if (!type.getValue().matches(ID_TYPE))
			throw new Exception("'" + this.type + "' is not a valid ID type");
	}
	
	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString()
	{
	    final String TAB = "    ";
	
	    StringBuilder retValue = new StringBuilder();
	    
	    retValue.append("Field ( ")
	        .append(super.toString()).append(TAB)
	        .append("id = ").append(this.id).append(TAB)
	        .append("generatedValue = ").append(this.generatedValue).append(TAB)
	        .append("name = ").append(this.name).append(TAB)
	        .append("type = ").append(this.type).append(TAB)
	        .append("constraint = ").append(this.constraint)
	        .append(" )");
	    
	    return retValue.toString();
	}
}