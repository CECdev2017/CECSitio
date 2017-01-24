ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content titulo: proc{ I18n.t("active_admin.dashboard") } do
    section 'Recent Orders' do
        table_for Order.order('created_at DESC').limit(5) do
            column :name
            column :total_precio do |order|
                number_to_currency order.total_precio
              end
              column :created_at do |order|
                time_ago_in_words order.created_at
              end
          end 
        strong {link_to 'View All Orders', admin_orders_path}

         div class: "blank_slate_container", id: "dashboard_default_message" do
            span class: "blank_slate" do
            span I18n.t("active_admin.dashboard_welcome.welcome")
            small I18n.t("active_admin.dashboard_welcome.call_to_action")
       end
     end
   end # content
 end
end