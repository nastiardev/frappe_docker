FROM frappe/erpnext:v15.74.0

# Install frappe_wiki
RUN bench get-app https://github.com/frappe/wiki

RUN bench get-app https://github.com/nastiardev/twilio-integration

RUN bench get-app https://github.com/frappe/print_designer