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
package com.googlecode.lazifier.generate;

import static com.googlecode.lazifier.generate.PatternConstants.COMMA;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_PACKAGE_INPUT_WITHOUT_WILDCARD;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_PACKAGE_INPUT_WITH_WILDCARD;
import static com.googlecode.lazifier.generate.PatternConstants.VALID_PACKAGE_PROPERTY_WITH_WILDCARD;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Properties;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;
import org.springframework.util.StringUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * The AbstractGenerator class. The basic class of all generator classes.
 * 
 * @author Donny A. Wijaya
 * @version 0.0.9
 * @since April 2010
 */
public abstract class AbstractGenerator<O> implements Generator<O> {
	/** The logger. */
	private static final Logger logger = LoggerFactory.getLogger(AbstractGenerator.class);
	
	/** The configuration. */
	private Configuration configuration;
	
	/** The properties. */
	private Properties properties;
	
	/**
	 * Gets the configuration.
	 * 
	 * @return the configuration
	 * 
	 * @throws Exception the exception
	 */
	protected final Configuration getConfiguration() throws Exception {
		if (configuration == null)
			throw new Exception("Freemarker configuration is not defined!!!");

		configuration.setTagSyntax(Configuration.SQUARE_BRACKET_TAG_SYNTAX);
		
		return configuration;
	}

	/**
	 * Sets the configuration.
	 * 
	 * @param configuration the new configuration
	 */
	public final void setConfiguration(Configuration configuration) {
		if (this.configuration == null)
			this.configuration = configuration;
	}
	
	/**
	 * Sets the properties.
	 * 
	 * @param properties the new properties
	 */
	public void setProperties(Properties properties) {
		if (this.properties == null)
			this.properties = properties;
	}
	
	/**
	 * Gets the value from properties.
	 * 
	 * @param key the key
	 * 
	 * @return the value from properties
	 */
	protected final String retrieveValueFromProperties(String key) {
		return (String) properties.get(key);
	}
	
	/**
	 * Gets the value from properties.
	 * 
	 * @param key the key
	 * @param attributes the attributes
	 * 
	 * @return the value from properties
	 */
	protected final String retrieveValueFromProperties(String key, String ... attributes) {
		for (String attribute: attributes) 
			key = key.concat(".").concat(attribute);

		return retrieveValueFromProperties(key);
	}
	
	/**
	 * Gets the values from properties.
	 * 
	 * @param key the key
	 * @param attribute the attribute
	 * 
	 * @return the values from properties
	 */
	protected final String[] retrieveValuesFromProperties(String key, String ... attribute) {
		String value = retrieveValueFromProperties(key, attribute);
		
		return (value != null)? value.split(COMMA) :  null;	
	}
	
	/**
	 * Copy from properties to object.
	 * 
	 * @param key the key
	 * @param object the target
	 */
	protected void copyFromPropertiesToObject(Object target, String key) throws Exception {
		copyFromPropertiesToObject(target, key, true);
	}
	
	/**
	 * Copy from properties to object.
	 * 
	 * @param key the key
	 * @param object the target
	 * @param boolean full
	 */
	protected void copyFromPropertiesToObject(Object target, String key, boolean full) throws Exception {
		Method[] methods = (full)? target.getClass().getMethods() : target.getClass().getDeclaredMethods();
		
		for (Method method: methods) {
			String methodName = method.getName();
			
			if (methodName.startsWith("set")) {
				String fieldName = removeStartIgnoreCase(methodName, "set");
				
				fieldName = StringUtils.uncapitalize(fieldName);
				String value = retrieveValueFromProperties(key, fieldName);

				if (value != null) {
					method.setAccessible(true);

					Object[] params = null;

					if (value.trim().equalsIgnoreCase("true") || 
						value.trim().equalsIgnoreCase("false"))
						params = new Object[] { Boolean.parseBoolean(value) };
					else
						params = new Object[] { value };

					ReflectionUtils.invokeMethod(method, target, params);
					method.setAccessible(false);
				}
			}
		}
	}

