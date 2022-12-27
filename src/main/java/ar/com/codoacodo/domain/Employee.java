package ar.com.codoacodo.domain;

public class Employee {

	/* ------------------------------ Constructores ----------------------------- */

	public Employee(
		int ID,
		String firstName,
		String lastName,
		String telephone,
		String workstation,
		float salary,
		String startDate,
		String endDate,
		boolean isActive
	) {
		this.ID = ID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.telephone = telephone;
		this.workstation = workstation;
		this.salary = salary;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isActive = isActive;
	}

	public Employee(
		String firstName,
		String lastName,
		String telephone,
		String workstation,
		float salary,
		String startDate,
		String endDate,
		boolean isActive
	) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.telephone = telephone;
		this.workstation = workstation;
		this.salary = salary;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isActive = isActive;
	}

	/* -------------------------------- Atributos ------------------------------- */

	private int ID;
	private String firstName;
	private String lastName;
	private String telephone;
	private String workstation;
	private float salary;
	private String startDate;
	private String endDate;
	private boolean isActive;

	/* --------------------------------- Métodos -------------------------------- */

	public void setId(int ID) {
		this.ID = ID;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public void setWorkstation(String workstation) {
		this.workstation = workstation;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public int getID() {
		return ID;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getTelephone() {
		return telephone;
	}

	public String getWorkstation() {
		return workstation;
	}

	public float getSalary() {
		return salary;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public boolean isActive() {
		return isActive;
	}

	public String toString() {
		return (
			"Employee [ID=" +
			ID +
			", firstName=" +
			firstName +
			", lastName=" +
			lastName +
			", telephone=" +
			telephone +
			", workstation=" +
			workstation +
			", salary=" +
			salary +
			", startDate=" +
			startDate +
			", endDate=" +
			endDate +
			", isActive=" +
			isActive +
			"]"
		);
	}
}
