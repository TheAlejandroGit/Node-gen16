
select clients.id , clients.first_name , clients.last_name , clients.email, accounts.account_no , accounts.balance  from accounts  
right join  
clients on accounts.client_id = clients.id ;
 
select accounts.account_no , accounts.client_id, account_types."name"  from accounts
left join 
account_types on accounts.type = account_types.id;

select transactions.id , transactions.amount , transactions_types."name" from transactions 
left join
transactions_types on transactions.transaction_type =transactions_types.id;


select transactions.id , transactions.amount , transactions_types.name from transactions 
right join 
transactions_types on transactions.transaction_type = transactions_types.id ;


create view v_clients_accounts as select clients.id as id_cliente, clients.first_name as nombre, clients.last_name as apellido, clients.email as email, accounts.account_no as cuenta , accounts.balance as saldo from accounts  
right join  clients on accounts.client_id = clients.id;

select * from v_clients_accounts;

create view v_accounts_types as  select accounts.account_no as cuenta , accounts.client_id as id_cliente, account_types."name" as tipo_cuenta from accounts
left join 
account_types on accounts.type = account_types.id;

select* from v_accounts_types;

create view v_transactions_detail as select transactions.id as transaccion , transactions.amount as monto , transactions_types."name" as tipo_de_transaccion from transactions 
left join
transactions_types on transactions.transaction_type =transactions_types.id;

select * from v_transactions_detail;


create view v_transations_types_detail as select transactions.id as transaccion , transactions.amount as monto, transactions_types.name as tipo_de_transaccion from transactions 
right join 
transactions_types on transactions.transaction_type = transactions_types.id ;


select * from v_transations_types_detail ;