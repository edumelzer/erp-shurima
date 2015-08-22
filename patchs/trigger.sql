 CREATE or replace FUNCTION insere_role() returns  trigger AS $trig_add_permissoes$
  declare
    --
    c_admin CURSOR FOR 
       SELECT id 
         FROM role r
        where r.authority = case new.tipo_usuario when 'A' then 'ROLE_ADMIN' 
	  			  when 'P' then 'ROLE_CONTASPAGAR' 
	  			  when 'R' then 'ROLE_CONTASRECEBER'
				  when 'E' then 'ROLE_ESTOQUE' end;
    --
    v_id integer;
    --
  BEGIN
   --
   delete from user_role where user_id = new.id;
   --
   open c_admin;
   fetch c_admin into v_id;
   close c_admin;
   --
   insert into user_role ( user_id
          		  , role_id)
	           values ( new.id
		          , v_id);
  return NEW;
END;
$trig_add_permissoes$ language plpgsql;
drop trigger if exists trig_add_permissoes on usuario;
create trigger trig_add_permissoes before insert or update 
on usuario
for each ROW EXECUTE PROCEDURE insere_role();
