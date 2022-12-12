-- WITH main AS (SELECT tc.table_name,
--                      kcu.column_name,
--                      CONCAT('idx_', tc.table_name, '_', kcu.column_name) AS idx_name
--               FROM information_schema.table_constraints AS tc
--                        JOIN information_schema.key_column_usage AS kcu
--                             ON tc.constraint_name = kcu.constraint_name
--                                 AND tc.table_schema = kcu.table_schema
--               WHERE tc.constraint_type = 'FOREIGN KEY'
--                 AND tc.table_name IN (SELECT tablename FROM pg_catalog.pg_tables WHERE schemaname = 'public'))

CREATE INDEX idx_person_visits_person_id ON person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);
CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order (person_id);
CREATE INDEX idx_person_order_menu_id ON person_order (menu_id);


