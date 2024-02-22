DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS estimate_item;
DROP TABLE IF EXISTS estimate;

CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(55) NOT NULL
);

CREATE TABLE estimate_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estimate_item VARCHAR(20) NOT NULL,
    category_id INT NOT NULL,
    quantity INT NOT NULL,
    unit VARCHAR(10) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    last_updated DATETIME,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE estimate (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(30) NOT NULL,
    estimate_item_list TEXT NOT NULL,
    remarks TEXT,
    unit_price_list TEXT NOT NULL,
    after_unit_price_calculation_list TEXT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME
);

INSERT INTO category (category_name) VALUES ('材料');
INSERT INTO category (category_name) VALUES ('施工');
INSERT INTO category (category_name) VALUES ('その他');

INSERT INTO estimate_item (estimate_item, category_id, quantity, unit, unit_price, last_updated) VALUES ('重機回送', 3, 1, '回', 20000.00, NOW());

INSERT INTO estimate (customer_name, estimate_item_list, remarks, unit_price_list, after_unit_price_calculation_list, total_price, created_at) VALUES ('顧客A', '施工項目1, 施工項目2', '備考欄のテキスト', '100, 200', '500, 1000', 1500.00, NOW());
