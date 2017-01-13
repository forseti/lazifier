[#import "/macro/view.ftl" as view /]
[#noparse][#import "/spring.ftl" as spring /][/#noparse]
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${show_ftl.suffix?cap_first} ${entity_java.defaultName}</title>
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/jquery.ui.core.css' /]" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="[@view.url '/scripts/jquery/ui/theme/base/jquery.ui.theme.css' /]" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="[@view.url '/scripts/jquery/jquery.js' /]"></script>
	<script type="text/javascript" src="[@view.url '/scripts/jquery/ui/jquery.ui.core.js' /]"></script>
[#if default_css??]
	<link rel="stylesheet" href="[@view.url '/styles/local/${default_css.packageName?replace(".","/")}/${default_css.fileName}' /]" type="text/css" media="screen, projection" />
[/#if]
[#if default_js??]
	<script type="text/javascript" src="[@view.url '/scripts/local/${default_js.packageName?replace(".","/")}/${default_js.fileName}' /]"></script>
[/#if]
</head>
<body>
	<form name="${entity_java.defaultName}" action="[@view.url '/${show_ftl.packageName?replace(".","/")}' /]" method="post">
		<fieldset>
			[@view.hiddenInput '${entity_java.defaultName}.${form.id.name}' /][#nt]
			<table>
				<tr>
					<td>
						[@view.label '${form.id.name}', '${entity_java.defaultName}.${form.id.name}' /][#nt]
				    </td>
				    <td>	
				    	[[#noparse]@[/#noparse]spring.bind '${entity_java.defaultName}.${form.id.name}' /]
				    	<a href="[@view.url '/${edit_ftl.packageName?replace(".","/")}' /]/${edit_ftl.suffix}/[#noparse]$[/#noparse]{${entity_java.defaultName}.${form.id.name}}">
				    		[#noparse]$[/#noparse]{spring.status.value}
				    	</a>
				    </td>
	    		</tr>
[#list form.inputs as input]
				<tr>
					<td>
						[@view.label '${input.name}', '${entity_java.defaultName}.${input.name}' /][#nt]
					</td>
					<td>
			    		[[#noparse]@[/#noparse]spring.bind '${entity_java.defaultName}.${input.name}' /]
			    		[#noparse]$[/#noparse]{spring.status.value}
			    	</td>
	    		</tr>
[/#list]
[#list form.embeddedInputs as embeddedInput]
				<tr>
					<td>
						[@view.label '${embeddedInput.name}', '${entity_java.defaultName}.${embeddedInput.name}' /][#nt]
					</td>
					<td>
			    		[[#noparse]@[/#noparse]spring.bind '${entity_java.defaultName}.${embeddedInput.name}' /]
			    		[#noparse]$[/#noparse]{spring.status.value}
			    	</td>
		    	</tr>
[/#list]
[#list form.checkboxes as checkbox]
				<tr>
					<td>
						[@view.label '${checkbox.name}', '${entity_java.defaultName}.${checkbox.name}' /][#nt]
					</td>
					<td>
			    		[[#noparse]@[/#noparse]spring.bind '${entity_java.defaultName}.${checkbox.name}' /]
			    		[#noparse]$[/#noparse]{spring.status.value}
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
			    		[#noparse]$[/#noparse]{spring.status.value}
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
			    		[[#noparse]#[/#noparse]list spring.status.value as ${multipleSelect.typeParameterClassName?uncap_first}]
			    			[#noparse]$[/#noparse]{${multipleSelect.typeParameterClassName?uncap_first}.${multipleSelect.key}}<br />
			    		[#noparse][/#list][/#noparse]
			    	</td>
				</tr>
[/#list]
				<tr>
					<td>
						<br />
					</td>
					<td>
						<input type="submit" name="delete" value="Delete" />
						<input type="submit" name="cancel" value="Cancel" />
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>