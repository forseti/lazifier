[#if form.include.name='jquery']
$(function() {
	[#if form.include.date == true]
		[#list form.inputs as input]
			[#if input.typeQualifiedClassName='java.util.Date']
	$('#${input.name}').datepicker();
			[/#if]
		[/#list]	
		[#list form.embeddedInputs as embeddedInput]
			[#if embeddedInput.typeQualifiedClassName='java.util.Date']
	$('#${input.name}').datepicker();			
			[/#if]	
		[/#list]
	[/#if]
	[#if form.include.validation == true]
	$('form#add').validate({
		rules: {
		[#list form.constraints as constraint]
			${constraint.name} : {
			[#list constraint.attributes?keys as key]
				${key}: ${constraint.attributes[key].value}[#if key_has_next],[/#if]
			[/#list]		
			}[#if constraint_has_next],[/#if]
		[/#list]
		}
	});
	$('form#edit').validate({
		rules: {
		[#list form.constraints as constraint]
			${constraint.name} : {
			[#list constraint.attributes?keys as key]
				${key}: ${constraint.attributes[key].value}[#if key_has_next],[/#if]
			[/#list]		
			}[#if constraint_has_next],[/#if]
		[/#list]
		}
	});
	[/#if]
});
[/#if]