	/**
	 * Retrieve root package from properties.
	 * 
	 * @return
	 * @throws Exception
	 */
	protected final String retrieveRootPackage() throws Exception {
		String rootPackage = retrieveValueFromProperties("package", "root");
		
		if (rootPackage == null)
			throw new Exception("Property 'package.root' doesn't exist.");
		
		return rootPackage;
	}
	
	/**
	 * Retrieve settings from properties.
	 * 
	 * @param key
	 * @param attribute
	 * @return
	 * @throws Exception
	 */
	protected final String[] retrieveSettings(String key, String attribute) throws Exception {
		String[] settings = retrieveValuesFromProperties(key, attribute);
		
		if (settings == null)
			throw new Exception("Property '" + key + "." + attribute + "' doesn't exist");
		
		return settings;
	}
	
	/**
	 * Process package. Replace wildcards (_???_) with the configured package name.
	 * 
	 * @param _package the _package
	 * 
	 * @return the string
	 * 
	 * @throws Exception the generator exception
	 */
	protected final String processPackage(String _package) throws Exception {
		if (_package.matches(VALID_PACKAGE_INPUT_WITHOUT_WILDCARD))
			return _package;
		
		Pattern pattern = Pattern.compile(VALID_PACKAGE_INPUT_WITH_WILDCARD);
		Matcher matcher = pattern.matcher(_package);
		
		if(!matcher.matches())
			throw new Exception("Package format '" + _package + "' is invalid.");
		
		while (matcher.matches()) {
			String wildcard = matcher.group(1);	
			String wildcardKey = matcher.group(2);
			String replacement = retrieveValueFromProperties("package", wildcardKey);
			
			if (replacement == null)
				throw new Exception("Property 'package." + wildcardKey + "' doesn't exist.");
			
			if (!replacement.matches(VALID_PACKAGE_PROPERTY_WITH_WILDCARD))
				throw new Exception("Property 'package." + wildcardKey + "' has invalid format.");
					
			_package = _package.replace(wildcard, replacement);
			
			matcher = pattern.matcher(_package);
		}
		
		return _package;
	}
	
	/**
	 * Adds the key value pair to models.
	 * 
	 * @param models the models
	 * @param key the key
	 * @param value the value
	 */
	protected final void addKeyValuePairToModels(Map<String, Object> models, String key, Object value) {
		models.put(key, value);
	}

	/**
	 * Create a Source object.
	 * 
	 * @param _package
	 * @param setting
	 * @return
	 * @throws Exception
	 */
	protected Source createSource(String _package, String setting) throws Exception {		
		return createSource(null, _package, setting, false);
	}
	
	
	/**
	 * Create a Source object.
	 * 
	 * @param _package
	 * @param setting
	 * @param addRootPackage
	 * @return
	 * @throws Exception
	 */
	protected Source createSource(String _package, String setting, boolean addRootPackage) throws Exception {
		return createSource(null, _package, setting, addRootPackage);
	}
	
	/**
	 * Create a Source object.
	 * 
	 * @param name
	 * @param _package
	 * @param setting
	 * @return
	 * @throws Exception
	 */
	protected Source createSource(String name, String _package, String setting) throws Exception {		
		return createSource(name, _package, setting, false);
	}
	
	/**
	 * Create a Source object.
	 * 
	 * @param name
	 * @param _package
	 * @param setting
	 * @param addRootPackage
	 * @return
	 * @throws Exception
	 */
	protected Source createSource(String name, String _package, String setting, boolean addRootPackage) throws Exception {
		Source source = (name != null)? new Source(name, _package) : new Source(_package);
		
		if (addRootPackage)
			source.setRootPackage(retrieveRootPackage());
		
		copyFromPropertiesToObject(source, setting);
		
		return source;
	}
	
