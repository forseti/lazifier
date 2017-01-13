package ${baseController_java.packageName};

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

public abstract class ${baseController_java.className} {
	private final MessageSource messageSource;

	public ${baseController_java.className}(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	 /*****************
	 **	i18n Methods **
	 *****************/

	/** Methods for handling i18n messages **/
    private final String retrieveMessage(String messageKey, Locale locale) {
    	return messageSource.getMessage(messageKey, null, locale);
    }

    private final String retrieveMessage(String messageKey, String argument, Locale locale) {
        return this.retrieveMessage(messageKey, new Object[] { argument }, locale);
    }

    private final String retrieveMessage(String messageKey, Object[] arguments, Locale locale) {
        return messageSource.getMessage(messageKey, arguments, locale);
    }

    @SuppressWarnings("unchecked")
    private final List<String> retrieveMessages(WebRequest request) {
    	Object object = ((ServletWebRequest) request).getAttribute("message",
    																  RequestAttributes.SCOPE_SESSION);

    	if (object == null)
    		return new ArrayList<String>();

    	return (List<String>) object;
    }

	private final void storeMessages(List<String> messages, WebRequest request) {
		if (messages != null)
			((ServletWebRequest) request).setAttribute("messages", messages,
														  RequestAttributes.SCOPE_SESSION);
    }

    protected final void cleanMessages(WebRequest request) {
    	List<String> messages = retrieveMessages(request);

		if (messages.size() > 0)
			messages.clear();

        storeMessages(messages, request);
    }

	protected final void storeMessage(String message, WebRequest request) {
		List<String> messages = retrieveMessages(request);

        messages.add(message);

        storeMessages(messages, request);
    }

	protected final void storeMessageKey(String messageKey, WebRequest request) {
		storeMessage(retrieveMessage(messageKey, request.getLocale()), request);
	}

	protected final void storeMessageKey(String messageKey, String argument, WebRequest request) {
		storeMessage(retrieveMessage(messageKey, argument, request.getLocale()), request);
	}

	protected final void storeMessageKey(String messageKey, Object[] arguments, WebRequest request) {
		storeMessage(retrieveMessage(messageKey, arguments, request.getLocale()), request);
	}

	 /**************************
	 ** Data Handling Methods **
	 **************************/

	/** Method for data binding **/
	protected void initBinder(Locale locale, WebDataBinder binder) {
        NumberFormat nf = NumberFormat.getNumberInstance();
        binder.registerCustomEditor(Integer.class, null, new CustomNumberEditor(Integer.class, nf, true));
        binder.registerCustomEditor(Long.class, null, new CustomNumberEditor(Long.class, nf, true));
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        binder.registerCustomEditor(Byte[].class, new ByteArrayMultipartFileEditor());

        SimpleDateFormat dateFormat = new SimpleDateFormat(retrieveMessage("application.dateFormat", locale));
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null, new CustomDateEditor(dateFormat, true));
	}


	 /***********************
	 ** Navigation Methods **
	 ***********************/

	protected String exit(String action, SessionStatus status) {
		status.setComplete();
		return "redirect:" + action;
	}
}