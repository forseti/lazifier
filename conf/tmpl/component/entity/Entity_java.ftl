package ${entity_java.packageName};

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Version;

@Entity
@Table(name="${entity_java.className?upper_case}")
public class ${entity_java.className} {
	@Version
	private Long version;
	
	public Long getVersion() {
		return version;
	}
	
	public void setVersion(Long version) {
		this.version = version;
	}
}