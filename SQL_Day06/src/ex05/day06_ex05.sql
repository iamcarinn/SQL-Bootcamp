COMMENT ON TABLE person_discounts IS 'This table shows discounts for persons';
COMMENT ON COLUMN person_discounts.id IS 'This is the primary key of the table';
COMMENT ON COLUMN person_discounts.person_id IS 'This is the foreign key for the person id who has this discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'This is the foreign key for the pizzeria id which offers this discount';
COMMENT ON COLUMN person_discounts.discount IS 'This is the amount of discount in percents';