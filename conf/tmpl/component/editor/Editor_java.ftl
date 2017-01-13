package ${editor_java.packageName};

import java.beans.PropertyEditorSupport;

import org.springframework.util.StringUtils;

[#if entity_java.packageName != editor_java.packageName]
	[#assign import=true /]
import ${entity_java.qualifiedClassName};
[/#if]
[#if service_java?? && service_java.packageName != editor_java.packageName]
	[#assign import=true /]
import ${service_java.qualifiedClassName};
[#elseif repository_java?? && repository_java.packageName != editor_java.packageName]
	[#assign import=true /]
import ${repository_java.qualifiedClassName};
[/#if]
[#if import??]

[/#if]
public class ${editor_java.className} extends PropertyEditorSupport {
[#if service_java??]
	private ${service_java.className} ${service_java.defaultName};
	
	public ${editor_java.className}(${service_java.className} ${service_java.defaultName}) {
		this.${service_java.defaultName} = ${service_java.defaultName};
	}
[#elseif repository_java??]	
	private ${repository_java.className} ${repository_java.defaultName};
	
	public ${editor_java.className}(${repository_java.className} ${repository_java.defaultName}) {
		this.${repository_java.defaultName} = ${repository_java.defaultName};
	}
[/#if]	
	
	public String getAsText() {
		${entity_java.className} ${entity_java.defaultName} = (${entity_java.className}) getValue();
			
		if (${entity_java.defaultName} != null)
			return String.valueOf(${entity_java.defaultName}.get${form.id.name?cap_first}());
		
		return null;
	}
	
	public void setAsText(String text) throws IllegalArgumentException {
		${entity_java.className} ${entity_java.defaultName} = null;
		
		if (StringUtils.hasText(text)) {
[#if service_java??]

			if (${service_java.defaultName} != null)
				${entity_java.defaultName} = ${service_java.defaultName}.loadAll(text);
[#elseif repository_java??]

			if (${repository_java.defaultName} != null)
				${entity_java.defaultName} = ${repository_java.defaultName}.loadAll(text);
[#else]			
			${entity_java.defaultName} = new ${entity_java.className}();
			${entity_java.defaultName}.set${form.id.name?cap_first}(text);
[/#if]				
			setValue(${entity_java.defaultName});
		}		
	}
}