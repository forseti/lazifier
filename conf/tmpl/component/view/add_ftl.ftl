[#import "/macro/view.ftl" as view /]
[#noparse][#import "/spring.ftl" as spring /][/#noparse]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${add_ftl.suffix?cap_first} ${entity_java.defaultName}</title>
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/jquery.ui.core.css' /]" type="text/css" media="screen, projection" />
[#if form.include.date == true]
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/jquery.ui.datepicker.css' /]" type="text/css" media="screen, projection" />
[/#if]
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/theme/base/jquery.ui.theme.css' /]" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="[@view.url '/scripts/jquery/jquery.js' /]"></script>
	<script type="text/javascript" src="[@view.url '/scripts/jquery/ui/jquery.ui.core.js' /]"></script>
[#if form.include.date == true]
	<script type="text/javascript" src="[@view.url '/scripts/jquery/ui/jquery.ui.datepicker.js' /]"></script>
[/#if]
[#if form.include.validation == true]
	<script type="text/javascript" src="[@view.url '/scripts/jquery/validation/jquery.validate.js' /]"></script>
[/#if]
[#if default_css??]
	<link rel="stylesheet" href="[@view.url '/styles/local/${default_css.packageName?replace(".","/")}/${default_css.fileName}' /]" type="text/css" media="screen, projection" />
[/#if]
[#if default_js??]
	<script type="text/javascript" src="[@view.url '/scripts/local/${default_js.packageName?replace(".","/")}/${default_js.fileName}' /]"></script>
[/#if]
</head>
<body>
	[#noparse][[/#noparse]@spring.bind "${entity_java.defaultName}" /]
	[#noparse]
	[#list spring.status.errorMessages as error]
		${error}
	[/#list]
	[/#noparse]
	<form id="add" name="${entity_java.defaultName}" action="[@view.url '/${add_ftl.packageName?replace(".","/")}' /]" method="post"[#if form.fileInputs?size > 0] enctype="multipart/form-data"[/#if]>
		<fieldset>
[#if form.id.generatedValue == false]
			<table>
				<tr>
					<td>
						[@view.label '${form.id.name}', '${entity_java.defaultName}.${form.id.name}' /][#nt]
					</td>
	[#if form.id.constraint?? && form.id.constraint.attributes['maxlength']??]
					<td>
						[@view.input '${entity_java.defaultName}.${form.id.name}', 'maxlength="${form.id.constraint.attributes["maxlength"].value}"' /][#nt]
					</td>
	[#else]
					<td>
						[@view.input '${entity_java.defaultName}.${form.id.name}' /][#nt]
					</td>
	[/#if]
				</tr>
[/#if]
[#list form.inputs as input]
				<tr>
					<td>
						[@view.label '${input.name}', '${entity_java.defaultName}.${input.name}' /][#nt]
					</td>
	[#if input.constraint?? && input.constraint.attributes['maxlength']??]
					<td>
						[@view.input '${entity_java.defaultName}.${input.name}', 'maxlength="${input.constraint.attributes["maxlength"].value}"' /][#nt]
					</td>
	[#else]
					<td>
						[@view.input '${entity_java.defaultName}.${input.name}' /][#nt]
					</td>
	[/#if]
				</tr>
[/#list]
[#list form.embeddedInputs as embeddedInput]
				<tr>
					<td>
						[@view.label '${embeddedInput.name}', '${entity_java.defaultName}.${embeddedInput.name}' /][#nt]
					</td>
	[#if input.constraint?? && input.constraint.attributes['maxlength']??]
					<td>
						[@view.input '${entity_java.defaultName}.${embeddedInput.name}', 'maxlength="${embeddedInput.constraint.attributes["maxlength"].value}"' /][#nt]
					</td>
	[#else]
					<td>
						[@view.input '${entity_java.defaultName}.${embeddedInput.name}' /][#nt]
					</td>
	[/#if]
				</tr>
[/#list]
[#list form.fileInputs as fileInput]
				<tr>
					<td>
						[@view.label '${fileInput.name}', '${entity_java.defaultName}.${fileInput.name}' /][#nt]
					</td>
	[#if fileInput.constraint?? && fileInput.constraint.attributes['maxlength']??]
					<td>
						[@view.fileInput '${entity_java.defaultName}.${fileInput.name}', 'maxlength="${fileInput.constraint.attributes["maxlength"].value}"' /][#nt]
					</td>
	[#else]
					<td>
						[@view.fileInput '${entity_java.defaultName}.${fileInput.name}' /][#nt]
					</td>
	[/#if]
				</tr>
[/#list]
[#list form.checkboxes as checkbox]
				<tr>
					<td>
						[@view.label '${checkbox.name}', '${entity_java.defaultName}.${checkbox.name}' /][#nt]
					</td>
					<td>
						[@view.checkbox '${entity_java.defaultName}.${checkbox.name}' /][#nt]
					</td>
				</tr>
[/#list]
[#list form.singleSelects as singleSelect]
				<tr>
					<td>
						[@view.label '${singleSelect.name}', '${entity_java.defaultName}.${singleSelect.name}' /][#nt]
					</td>
					<td>
						[[#noparse]@[/#noparse]spring.bind '${entity_java.defaultName}.${singleSelect.name}' /]
					    <select id="[#noparse]$[/#noparse]{spring.status.expression}" name="[#noparse]$[/#noparse]{spring.status.expression}">
					    	[#noparse][[/#noparse]#list referenceData["${singleSelect.typeClassName?uncap_first}"] as ${singleSelect.typeClassName?uncap_first}]
								[#noparse][[/#noparse]#assign isSelected='false' /]
								[#noparse][[/#noparse]#if spring.status.value??]
						            [#noparse][[/#noparse]#if spring.status.value == ${singleSelect.typeClassName?uncap_first}.${singleSelect.key}][#noparse][[/#noparse]#assign isSelected='true' /][#noparse][/#if][/#noparse]
						        [#noparse][/#if][/#noparse]
					            <option value="[#noparse]$[/#noparse]{${singleSelect.typeClassName?uncap_first}.${singleSelect.key}}" [#noparse][#if isSelected == 'true']selected="selected"[/#if][/#noparse]>[#noparse]$[/#noparse]{${singleSelect.typeClassName?uncap_first}.${singleSelect.key}}</option>
					        [#noparse][/#list][/#noparse]
					    </select>
					</td>
				</tr>
[/#list]
[#list form.multipleSelects as multipleSelect]
				<tr>
					<td>
						[@view.label '${multipleSelect.name}', '${entity_java.defaultName}.${multipleSelect.name}' /][#nt]
				    </td>
				    <td>	
				    	[[#noparse]@[/#noparse]spring.bind '${entity_java.defaultName}.${multipleSelect.name}' /]
					    <select id="[#noparse]$[/#noparse]{spring.status.expression}" name="[#noparse]$[/#noparse]{spring.status.expression}" multiple="multiple">
					    	[#noparse][[/#noparse]#list referenceData["${multipleSelect.typeParameterClassName?uncap_first}"] as ${multipleSelect.typeParameterClassName?uncap_first}]
								[#noparse][[/#noparse]#assign isSelected='false' /]
								[#noparse][[/#noparse]#if spring.status.value??]
									[#noparse][[/#noparse]#list spring.status.value as value]
						            	[#noparse][[/#noparse]#if value.${multipleSelect.key} == ${multipleSelect.typeParameterClassName?uncap_first}.${multipleSelect.key}][#noparse][[/#noparse]#assign isSelected='true' /][#noparse][#break /][/#if][/#noparse]
						            [#noparse][/#list][/#noparse]
						        [#noparse][/#if][/#noparse]
					            <option value="[#noparse]$[/#noparse]{${multipleSelect.typeParameterClassName?uncap_first}.${multipleSelect.key}}" [#noparse][#if isSelected == 'true']selected="selected"[/#if][/#noparse]>[#noparse]$[/#noparse]{${multipleSelect.typeParameterClassName?uncap_first}.${multipleSelect.key}}</option>
					        [#noparse][/#list][/#noparse]
					    </select>
						<input type="hidden" name="_[#noparse]$[/#noparse]{spring.status.expression}"/>
					</td>
				</tr>
[/#list]
				<tr>
					<td>
						<br />
					</td>
					<td>
						<input type="submit" name="create" value="Create" />
						<input type="submit" name="cancel" value="Cancel" />
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>