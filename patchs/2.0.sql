ALTER TABLE transacao ALTER COLUMN empresa_id SET NOT NULL;
ALTER TABLE transacao ALTER COLUMN observacao SET NULL;
ALTER TABLE transacao ALTER COLUMN numero_titulo SET NULL;
ALTER TABLE usuario ADD tipo_usuario varchar(1);
