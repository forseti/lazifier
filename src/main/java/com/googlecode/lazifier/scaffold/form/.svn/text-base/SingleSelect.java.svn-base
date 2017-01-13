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

import com.googlecode.lazifier.generate.Source;
import com.thoughtworks.qdox.model.Type;

/**
 * The SingleSelect class.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public class SingleSelect extends Select {
	private Source referenceEditor;
	
	/**
	 * Instantiate SingleSelect object.
	 * 
	 * @param name
	 * @param type
	 * @param key
	 * @param keyType
	 * @throws Exception
	 */
	public SingleSelect(String name, Type type, String key, Type keyType) throws Exception {
		// TODO Auto-generated constructor stub
		super(name, type, key, keyType);
	}

	/**
	 * Get reference editor
	 * 
	 * @return reference editor
	 */
	public Source getReferenceEditor() {
		return referenceEditor;
	}

	/**
	 * Set reference editor
	 * 
	 * @param referenceEditor
	 */
	public void setReferenceEditor(Source referenceEditor) {
		this.referenceEditor = referenceEditor;
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
	    
	    retValue.append("SingleSelect ( ")
	        .append(super.toString()).append(TAB)
	        .append("referenceEditor = ").append(this.referenceEditor).append(TAB)
	        .append(" )");
	    
	    return retValue.toString();
	}
}