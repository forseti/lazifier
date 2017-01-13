package ${repository_java.packageName};
[#if baseRepository_java??]

import ${baseRepository_java.qualifiedClassName};
[#if entity_java?? && entity_java.packageName != repository_java.packageName]
import ${entity_java.qualifiedClassName};
[/#if]
[/#if]

[@compress single_line=true]public interface ${repository_java.className}[#if baseRepository_java??] extends ${baseRepository_java.className}<[#t]
[#if entity_java??]${entity_java.className}, ${form.id.typeClassName}[#else],[/#if]>[/#if] {[/@compress]
}