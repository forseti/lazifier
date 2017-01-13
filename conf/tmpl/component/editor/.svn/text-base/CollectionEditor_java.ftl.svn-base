package ${editor_java.packageName};

import org.springframework.beans.propertyeditors.CustomCollectionEditor;

[#if entity_java.packageName != collectionEditor_java.packageName]
	[#assign import=true /]
import ${entity_java.qualifiedClassName};
[/#if]
[#if service_java?? && service_java.packageName != collectionEditor_java.packageName]
	[#assign import=true /]
import ${service_java.qualifiedClassName};
[#elseif repository_java?? && repository_java.packageName != collectionEditor_java.packageName]
	[#assign import=true /]
import ${repository_java.qualifiedClassName};
[/#if]
[#if import??]

[/#if]
public class ${collectionEditor_java.className} extends CustomCollectionEditor {
[#if service_java??]
	private ${service_java.className} ${service_java.defaultName};
		
	public ${collectionEditor_java.className}(Class<?> collectionType, ${service_java.className} ${service_java.defaultName}) {
		super(collectionType, true);
		this.${service_java.defaultName} = ${service_java.defaultName};
	}
[#elseif repository_java??]	
	private ${repository_java.className} ${repository_java.defaultName};
	
	public ${collectionEditor_java.className}(Class<?> collectionType, ${repository_java.className} ${repository_java.defaultName}) {
		super(collectionType, true);
		this.${repository_java.defaultName} = ${repository_java.defaultName};
	}
[#else]
	public ${collectionEditor_java.className}(Class<?> collectionType) {
		super(collectionType, true);
	}
[/#if]

	@Override
	protected Object convertElement(Object element) {
	    ${entity_java.className} ${entity_java.defaultName} = null; 
		
		if (element != null) {
             ${form.id.typeClassName} ${form.id.name} = ${form.id.typeClassName}.valueOf((String) element);
[#if service_java??]

			if (${service_java.defaultName} != null)
				${entity_java.defaultName} = ${service_java.defaultName}.loadAll(${form.id.name});
[#elseif repository_java??]

			if (${repository_java.defaultName} != null)
				${entity_java.defaultName} = ${repository_java.defaultName}.loadAll(${form.id.name});
[#else]
           	${entity_java.defaultName} = new ${entity_java.className}();
           	${entity_java.defaultName}.set${form.id.name?cap_first}(${form.id.name});
[/#if]
         }
		 
         return ${entity_java.defaultName};
	}
}