	/**
	 * Process template.
	 * 
	 * @param template the template
	 * @param models the models
	 * 
	 * @return the string
	 * 
	 * @throws Exception the exception
	 */
	protected final String processTemplate(Template template, Map<String, Object> models) throws Exception {
		Assert.notNull(template, "Parameter 'template' cannot be null");
		Assert.notNull(models, "Parameter 'models' cannot be null");
		
		String text = null;
		
		try {
			text = FreeMarkerTemplateUtils.processTemplateIntoString(template, models);
		} catch (Exception e) {
			logger.error("Encountered error when processing template", e);
			throw e;
		}
		
		return text;
	}

	/**
	 * Process template.
	 * 
	 * @param templateFile the template file
	 * @param models the models
	 * 
	 * @return the string
	 * 
	 * @throws Exception the exception
	 */
	protected final String processTemplate(String templateFile, Map<String, Object> models) throws Exception {
		Configuration configuration = getConfiguration();
		Template template = configuration.getTemplate(templateFile);
		return processTemplate(template, models);
	}
	
	/**
	 * Write the output to files.
	 * 
	 * @param source the source
	 * @param models the models
	 * 
	 * @throws Exception the exception
	 */
	protected final void write(Source source, Map<String, Object> models, String targetDir) throws Exception {
		Assert.notNull(source, "Parameter 'source' cannot be null");
		Assert.notNull(models, "Parameter 'models' cannot be null");
		
		targetDir = (targetDir != null)? targetDir.trim() : "";
		targetDir = (targetDir.matches("^[A-Za-z0-9]+$"))? targetDir + "/" : targetDir;
		
		String text = processTemplate(source.getTemplateFile(), models);

		String fullDirName = targetDir + source.getDirName();
		String fullFileName = targetDir + source.getQualifiedFileName();
		
		File file = new File(fullFileName);
		
		if (!file.exists()) {
			if (fullDirName.trim().length() > 0) {
				File directory = new File(fullDirName);

				if (!directory.exists())
					forceMkdir(directory);
			}
			
			writeStringToFile(file, text);
			
			logger.info("Created file: {}", fullFileName);
		}
	}
	
	/**
	 * Bulk write the output to files.
	 * 
	 * @param models
	 * @throws Exception
	 */
	protected final void bulkWrite(Map<String, Object> models) throws Exception {
		bulkWrite(models, null);
	}
	
	/**
	 * Bulk write the output to files.
	 * 
	 * @param models
	 * @throws Exception
	 */
	protected final void bulkWrite(Map<String, Object> models, String targetDir) throws Exception {
		for (Entry<String, Object> setting: models.entrySet()) {
			if ((setting.getValue() instanceof Source)) {
				try {
					Source source = (Source) setting.getValue();
					
					if (source.isCreate())
						write(source, models, targetDir);
				} catch(Exception e) {
					throw e;
				}
			}
		}
	}
	
	/**
	 * Remove the beginning of a String.
	 * 
	 * @param str
	 * @param remove
	 * @return
	 */
	private final String removeStartIgnoreCase (String str, String remove) {
		if (!StringUtils.hasText(str) || !StringUtils.hasText(remove)) {
			return str;
		}
		
		if (StringUtils.startsWithIgnoreCase(str, remove)) {
			return str.substring(remove.length());
		}
		
		return str;
	}
	
	/**
	 * Create directories with force.
	 * 
	 * @param directory
	 * @throws IOException
	 */
    private final void forceMkdir(File directory) throws IOException {
        if (directory.exists()) {
            if (directory.isFile()) {
                String message = "File ".concat(directory.getName()).concat(" exists and is ")
                        				.concat("not a directory. Unable to create directory.");
                throw new IOException(message);
            }
        } else {
            if (false == directory.mkdirs()) {
                String message = "Unable to create directory ".concat(directory.getName());
                throw new IOException(message);
            }
        }
    }

    /**
     * Write the String to a file.
     * 
     * @param file
     * @param data
     * @throws IOException
     */
    private final void writeStringToFile(File file, String data) throws IOException {
		OutputStream out = new FileOutputStream(file);

		try {
			out.write(data.getBytes());
		} finally {
			if (out == null)
				return;
			try {
				out.close();
			} catch (IOException e) {}
		}
	}
}