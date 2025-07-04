-- Function to check if a constraint already exists, if it does, it return nothing, else return the check

CREATE OR REPLACE FUNCTION add_check_if_not_exists(
    tbl TEXT,
    constraint_name TEXT,
    check_sql TEXT
) RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = constraint_name
    ) THEN
        EXECUTE format(
            'ALTER TABLE %I ADD CONSTRAINT %I CHECK (%s)',
            tbl, constraint_name, check_sql
        );
    END IF;
END;
$$ LANGUAGE plpgsql;
