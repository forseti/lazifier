package ${controller_java.packageName};
[#if baseController_java??]

	[#if entity_java??]
		[#if form.singleSelects?size > 0 || form.multipleSelects?size > 0]
import java.util.HashMap;
		[/#if]
import java.util.List;
		[#if !service_java?? && !repository_java??]
import java.util.ArrayList;
		[#elseif baseController_java?? && entity_java?? && (form.singleSelects?size > 0 || form.multipleSelects?size > 0)]
			[#assign skip=false /]
			[#list form.singleSelects as singleSelect]
				[#if !singleSelect.referenceService?? && !singleSelect.referenceRepository??]
import java.util.ArrayList;
					[#assign skip=true /]
					[#break /]
				[/#if]
			[/#list]
			[#if !skip]
				[#list form.multipleSelects as multipleSelect]
					[#if !multipleSelect.referenceService?? && !multipleSelect.referenceRepository??]
import java.util.ArrayList;
						[#break /]
					[/#if]	
				[/#list]
			[/#if]
		[/#if]
	[/#if]
import java.util.Locale;
	[#if entity_java??]
		[#if form.singleSelects?size > 0 || form.multipleSelects?size > 0]
import java.util.Map;
		[/#if]
		[#if form.multipleSelects?size > 0]
			[#list form.multipleSelects as multipleSelect]
				[#if multipleSelect.referenceCollectionEditor?? && multipleSelect.typeQualifiedClassName != 'java.util.List']
					[#assign import=true /]
import ${multipleSelect.typeQualifiedClassName};
				[/#if]
			[/#list]
		[/#if]
		[#if service_java?? || repository_java??]

import javax.persistence.EntityNotFoundException;
		[/#if]
import javax.validation.Valid;
	[/#if]

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
	[#if entity_java??]
import org.springframework.dao.DataIntegrityViolationException;
	[/#if]
import org.springframework.context.MessageSource;
[/#if]
import org.springframework.stereotype.Controller;
[#if baseController_java??]
	[#if entity_java??]
import org.springframework.ui.Model;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
	[/#if]
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
	[#if entity_java??]
		[#if (form.singleSelects?size > 0 || form.multipleSelects?size > 0)]
import org.springframework.web.bind.annotation.ModelAttribute;
		[/#if]
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
	[/#if]
import org.springframework.web.bind.support.SessionStatus;
	[#if  entity_java??]
import org.springframework.web.context.request.WebRequest;
	[/#if]
[/#if]

[#if baseController_java??]
	[#assign import=true /]
import ${baseController_java.qualifiedClassName};
	[#if entity_java?? && entity_java.packageName != controller_java.packageName]
		[#assign import=true /]
import ${entity_java.qualifiedClassName};
	[/#if]
	[#if entity_java?? && form.singleSelects?size > 0]
		[#list form.singleSelects as singleSelect]
			[#if singleSelect.referenceEditor?? && singleSelect.typePackageName != controller_java.packageName]
				[#assign import=true /]
import ${singleSelect.typeQualifiedClassName};
			[#elseif !singleSelect.referenceService?? && !singleSelect.referenceRepository?? && singleSelect.typePackageName != controller_java.packageName]
				[#assign import=true /]
import ${singleSelect.typeQualifiedClassName};
			[/#if]
		[/#list]
	[/#if]
	[#if entity_java?? && form.multipleSelects?size > 0]
		[#list form.multipleSelects as multipleSelect]
			[#if !multipleSelect.referenceService?? && !multipleSelect.referenceRepository?? && multipleSelect.typePackageName != controller_java.packageName]
				[#assign import=true /]
import ${multipleSelect.typeParameterQualifiedClassName};			
			[/#if]
		[/#list]	
	[/#if]
[/#if]
[#if service_java?? && service_java.packageName != controller_java.packageName]
	[#assign import=true /]
import ${service_java.qualifiedClassName};
[#elseif repository_java?? && repository_java.packageName != controller_java.packageName]
	[#assign import=true /]
import ${repository_java.qualifiedClassName};
[/#if]
[#if baseController_java?? && entity_java?? && form.singleSelects?size > 0]
	[#list form.singleSelects as singleSelect]
		[#if singleSelect.referenceEditor??]
			[#if singleSelect.referenceEditor.packageName != controller_java.packageName]
				[#assign import=true /]
import ${singleSelect.referenceEditor.qualifiedClassName};
			[/#if]
		[/#if]
	[/#list]
[/#if]
[#if baseController_java?? && entity_java?? && form.multipleSelects?size > 0]
	[#list form.multipleSelects as multipleSelect]
		[#if multipleSelect.referenceCollectionEditor??]
			[#if multipleSelect.referenceCollectionEditor.packageName != controller_java.packageName]
				[#assign import=true /]
import ${multipleSelect.referenceCollectionEditor.qualifiedClassName};
			[/#if]
		[/#if]
	[/#list]
	[#list form.singleSelects as singleSelect]
		[#if singleSelect.referenceService??]
			[#if singleSelect.referenceService.packageName != controller_java.packageName]
				[#assign import=true /]
import ${singleSelect.referenceService.qualifiedClassName};
			[/#if]
		[#elseif singleSelect.referenceRepository??]
			[#if singleSelect.referenceRepository.packageName != controller_java.packageName]
import ${singleSelect.referenceRepository.qualifiedClassName};
			[/#if]
		[/#if]
	[/#list]
	[#list form.multipleSelects as multipleSelect]
		[#if multipleSelect.referenceService??]
			[#if multipleSelect.referenceService.packageName != controller_java.packageName]
				[#assign import=true /]
import ${multipleSelect.referenceService.qualifiedClassName};
			[/#if]
		[#elseif multipleSelect.referenceRepository??]
			[#if multipleSelect.referenceRepository.packageName != controller_java.packageName]
import ${multipleSelect.referenceRepository.qualifiedClassName};
			[/#if]
		[/#if]
	[/#list]
[/#if]
[#if import??]

[/#if]
@Controller("${controller_java.defaultName}")
[#if entity_java?? && list_ftl??]
@RequestMapping("/${list_ftl.packageName?replace(".","/")}")
[/#if]
public class ${controller_java.className}[#if baseController_java??] extends ${baseController_java.className}[/#if] {
[#if entity_java??]
	[#if add_ftl??]
	[#assign view="true" /]
	private static final String ${add_ftl.suffix?upper_case}_VIEW = "${add_ftl.packageName?replace(".","/")}/${add_ftl.suffix}";
	[/#if]
	[#if edit_ftl??]
	[#assign view="true" /]
	private static final String ${edit_ftl.suffix?upper_case}_VIEW = "${edit_ftl.packageName?replace(".","/")}/${edit_ftl.suffix}";
	[/#if]
	[#if list_ftl??]
	[#assign view="true" /]
	private static final String ${list_ftl.suffix?upper_case}_VIEW = "${list_ftl.packageName?replace(".","/")}/${list_ftl.suffix}";
	[/#if]
	[#if show_ftl??]
	[#assign view="true" /]
	private static final String ${show_ftl.suffix?upper_case}_VIEW = "${show_ftl.packageName?replace(".","/")}/${show_ftl.suffix}";
	[/#if]
	[#if view??]
	
	[/#if]
[/#if]
[#if service_java??]
	@Autowired
	private ${service_java.className} ${service_java.defaultName};
	
[#elseif repository_java??]
	@Autowired
	private ${repository_java.className} ${repository_java.defaultName};
	
[/#if]
[#if entity_java??]
	[#list form.singleSelects as singleSelect]
		[#if singleSelect.referenceService??]
	@Autowired
	private ${singleSelect.referenceService.className} ${singleSelect.referenceService.defaultName};
	
		[#elseif singleSelect.referenceRepository??]
	@Autowired
	private ${singleSelect.referenceRepository.className} ${singleSelect.referenceRepository.defaultName};
	
		[/#if]
	[/#list]
	[#list form.multipleSelects as multipleSelect]
		[#if multipleSelect.referenceService??]
	@Autowired
	private ${multipleSelect.referenceService.className} ${multipleSelect.referenceService.defaultName};
	
		[#elseif multipleSelect.referenceRepository??]
	@Autowired
	private ${multipleSelect.referenceRepository.className} ${multipleSelect.referenceRepository.defaultName};
	
		[/#if]
	[/#list]
[/#if]
[#if baseController_java??] 
	@Autowired
	public ${controller_java.className}(@Qualifier("messageSource") MessageSource messageSource) {
		super(messageSource);
	}
[/#if]
[#if entity_java??]
	[#if index_ftl??]

	@RequestMapping(method=RequestMethod.GET, value="/${index_ftl.suffix}")
	public String ${index_ftl.suffix}() {
		return "redirect:${list_ftl.suffix}";
	}
	[/#if]
	[#if add_ftl??]

	@RequestMapping(method=RequestMethod.GET, value="/${add_ftl.suffix}")
	public String ${add_ftl.suffix}(Model model, WebRequest request) {
		model.addAttribute("${entity_java.defaultName}", new ${entity_java.className}());
		return [#if add_ftl??]${add_ftl.suffix?upper_case}_VIEW[#else]null[/#if];
	}
	[/#if]
	[#if edit_ftl??]

	@RequestMapping(method=RequestMethod.GET, value="/${edit_ftl.suffix}/{${form.id.name}}")
	public String ${edit_ftl.suffix}(@PathVariable("${form.id.name}") ${form.id.typeClassName} ${form.id.name},
									 Model model, WebRequest request) {
		try {
			${entity_java.className} ${entity_java.defaultName} = [#if service_java??]${service_java.defaultName}[#elseif repository_java??]${repository_java.defaultName}[/#if].loadAll(${form.id.name});
			model.addAttribute("${entity_java.defaultName}", ${entity_java.defaultName});
		} catch (EntityNotFoundException e) {
			// Cannot find ${entity_java.defaultName} object.
			BeanPropertyBindingResult result = new BeanPropertyBindingResult(new ${entity_java.className}(), "${entity_java.defaultName}");
			result.reject("object.notFound", new Object[] {${entity_java.className}.class.getName(), 
														   ${form.id.name}}, null);
			return [#if list_ftl??]"redirect:../${list_ftl.suffix}"[#else]null[/#if];
		}
		return [#if edit_ftl??]${edit_ftl.suffix?upper_case}_VIEW[#else]null[/#if];
	}
	[/#if]
	[#if list_ftl??]
	
	@RequestMapping(method=RequestMethod.GET, value="/${list_ftl.suffix}")
	public String ${list_ftl.suffix}(Model model, WebRequest request) {
		return ${list_ftl.suffix}(null, null, model, request);
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/${list_ftl.suffix}/{currentPage}/{maxResults}")
	public String ${list_ftl.suffix}(@PathVariable("currentPage") Integer currentPage, @PathVariable("maxResults") Integer maxResults, Model model, WebRequest request) {
		if (currentPage == null) {
			String parameter = request.getParameter("currentPage");
			currentPage = (parameter == null)? Integer.valueOf(1) : Integer.valueOf(parameter);
		}
		
		if (maxResults == null) {
			String parameter = request.getParameter("maxResults");
			maxResults = (parameter == null)? Integer.valueOf(10) : Integer.valueOf(parameter);
		}
			
		List<${entity_java.className}> results = [#if service_java??]${service_java.defaultName}.find(currentPage, maxResults)[#elseif repository_java??]${repository_java.defaultName}.find(currentPage, maxResults)[#else]new ArrayList<${entity_java.className}>()[/#if];
		Integer maxPages = [#if service_java??]${service_java.defaultName}.findMaxPages(maxResults)[#elseif repository_java??]${repository_java.defaultName}.findMaxPages(maxResults)[#else]Integer.valueOf(0)[/#if];
		Integer totalResults = [#if service_java??]${service_java.defaultName}.findTotalResults()[#elseif repository_java??]${repository_java.defaultName}.findTotalResults()[#else]Integer.valueOf(0)[/#if];
		
		model.addAttribute("results", results)
			 .addAttribute("currentPage", currentPage)
			 .addAttribute("maxResults", maxResults)
			 .addAttribute("maxPages", maxPages)
			 .addAttribute("totalResults", totalResults);
		
		return ${list_ftl.suffix?upper_case}_VIEW;
	}
	[/#if]
	[#if show_ftl??]

	@RequestMapping(method=RequestMethod.GET, value="/${show_ftl.suffix}/{${form.id.name}}")
	public String ${show_ftl.suffix}(@PathVariable("${form.id.name}") ${form.id.typeClassName} ${form.id.name}, Model model, WebRequest request) {
		try {
			${entity_java.className} ${entity_java.defaultName} = [#if service_java??]${service_java.defaultName}[#elseif repository_java??]${repository_java.defaultName}[/#if].loadAll(${form.id.name});
			model.addAttribute("${entity_java.defaultName}", ${entity_java.defaultName});
		} catch (EntityNotFoundException e) {
			// Cannot find ${entity_java.defaultName} object.
			BeanPropertyBindingResult result = new BeanPropertyBindingResult(new ${entity_java.className}(), "${entity_java.defaultName}");			
			result.reject("object.notFound", new Object[] {${entity_java.className}.class.getName(), 
														   ${form.id.name}}, null);
			return [#if list_ftl??]"redirect:../${list_ftl.suffix}"[#else]null[/#if];
		}
		return [#if show_ftl??]${show_ftl.suffix?upper_case}_VIEW[#else]null[/#if];
	}
	[/#if]

	@RequestMapping(method=RequestMethod.POST, params="create")
	public String create(@Valid ${entity_java.className} ${entity_java.defaultName}, BindingResult result,
						 WebRequest request, SessionStatus status) {
		if (!result.hasErrors()) {
			try {
				${entity_java.defaultName} = [#if service_java??]${service_java.defaultName}[#elseif repository_java??]${repository_java.defaultName}[/#if].save(${entity_java.defaultName});
				status.setComplete();
				return [#if list_ftl??]"redirect:${entity_java.defaultName}/${show_ftl.suffix}/" + ${entity_java.defaultName}.get${form.id.name?cap_first}()[#else]null[/#if];
			} catch (DataIntegrityViolationException e) {
				result.reject("object.duplicate", new Object[] {${entity_java.className}.class.getName()}, null);			
			}
		}
		
		return [#if add_ftl??]${add_ftl.suffix?upper_case}_VIEW[#else]null[/#if];
	}

	@RequestMapping(method=RequestMethod.POST, params="update")
	public String update(@Valid ${entity_java.className} ${entity_java.defaultName}, BindingResult result, 
						 Model model, WebRequest request, SessionStatus status) {
		try {
			${entity_java.className} current${entity_java.className} = [#if service_java??]${service_java.defaultName}[#elseif repository_java??]${repository_java.defaultName}[/#if].loadAll(${entity_java.defaultName}.get${form.id.name?cap_first}());

			if (current${entity_java.className}.getVersion() > ${entity_java.defaultName}.getVersion()) {
				// Another user has updated this ${entity_java.defaultName} you were editing
				model.addAttribute("${entity_java.defaultName}", current${entity_java.className});
				return [#if edit_ftl??]${edit_ftl.suffix?upper_case}_VIEW[#else]null[/#if];
			} else if (!result.hasErrors()) {
				${entity_java.defaultName} = [#if service_java??]${service_java.defaultName}[#elseif repository_java??]${repository_java.defaultName}[/#if].save(${entity_java.defaultName});
				status.setComplete();
				return [#if show_ftl??]"redirect:${entity_java.defaultName}/${show_ftl.suffix}/" + ${entity_java.defaultName}.get${form.id.name?cap_first}()[#else]null[/#if];
			} else
				return [#if edit_ftl??]${edit_ftl.suffix?upper_case}_VIEW[#else]null[/#if];
		} catch (EntityNotFoundException e) {
			// Cannot find ${entity_java.defaultName} object.
			result.reject("object.notFound", new Object[] {${entity_java.className}.class.getName(), 
														   ${entity_java.defaultName}.get${form.id.name?cap_first}()}, null);
			return [#if list_ftl??]"redirect:${entity_java.defaultName}/${list_ftl.suffix}"[#else]null[/#if];
		}
	}

	@RequestMapping(method=RequestMethod.POST, params="delete")
	public String delete(@RequestParam(value="${form.id.name}", required=true) ${form.id.typeClassName} ${form.id.name},
			 			 WebRequest request, SessionStatus status) {
		try {
			[#if service_java??]${service_java.defaultName}[#elseif repository_java??]${repository_java.defaultName}[/#if].remove(${form.id.name});
			status.setComplete();
		} catch (EntityNotFoundException e) {
			// Cannot find ${entity_java.defaultName} object.
			BeanPropertyBindingResult result = new BeanPropertyBindingResult(new ${entity_java.className}(), "${entity_java.defaultName}");
			result.reject("object.notFound", new Object[] {${entity_java.className}.class.getName(), 
														   ${form.id.name}}, null);
		} catch (DataIntegrityViolationException e) {
			// Cannot delete ${entity_java.defaultName} object.
		}
		
		return [#if list_ftl??]"redirect:${entity_java.defaultName}/${list_ftl.suffix}"[#else]null[/#if];
	}
[/#if]
[#if baseController_java??]

	@RequestMapping(method=RequestMethod.POST, params="cancel")
	public String cancel(SessionStatus status) {
		return exit(status);
	}

	@RequestMapping(method=RequestMethod.POST, params="exit")
	public String exit(SessionStatus status) {
		return super.exit([#if index_ftl??]"${entity_java.defaultName}/${index_ftl.suffix}"[#else]null[/#if], status);
	}
[/#if]
[#if entity_java?? && (form.singleSelects?size > 0 || form.multipleSelects?size > 0)]

	@ModelAttribute("referenceData")	
	public Map<String, Object> loadReferenceData() {
		Map<String, Object> referenceData = new HashMap<String, Object>();	
	[#list form.singleSelects as singleSelect]
		[#if singleSelect.referenceService??]
		referenceData.put("${singleSelect.typeClassName?uncap_first}", ${singleSelect.referenceService.defaultName}.findAll());
		[#elseif singleSelect.referenceRepository??]
		referenceData.put("${singleSelect.typeClassName?uncap_first}", ${singleSelect.referenceRepository.defaultName}.findAll());
		[#else]
		referenceData.put("${singleSelect.typeClassName?uncap_first}", new ArrayList<${singleSelect.typeClassName}>());
		[/#if]
	[/#list]
	[#list form.multipleSelects as multipleSelect]
		[#if multipleSelect.referenceService??]
		referenceData.put("${multipleSelect.typeParameterClassName?uncap_first}", ${multipleSelect.referenceService.defaultName}.findAll());
		[#elseif multipleSelect.referenceRepository??]
		referenceData.put("${multipleSelect.typeParameterClassName?uncap_first}", ${multipleSelect.referenceRepository.defaultName}.findAll());
		[#else]
		referenceData.put("${multipleSelect.typeParameterClassName?uncap_first}", new ArrayList<${multipleSelect.typeParameterClassName}>());
		[/#if]	
	[/#list]
		return referenceData;
	}
[/#if]
[#if baseController_java??]

	@InitBinder
	public void initBinder(Locale locale, WebDataBinder binder) {
[#if entity_java??]
	[#list form.singleSelects as singleSelect]
		[#if singleSelect.referenceEditor??]
		binder.registerCustomEditor(${singleSelect.typeClassName}.class, "${singleSelect.name}", new ${singleSelect.referenceEditor.className}([#if singleSelect.referenceService??]${singleSelect.referenceService.defaultName}[#elseif singleSelect.referenceRepository??]${singleSelect.referenceRepository.defaultName}[/#if]));
		[/#if]
	[/#list]
	[#list form.multipleSelects as multipleSelect]
		[#if multipleSelect.referenceCollectionEditor??]
		binder.registerCustomEditor(${multipleSelect.typeClassName}.class, "${multipleSelect.name}", new ${multipleSelect.referenceCollectionEditor.className}(${multipleSelect.typeClassName}.class[#if multipleSelect.referenceService??], ${multipleSelect.referenceService.defaultName}[#elseif multipleSelect.referenceRepository??], ${multipleSelect.referenceRepository.defaultName}[/#if]));
		[/#if]
	[/#list]
[/#if]
		super.initBinder(locale, binder);
	}
[/#if]
}