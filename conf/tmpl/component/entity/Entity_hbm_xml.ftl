<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE hibernate-mapping 
   PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN"
		  "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">
<hibernate-mapping>
	<query name="${entity_java.className}.loadAll">
		<![CDATA[
			from ${entity_java.className} as ${entity_java.defaultName}
[#list form.singleSelects as singleSelect]		
			left join fetch ${entity_java.defaultName}.${singleSelect.name}
[/#list]
[#list form.multipleSelects as multipleSelect]
			left join fetch ${entity_java.defaultName}.${multipleSelect.name}
[/#list]
			where ${entity_java.defaultName}.${form.id.name} = ?
		]]>
	</query>
</hibernate-mapping>