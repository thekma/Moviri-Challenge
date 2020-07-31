select employees.EmployeeId, round(EmById.totals,2) /*get employeeid and their 'rounded' total as output*/
from employees /*taking from the employees table, as employeeid is the focus*/
left join (select EmployeeId, SUM(total) as totals /*left join to get employeeid by each total amount*/
			from employees, customers, invoices
			where EmployeeId = SupportRepId
				and customers.CustomerId = invoices.CustomerId
			group by EmployeeId)
			as EmById on employees.EmployeeId = EmById.EmployeeId /*then have the result linked to the intial select*/
group by employees.EmployeeId /*group the employeeid values in employees*/
order by EmById.totals DESC; /*descending view for the totals*/