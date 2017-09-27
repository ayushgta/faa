- view: fact_sessions
  sql_table_name: event_store.fact_sessions_v2
# Uncomment the above v2 and comment v1 Basically redirecting looker to use v2 rather than v1

  fields:

  - dimension: canonical_user_id
    description: "The unique identifier for a user"
    sql: ${TABLE}.canonical_user_id

  - dimension: first_item_order_id
    description: "The first item order in a session"
    sql: ${TABLE}.first_item_order_id

  - dimension: count_of_add_to_cart_events
    type: number
    hidden: true
    sql: ${TABLE}.count_of_add_to_cart_events

# Adding count of atc - count of remove from cart

# AMANE Added on Oct 6/2016
  - dimension: differential_cart_add_and_remove_events
#    description: "Total add to cart events after SUM(ATC) - SUM(Remove from Cart)"
#    view_label: Cart
    type: number
    sql: ${count_of_add_to_cart_events}-${count_of_remove_from_cart_events}



  - dimension: user_did_chat
    type: yesno
    sql: ${chats_v3.id} IS NOT NULL AND ${chats_v3.type} = 'chat'

  - dimension: pdp_plp_cleanout_chat
    type: yesno
    sql: ${chats_v3.id} IS NOT NULL AND ${chats_v3.type} = 'chat' AND ${chats_v3.start_page} IN ('pdp', 'plp', 'cleanout')

  - dimension: checkout_cartedit_chat
    type: yesno
    sql: ${chats_v3.id} IS NOT NULL AND ${chats_v3.type} = 'chat' AND ${chats_v3.start_page} IN ('cart-edit', 'checkout')

  - dimension: viewed_cart_or_checkout
    type: yesno
    sql: ${indicator_for_view_cart_events} = 1 OR ${indicator_for_check_out_events} = 1

  - dimension: count_of_back_to_school
    type: number
    hidden: true
    sql: ${TABLE}.count_of_back_to_school

  - dimension: count_of_boys_shortcuts
    type: number
    hidden: true
    sql: ${TABLE}.count_of_boys_shortcuts

  - dimension: count_of_checkout_events
    type: number
    hidden: true
    sql: ${TABLE}.count_of_checkout_events

  - dimension: count_of_girls_shortcuts
    type: number
    hidden: true
    sql: ${TABLE}.count_of_girls_shortcuts

  - dimension: count_of_home_page_visits
    type: number
    hidden: true
    sql: ${TABLE}.count_of_home_page_visits

  - dimension: count_of_incoming_referral_codes
    type: number
    hidden: true
    sql: ${TABLE}.count_of_incoming_referral_codes

  - dimension: count_of_paid_bag_orders
    hidden: true
    type: number
    sql: ${TABLE}.count_of_paid_bag_orders

  - dimension: count_of_paid_item_orders
    type: number
    hidden: true
    sql: ${TABLE}.count_of_paid_item_orders

  - dimension: count_of_paid_orders
    hidden: true
    type: number
    sql: ${count_of_paid_item_orders} + ${count_of_paid_bag_orders}

  - dimension: count_of_pdp_boys
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_boys

  - dimension: count_of_pdp_girls
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_girls

  - dimension: count_of_pdp_handbags
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_handbags

  - dimension: count_of_pdp_juniors
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_juniors

  - dimension: count_of_pdp_maternity
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_maternity

  - dimension: count_of_pdp_plus
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_plus

  - dimension: count_of_pdp_women
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_women

  - dimension: count_of_pdp_women_shoes
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_women_shoes

  - dimension: count_of_pdp_x
    hidden: true
    type: number
    sql: ${TABLE}.count_of_pdp_x

  - dimension: count_of_personal_shops
    hidden: true
    type: number
    sql: ${TABLE}.count_of_personal_shops

  - dimension: count_of_remove_from_cart_events
    type: number
    hidden: true
    sql: ${TABLE}.count_of_remove_from_cart_events

  - dimension: count_of_searches_made
    type: number
    hidden: true
    sql: ${TABLE}.count_of_searches_made

  - dimension: count_of_shop_boys
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_boys

  - dimension: count_of_shop_girls
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_girls

  - dimension: count_of_shop_handbags
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_handbags

  - dimension: count_of_shop_maternity
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_maternity

  - dimension: count_of_shop_petite
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_petite

  - dimension: count_of_shop_plus
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_plus

  - dimension: count_of_shop_women
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_women

  - dimension: count_of_shop_women_shoes
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_women_shoes

  - dimension: count_of_shop_x
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_x

  - dimension: count_of_shop_tall
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_tall

  - dimension: count_of_shop_juniors
    hidden: true
    type: number
    sql: ${TABLE}.count_of_shop_juniors

  - dimension: count_of_thredup_for_schools
    hidden: true
    type: number
    sql: ${TABLE}.count_of_thredup_for_schools

  - dimension: count_of_view_cart_events
    type: number
    hidden: true
    sql: ${TABLE}.count_of_view_cart_events

  - dimension: count_of_women_shortcuts
    hidden: true
    type: number
    sql: ${TABLE}.count_of_women_shortcuts

# AMANE ADDED on JULY 30/2017

  - dimension: count_of_favorites
    hidden: true
    type: number
    sql: ${TABLE}.count_of_favorites

  - dimension: count_of_unfavorites
    hidden: true
    type: number
    sql: ${TABLE}.count_of_unfavorites

  - dimension: exit_page_url
    description: "The last URL visited in the session (don't use before 11/21/2015)"
    view_label: Exit page
    sql: ${TABLE}.exit_page_url

  - dimension: first_signup_indicator
    description: "Indicates the session contains the user's first signup"
    label: First Signup Indicator (0/1)
    view_label: User Types
 #   description: "Indicator for when a visitor signs up and logs in at the same time"
    type: number
    sql: ${TABLE}.first_login_indicator

#   - dimension: logged_in_status_indicator
#     view_label: User Types
#     label: Indicator Status Logged In (0/1)
#     #description: Indicates the user/visitor was logged in during the session
#     type: number
#     sql: |
#         CASE WHEN ${first_signup_indicator}>0 OR
#         ${returning_user_indicator}>0
#         THEN 1
#         ELSE 0
#         END
#
#   - measure: count_of_logged_in_status_indicator
#     label: Count of Sessions with Status Logged In (0/1)
#     view_label: User Types
#     #description: Measurement to count sessions with status = logged_in
#     type: sum
#     sql: |
#         CASE WHEN ${first_signup_indicator}>0 OR
#         ${returning_user_indicator}>0
#         THEN 1
#         ELSE 0
#         END

  - dimension: first_visit_indicator
    #description: Indicates the session is the users first visit to thredUP.com
    label: First Visit Indicator (0/1)
    view_label: User Types
    type: number
    sql: ${TABLE}.first_visit_indicator

  - dimension: landing_page_url
    #description: The first url of the session (don't use before 11/21/2015)
    view_label: Landing Page
    sql: ${TABLE}.landing_page_url


  - dimension: last_incoming_referral_code
    hidden: true
    sql: ${TABLE}.last_incoming_referral_code

  - dimension: referral_url_lp
#    hidden: true Dec 1/2015 Unhide this based on Mac request
    view_label: Landing Page
    sql: ${TABLE}.landing_page_url
# MANE on April 1/2016 Removed referral url LP as it was same as landing page URL

  - dimension: referral_url_lp_referral_code
    hidden: true
    view_label: Landing Page
    sql: lower(${TABLE}.referral_url_lp_referral_code)

  - dimension: referral_url_lp_referred_inv_id
    hidden: true
    view_label: Landing Page
    sql: ${TABLE}.referral_url_lp_referred_inv_id

  - dimension: referral_url_lp_utm_campaign
#    hidden: true
    view_label: Landing Page
    sql: ${TABLE}.referral_url_lp_utm_campaign

  - dimension: referral_url_lp_utm_content
    #description: Used to differentiate ads
    view_label: Landing Page
    sql: ${TABLE}.referral_url_lp_utm_content

  - dimension: referral_url_lp_utm_medium
    #description: Marketing medium - cpc, banner, email
    view_label: Landing Page
    sql: ${TABLE}.referral_url_lp_utm_medium

  - dimension: referral_url_lp_utm_source
    #description: Campaign source - where the session came from (google, facebook, etc.)
    view_label: Landing Page
    sql: ${TABLE}.referral_url_lp_utm_source

  - dimension: referral_url_lp_utm_term
    #description: Search keyword
    view_label: Landing Page
    sql: ${TABLE}.referral_url_lp_utm_term

# AMANE on Dec 21 parsing fields from REFERRING URL

  - dimension: referring_url_utm_campaign
#    hidden: true
    view_label: Landing Page
    sql: ${TABLE}.referring_url_utm_campaign

  - dimension: referring_url_utm_content
#    hidden: true
    #description: Used to differentiate ads
    view_label: Landing Page
    sql: ${TABLE}.referring_url_utm_content

  - dimension: referring_url_utm_medium
#    hidden: true
    #description: Marketing medium - cpc, banner, email
    view_label: Landing Page
    sql: ${TABLE}.referring_url_utm_medium

  - dimension: referring_url_utm_source
#    hidden: true
    #description: Campaign source - where the session came from (google, facebook, etc.)
    view_label: Landing Page
    sql: ${TABLE}.referring_url_utm_source

  - dimension: referring_url_utm_term
#    hidden: true
    #description: Search keyword
    view_label: Landing Page
    sql: ${TABLE}.referring_url_utm_term

  - dimension: referring_url_referral_code
#    hidden: true
    #description: The session's referral code from Referring URL
    view_label: Landing Page
    sql: ${TABLE}.referring_url_referral_code

# End of Additional UTM fields for Referring URL

  - dimension_group: session_end
    #description: The timestamp of the last event/page view of the session
    type: time
    timeframes: [raw, time, date, week, month]
    sql: ${TABLE}.session_end

  - dimension: session_idx
    sql: ${TABLE}.session_idx
    primary_key: true

  - dimension_group: session_start
    #description: The timestamp of the first event/page view of the session
    type: time
    timeframes: [raw, time, date, week, month, hour_of_day, day_of_week,minute]
    sql: ${TABLE}.session_start

#   - dimension: session_start_raw_fs
#     hidden: true
#     sql: ${TABLE}.session_start

#   - dimension: session_start_raw_rentry_fs
#     hidden: true
#     sql: ${rentry_fact_sessions.session_start}

  - dimension: item_count
#    hidden: true
    type: number
    sql: ${TABLE}.total_item_count

  - dimension: item_order_count_tier
    label: item order count tier
    #description: 1-2 items, 3-4 items, 4+ items
    type: tier
    tiers: [0,1,3,5]
    style: integer
    sql: ${item_count}

  - dimension: total_session_time
    #description: The difference between the last and the first session timestamp
    type: number
    value_format_name: decimal_1
    sql: 1.0*${TABLE}.total_session_time

# added by sryu on 4.1 for elisa

  - measure: total_session_time_sum
    hidden: true
    sql: sum(${total_session_time})

  - measure: avg_session_time
    label: Avg Session Length (minutes)
    type: number
    value_format_name: decimal_1
    sql: (${total_session_time_sum}/${count_of_sessions})/60

  - dimension: udo_platform
    #description: Platform of the session
    sql: ${TABLE}.udo_platform


  - measure: count
    hidden: true
    type: count
    drill_fields: []

  - measure: count_of_sessions
    #description: Measurement to count the number of sessions
    type: count_distinct
    sql: ${session_idx}

  - measure: count_of_sessions_modal
    #description: Measurement to count the number of sessions that hit the signup modal
    type: count_distinct
    sql: ${session_idx}
    filters:
      signup_modal_indicator: 1

  - measure: count_of_sessions_not_logged_in_all
    #description: Measurement to count the number of sessions where user was not logged in
    type: count_distinct
    sql: ${session_idx}
    filters:
      count_of_logged_in_indicator: 0

  - measure: count_of_sessions_not_logged_in_modal
    #description: Measurement to count the number of sessions where user was not logged in
    type: count_distinct
    sql: ${session_idx}
    filters:
      count_of_logged_in_indicator: 0
      signup_modal_indicator: 1

  - measure: percent_sessions_not_logged_in_modal
    #description: Measurement to count the number of sessions
    type: number
    value_format_name: percent_2
    sql: (${count_of_sessions_not_logged_in_modal} * 1.00) / (${count_of_sessions} * 1.00)

  - measure: percent_sessions_not_logged_in_all
    #description: Measurement to count the number of sessions
    type: number
    value_format_name: percent_2
    sql: (${count_of_sessions_not_logged_in_all} * 1.00) / (${count_of_sessions} * 1.00)

  - measure: total_item_count
    #description: Total item purchased during the session
    view_label: Orders
    type: sum
    sql: ${item_count}

  - measure: total_paid_item_orders
    #description: Total paid item orders in the session
    view_label: Orders
    type: sum
    sql: ${count_of_paid_item_orders}

  - measure: total_paid_item_orders_first_session
    #description: Total paid item orders in the first session
    view_label: Orders
    type: sum
    sql: ${count_of_paid_item_orders}
    filters:
      first_visit_indicator: '1'


  - measure: total_bag_orders
    #description: Total orders with 1+ clean out bag during the session
    view_label: Orders
    type: sum
    sql: ${count_of_paid_bag_orders}

  - measure: total_add_to_cart_events
    #description: Total add to cart events in the session
    view_label: Cart
    type: sum
    sql: ${count_of_add_to_cart_events}


# CREATE DUPLICATE to get into ATC data mart

  - measure: total_add_to_cart_events_for_atc_model
    #description: Total add to cart events in the session
    hidden: true
    type: sum
    sql: ${count_of_add_to_cart_events}

  - measure: total_remove_from_cart_events
    #description: Total remove from cart events in the session
    view_label: Cart
    type: sum
    sql: ${count_of_remove_from_cart_events}

  - measure: total_view_cart_events
    #description: Total /cart/edit page views in the session
    view_label: Cart
    type: sum
    sql: ${count_of_view_cart_events}

  - measure: total_searches_made
    #description: Total searches made in a session
    view_label: Searches
    type: sum
    sql: ${count_of_searches_made}

  - measure: total_checkout_events
    #description: Total checkout page views in a session
    view_label: Checkout
    type: sum
    sql: ${count_of_checkout_events}

  - measure: total_incoming_referral_codes
    hidden: true
    view_label: Referral codes
    type: sum
    sql: ${count_of_incoming_referral_codes}

# CONVERT DIMENSIONS TO MEASURES START



  - measure: total_back_to_school_events
    hidden: true
    view_label: Back to School
    type: sum
    sql: ${count_of_back_to_school}

  - measure: total_boys_shortcuts
    #description: Total Boy's shortcut views in a session
    view_label: Shortcuts
    type: sum
    sql: ${count_of_boys_shortcuts}


  - measure: total_girls_shortcuts
    #description: Total Girl's shortcut views in a session
    view_label: Shortcuts
    type: sum
    sql: ${count_of_girls_shortcuts}

  - measure: total_womens_shortcuts
    #description: Total Women's shortcut views in a session
    view_label: Shortcuts
    type: sum
    sql: ${count_of_women_shortcuts}

  - measure: total_home_page_visits
    #description: Total homepage views in the session
    view_label: Homepage
    type: sum
    sql: ${count_of_home_page_visits}



  - measure: total_paid_orders
    #description: Total paid (item or bag) orders in the session
    view_label: Orders
    type: sum
    sql: ${count_of_paid_orders}

  - measure: total_visits_pdp_boys
    #description: Total Boy's PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_boys

  - measure: total_visits_pdp_girls
    #description: Total Girl's PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_girls

  - measure: total_visits_pdp_handbags
    #description: Total Handbag PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_handbags

  - measure: total_visits_pdp_juniors
    #description: Total Junior's PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_juniors

  - measure: total_visits_pdp_maternity
    #description: Total Maternity PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_maternity

  - measure: total_visits_pdp_plus
    #description: Total Plus PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_plus

  - measure: total_visits_pdp_women
    #description: Total Women's PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_women

  - measure: total_visits_pdp_women_shoes
    #description: Total Women's Shoes PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_women_shoes

  - measure: total_visits_pdp_x_collection
    #description: Total X Collection PDP visits in a session
    view_label: PDP
    type: sum
    sql: ${TABLE}.count_of_pdp_x

  - measure: total_visits_personal_shops
    #description: Total personal shop views in the session
    view_label: Personal Shops
    type: sum
    sql: ${TABLE}.count_of_personal_shops


  - measure: total_visits_shop_boys
    label: Total Visits to Boy's PLP
    #description: Total Boy's PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_boys

  - measure: total_visits_shop_girls
    label: Total Visits to Girl's PLP
    #description: Total Girl's PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_girls

  - measure: total_visits_shop_handbags
    label: Total Visits to Handbag PLP
    #description: Total Handbag PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_handbags

  - measure: total_visits_shop_maternity
    label: Total Visits to Maternity PLP
    #description: Total Maternity PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_maternity

  - measure: total_visits_shop_petite
    label: Total Visits to Petite PLP
    #description: Total Petite PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_petite

  - measure: total_visits_shop_plus
    label: Total Visits to Tall PLP
    #description: Total Plus PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_plus

  - measure: total_visits_shop_women
    label: Total Visits to Women's PLP
    #description: Total Women's (non-tall, non-petite) PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_women

  - measure: total_visits_shop_women_shoes
    label: Total Visits to Women's Shoes PLP
    #description: Total Women's Shoe PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_women_shoes

  - measure: total_visits_shop_x_collection
    label: Total Visits to X Collection PLP
    #description: Total X Collection PLP visits in a session
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_x

# Added on Oct 30/2015

  - measure: total_visits_shop_tall
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_tall

  - measure: total_visits_shop_juniors
    view_label: PLP
    type: sum
    sql: ${TABLE}.count_of_shop_juniors


  - dimension: count_of_events
    #description: The number of events in the session
    type: number
    sql: ${TABLE}.count_of_events

  # 2017/07/07 : Commented the dim and added the measure total_no_of_events to remove lookml deprecation warnings by Gayatri P

#   - dimension: total_no_of_events
#     #description: The number of events in the session
#     type: sum
#     sql: ${TABLE}.count_of_events

  - measure: total_no_of_events
    #description: The number of events in the session
    type: sum
    sql: ${TABLE}.count_of_events

  - measure: avg_no_of_events_per_session
    sql: ${total_no_of_events}/${count_of_sessions}

# End of Addition
  - measure: total_visits_thredup_for_schools
    #description: Total thredUP for Schools page views
    view_label: Thredup for Schools
    type: sum
    sql: ${TABLE}.count_of_thredup_for_schools

  - measure: count_of_users
#    hidden: true
    type: count_distinct
    sql: ${TABLE}.canonical_user_id

  - measure: count_of_signed_up_users
#    hidden: true
    type: count_distinct
    sql: ${users_v3.id}

  - measure: count_of_visitors
    hidden: true
    type: count_distinct
    sql: ${TABLE}.visitorid

  - measure: count_of_platforms
    hidden: true
    type: count_distinct
    sql: ${TABLE}.udo_platform

# Added by SR 11.3.15 to build out event data

  - dimension: indicator_for_add_to_cart
    #description: Indicates if the session had 1+ add to cart
    view_label: Cart
    label: Add to Cart Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_add_to_cart_events}>0 THEN 1 ELSE 0 END

  - measure: count_of_add_to_cart_indicator
    #description: Measurement to count sessions with 1+ add to cart
    view_label: Cart
    label: Count Add to Cart Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_add_to_cart_events}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_remove_from_cart
    #description: Indicates if the session had 1+ remove from cart
    view_label: Cart
    label: Remove from Cart Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_remove_from_cart_events}>0 THEN 1 ELSE 0 END

  - measure: count_of_remove_from_cart
    #description: Measurement to count session with 1+ remove from cart
    view_label: Cart
    label: Count Remove from Cart Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_remove_from_cart_events}>0 THEN 1 ELSE 0 END


  - dimension: indicator_for_view_cart_events
    #description: Indicates if the session had 1+ /cart/edit page view
    view_label: Cart
    label: View Cart Events Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_view_cart_events}>0 THEN 1 ELSE 0 END

  - measure: count_of_view_cart_events_v1
    #description: Measurement to count session with 1+ /cart/edit page view
    view_label: Cart
    label: Count View Cart Events Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_view_cart_events}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_check_out_events
    #description: Indicates if the session had 1+ checkout page view
    view_label: Checkout
    label: Checkout Events Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_checkout_events}>0 THEN 1 ELSE 0 END

  - measure: count_of_checkout_events_v1
    #description: Measurement to count sessions with 1+ checkout page view
    view_label: Checkout
    label: Count Checkout Events Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_checkout_events}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_home_page
    #description: Indicates if the session had 1+ homepage view (don't use before 10/7/2015)
    view_label: Homepage
    label: Homepage Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_home_page_visits}>0 AND ${count_of_logged_in_indicator} >0 THEN 1 ELSE 0 END

  - measure: count_of_home_page
    #description: Measurement to count sessions with 1+ homepage view
    view_label: Homepage
    label: Count Homepage Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_home_page_visits}>0 AND ${count_of_logged_in_indicator} >0 THEN 1 ELSE 0 END

  - dimension: indicator_for_home_page_nologin
    #description: Indicates if the session had 1+ homepage view (no log in limitation)
    view_label: Homepage
    label: Homepage Indicator Total Visits (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_home_page_visits}>0 THEN 1 ELSE 0 END

  - measure: count_of_home_page_vists_nologin
    #description: Measurement to count sessions with 1+ homepage view (no log in limitation)
    view_label: Homepage
    label: Count Homepage Indicator Total Visits (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_home_page_visits}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_paid_bag_orders
    #description: Indicates if the session had 1+ clean out bag ordered
    view_label: Orders
    label: Paid Bag Orders Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_paid_bag_orders}>0 THEN 1 ELSE 0 END

  - measure: count_of_paid_bag_orders_v1
    #description: Measurement to count sessions with 1+ clean out bag ordered
    view_label: Orders
    label: Count Paid Bag Orders Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_paid_bag_orders}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_paid_item_orders
    #description: Indicates if the session had 1+ paid item orders
    view_label: Orders
    label: Paid Item Orders Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_paid_item_orders}>0 THEN 1 ELSE 0 END

  - measure: count_of_paid_item_orders_v1
    #description: Measurement to count sessions with 1+ paid item orders
    view_label: Orders
    label: Count Paid Item Orders Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_paid_item_orders}>0 THEN 1 ELSE 0 END

#AG added 1 18 16

  - measure: session_to_order_conversion_rate
    type: number
    value_format_name: percent_2
    sql: |
          CASE WHEN ${fact_sessions.count_of_paid_item_orders_v1}=0 THEN 0 ELSE (${fact_sessions.count_of_paid_item_orders_v1}*1.00)/(${fact_sessions.count_of_sessions}*1.00) END


###### PLP

 # 2017/07/07 : Commented the dim and added the measure total_no_plp_views to remove lookml deprecation warnings by Gayatri P

#   - dimension: total_no_plp_views
#     #description: The number of plp views in the session
#     type: sum
#     sql: ${count_of_shop_women}+${count_of_shop_girls}+${count_of_shop_boys}+${count_of_shop_x}
#          +${count_of_shop_women_shoes}+${count_of_shop_handbags}+${count_of_shop_maternity}+${count_of_shop_plus}
#          +${count_of_shop_petite}+${count_of_shop_juniors}+${count_of_shop_tall}
#          +${count_of_shop_search_women}+${count_of_shop_search_girls}+${count_of_shop_search_boys}+${count_of_shop_search_designer}
#          +${count_of_shop_search_women_shoes}+${count_of_shop_search_women_handbags}+${count_of_shop_search_maternity}+${count_of_shop_search_plus}
#          +${count_of_shop_search_petite}+${count_of_shop_search_juniors}+${count_of_shop_search_tall}

  - measure: total_no_plp_views
    #description: The number of plp views in the session
    type: sum
    sql: ${count_of_shop_women}+${count_of_shop_girls}+${count_of_shop_boys}+${count_of_shop_x}
         +${count_of_shop_women_shoes}+${count_of_shop_handbags}+${count_of_shop_maternity}+${count_of_shop_plus}
         +${count_of_shop_petite}+${count_of_shop_juniors}+${count_of_shop_tall}
         +${count_of_shop_search_women}+${count_of_shop_search_girls}+${count_of_shop_search_boys}+${count_of_shop_search_designer}
         +${count_of_shop_search_women_shoes}+${count_of_shop_search_women_handbags}+${count_of_shop_search_maternity}+${count_of_shop_search_plus}
         +${count_of_shop_search_petite}+${count_of_shop_search_juniors}+${count_of_shop_search_tall}


  - dimension: indicator_for_any_plp_page_view
    #description: Indicates if the session has 1+ PLP view
    view_label: PLP
    label: Any PLP Page View Indicator (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_boys}>0 OR
        ${count_of_shop_girls}>0 OR
        ${count_of_shop_handbags}>0 OR
        ${count_of_shop_maternity}>0 OR
        ${count_of_shop_petite}>0 OR
        ${count_of_shop_plus}>0 OR
        ${count_of_shop_women}>0 OR
        ${count_of_shop_women_shoes}>0 OR
        ${count_of_shop_x}>0 OR
        ${count_of_shop_tall}>0 OR
        ${count_of_shop_juniors}>0
        THEN 1
        ELSE 0
        END

  - measure: count_of_any_plp_page_views
    #description: Measurement to count sessions with 1+ PLP view
    view_label: PLP
    label: Count Any PLP Page Views Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_boys}>0 OR
        ${count_of_shop_girls}>0 OR
        ${count_of_shop_handbags}>0 OR
        ${count_of_shop_maternity}>0 OR
        ${count_of_shop_petite}>0 OR
        ${count_of_shop_plus}>0 OR
        ${count_of_shop_women}>0 OR
        ${count_of_shop_women_shoes}>0 OR
        ${count_of_shop_x}>0 OR
        ${count_of_shop_tall}>0 OR
        ${count_of_shop_juniors}>0
        THEN 1
        ELSE 0
        END

  - dimension: indicator_for_boys_plp
    #description: Indicates if the session has 1+ Boy's PLP view
    view_label: PLP
    label: Indicator for Visit to Boys PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_boys}>0 THEN 1 ELSE 0 END

  - measure: count_of_boys_plp
    #description: Measurement to count sessions with 1+ Boy's PLP view
    view_label: PLP
    label: Count Boys PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_boys}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_girls_plp_view
    #description: Indicates if the session has 1+ Girl's PLP view
    view_label: PLP
    label: Indicator for Visit to Girls PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_girls}>0 THEN 1 ELSE 0 END

  - measure: count_of_girls_plp
    #description: Measurement to count sessions with 1+ Girl's PLP view
    view_label: PLP
    label: Count Girls PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_girls}>0 THEN 1 ELSE 0 END

#Tony added for Jessi/merch email pullback 5/5/16
  - dimension: any_kids_activity_on_plps_or_pdp
    label: Count Kids Activity PLP or PDP Indicator (0/1)
    type: number
    sql: |
        CASE WHEN (${count_of_shop_boys}>0 OR ${count_of_shop_girls}>0 OR ${count_of_boys_shortcuts}>0 OR ${count_of_girls_shortcuts}>0 OR ${TABLE}.count_of_pdp_boys>0 OR ${TABLE}.count_of_pdp_girls>0) THEN 1 ELSE 0 END

  - dimension: indicator_for_handbag_plp_view
    #description: Indicates if the session has 1+ Handbag PLP view
    view_label: PLP
    label: Indicator for Visit to Handbag PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_handbags}>0 THEN 1 ELSE 0 END

  - measure: count_of_handbag_plp
    #description: Measurement to count sessions with 1+ Handbag PLP view
    view_label: PLP
    label: Count Handbag PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_handbags}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_maternity_plp_view
    #description: Indicates if the session has 1+ Maternity PLP view
    view_label: PLP
    label: Indicator for Visit to Maternity PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_maternity}>0 THEN 1 ELSE 0 END

  - measure: count_of_maternity_plp
    #description: Measurement to count sessions with 1+ Maternity PLP view
    view_label: PLP
    label: Count Maternity PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_maternity}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_petite_plp_view
    #description: Indicates if the session has 1+ Petite PLP view
    view_label: PLP
    label: Indicator for Visit to Petite PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_petite}>0 THEN 1 ELSE 0 END

  - measure: count_of_petite_plp
    #description: Measurement to count sessions with 1+ Petite PLP view
    view_label: PLP
    label: Count Petite PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_petite}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_plus_plp_view
    #description: Indicates if the session has 1+ Plus PLP view
    view_label: PLP
    label: Indicator for Visit to Plus PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_plus}>0 THEN 1 ELSE 0 END

  - measure: count_for_plus_plp
    #description: Measurement to count sessions with 1+ Plus PLP view
    view_label: PLP
    label: Count Plus PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_plus}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_womens_plp_view
    #description: Indicates if the session has 1+ Women's (non-tall, non-Petite) PLP view
    view_label: PLP
    label: Indicator for Visit to Womens PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_women}>0 THEN 1 ELSE 0 END

  - measure: count_of_womens_plp
    #description: Measurement to count sessions with 1+ Women's (non-tall, non-petite) PLP view
    view_label: PLP
    label: Count Womens PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_women}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_womens_shoe_plp_view
    #description: Indicates if the session has 1+ Women's Shoes PLP view
    view_label: PLP
    label: Indicator for Visit to Womens Shoe PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_women_shoes}>0 THEN 1 ELSE 0 END

  - measure: count_of_womens_shoes_plp
    #description: Measurement to count sessions with 1+ Women's Shoes PLP view
    view_label: PLP
    label: Count Womens Shoes PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_women_shoes}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_x_collection_plp_view
    #description: Indicates if the session has 1+ X Collection PLP view
    view_label: PLP
    label: Indicator for Visit to X Collection PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_x}>0 THEN 1 ELSE 0 END

  - measure: count_of_x_collection_plp
    #description: Measurement to count sessions with 1+ X Collection PLP view
    view_label: PLP
    label: Count X Collection PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_x}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_tall_plp_view
    #description: Indicates if the session has 1+ Women's Tall PLP view
    view_label: PLP
    label: Indicator for Visit to Tall PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_tall}>0 THEN 1 ELSE 0 END

  - measure: count_of_tall_plp
    #description: Measurement to count sessions with 1+ Tall PLP view
    view_label: PLP
    label: Count Tall PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_tall}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_juniors_plp_view
    #description: Indicates if the session has 1+ Junior's PLP view
    view_label: PLP
    label: Indicator for Visit to Juniors PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_shop_juniors}>0 THEN 1 ELSE 0 END

  - measure: count_of_juniors_plp
    #description: Measurement to count sessions with 1+ Junior's PLP view
    view_label: PLP
    label: Count Juniors PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_shop_juniors}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_shop_search_plp_view
    hidden: true
    view_label: PLP
    label: Indicator for Visit to Shop Search PLP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_searches_made}>0 THEN 1 ELSE 0 END

  - measure: count_of_shop_search_plp
    hidden: true
    view_label: PLP
    label: Count Shop Search PLP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_searches_made}>0 THEN 1 ELSE 0 END

### PERSONAL SHOPS

  - dimension: indicator_for_personal_shop_view
    #description: Indicates if the session had 1+ personal shop page view
    view_label: Personal Shops
    label: Indicator for Visit to Personal Shop (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_personal_shops}>0 THEN 1 ELSE 0 END

  - measure: count_of_personal_shop_visits
    #description: Measurement to count sessions with 1+ personal shop page view
    view_label: Personal Shops
    label: Count Personal Shops Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_personal_shops}>0 THEN 1 ELSE 0 END

### PDP

  - dimension: count_of_any_pdp
    label: Count of PDP
    hidden: true
    type: number
    sql: ${TABLE}.count_of_any_pdp

  - dimension: indicator_for_any_pdp_page_view
    #description: Indicates if the session had 1+ PDP view
    view_label: PDP
    label: Indicator for Any PDP Page View (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_any_pdp} >0
        THEN 1
        ELSE 0
        END

  - measure: count_for_any_pdp_page_view
    #description: Measurement to count sessions with 1+ PDP view
    view_label: PDP
    label: Count Any PDP Page View Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_any_pdp} > 0
        THEN 1
        ELSE 0
        END

  - dimension: indicator_for_pdp_boys_view
    #description: Indicates if the session had 1+ Boy's PDP view
    view_label: PDP
    label: Indicator for Visit to Boys PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_boys}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_boys_view
    #description: Measurement to count sessions with 1+ Boy's PDP view
    view_label: PDP
    label: Count Boys PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_boys}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_girls_view
    #description: Indicates if the session had 1+ Girl's PDP view
    view_label: PDP
    label: Indicator for Visit to Girls PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_girls}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_girls_view
    #description: Measurement to count sessions with 1+ Girl's PDP view
    view_label: PDP
    label: Count Girls PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_girls}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_handbags_view
    #description: Indicates if the session had 1+ Handbag PDP view
    view_label: PDP
    label: Indicator for Visit to Handbags PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_handbags}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_handbags_view
    #description: Measurement to count sessions with 1+ Handbag PDP view
    view_label: PDP
    label: Count Handbags PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_handbags}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_juniors_view
    #description: Indicates if the session had 1+ Junior's PDP view
    view_label: PDP
    label: Indicator for Visit to Juniors PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_juniors}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_juniors_view
    #description: Measurement to count sessions with 1+ Junior's PDP view
    view_label: PDP
    label: Count Juniors PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_juniors}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_maternity_view
    #description: Indicates if the session had 1+ Maternity PDP view
    view_label: PDP
    label: Indicator for Visit to Maternity PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_maternity}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_maternity_view
    #description: Measurement to count sessions with 1+ Maternity PDP view
    view_label: PDP
    label: Count Maternity PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_maternity}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_plus_view
    #description: Indicates if the session had 1+ Plus PDP view
    view_label: PDP
    label: Indicator for Visit to Plus PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_plus}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_plus_view
    #description: Measurement to count sessions with 1+ Plus PDP view
    view_label: PDP
    label: Count Plus PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_plus}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_womens_view
    #description: Indicates if the session had 1+ Women's PDP view
    view_label: PDP
    label: Indicator for Visit to Womens PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_women}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_womens_view
    #description: Measurement to count sessions with Women's PDP view
    view_label: PDP
    label: Count Womens PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_women}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_womens_shoes_view
    #description: Indicates if the session had 1+ Women's Shoes PDP view
    view_label: PDP
    label: Indicator for Visit to Womens Shoes PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_women_shoes}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_womens_shoes_view
    #description: Measurement to count sessions with Women's Shoes PDP view
    view_label: PDP
    label: Count Womens Shoes PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_women_shoes}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_pdp_x_collection_view
    #description: Indicates if the session had 1+ X Collection PDP view
    view_label: PDP
    label: Indicator for Visit to X Collection PDP (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_pdp_x}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdp_x_collection_view
    #description: Measurement to count sessions with X Collection PDP view
    view_label: PDP
    label: Count X Collection PDP Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_pdp_x}>0 THEN 1 ELSE 0 END

### SHORTCUTS

  - dimension: indicator_for_boys_shortcut_view
    #description: Indicates the session had 1+ Boy's shortcut view
    view_label: Shortcuts
    label: Indicator for Visit to Boys Shortcut (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_boys_shortcuts}>0 THEN 1 ELSE 0 END

  - measure: count_of_boys_shortcut_view
    #description: Measurement to count sessions with 1+ Boy's shortcut view
    view_label: Shortcuts
    label: Count Boys Shortcuts Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_boys_shortcuts}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_girls_shortcut_view
    #description: Indicates the session had 1+ Girl's shortcut view
    view_label: Shortcuts
    label: Indicator for Visit to Girls Shortcut (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_girls_shortcuts}>0 THEN 1 ELSE 0 END

  - measure: count_of_girls_shortcut_view
    #description: Measurement to count sessions with 1+ Girl's shortcut view
    view_label: Shortcuts
    label: Count Girls Shortcuts Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_girls_shortcuts}>0 THEN 1 ELSE 0 END

  - dimension: indicator_for_womens_shortcut_view
    #description: Indicates the session had 1+ Women's shortcut view
    view_label: Shortcuts
    label: Indicator for Visit to Womens Shortcut (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_women_shortcuts}>0 THEN 1 ELSE 0 END

  - measure: count_of_womens_shortcut_view
    #description: Measurement to count sessions with 1+ Women's shortcut view
    view_label: Shortcuts
    label: Count Womens Shortcuts Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_women_shortcuts}>0 THEN 1 ELSE 0 END

  - dimension: count_of_any_shortcuts
    hidden: true
    type: number
    sql: ${TABLE}.count_of_any_shortcuts

  - dimension: indicator_for_any_shortcut_view
    #description: Indicates the session had 1+ shortcut view
    view_label: Shortcuts
    label: Indicator for Visit to Any Shortcut (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_any_shortcuts}>0 THEN 1 ELSE 0 END

  - measure: count_of_any_shortcut_view
    #description: Measurement to count sessions with 1+ shortcut view
    view_label: Shortcuts
    label: Count Visit to Any Shortcut Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_any_shortcuts}>0 THEN 1 ELSE 0 END

### BACK TO SCHOOL

  - dimension: indicator_for_back_to_school_view
    hidden: true
    view_label: Back to School
    label: Indicator for Visit to Back to School (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_back_to_school}>0 THEN 1 ELSE 0 END

  - measure: count_of_back_to_school_view
    hidden: true
    view_label: Back to School
    label: Count Back to School View Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_back_to_school}>0 THEN 1 ELSE 0 END

### thredUp For Schools

  - dimension: indicator_for_thredup_for_schools_view
    #description: Indicates the session has 1+ thredUP for Schools page view
    view_label: Thredup for Schools
    label: Indicator for Visit to thredUp for Schools (0/1)
    type: number
    sql: |
        CASE WHEN ${count_of_thredup_for_schools}>0 THEN 1 ELSE 0 END

  - measure: count_of_thredup_for_schools_view
    #description: Measurement to count sessions with 1+ thredUP for Schools page view
    view_label: Thredup for Schools
    label: Count ThredUp for Schools Indicator (0/1)
    type: sum
    sql: |
        CASE WHEN ${count_of_thredup_for_schools}>0 THEN 1 ELSE 0 END


### NEW VISITORS

  - measure: count_of_new_visitors
    #description: Measurement to count sessions that are the visitor's first time to thredUP.com
    view_label: User Types
#    hidden: true
    label: Count of New Visitors
    type: sum
    sql: ${TABLE}.first_visit_indicator


  - measure: count_of_new_visitors_to_sign_up
    #description: Measurement to count sessions when a new visitor sign ups in the same session
    view_label: User Types
#    hidden: true
    label: Count of New Visitor to Signup
    type: sum
    sql: ${TABLE}.first_login_indicator
    filters:
      first_visit_indicator: '1'

  - measure: count_of_first_signups
    #description: Measurement to count sessions with a first signup
    view_label: User Types
    label: Count of First Signups
    type: sum
    sql: ${TABLE}.first_login_indicator

  - measure: new_visitor_to_signup_conversion
    #description: The percent of new visitors that sign up in the same session
    view_label: User Types
    label: New Visitor to Signup Conversion
    type: number
    value_format_name: percent_2
    sql: |
       CASE WHEN ${count_of_new_visitors} = 0 THEN 0 ELSE (${count_of_new_visitors_to_sign_up} * 1.00)/(${count_of_new_visitors} *1.00) END

  - measure: total_visitor_count
    view_label: User Types
    label: Total Visitors (New + Returning)
    type: number
    sql: ${count_of_returning_visitor_sessions} + ${count_of_new_visitors}

  - measure: total_visit_to_signup_conversion
    view_label: User Types
    label: Total Visit to Signup Conversion
    type: number
    value_format_name: percent_2
    sql: |
       CASE WHEN ${total_visitor_count} = 0 THEN 0 ELSE (${count_of_first_signups} * 1.00)/(${total_visitor_count} * 1.00) END

### Returning Visitor Indicator
# # AMANE EXPIRED THE BELOW DIMENSION and renamed to old_ ON JAN 22/2017
#   - dimension: old_returning_visitor_indicator
#     #description: Indicates the session is by someone who has not previously signed in, but is not their first visit
#     view_label: User Types
# #    hidden: true
#     label: Returning Visitor Indicator (0/1)
#     sql: |
#         CASE WHEN
#         (
#         (${first_login_indicator.eventtime_time} IS NOT NULL
#         AND ${session_start_time} <= ${first_login_indicator.eventtime_time}
#         AND ${TABLE}.first_visit_indicator = 0 AND ${users.first_login_time} IS NULL )
#         OR
#         (${first_login_indicator.eventtime_time} IS NULL AND
#         ${session_start_time} <= ${users.first_login_time} AND ${TABLE}.first_visit_indicator = 0)
#         OR
#         (${first_login_indicator.eventtime_time} IS NULL
#         AND ${users.first_login_time} IS NULL
#         AND ${TABLE}.first_visit_indicator = 0)
#         OR
#         (${first_login_indicator.eventtime_time} IS NOT NULL
#         AND ${session_start_time} <= ${first_login_indicator.eventtime_time}
#         AND ${TABLE}.first_visit_indicator = 0 AND  ${users.first_login_time} > '2015-03-16 23:34:39')
#         )
#
#         THEN 1
#         ELSE 0
#         END

  - dimension: returning_visitor_indicator
    description:  Indicates the session is by someone who has not previously signed in, but is not their first visit
    view_label: User Types
#    hidden: true
    label: Returning Visitor Indicator (0/1)
    sql: |
        CASE WHEN
         ${users.first_login_time} IS NULL AND  ${TABLE}.first_visit_indicator = 0 THEN 1
         WHEN COALESCE(${users.first_login_time},${users.created_time}) IS NOT NULL AND ${session_start_time} <  COALESCE(${users.first_login_time},${users.created_time})
         AND ${TABLE}.first_visit_indicator = 0 THEN 1
         ELSE 0
        END
#    required_joins: [users]

 # AMANE EXPIRED THE BELOW DIMENSION on JAN 22/2017
#   - measure: count_of_returning_visitor_sessions
#     view_label: User Types
#     label: Count of Returning Visitor Sessions
#     type: sum
#     sql: |
#         CASE WHEN
#         ((${first_login_indicator.eventtime_time} IS NOT NULL
#         AND ${session_start_time} <= ${first_login_indicator.eventtime_time}
#         AND ${TABLE}.first_visit_indicator = 0) OR
#         (${first_login_indicator.eventtime_time} IS NULL AND
#         ${session_start_time} <= ${users.first_login_time} AND ${TABLE}.first_visit_indicator = 0) OR
#         (${first_login_indicator.eventtime_time} IS NULL
#         AND ${users.first_login_time} IS NULL
#         AND ${TABLE}.first_visit_indicator = 0)) THEN 1
#         ELSE 0
#         END

  - measure: count_of_returning_visitor_sessions
    view_label: User Types
    label: Count of Returning Visitor Sessions
    type: count_distinct
    sql: ${TABLE}.session_idx
    filters:
     returning_visitor_indicator: '1'



  - measure: count_of_returning_visitors_who_signup
#    hidden: true
    view_label: User Types
    label: Count of Returning Visitor Signups
    type: count_distinct
    sql: ${TABLE}.canonical_user_id
    filters:
       returning_visitor_indicator: '1'
       first_signup_indicator: '1'

  - measure: count_distinct_of_returning_visitors
    #description: Measurement to count sessions of unique returning visitors
    view_label: User Types
    label: Count Distinct of Returning Visitors (not sessions)
    type: count_distinct
    sql: ${TABLE}.canonical_user_id
    filters:
       returning_visitor_indicator: '1'

  - measure: returning_visit_to_signup_conversion
#    hidden: true
    view_label: User Types
    label: Returning Visitor to Signup Conversion
    type: number
    value_format_name: percent_2
    sql: |
       CASE WHEN ${count_of_returning_visitor_sessions} = 0 THEN 0 ELSE (${count_of_returning_visitors_who_signup} * 1.00)/(${count_of_returning_visitor_sessions} *1.00) END

  - dimension:  days_since_last_purchase
    label:  days since last purchase from start of session
    type: number
    sql: DATEDIFF(day,${item_order_sequence_for_model_1.purchased_date}, ${session_start_date})

  - dimension:  days_since_first_purchase
    label:  days since first purchase from start of session
    type: number
    sql: DATEDIFF(day,${first_item_order.purchased_date}, ${session_start_date})


  # Tony D
  - dimension: days_since_first_item_order_bucket
    label: days between session and customers first item order by 30 day increments
    sql: case when ${days_since_first_purchase} < 30 then '30'
                when ${days_since_first_purchase} < 60 then '60'
                when ${days_since_first_purchase} < 90 then '90'
                when ${days_since_first_purchase} < 120 then '120'
                when ${days_since_first_purchase} < 150 then '150'
                when ${days_since_first_purchase} < 180 then '180'
                when ${days_since_first_purchase} < 210 then '210'
                when ${days_since_first_purchase} < 240 then '240'
                when ${days_since_first_purchase} < 270 then '270'
                when ${days_since_first_purchase} < 300 then '300'
                when ${days_since_first_purchase} < 330 then '330'
                when ${days_since_first_purchase} < 360 then '360'
                when ${days_since_first_purchase} < 390 then '390'
                when ${days_since_first_purchase} < 420 then '420'
                when ${days_since_first_purchase} < 450 then '450'
                when ${days_since_first_purchase} < 480 then '480'
                when ${days_since_first_purchase} < 510 then '510'
                when ${days_since_first_purchase} < 540 then '540'
                when ${days_since_first_purchase} < 570 then '570'
                when ${days_since_first_purchase} < 600 then '600'
                when ${days_since_first_purchase} < 630 then '630'
                when ${days_since_first_purchase} < 660 then '660'
                when ${days_since_first_purchase} < 690 then '690'
                when ${days_since_first_purchase} < 720 then '720'
                when ${days_since_first_purchase} < 750 then '750'
                when ${days_since_first_purchase} < 780 then '780'
                when ${days_since_first_purchase} < 810 then '810'
                else '811' end






  - dimension:  days_since_first_login
    label:  days since first login from start of session
    type: number
    sql: DATEDIFF(day,${users_v3.first_login_at_date}, ${session_start_date})


  - dimension: is_part_of_active_cohort
    label: user is part of an active cohort
    #description: users last item order occured within 365 days of session start time
    type: yesno
    sql: ${days_since_last_purchase} <= 365

# atg 1 26 17 added field for dashboard metrics.  Purpose of field is to indicate funnel position of the visitor/user in the session.
# if user has given an item order, then funnel position is the NEXT item order a user will give us.  e.g. 1 item order is 2 funnel position
# if user has signed up but no item order, then funnel position is 0TP.  Perhaps it should be 1TP to align with above, but organization refers to these users as NP or 0TP
# so I'm not going to rock that boat.  if user has not signed up, then user is designated as a visitor.

  - dimension: funnel_position
    label: buyer funnel position
    #description: vistor, 0TP, 2nd, 3rd, 4-9th, 10+
    sql: |
         CASE
         WHEN ${item_order_sequence_for_model_1.returning_cohort} IN ('10+','4-9','3','2') then ${item_order_sequence_for_model_1.returning_cohort}
         WHEN ${first_visit_indicator}=0 AND ${returning_visitor_indicator}=0 THEN '0TP'
         ELSE 'visitor'
         END

# atg 2 14 17 added this logic now that we have bag order processed pdt that is analogous to item order sequence pdt.
# for suppliers lets call their position TB vs TP for buyer
# also let keep visitor the same since we don't know intention at this stage so logic calls them TP vs TB.

  - dimension: funnel_position_supplier
    label: supplier funnel position
    #description: vistor, 0TP, 2nd, 3rd, 4-9th, 10+
    sql: |
         CASE
         WHEN ${bag_processed_sequence.returning_cohort} IN ('10+ TB','4-9 TB','3TB','2TB') then ${bag_processed_sequence.returning_cohort}
         WHEN ${first_visit_indicator}=0 AND ${returning_visitor_indicator}=0 THEN '0TP'
         ELSE 'visitor'
         END


#   - measure: tealium_users_check
#     label: Tealium and Users Check
#     type: sum
#     sql: |
#        CASE WHEN ${first_login_indicator.eventtime_date} < ${users.first_login_date} THEN 1
#        ELSE 0
#        END
#
#   - dimension: tealium_users_check_indicator
#     label: Tealium and Users Check Indicator (0/1)
#     sql: |
#        CASE WHEN ${first_login_indicator.eventtime_date} < ${users.first_login_date} THEN 1
#        ELSE 0
#        END

### Returning USERS

#   - dimension: returning_user_indicator
#     #description: Indicates the session is by a someone who has previously created an account
#     view_label: User Types
#     label: Returning User Indicator (0/1)
#     type: number
#     sql: |
#         CASE WHEN
#         ((${first_login_indicator.eventtime_time} IS NOT NULL
#         AND ${session_start_time} > ${first_login_indicator.eventtime_time}
#         AND ${TABLE}.first_visit_indicator = 0
#         AND ${TABLE}.first_login_indicator = 0) OR
#         (${first_login_indicator.eventtime_time} IS  NULL AND
#         ${session_start_time} > ${users.first_login_time} AND ${TABLE}.first_visit_indicator = 0 AND ${TABLE}.first_login_indicator = 0)
#         OR
#         (
#         ${first_login_indicator.eventtime_time} IS NOT NULL
#         AND ${TABLE}.first_visit_indicator = 0
#         AND ${TABLE}.first_login_indicator = 0
#         AND ${users.first_login_time} < '2015-03-16 23:34:39'
#         )) THEN 1
#         ELSE 0
#         END
#
#   - measure: count_of_returning_user_sessions
#     #description: Measurement to count the number of sessions for returning users
#     view_label: User Types
#     label: Count of Returning User Sessions
#     type: sum
#     sql: |
#         CASE WHEN
#         ((${first_login_indicator.eventtime_time} IS NOT NULL
#         AND ${session_start_time} > ${first_login_indicator.eventtime_time}
#         AND ${TABLE}.first_visit_indicator = 0
#         AND ${TABLE}.first_login_indicator = 0) OR
#         (${first_login_indicator.eventtime_time} IS  NULL AND
#         ${session_start_time} > ${users.first_login_time} AND ${TABLE}.first_visit_indicator = 0 AND ${TABLE}.first_login_indicator = 0)) THEN 1
#         ELSE 0
#         END
# AMANE EXPIRED THE BELOW DIMENSION and renamed to old_ ON JAN 22/2017
#   - dimension: old_returning_user_indicator
#     #description: Indicates the session is by a someone who has previously created an account
#     view_label: User Types
#     label: Returning User Indicator (0/1)
#     type: number
#     sql: |
#         CASE WHEN
#         ((${users.first_login_time} IS NOT NULL
#         AND ${session_start_time} > ${users.first_login_time}
#         AND ${TABLE}.first_visit_indicator = 0
#         AND ${TABLE}.first_login_indicator = 0) OR
#         (${users.first_login_time} IS  NULL AND
#         ${session_start_time} > ${users.first_login_time} AND ${TABLE}.first_visit_indicator = 0 AND ${TABLE}.first_login_indicator = 0)) THEN 1
#         ELSE 0
#         END
  - dimension: returning_user_indicator
    #description: Indicates the session is by a someone who has previously created an account
    view_label: User Types
    label: Returning User Indicator (0/1)
    type: number
    sql: |
        CASE WHEN
        ${session_start_time} > COALESCE(${users.first_login_time},${users.created_time})
        AND ${TABLE}.first_visit_indicator = 0
        AND ${TABLE}.first_login_indicator = 0  THEN 1
        ELSE 0
        END


  - measure: count_of_returning_user_sessions
    #description: Measurement to count the number of sessions for returning users
    view_label: User Types
    label: Count of Returning User Sessions
    type: count_distinct
    sql: ${TABLE}.session_idx
    filters:
     returning_user_indicator: '1'



# AMANE EXPIRED THE BELOW MEASURE ON JAN 22/2017
#   - measure: count_of_returning_user_sessions
#     #description: Measurement to count the number of sessions for returning users
#     view_label: User Types
#     label: Count of Returning User Sessions
#     type: sum
#     sql: |
#         CASE WHEN
#         ((${users.first_login_time} IS NOT NULL
#         AND ${session_start_time} > ${users.first_login_time}
#         AND ${TABLE}.first_visit_indicator = 0
#         AND ${TABLE}.first_login_indicator = 0) OR
#         (${users.first_login_time} IS NULL AND
#         ${session_start_time} > ${users.first_login_time} AND ${TABLE}.first_visit_indicator = 0 AND ${TABLE}.first_login_indicator = 0)) THEN 1
#         ELSE 0
#         END

  - measure: count_of_distinct_returning_users
    #description: Measurement to count sessions of unique returning users
    view_label: User Types
    label: Count Distinct of Returning Users (not sessions)
    type: count_distinct
    sql: ${TABLE}.canonical_user_id
    filters:
       first_visit_indicator: '0'
       first_signup_indicator: '0'
       returning_visitor_indicator: '0'


# AMANE on Nov 11/2015
# NEW FIELDS in v2 uncomment when v2 becomes available

# count_of_shop_search_women INT,
# count_of_shop_search_girls INT,
# count_of_shop_search_boys INT,
# count_of_shop_search_plus INT,
# count_of_shop_search_maternity INT,
# count_of_shop_search_designer INT,
# count_of_shop_search_juniors INT,
# count_of_shop_search_petite INT,
# count_of_shop_search_tall INT,
# count_of_shop_search_women_handbags INT,
# count_of_shop_search_women_shoes INT,
# user_warehouse_id

# AMANE DISABLED ON March 6/2017. Please get in touch with me if you need to use the dimension
  - dimension: user_warehouse_id
    #description: The warehouse the visitor shopped (missing for sessions that don't go past modal)
    sql: ${warehouse_dim_fact_sessions.warehouse_code}

  - dimension: warehouse_code
    label: Warehouse Code
    sql: ${warehouse_dim_fact_sessions.warehouse_code}

  - dimension: count_of_shop_search_women
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_women


  - dimension: count_of_shop_search_girls
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_girls

  - dimension: count_of_shop_search_boys
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_boys

  - dimension: count_of_shop_search_plus
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_plus
#
#
  - dimension: count_of_shop_search_maternity
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_maternity

  - dimension: count_of_shop_search_designer
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_designer

  - dimension: count_of_shop_search_juniors
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_juniors

  - dimension: count_of_shop_search_petite
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_petite

  - dimension: count_of_shop_search_tall
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_tall

  - dimension: count_of_shop_search_women_handbags
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_women_handbags

  - dimension: count_of_shop_search_women_shoes
    type: number
    hidden: true
    sql: ${TABLE}.count_of_shop_search_women_shoes


#
# # total_order_discount_amount real,
# # total_order_shipping_amount real,
# # total_order_tax_amount real,
# # total_order_total real,
# # total_order_subtotal real,
# # total_order_noncashcredit real,
#
  - dimension: discount_amount
    hidden: true
    sql: ${TABLE}.total_order_discount_amount * 1.00

  - measure: total_discount_amount
    #description: Total Discount received across all item orders during the session
    view_label: Orders
    type: sum
    value_format: '$#,##0.00'
    sql: ${discount_amount}

  - dimension: shipping_amount
    hidden: true
    sql: ${TABLE}.total_order_shipping_amount * 1.00

  - measure: total_shipping_amount
    #description: Total shipping paid in all orders in the session
    view_label: Orders
    type: sum
    value_format: '$#,##0.00'
    sql: ${shipping_amount}

  - dimension: tax_amount
    hidden: true
    sql: ${TABLE}.total_order_tax_amount * 1.00

  - measure: total_tax_amount
    #description: Total tax paid in all orders in the session
    view_label: Orders
    type: sum
    value_format: '$#,##0.00'
    sql: ${tax_amount}

  - dimension: order_total
    hidden: true
    sql: ${TABLE}.total_order_total * 1.00
#
  - measure: total_order_total
    hidden: true
    view_label: Orders
    type: sum
    value_format: '$#,##0.00'
    sql: ${order_total}

#   - dimension: order_subtotal
#     hidden: true
#     sql: ${TABLE}.total_order_subtotal * 1.00
#
#   - measure: total_order_subtotal
#     hidden: true
#     view_label: Orders
#     type: sum
#     value_format: '$#,##0.00'
#     sql: ${order_subtotal}

  - dimension: order_noncashcredit
    hidden: true
    sql: ${TABLE}.total_order_noncashcredit * 1.00
#
  - measure: total_order_noncashcredit
    hidden: true
    view_label: Orders
    type: sum
    value_format: '$#,##0.00'
    sql: ${order_noncashcredit}

# AMANE on Nov 11/2015 -
#Sam you build Revenue fields and other fields below this

  - dimension: total_womens_search_indicator
    #description: Indicates the session had 1+ Women's search
    label: Total Womens Search Indicator (0/1)
    view_label: Searches
    type: number
    sql: |
      CASE WHEN ${count_of_shop_search_women}>0 OR
      ${count_of_shop_search_plus}>0 OR
      ${count_of_shop_search_maternity}>0 OR
      ${count_of_shop_search_designer}>0 OR
      ${count_of_shop_search_juniors}>0 OR
      ${count_of_shop_search_petite}>0 OR
      ${count_of_shop_search_tall}>0 OR
      ${count_of_shop_search_women_handbags}>0 OR
      ${count_of_shop_search_women_shoes}>0
      THEN 1
      ELSE 0
      END

  - measure: count_of_total_womens_search
    #description: Measurement to count sessions with 1+ Women's search
    view_label: Searches
    label: Count of Women's Search Indicator (0/1)
    type: sum
    sql: |
      CASE WHEN ${count_of_shop_search_women}>0 OR
      ${count_of_shop_search_plus}>0 OR
      ${count_of_shop_search_maternity}>0 OR
      ${count_of_shop_search_designer}>0 OR
      ${count_of_shop_search_juniors}>0 OR
      ${count_of_shop_search_petite}>0 OR
      ${count_of_shop_search_tall}>0 OR
      ${count_of_shop_search_women_handbags}>0 OR
      ${count_of_shop_search_women_shoes}>0
      THEN 1
      ELSE 0
      END

  - dimension: total_boys_search_indicator
    #description: Indicates the session had 1+ Boy's search
    view_label: Searches
    label: Total Boys Search Indicator (0/1)
    type: number
    sql: |
       CASE WHEN ${count_of_shop_search_boys}>0 THEN 1 ELSE 0 END

  - measure: count_of_boys_search
    #description: Measurement to count sessions with 1+ Boy's search
    view_label: Searches
    label: Count of Boy's Search Indicator (0/1)
    type: sum
    sql: |
       CASE WHEN ${count_of_shop_search_boys}>0 THEN 1 ELSE 0 END

  - dimension: total_girls_search_indicator
    #description: Indicates the session had 1+ Girl's search
    view_label: Searches
    label: Total Girls Search Indicator (0/1)
    type: number
    sql: |
      CASE WHEN ${count_of_shop_search_girls}>0 THEN 1 ELSE 0 END

  - measure: count_of_girls_search
    #description: Measurement to count sessions with 1+ Girl's search
    view_label: Searches
    label: Count of Girls Search Indicator (0/1)
    type: sum
    sql: |
      CASE WHEN ${count_of_shop_search_girls}>0 THEN 1 ELSE 0 END

  - dimension: count_of_any_search_indicator
    #description: Indicates the session had 1+ search
    view_label: Searches
    label: Any Search Indicator (0/1)
    type: number
    sql: |
      CASE WHEN ${count_of_shop_search_boys}>0 OR
      ${count_of_shop_search_women}>0 OR
      ${count_of_shop_search_plus}>0 OR
      ${count_of_shop_search_maternity}>0 OR
      ${count_of_shop_search_designer}>0 OR
      ${count_of_shop_search_juniors}>0 OR
      ${count_of_shop_search_petite}>0 OR
      ${count_of_shop_search_tall}>0 OR
      ${count_of_shop_search_women_handbags}>0 OR
      ${count_of_shop_search_women_shoes}>0 OR
      ${count_of_shop_search_girls}>0 OR
      ${count_of_search_no_department}>0
      THEN 1
      ELSE 0
      END

  - measure: count_of_any_search
    #description: Measurement to count sessions with 1+ search
    view_label: Searches
    label: Count of Any Search Indicator (0/1)
    type: sum
    sql: |
      CASE WHEN ${count_of_shop_search_boys}>0 OR
      ${count_of_shop_search_women}>0 OR
      ${count_of_shop_search_plus}>0 OR
      ${count_of_shop_search_maternity}>0 OR
      ${count_of_shop_search_designer}>0 OR
      ${count_of_shop_search_juniors}>0 OR
      ${count_of_shop_search_petite}>0 OR
      ${count_of_shop_search_tall}>0 OR
      ${count_of_shop_search_women_handbags}>0 OR
      ${count_of_shop_search_women_shoes}>0 OR
      ${count_of_shop_search_girls}>0 OR
      ${count_of_search_no_department} >0
      THEN 1
      ELSE 0
      END

  - dimension: count_of_search_no_department
#    label: Number of Add to Cart Events from a PDP
#    view_label: Cart
    type: number
    hidden: true
    sql: ${TABLE}.count_of_search_no_department

### SRYU created Session Channel 11.13

  -   dimension: session_channel_code
      hidden: true
      label: Session Channel Code
      sql: |
       CASE WHEN ((${invitations.folder} = 'Paid') OR (${invitations.folder} = 'Twitter / Facebook') OR (${invitations.folder} IS NULL AND (${referral_url_lp_referral_code} LIKE 'adwords_search_%' OR ${referral_url_lp_referral_code} LIKE 'bing_search_%' OR ${referral_url_lp_referral_code} LIKE 'fb_%' OR ${referring_url_referral_code} LIKE 'adwords_thredup%' OR ${referring_url_referral_code} LIKE 'bing_search_%' OR ${referring_url_referral_code} LIKE 'fb_%'))) THEN 'Paid'
         WHEN (${invitations.folder} = 'Affiliate' OR ${invitations.folder} = 'Affiliate PPL' OR ${referral_url_lp_utm_campaign} = 'linkshare' OR ${referral_url_lp_utm_medium} = 'affiliate' OR ${referral_url_lp_utm_medium} = 'Potential Affiliate') THEN 'Affiliate'
         WHEN ${invitations.folder} = 'Earned Media' THEN 'Earned Media'
         WHEN ((${invitations.folder} IS NULL AND ${referral_url_lp_referral_code} IS NOT NULL AND ${invitations.sender_id} >1) OR (length(${invitations.folder}) = 0 AND ${referral_url_lp_referral_code} IS NOT NULL AND ${invitations.sender_id} >1) OR (${invitations.folder} IS NULL AND ${referral_url_lp_utm_campaign} LIKE 'invites_%')) THEN 'Referral'
         WHEN (${invitations.folder} IS NULL AND ${referral_url_lp_referral_code} IS NULL AND ${referring_url_referral_code} IS NULL) OR (${invitations.folder} = 'Organic' AND ${referral_url_lp_referral_code} IS NULL AND ${referring_url_referral_code} IS NULL) OR (length(${referral_url_lp_referral_code}) = 0 AND length(${referring_url_referral_code}) = 0) OR (${invitations.folder} IS NULL AND length(${referral_url_lp_referral_code}) = 0 AND length(${referring_url_referral_code}) = 0) OR (${invitations.folder} IS NULL AND length(${referral_url_lp_referral_code}) = 0 AND ${referring_url_referral_code} IS NULL) OR (${invitations.folder} IS NULL AND ${referral_url_lp_referral_code} IS NULL AND length(${referring_url_referral_code}) = 0) THEN 'Organic'
         WHEN ((${invitations.folder} = 'Paid' AND ${referral_url_lp_utm_campaign} = 'Other') OR (${invitations.folder} = 'Paid' AND ${referral_url_lp_utm_campaign} = 'Military') OR (${referral_url_lp_utm_campaign} = 'ebay')) THEN 'Miscellaneous'
         WHEN ${referral_url_lp_utm_campaign} = 'Target' OR ${referral_url_lp_utm_campaign} = 'concierge' THEN 'Unclassified'
         ELSE 'error'
         END

  -   dimension: session_channel
      #description: The session's channel
      view_label: Session Channel
      label: Session Channel
      sql: |
        CASE WHEN (${first_signup_indicator} = 1 AND ${user_acquisition_channels.channel} IS NOT NULL) THEN ${user_acquisition_channels.channel}
        ELSE ${session_channel_code}
        END

  -   dimension: session_subchannel
      #description: The session's subchannel
      view_label: Session Channel
      label: Session Subchannel
      sql: |
        CASE WHEN ${first_signup_indicator} = 1 THEN ${user_acquisition_channels.sub_channel}
        ELSE ${referral_url_lp_utm_campaign}
        END

  -    dimension: session_referral_code
       #description: The session's referral code
#       hidden: true
       view_label: Session Channel
       sql: ${TABLE}.referral_url_lp_referral_code


### Ray duplicate session_referral_code for filtering purpose

  -    dimension: session_referral_code_analysis
       #description: The session's referral code for analytical purpose
#       hidden: true
       view_label: Session Channel
       sql: ${TABLE}.referral_url_lp_referral_code


  -    dimension: session_referral_code_analysis_2
       #description: The session's referral code for analytical purpose
#       hidden: true
       view_label: Session Channel
       sql: ${TABLE}.referral_url_lp_referral_code


### Revenue Fields
## CY changed dimension to a measure to resolve lookml deprecation error on Aug 9 2017
  -    measure: total_revenue
       label: Total Price
       #description: Total price across all orders in the session
       view_label: Orders
       type: number
       value_format: '$#,##0.00'
       sql: (${total_order_total} - ${total_shipping_amount})  * 1.00
# AMANE changed total_revenue from ${total_order_toal} to minus shipping amount in price we have started shipping amount.
# any questions on above please contact me.

# added by SRYU for MAC + marketing team
  - dimension: referring_url
    #description: URL which the visit came from
    view_label: Landing Page
    sql: CASE WHEN LENGTH(${TABLE}.referring_url)=0 THEN ${referral_url_lp} ELSE ${TABLE}.referring_url END

# Gupta 12/14, Mac 12/21
  -   dimension: session_revenue_bucket_mkt
      view_label: Session Channel
      label: Session Revenue Bucket (MKT)
      sql: |
         CASE
         WHEN (${referral_url_lp_utm_medium} LIKE 'email' OR ${referral_url_lp} LIKE '%esponsys%' OR ${referral_url_lp} LIKE '%andrill%'  OR ${referring_url} LIKE '%esponsys%' OR ${referring_url} LIKE '%andrill%') THEN 'E-Mail'
         WHEN ((${referral_url_lp_referral_code} LIKE 'adwords_search%' AND ${referral_url_lp_referral_code} NOT IN ('adwords_search_brand_test1','adwords_search_brand')) OR (${referring_url_referral_code} LIKE 'adwords_search%' AND ${referring_url_referral_code} NOT IN ('adwords_search_brand_test1','adwords_search_brand'))) THEN 'Non_Brand_Google_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search_brand_test1' OR ${referral_url_lp_referral_code} LIKE 'adwords_search_brand' OR ${referral_url_lp_referral_code} LIKE 'adwords_thredup%' OR ${referring_url_referral_code} LIKE 'adwords_search_brand_test1' OR ${referring_url_referral_code} LIKE 'adwords_search_brand' OR ${referring_url_referral_code} LIKE 'adwords_thredup%') THEN 'Branded_Google_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'bing_search%' OR ${referring_url_referral_code} LIKE 'bing_search%') THEN 'Non_Brand_Bing_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'bing_thredup%' OR ${referring_url_referral_code} LIKE 'bing_thredup%' OR ${referral_url_lp_referral_code} LIKE 'bing_search_brand' OR ${referring_url_referral_code} LIKE 'bing_search_brand') THEN 'Branded_Bing_Search'
         WHEN (${referral_url_lp} LIKE '%adwords_pla%' OR ${referral_url_lp_referral_code} LIKE 'adwords_pla%' OR ${referring_url} LIKE '%code=adwords_pla%' OR ${referring_url_referral_code} LIKE '%code=adwords_pla%') THEN 'Google_PLA'
         WHEN (${referral_url_lp} LIKE '%bing_pla%' OR ${referral_url_lp_referral_code} LIKE '%bing_pla%' OR ${referring_url} LIKE '%code=bing_pla%' OR ${referring_url_referral_code} LIKE '%bing_pla%') THEN 'Bing_PLA'
         WHEN (${referral_url_lp} LIKE '%polyvore_pla%' OR ${referral_url_lp_referral_code} LIKE '%polyvore_pla%' OR ${referring_url} LIKE '%polyvore_pla%' OR ${referring_url_referral_code} LIKE '%polyvore_pla%') THEN 'Polyvore'
         WHEN (${referral_url_lp} LIKE '%datafeed_pla_connexity%' OR ${referral_url_lp_referral_code} LIKE '%datafeed_pla_connexity%' OR ${referring_url} LIKE '%datafeed_pla_connexity%' OR ${referring_url_referral_code} LIKE '%datafeed_pla_connexity%') THEN 'Connexity'
         WHEN (${referral_url_lp} LIKE '%datafeed_pla_ebaycn%' OR ${referral_url_lp_referral_code} LIKE '%datafeed_pla_ebaycn%' OR ${referring_url} LIKE '%datafeed_pla_ebaycn%' OR ${referring_url_referral_code} LIKE '%datafeed_pla_ebaycn%') THEN 'Ebay_Commerce_Network'
         WHEN (((${referral_url_lp_referral_code} LIKE '%fb%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%') OR (${referral_url_lp_referral_code} LIKE '%reta%fb%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%')))  THEN 'FB_EP_Retargeting'
         WHEN ((((${referral_url_lp_referral_code}) LIKE '%fb%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') OR (${referral_url_lp_referral_code} LIKE '%reta%fb%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') ))  THEN 'FB_Lead_Retargeting'
         WHEN (${referral_url_lp_referral_code} LIKE 'fb_%' OR ${referral_url_lp_referral_code} LIKE '%facebook%' OR ${session_subchannel} LIKE 'Facebook Ads' OR ${session_subchannel} LIKE '%fb%' OR ${session_subchannel} LIKE '%insta%') THEN 'Facebook'
         WHEN (${referral_url_lp_referral_code} LIKE '%yahoo%' OR ${referring_url_referral_code} LIKE '%yahoo%') THEN 'Yahoo'
         WHEN (${referral_url_lp_referral_code} LIKE 'youtube%' OR ${referring_url_referral_code} LIKE 'yahoo%') THEN 'Youtube'
         WHEN (${referral_url_lp_referral_code} LIKE 'pandora%' OR ${referring_url_referral_code} LIKE 'pandora%') THEN 'Pandora'
         WHEN (${referral_url_lp_referral_code} LIKE 'integrate%' OR ${referring_url_referral_code} LIKE 'integrate%') THEN 'Integrate'
         WHEN (${referral_url_lp_referral_code} LIKE 'display%' OR ${referring_url_referral_code} LIKE 'display%') THEN 'Display'
         WHEN (${referral_url_lp_referral_code} LIKE '%retar%' OR ${referring_url_referral_code} LIKE '%retar%' OR ${referral_url_lp_referral_code} LIKE '%criteo%' OR ${referring_url_referral_code} LIKE '%criteo%') THEN 'Retargeting'
         WHEN (((${referral_url_lp_referral_code} LIKE '%pint%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%') OR (${referral_url_lp_referral_code} LIKE '%reta%pint%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%')))  THEN 'Pinterest_EP_Retargeting'
         WHEN (((${referral_url_lp_referral_code} LIKE '%pint%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') OR (${referral_url_lp_referral_code} LIKE '%reta%pint%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%')))  THEN 'Pinterest_Lead_Retargeting'
         WHEN (${referral_url_lp_referral_code} LIKE '%pint%' OR ${session_subchannel} LIKE '%pint%') THEN 'Pinterest'
         WHEN (${referral_url_lp_referral_code} LIKE '%twitter%' OR ${referring_url_referral_code} LIKE '%twitter%') THEN 'Twitter'
         WHEN (${referral_url_lp_referral_code} LIKE 'leadg%' OR ${referring_url_referral_code} LIKE 'leadg%') THEN 'Other_Lead_Gen'
         WHEN (${referral_url_lp_utm_campaign} LIKE '%invites_%' OR ${referring_url_referral_code} LIKE '%invites_%') THEN 'Referrals'
         WHEN (${referring_url} LIKE '%www.google.%' OR ${referring_url} LIKE '%www.bing.%' OR ${referring_url} LIKE '%search.yahoo.%') THEN 'Organic_Search_(SEO)'
         WHEN (${referral_url_lp} LIKE '%linkshare%' OR ${referring_url} LIKE '%linkshare%') THEN 'Affiliate'
         WHEN (${referring_url} LIKE '%abcnews%' OR ${referral_url_lp} LIKE '%abcnews%' OR ${referring_url} LIKE '%businessinsider%' OR ${referral_url_lp} LIKE '%businessinsider%' OR ${referring_url} LIKE '%fortune%' OR ${referral_url_lp} LIKE '%fortune%' OR ${referring_url} LIKE '%penny%' OR ${referral_url_lp} LIKE '%penny%' OR ${referring_url} LIKE '%buzzfeed%' OR ${referral_url_lp} LIKE '%buzzfeed%' OR ${referring_url} LIKE '%mashable%' OR ${referral_url_lp} LIKE '%mashable%' OR ${referring_url} LIKE '%techcrunch%' OR ${referral_url_lp} LIKE '%techcrunch%') THEN 'PR'
         WHEN (${referring_url} LIKE '%.youtube.%' OR ${referral_url_lp} LIKE '%.youtube.%') THEN 'Vloggers'
         ELSE 'Organic'
         END

# TD 3.14.17
  -   dimension: session_bucket_high_level
      view_label: Session Channel
      label: High Level Session Bucket
      sql: |
         CASE
         WHEN ${session_revenue_bucket_mkt} = 'E-Mail' THEN 'E-Mail'
         WHEN ${session_revenue_bucket_mkt} in ('Non_Brand_Google_Search', 'Non_Brand_Bing_Search', 'Google_PLA', 'Bing_PLA', 'Polyvore', 'Connexity', 'Ebay_Commerce_Network') THEN 'Paid Search and PLA'
         WHEN ${session_revenue_bucket_mkt} in ('Organic') THEN 'Organic'
         WHEN ${session_revenue_bucket_mkt} in ('Branded_Google_Search', 'Branded_Bing_Search') THEN 'Branded Search'
         WHEN ${session_revenue_bucket_mkt} in ('Organic_Search_(SEO)') THEN 'SEO'
         WHEN ${session_revenue_bucket_mkt} in ('Facebook', 'Pinterest', 'Yahoo', 'Twitter') THEN 'Social Prospecting'
         WHEN ${session_revenue_bucket_mkt} in ('FB_Lead_Retargeting', 'Pinterest_Lead_Retargeting', 'FB_EP_Retargeting', 'Pinterest_EP_Retargeting') THEN 'Social Retargeting'
         ELSE 'Other' END



# atg 1 23 17 created to group ${session_revenue_bucket_mkt} into 5 main groups in order to categorize returning sessions

  -   dimension: session_bucket
      label: Session Bucket for repeat
      sql: |
         CASE
         WHEN ${session_revenue_bucket_mkt} IN ('Organic','E-Mail') THEN ${session_revenue_bucket_mkt}
         WHEN ${session_revenue_bucket_mkt} LIKE '%Search%' THEN 'Search'
         WHEN ${session_revenue_bucket_mkt} LIKE '%targeting%' THEN 'Retargeting'
         ELSE 'paid'
         END

# atg 1 26 17 created to group ${session_revenue_bucket_mkt} into 3 main groups in order to categorize new sessions

  -   dimension: session_bucket_a
      label: Session Bucket for acq
      sql: |
         CASE
         WHEN ${users_v3.paid_acquisition_bucket} IN ('Organic') THEN ${users_v3.paid_acquisition_bucket}
         WHEN ${users_v3.paid_acquisition_bucket} LIKE '%Search%' THEN 'Search'
         ELSE 'paid'
         END



  -   dimension: session_email_bucket
      view_label: Session Channel
      label: Session Email Bucket (MKT)
      sql: |
         CASE
         WHEN (${referral_url_lp_utm_campaign} LIKE 'Onboarding-' OR ${referral_url_lp_utm_campaign} LIKE '1TP' OR ${referral_url_lp_utm_campaign} LIKE '2TP' OR ${referral_url_lp_utm_campaign} LIKE 'Welcome' OR ${referral_url_lp_utm_campaign} LIKE 'Subscription') THEN 'Lifecycle E-Mail'
         WHEN (${referral_url_lp_utm_campaign} LIKE 'abandoned' OR ${referral_url_lp_utm_campaign} LIKE 'browse' OR ${referral_url_lp_utm_campaign} LIKE 'expiring' OR ${referral_url_lp_utm_campaign} LIKE 'tue' OR ${referral_url_lp_utm_campaign} LIKE 'Subscription' OR ${referral_url_lp_utm_campaign} LIKE 'tu4s' OR ${referral_url_lp_utm_campaign} LIKE 'mosaic') THEN 'Trigger_Buyer E-Mail'
         WHEN (${referral_url_lp_utm_campaign} LIKE 'bag' OR ${referral_url_lp_utm_campaign} LIKE 'consignment' OR ${referral_url_lp_utm_campaign} LIKE 'supplier') THEN 'Trigger_Seller E-Mail'
         WHEN (${referral_url_lp_utm_medium} LIKE 'email' AND ${referral_url_lp_utm_campaign} LIKE '15-') THEN 'Merch E-Mail'
         WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search%' AND ${referral_url_lp_referral_code} NOT IN('adwords_search_brand_test1','adwords_search_brand')) THEN 'Non_Brand_Google_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search_brand_test1' OR ${referral_url_lp_referral_code} LIKE 'adwords_search_brand' OR ${referral_url_lp_referral_code} LIKE 'adwords_thredup%') THEN 'Branded_Google_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'bing_search%') THEN 'Non_Brand_Bing_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'bing_thredup%'  OR ${referral_url_lp_referral_code} LIKE ('bing_search_brand')) THEN 'Branded_Bing_Search'
         WHEN (${referral_url_lp_referral_code} LIKE 'adwords_pla') THEN 'Google_PLA'
         WHEN (${referral_url_lp_referral_code} LIKE 'bing_pla') THEN 'Bing_PLA'
         WHEN (${referral_url_lp_referral_code} LIKE 'polyvore_pla') THEN 'Polyvore'
         WHEN (${referral_url_lp_referral_code} LIKE 'datafeed_pla_connexity') THEN 'Connexity'
         WHEN (${referral_url_lp_referral_code} LIKE 'datafeed_pla_ebaycn') THEN 'Ebay_Commerce_Network'
         WHEN (${referral_url_lp_referral_code} LIKE 'fb_%' OR ${referral_url_lp_referral_code} LIKE '%facebook%' OR ${session_subchannel} LIKE 'Facebook Ads' OR ${session_subchannel} LIKE '%fb%' OR ${referral_url_lp_utm_source} LIKE 'Facebook') THEN 'Facebook'
         WHEN (${referral_url_lp_referral_code} LIKE '%yahoo%') THEN 'Yahoo'
         WHEN (${referral_url_lp_referral_code} LIKE 'youtube%') THEN 'Youtube'
         WHEN (${referral_url_lp_referral_code} LIKE 'pandora%') THEN 'Pandora'
         WHEN (${referral_url_lp_referral_code} LIKE 'integrate%') THEN 'Integrate'
         WHEN (${referral_url_lp_referral_code} LIKE 'display%') THEN 'Display'
         WHEN (${referral_url_lp_referral_code} LIKE '%retar%' OR ${referral_url_lp_referral_code} LIKE '%criteo%')  THEN 'Retargeting'
         WHEN (${referral_url_lp_referral_code} LIKE '%pinterest%' OR ${user_acquisition_channels.sub_channel} LIKE '%pinterest%') THEN 'Pinterest'
         WHEN (${referral_url_lp_referral_code} LIKE '%twitter%') THEN 'Twitter'
         WHEN (${session_subchannel} LIKE '%super%') THEN 'Supersonic'
         WHEN (${session_subchannel} LIKE '%tap%') THEN 'Tapjoy'
         WHEN (${referral_url_lp_referral_code} LIKE 'leadg%') THEN 'Other_Lead_Gen'
         WHEN (${session_channel} LIKE '%eferral%') THEN 'Referrals'
         WHEN (${referring_url} LIKE 'www.google.' OR ${referring_url} LIKE 'www.bing.' OR ${referring_url} LIKE 'www.yahoo.') THEN 'Organic_Search_(SEO)'
         WHEN (${session_channel} LIKE '%rganic%') THEN 'Organic'
         WHEN (${session_channel} LIKE '%ffiliate%') THEN 'Affiliate'
         ELSE 'Other'
         END

# SRYU 1/11/16 adding fields for filter columns and cleanout pages

# FILTERS


  - dimension: count_of_sort_filters
    label: Number of Sort_by Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: ${TABLE}.count_of_sort_filters

  - dimension: count_of_sort_by_filters_indicator
    label: Sort_by Filter Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ sort_by filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_sort_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_sort_filters_by_session
    label: Count Sort_by Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 sort_by filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_sort_filters}>0 THEN 1 ELSE 0 END

  - dimension: count_of_style_filters
    label: Number of Style Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: ${TABLE}.count_of_style_filters

  - dimension: count_of_style_filters_indicator
    label: Style Filters Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ style filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_style_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_style_filters_by_session
    label: Count Style Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 style filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_style_filters}>0 THEN 1 ELSE 0 END

  - dimension: count_of_price_filters
    label: Number of Price Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: ${TABLE}.count_of_price_filters

  - dimension: count_of_price_filters_indicator
    label: Price Filter Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ price filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_price_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_price_filters_by_session
    label: Count Price Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 price filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_price_filters}>0 THEN 1 ELSE 0 END

  - dimension: count_of_color_filters
    label: Number of Color Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: ${TABLE}.count_of_color_filters

  - dimension: count_of_color_filters_indicator
    label: Color Filter Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ color filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_color_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_color_filters_by_session
    label: Count Color Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 color filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_color_filters}>0 THEN 1 ELSE 0 END

  - dimension: count_of_brand_filters
    label: Number of Brand Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: ${TABLE}.count_of_brand_filters

  - dimension: count_of_brand_filters_indicator
    label: Brand Filter Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ brand filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_brand_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_brand_filters_by_session
    label: Count Brand Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 brand filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_brand_filters}>0 THEN 1 ELSE 0 END

  - dimension: count_of_sizing_filters
    label: Number of Sizing Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: ${TABLE}.count_of_sizing_filters

  - dimension: count_of_sizing_filters_indicator
    label: Sizing Filter Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ size filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_sizing_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_sizing_filters_by_session
    label: Count Sizing Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 size filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_sizing_filters}>0 THEN 1 ELSE 0 END

  - dimension: count_of_any_filters
    label: Count of Total (Any) Filters Applied
    view_label: Filters
    type: number
    hidden: true
    sql: |
        CASE WHEN ${count_of_sizing_filters}>0 OR
        ${count_of_brand_filters}>0 OR
        ${count_of_price_filters}>0 OR
        ${count_of_sort_filters}>0 OR
        ${count_of_style_filters}>0 OR
        ${count_of_color_filters}>0
        THEN 1
        ELSE 0
        END

  - dimension: count_of_any_filters_indicator
    label: Any Filter Indicator (0/1)
    view_label: Filters
    #description: Indicates the session had 1+ filter applied
    type: number
    sql: |
        CASE WHEN ${count_of_any_filters}>0 THEN 1 ELSE 0 END

  - measure: count_of_any_filters_by_session
    label: Count Any Filter Indicator (0/1)
    view_label: Filters
    #description: Measurement to count sessions with at least 1 filter applied
    type: sum
    sql: |
        CASE WHEN ${count_of_any_filters}>0 THEN 1 ELSE 0 END

  # 2017/07/07 : Commented the dim and added the measure total_no_of_filters to remove lookml deprecation warnings by Gayatri P

#   - dimension: total_no_of_filters
#     #description: The number of filters applied in the session
#     type: sum
#     sql: ${count_of_sizing_filters}+${count_of_brand_filters}+${count_of_price_filters}
#          +${count_of_sort_filters}+${count_of_style_filters}+${count_of_color_filters}

  - measure: total_no_of_filters
    #description: The number of filters applied in the session
    type: sum
    sql: ${count_of_sizing_filters}+${count_of_brand_filters}+${count_of_price_filters}
         +${count_of_sort_filters}+${count_of_style_filters}+${count_of_color_filters}

# BADASS MOMS

  - dimension: count_of_badassmoms
    label: Number of Badass Moms Page Loads
    view_label: Badass Moms
    type: number
    hidden: true
    sql: ${TABLE}.count_of_badassmoms

  - dimension: count_of_badassmoms_filters_indicator
    label: Badass Moms Indicator (0/1)
    view_label: Badass Moms
    #description: Indicates the session had 1+ Badass Moms page load
    type: number
    sql: |
        CASE WHEN ${count_of_badassmoms}>0 THEN 1 ELSE 0 END

  - measure: count_of_badassmoms_filters_by_session
    label: Count Badass Mom Indicator (0/1)
    view_label: Badass Moms
    #description: Measurement to count sessions with at least 1 Badass Mom page load
    type: sum
    sql: |
        CASE WHEN ${count_of_badassmoms}>0 THEN 1 ELSE 0 END

# CLEANOUT

  - dimension: count_of_any_cleanout_nav
    label: Number of Cleanout Page Views
    view_label: Cleanout
    type: number
    hidden: true
    sql: ${TABLE}.count_of_any_cleanout_nav

  # 2017/07/07 : Commented the dim and added the measure count_of_any_cleanout_navigation to remove lookml deprecation warnings by Gayatri P

#   - dimension: count_of_any_cleanout_navigation
#     #description: The number of cleanout navigation events in the session
#     type: sum
#     sql: ${TABLE}.count_of_any_cleanout_nav

  - measure: count_of_any_cleanout_navigation
    #description: The number of cleanout navigation events in the session
    type: sum
    sql: ${TABLE}.count_of_any_cleanout_nav

  - dimension: count_of_any_cleanout_nav_indicator
    label: Any Cleanout Page Indicator (0/1)
    view_label: Cleanout
    #description: Indicates the session had 1+ Cleanout page views
    type: number
    sql: |
        CASE WHEN ${count_of_any_cleanout_nav}>0 THEN 1 ELSE 0 END

  - measure: count_of_any_cleanout_nav_by_session
    label: Count Any Cleanout Page Indicator (0/1)
    view_label: Cleanout
    #description: Measurement to count sessions with at least 1 cleanout page views
    type: sum
    sql: |
        CASE WHEN ${count_of_any_cleanout_nav}>0 THEN 1 ELSE 0 END


# PDLP Views

  - dimension:  count_of_pdlp_page_views
    label: Number PDLP Page View
    view_label: PDLP
    type: number
    hidden: true
    sql: ${TABLE}.count_of_pdlp_page_views

  - dimension:  count_of_pdlp_page_views_indicator
#    hidden: true
    label: PDLP Indicator (0/1)
    view_label: PDLP
    #description: Indicates the session had 1+ PDLP Views
    type: number
    sql: |
        CASE WHEN ${count_of_pdlp_page_views}>0 THEN 1 ELSE 0 END

  - measure: count_of_pdlp_page_views_indicator_by_session
#    hidden: true
    label: Count PDLP Indicator (0/1)
    view_label: PDLP
    #description: Measurement to count sessions with at least 1 PDLP view
    type: sum
    sql: |
        CASE WHEN ${count_of_pdlp_page_views}>0 THEN 1 ELSE 0 END

# Time Bucketing

  - dimension: total_session_time_minutes
    hidden: true
    view_label: Fact Sessions
    sql: ${total_session_time}/60

#atg 10 31 16 changed type to tier, just plain easier than case when statement

  - dimension: total_session_time_buckets
    label: Total Session Time Buckets
    type: tier
    view_label: Fact Sessions
    tiers: [-1000,0,5,10,15,30]
    style: integer
    sql: ${total_session_time_minutes}


#        CASE WHEN ${total_session_time_minutes} < 5 THEN '1) Less than 5 Minutes'
#       WHEN ${total_session_time_minutes} >= 5 AND ${total_session_time_minutes} < 30 THEN '2) Between 5 and 30 Minutes'
#       WHEN ${total_session_time_minutes} >=30 AND ${total_session_time_minutes} <60 THEN '3) Between 30 and 60 Minutes'
#       WHEN ${total_session_time_minutes} >=60 THEN '4) Greater than 60 Minutes'
#       ELSE 'error'
#       END


# Bounced

  - dimension: is_bounced
    label: Bounced Session Indicator (0/1)
    #description: Indicates if a user bounces from the site (spends 0 seconds)
    view_label: Fact Sessions
    type: number
    sql: |
        CASE WHEN ${total_session_time}=0 THEN 1
        ELSE 0
        END

  - measure: count_of_bounced_sessions
    label: Count of Bounced Sessions Indicator (0/1)
    #description: Measurement to count sessions where a user bounces from the site
    view_label: Fact Sessions
    type: sum
    sql: |
        CASE WHEN ${total_session_time}=0 THEN 1
        ELSE 0
        END

# Modal

  - dimension: count_of_signup_modal
    hidden: true
    type: number
    sql: ${TABLE}.count_of_signup_modal

  - dimension: signup_modal_indicator
    label: Signup Modal Indicator (0/1)
    #description: Indicates the session had at least 1 signup modal view
    view_label: Modal
    type: number
    sql: |
      CASE WHEN ${count_of_signup_modal}>0 THEN 1 ELSE 0 END

  - measure: signup_modal_count
    label: Count Signup Modal Indicator (0/1)
    #description: Measurement to count sessions with at least 1 signup modal view
    view_label: Modal
    type: sum
    sql: ${signup_modal_indicator}

  - dimension: count_of_homepage_logged_out
    hidden: true
    type: number
    sql: ${TABLE}.count_of_homepage_logged_out

  - dimension: count_of_homepage_logged_in
    hidden: true
    type: number
    sql: ${TABLE}.count_of_homepage_logged_in

# added by sryu on 5.10.16 to find signup MODAL bounce rate

  - dimension: signup_modal_yes
    hidden: true
    sql: |
      CASE WHEN ${signup_modal_indicator} = 1 AND ${count_of_logged_in} = 0 THEN 1
      ELSE 0
      END

  - measure: count_of_signup_modal_bounce
    type: number
    sql: sum(${signup_modal_yes})


# 2/16/16

#   - dimension: signup_to_first_purchase_count
# #    hidden: true
#     label: Signup to First Purchase Count
#     sql: ${session_idx}
#     type: count_distinct
#     filters:
#       first_signup_indicator: '1'
#       indicator_for_paid_item_orders: '1'

# 3.8.16 Added by Sryu for time and visits between SU and 1TP, and between First Visit and SU
#   - dimension: session_idx_parse
#     hidden: true
#     sql: REGEXP_REPLACE(session_idx, '^.*-')

  - dimension: ever_purchased_indicator
    label: Ever Purchased Indicator (0/1)
    sql: |
       CASE WHEN (${session_start_time} > ${partitioned_item_orders_by_users.purchased_at}) THEN 1
       ELSE 0
       END

#   - dimension: sr_for_count_of_visits
#     hidden: true
#     sql: |
#        CASE WHEN ${session_start_raw} > ${partitioned_item_orders_by_users.purchased_at} AND ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} = 0 THEN 0
#        WHEN ${session_start_raw} < ${partitioned_item_orders_by_users.purchased_at} AND ${session_start_raw} >= ${users.first_login_raw} AND ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} = 0 THEN 1
#        ELSE 0
#        END
#
#   - measure: count_of_visits_between_su_and_1tp
#     label: Count of Sessions Between SU and 1TP
#     type: sum
#     sql: ${sr_for_count_of_visits}
#     required_joins: [users]
#
#   - dimension: user_with_first_purchase
# #    hidden: true
#     type: yesno
#     sql: ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} = 1

  - dimension: user_with_zero_to_first_purchase
    hidden: true
    type: yesno
    sql: ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} >= 0 AND ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} <1



#   - measure: count_of_users_with_first_purchase
# #    hidden: true
#     type: count_distinct
#     sql: ${canonical_user_id}
#     filters:
#       user_with_first_purchase: yes

  - measure: count_of_users_with_first_purchase
    hidden: true
    label: Count of Users with First Purchase
    type: count_distinct
    sql: ${canonical_user_id}
    filters:
      item_order_sequence_for_model_1.item_order_sequence_at_start_of_session: '0'
      partitioned_item_orders_by_users.item_order_sequence: '1'

  - measure: count_of_sessions_between_su_and_1tp_final
    label: Count of Sessions between SU and 1TP per User
    type: number
    value_format: '0.0'
    sql: |
      CASE WHEN ${count_of_users_with_first_purchase} > 0 THEN ${count_of_visits_between_su_and_1tp}/(${count_of_users_with_first_purchase} * 1.00)
      ELSE 0
      END

  - measure: count_of_visits_between_su_and_1tp
    label: Count of Sessions Between SU and 1TP
    hidden: true
    type: count_distinct
    sql: ${session_idx}
    filters:
      user_with_zero_to_first_purchase: yes
      partitioned_item_order_sequence_indicator: '1'

  - dimension: partitioned_item_order_sequence_indicator
    hidden: true
    sql: |
      CASE WHEN ${partitioned_item_orders_by_users.item_order_sequence} = 0 THEN 0
      WHEN ${partitioned_item_orders_by_users.item_order_sequence} IS NULL THEN 0
      ELSE 1
      END

  - dimension: sr_for_count_of_visits_until_su
    hidden: true
    sql: |
      CASE WHEN ${users.first_login_time} IS NOT NULL AND (${session_end_time} < ${users.first_login_time}) THEN 1
      ELSE 0
      END

  - measure: count_of_visits_between_first_visit_and_su
    label: Count of Sessions Between First Visit and SU
    type: sum
    sql: ${sr_for_count_of_visits_until_su}

# 2017/07/07 : Commented the dim and added the measure count_of_users_with_a_su to remove lookml deprecation warnings by Gayatri P

#   - dimension: count_of_users_with_a_su
# #    hidden: true
#     type: count_distinct
#     sql: ${canonical_user_id}
#     filters:
#       count_of_logged_in_indicator: '1'

  - measure: count_of_users_with_a_su
#    hidden: true
    type: count_distinct
    sql: ${canonical_user_id}
    filters:
      count_of_logged_in_indicator: '1'

# Needs to validated.
  - dimension: session_time_between_su_and_1tp_indicator
    hidden: true
    sql: |
       CASE WHEN ${session_start_raw} > ${partitioned_item_orders_by_users.purchased_at} THEN 0
       WHEN (${session_start_raw} < ${partitioned_item_orders_by_users.purchased_at}) AND (${session_start_raw} > ${users.first_login_time}) THEN ${total_session_time}
       ELSE 0
       END

# Please validate before commit
  - measure: total_session_time_between_su_and_1tp
    label: Total Session Time Between SU and 1TP
    type: sum
    sql: ${session_time_between_su_and_1tp_indicator}

  - dimension: session_time_between_first_visit_and_su
    hidden: true
    sql: |
      CASE WHEN ${users.first_login_time} IS NOT NULL AND (${session_end_time} < ${users.first_login_time}) THEN ${total_session_time}
      ELSE 0
      END

  - measure: total_session_time_between_first_visit_and_su
    label: Total Session Time Between First Visit and SU
    type: sum
    sql: ${session_time_between_first_visit_and_su}

# 3.9.16 Added by Sryu to create groups for signup method: FB, Amazon and Email

  - dimension: fb_amazon_email
    label: Signup Method Groups (FB, Amazon, Email)
    sql: |
      CASE WHEN ${user_acquisition_channels.signup_method} LIKE 'email_modal%' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_signup_panel_referral%' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_signup_panel%' OR ${user_acquisition_channels.signup_method} LIKE 'yahoo_landing_page' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_signup_form' OR ${user_acquisition_channels.signup_method} LIKE 'iPhone' OR ${user_acquisition_channels.signup_method} LIKE 'iPad' OR ${user_acquisition_channels.signup_method} LIKE 'android_smartphone' OR ${user_acquisition_channels.signup_method} LIKE 'standalone_signup_form%' THEN 'Email'
      WHEN ${user_acquisition_channels.signup_method} LIKE 'facebook_signup%' OR ${user_acquisition_channels.signup_method} LIKE 'iPhone_facebook_signup' OR ${user_acquisition_channels.signup_method} LIKE 'yahoo_landing_page_facebook' OR ${user_acquisition_channels.signup_method} LIKE 'iPad_facebook_signup' OR ${user_acquisition_channels.signup_method} LIKE 'android_smartphone_facebook_signup' OR ${user_acquisition_channels.signup_method} LIKE 'android_tablet_facebook_signup' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_facebook_signup%' THEN 'Facebook'
      WHEN ${user_acquisition_channels.signup_method} LIKE 'onboarding_modal_amazon%' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_signup_panel_amazon%' OR ${user_acquisition_channels.signup_method} LIKE 'yahoo_landing_page_amazon' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_signup_panel_referral_amazon' OR ${user_acquisition_channels.signup_method} LIKE '_amazon%' OR ${user_acquisition_channels.signup_method} LIKE 'email_modal_amazon' OR ${user_acquisition_channels.signup_method} LIKE 'standalone_signup_form_amazon' OR ${user_acquisition_channels.signup_method} LIKE 'mobile_web_onboarding_modal_amazon%' THEN 'Amazon'
      ELSE 'Other'
      End

# 3.10.16 Added by Sryu to create metric for reengagement after signup

# Re-Entries Metrics removed and move to fact_sessions_reentries 24 hrs and 7 cal days respectively

# added by SRYU on 3.16.16 for signup bounce rate

  - dimension: count_of_signup_bounces_metric
    hidden: true
    sql: |
      CASE WHEN ${exit_page_url} LIKE 'https://www.thredup.com/?new_user=true' AND ${first_signup_indicator} = 1 THEN 1
      ELSE 0
      END

  - measure: count_of_signup_bounces
    label: Count of Signup Bounces
    type: sum
    sql: ${count_of_signup_bounces_metric}

# Added by sryu on 3.21.18 for avg PDP views

  - measure: sum_count_of_pdp_views
    #hidden: true
    label: Sum of the Count of PDP Views (for web, mw only)
    type: sum
    sql: ${count_of_any_pdp}

  - measure: avg_count_of_pdp_views
    label: Avg Count of PDP Views (for web, mw only)
    type: number
    value_format_name: decimal_1
    sql: |
      CASE WHEN ${count_of_users_who_view_a_pdp} = 0 THEN 0 ELSE (${sum_count_of_pdp_views}/${count_of_users_who_view_a_pdp}) END

  - measure: count_of_users_who_view_a_pdp
    #hidden: true
    type: count_distinct
    sql: ${canonical_user_id}
    filters:
      indicator_for_any_pdp_page_view: '1'

# Added by sryu on 3.30.16 for error code columns

  - dimension: count_of_any_checkout_error
    label: Count of Any Checkout Error Indicator (0/1)
    view_label: Errors
    type: number
    sql: |
      CASE WHEN ${count_of_shipping_address_error}>0 OR ${count_of_promo_code_error}>0
      THEN 1
      ELSE 0
      END

  - dimension: count_of_shipping_address_error
    hidden: true
    sql: ${TABLE}.count_of_shipping_address_error

  - dimension: count_of_shipping_address_error_dimension
    label: Checkout Shipping Address Error Indicator (0/1)
    view_label: Errors
    type: number
    sql: |
       CASE WHEN ${count_of_shipping_address_error}>0 THEN 1 ELSE 0 END

  - measure: count_of_shipping_address_error_measure
    label: Count Checkout Shipping Address Error Indicator (0/1)
    view_label: Errors
    type: sum
    sql: |
      CASE WHEN ${count_of_shipping_address_error}>0 THEN 1 ELSE 0 END

  - dimension: count_of_promo_code_error
    hidden: true
    sql: ${TABLE}.count_of_promo_code_error

  - dimension: count_of_promo_code_error_dimension
    label: Checkout Promo Code Error Indicator (0/1)
    view_label: Errors
    type: number
    sql: |
       CASE WHEN ${count_of_promo_code_error}>0 THEN 1 ELSE 0 END

  - measure: count_of_promo_code_error_measure
    label: Count Checkout Promo Code Error Indicator (0/1)
    view_label: Errors
    type: sum
    sql: |
      CASE WHEN ${count_of_promo_code_error}>0 THEN 1 ELSE 0 END

  - dimension: count_of_featured
    hidden: true
    sql: ${TABLE}.count_of_featured

  - dimension: count_of_featured_dimension
    label: Featured (apps) Indicator (0/1)
    view_label: Homepage
    type: number
    sql: |
       CASE WHEN ${count_of_featured}>0 THEN 1 ELSE 0 END

  - measure: count_of_featured_measure
    label: Count Featured (apps) Indicator (0/1)
    view_label: Homepage
    type: sum
    sql: |
      CASE WHEN ${count_of_featured}>0 THEN 1 ELSE 0 END


#abandoned_cart_details
# AMANE ADDED ON MAY 10 to Test. NOt required
#   - dimension: is_abandoncart_session
#     type: yesno
#     sql: ${abandoned_cart.session_idx} IS NOT NULL

# MAY 14 /2016

  - dimension: exp_visitor_id
#    hidden: true
    sql: ${TABLE}.exp_visitor_id

# added by sryu on 5/17/16 for my sizes/brands/info

  - dimension: total_search_results_shown
    view_label: My Sizes/Brands
#    hidden: true
    sql: ${TABLE}.total_search_results_shown

  - dimension: count_of_page_views
#    hidden: true
    sql: ${TABLE}.count_of_page_views

  - measure: total_count_of_page_views
    type: sum
    sql: ${TABLE}.count_of_page_views

  - dimension: count_of_hub
    view_label: Hub Page
#    hidden: true
    sql: ${TABLE}.count_of_hub

  - dimension: count_of_profile_brand
    hidden: true
    sql: ${TABLE}.count_of_profile_brand

  - dimension: count_of_profile_size
    hidden: true
    sql: ${TABLE}.count_of_profile_size

  - dimension: count_of_profile_shown_indicator
    hidden: true
    sql: ${TABLE}.count_of_profile_shown_indicator

  - dimension: count_of_search_results
    view_label: Search
#    hidden: true
    sql: ${TABLE}.count_of_search_results

  - dimension: count_of_size_and_brand_profile
    label: Used Size AND Brand Profile Indicator (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN ${size_profile_overall} > 0 AND ${brand_profile_overall} > 0 THEN 1
      ELSE 0
      END

  - measure: count_of_size_and_brand_profile_measure
    label: Count Used Size AND Brand Profile Indicator (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${count_of_size_and_brand_profile}

  - dimension: count_of_size_profile_only_indicator
    label: Size Profile Only Indicator (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN ${count_of_profile_size} > 0 AND (${count_of_profile_brand} = 0 OR ${count_of_profile_brand} IS NULL) THEN 1
      ELSE 0
      END

  - measure: count_of_size_profile_only_measure
    label: Count Size Profile Only Indicator (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${count_of_size_profile_only_indicator}

  - dimension: count_of_brand_profile_only_indicator
    label: Brand Profile Only Indicator (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN ${count_of_profile_brand} > 0 AND (${count_of_profile_size} = 0 OR ${count_of_profile_size} IS NULL) THEN 1
      ELSE 0
      END

  - measure: count_of_brand_profile_only_measure
    label: Count Brand Profile Only Indicator (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${count_of_brand_profile_only_indicator}

  - dimension: count_of_profile_shown_indicator_sr
    hidden: true
    label: Profile Shown Indicator (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN ${count_of_profile_shown_indicator} > 0 THEN 1
      ELSE 0
      END

  - measure: count_of_profile_shown_measure
    hidden: true
    label: Count Profile Shown Indicator (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${count_of_profile_shown_indicator_sr}

  - dimension: count_of_hub_page_indicator
    label: Hub Page Indicator (0/1)
    view_label: Hub Page
    sql: |
      CASE WHEN ${count_of_hub} > 0 THEN 1
      ELSE 0
      END

  - measure: count_of_hub_page_measure
    label: Count Hub Page Indicator (0/1)
    view_label: Hub Page
    type: sum
    sql: ${count_of_hub_page_indicator}

# for my sizes/brands analysis

  - dimension: people_who_used_profile_either_size_or_brand
    label: Used Size OR Brand Profile Indicator (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN ${size_profile_overall} > 0 OR ${brand_profile_overall} > 0 THEN 1
      ELSE 0
      END

  - measure: count_people_who_used_profile_either_size_or_brand
    label: Count Used Size OR Brand Profile Indicator (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${people_who_used_profile_either_size_or_brand}

  - dimension: size_profile_overall
    label: Size Profile Indicator (users could have also had a brand profile) (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN (${count_of_profile_size} > 0 OR ${count_of_profile_size} IS NOT NULL) THEN 1
      ELSE 0
      END

  - measure: count_size_profile_overall
    label: Count Size Profile Indicator (users could have also had a brand profile) (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${size_profile_overall}

  - dimension: brand_profile_overall
    label: Brand Profile Indicator (users could have also had a size profile) (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN (${count_of_profile_brand} > 0 OR ${count_of_profile_brand} IS NOT NULL) THEN 1
      ELSE 0
      END

  - measure: count_brand_profile_overall
    label: Count Brand Profile Indicator (users could have also had a size profile) (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${brand_profile_overall}

  - dimension: 50_percent_rollout
    hidden: true
#     type: yesno
    sql: |
      CASE WHEN LENGTH(canonical_user_id) < 10 AND MOD(CAST(canonical_user_id as INT), 10) < 5 THEN 1
       ELSE 0
      END

  - dimension: 50_percent_rollout_overall
    label: 50 Percent Rollout Indicator (0/1)
    sql: |
      CASE WHEN ${session_start_time} > '2016-05-16 HH15:00:00' THEN ${50_percent_rollout}
      WHEN ${session_start_time} < '2016-05-16 HH15:00:00' AND ${session_start_time} > '2016-05-11 HH01:00:00' THEN ${count_of_profile_shown_indicator_sr}
      ELSE NULL
      END

  - dimension: new_nav_5_percent_rollout
    hidden: true
    sql: |
      CASE WHEN LENGTH(${canonical_user_id}) < 10 AND MOD(CAST(${canonical_user_id} as INT), 100) < 5 THEN 1
      ELSE 0
      END

  - dimension: new_nav_5_percent_rollout_overall
    label: New Nav 5 Percent Rollout Indicator (0/1)
    sql: |
      CASE WHEN ${session_start_time} > '2016-11-03 13:30:00' THEN ${new_nav_5_percent_rollout}
      ELSE NULL
      END

  - dimension: new_nav_20_percent_rollout
    hidden: true
    sql:
    |
      CASE WHEN LENGTH(${canonical_user_id}) < 10 AND MOD(CAST(${canonical_user_id} as INT), 100) < 20 THEN 1
      ELSE 0
      END

  - dimension: new_nav_20_percent_rollout_overall
    label: New Nav 20 Percent Rollout Indicator (0/1)
    sql: |
      CASE WHEN ${session_start_time} > '2016-11-09 12:11:00' THEN ${new_nav_20_percent_rollout}
      ELSE NULL
      END

  - dimension: new_nav_50_percent_rollout
    hidden: true
    sql: |
      CASE WHEN LENGTH(${canonical_user_id}) < 10 AND MOD(CAST(${canonical_user_id} as INT), 100) < 50 THEN 1
      ELSE 0
      END

  - dimension: new_nav_50_percent_rollout_overall
    label: New Nav 50 Percent Rollout Indicator (0/1)
    sql: |
      CASE WHEN ${session_start_time} > '2016-11-11 15:36:00' THEN ${new_nav_50_percent_rollout}
      ELSE NULL
      END

  - dimension: no_sizing_filter_no_profile
    label: No Sizing Filter No Profile Indicator (0/1)
    view_label: My Sizes/Brands
    sql: |
      CASE WHEN ${people_who_used_profile_either_size_or_brand} = 0 AND ${count_of_sizing_filters_indicator} = 0
      THEN 1
      ELSE 0
      END

  - measure: no_sizing_filter_no_profile_count
    label: Count No Sizing Filter No Profile Indicator (0/1)
    view_label: My Sizes/Brands
    type: sum
    sql: ${no_sizing_filter_no_profile}

# sryu added for paid session bucket

  - dimension: paid_session_bucket
    label: Paid Session Bucket (MKT)
    sql: |
     CASE
     WHEN (${session_subchannel} LIKE '%logger%' OR ${referral_url_lp_referral_code} LIKE '%blog%' OR ${referral_url_lp_referral_code} LIKE '%vlog%' OR ${influencers.email} is not null) THEN 'Influencers'
     WHEN (((${referral_url_lp_referral_code} LIKE '%fb%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%') OR (${referral_url_lp_referral_code} LIKE '%reta%fb%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%')))  THEN 'FB_EP_Retargeting'
     WHEN ((((${referral_url_lp_referral_code}) LIKE '%fb%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') OR (${referral_url_lp_referral_code} LIKE '%reta%fb%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') ))  THEN 'FB_Lead_Retargeting'
     WHEN (${referral_url_lp_referral_code} LIKE 'fb_%' OR ${referral_url_lp_referral_code} LIKE '%facebook%' OR ${session_subchannel} LIKE 'Facebook Ads' OR ${session_subchannel} LIKE '%fb%' OR ${session_subchannel} LIKE '%insta%') THEN 'Facebook'
     WHEN (((${referral_url_lp_referral_code} LIKE '%pint%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%') OR (${referral_url_lp_referral_code} LIKE '%reta%pint%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%')))  THEN 'Pinterest_EP_Retargeting'
     WHEN (((${referral_url_lp_referral_code} LIKE '%pint%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') OR (${referral_url_lp_referral_code} LIKE '%reta%pint%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%')))  THEN 'Pinterest_Lead_Retargeting'
     WHEN (${referral_url_lp_referral_code} LIKE '%pint%' OR ${session_subchannel} LIKE '%pint%') THEN 'Pinterest'
     WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search%' AND ${referral_url_lp_referral_code} NOT IN ('adwords_search_brand_test1','adwords_search_brand')) THEN 'Non_Branded_Google_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search_brand_test1' OR ${referral_url_lp_referral_code}  LIKE 'adwords_search_brand' OR ${referral_url_lp_referral_code}  LIKE 'adwords_thredup%') THEN 'Branded_Google_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'bing_search%' AND ${referral_url_lp_referral_code} NOT IN ('bing_search_brand')) THEN 'Non_Branded_Bing_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'bing_thredup%'  OR ${referral_url_lp_referral_code} LIKE ('bing_search_brand')) THEN 'Branded_Bing_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'adwords_pla%') THEN 'Google_PLA'
     WHEN (${referral_url_lp_referral_code} LIKE 'bing_pla%') THEN 'Bing_PLA'
     WHEN (${referral_url_lp_referral_code} LIKE 'polyvore_pla%') THEN 'Polyvore'
     WHEN (${referral_url_lp_referral_code} LIKE 'datafeed_pla_connexity%') THEN 'Connexity'
     WHEN (${referral_url_lp_referral_code} LIKE 'datafeed_pla_ebaycn%') THEN 'Ebay_Commerce_Network'
     WHEN (${referral_url_lp_referral_code} LIKE '%yahoo%') THEN 'Yahoo'
     WHEN (${referral_url_lp_referral_code} LIKE 'youtube%') THEN 'Youtube'
     WHEN (${referral_url_lp_referral_code} LIKE 'pandora%') THEN 'Pandora'
     WHEN (${referral_url_lp_referral_code} LIKE 'integrate%') THEN 'Integrate'
     WHEN (${referral_url_lp_referral_code} LIKE 'display%') THEN 'Display'
     WHEN (${referral_url_lp_referral_code} LIKE '%retar%' OR ${referral_url_lp_referral_code} LIKE '%criteo%')  THEN 'Retargeting'
     WHEN (${referral_url_lp_referral_code} LIKE '%twitter%') THEN 'Twitter'
     WHEN (${session_subchannel} LIKE '%super%') THEN 'Supersonic'
     WHEN (${session_subchannel} LIKE '%tap%') THEN 'Tapjoy'
     WHEN (${referral_url_lp_referral_code} LIKE 'leadg%') THEN 'Other_Lead_Gen'
     WHEN (${session_channel} LIKE '%rganic%') THEN 'Organic'
     WHEN (${session_channel} LIKE '%eferral%') THEN 'Referrals'
     WHEN (${session_channel} LIKE '%ffiliat%') THEN 'Affiliate'
     WHEN (${session_channel} NOT IN ('Paid')) THEN 'Other_Not_Paid'
     ELSE 'Organic'
     END



  - dimension: paid_first_session_bucket
    label: Paid FIRST Session Bucket (MKT)
    sql: |
     CASE
     WHEN ${first_visit_indicator} = 0 THEN 'N/A'
     WHEN (${session_subchannel} LIKE '%logger%' OR ${referral_url_lp_referral_code} LIKE '%blog%' OR ${referral_url_lp_referral_code} LIKE '%vlog%' OR ${influencers.email} is not null) THEN 'Influencers'
     WHEN (((${referral_url_lp_referral_code} LIKE '%fb%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%') OR (${referral_url_lp_referral_code} LIKE '%reta%fb%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%')))  THEN 'FB_EP_Retargeting'
     WHEN (((${referral_url_lp_referral_code} LIKE '%fb%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') OR (${referral_url_lp_referral_code} LIKE '%reta%fb%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%')))  THEN 'FB_Lead_Retargeting'
     WHEN (${referral_url_lp_referral_code} LIKE 'fb_%' OR ${referral_url_lp_referral_code} LIKE '%facebook%' OR ${session_subchannel} LIKE 'Facebook Ads' OR ${session_subchannel} LIKE '%fb%' OR ${session_subchannel} LIKE '%insta%') THEN 'Facebook'
     WHEN (((${referral_url_lp_referral_code} LIKE '%pint%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%') OR (${referral_url_lp_referral_code} LIKE '%reta%pint%' AND ${referral_url_lp_referral_code} NOT LIKE '%np%')))  THEN 'Pinterest_EP_Retargeting'
     WHEN (((${referral_url_lp_referral_code} LIKE '%pint%reta%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%') OR (${referral_url_lp_referral_code} LIKE '%reta%pint%' AND ${referral_url_lp_referral_code} NOT LIKE '%ep%')))  THEN 'Pinterest_Lead_Retargeting'
     WHEN (${referral_url_lp_referral_code} LIKE '%pint%' OR ${session_subchannel} LIKE '%pint%') THEN 'Pinterest'
     WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search%' AND ${referral_url_lp_referral_code} NOT IN ('adwords_search_brand_test1','adwords_search_brand')) THEN 'Non_Branded_Google_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'adwords_search_brand_test1' OR ${referral_url_lp_referral_code}  LIKE 'adwords_search_brand' OR ${referral_url_lp_referral_code}  LIKE 'adwords_thredup%') THEN 'Branded_Google_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'bing_search%' AND ${referral_url_lp_referral_code} NOT IN ('bing_search_brand')) THEN 'Non_Branded_Bing_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'bing_thredup%'  OR ${referral_url_lp_referral_code} LIKE ('bing_search_brand')) THEN 'Branded_Bing_Search'
     WHEN (${referral_url_lp_referral_code} LIKE 'adwords_pla%') THEN 'Google_PLA'
     WHEN (${referral_url_lp_referral_code} LIKE 'bing_pla%') THEN 'Bing_PLA'
     WHEN (${referral_url_lp_referral_code} LIKE 'polyvore_pla%') THEN 'Polyvore'
     WHEN (${referral_url_lp_referral_code} LIKE 'datafeed_pla_connexity%') THEN 'Connexity'
     WHEN (${referral_url_lp_referral_code} LIKE 'datafeed_pla_ebaycn%') THEN 'Ebay_Commerce_Network'
     WHEN (${referral_url_lp_referral_code} LIKE '%yahoo%') THEN 'Yahoo'
     WHEN (${referral_url_lp_referral_code} LIKE 'youtube%') THEN 'Youtube'
     WHEN (${referral_url_lp_referral_code} LIKE 'pandora%') THEN 'Pandora'
     WHEN (${referral_url_lp_referral_code} LIKE 'integrate%') THEN 'Integrate'
     WHEN (${referral_url_lp_referral_code} LIKE 'display%') THEN 'Display'
     WHEN (${referral_url_lp_referral_code} LIKE '%retar%' OR ${referral_url_lp_referral_code} LIKE '%criteo%')  THEN 'Retargeting'
     WHEN (${referral_url_lp_referral_code} LIKE '%twitter%') THEN 'Twitter'
     WHEN (${session_subchannel} LIKE '%super%') THEN 'Supersonic'
     WHEN (${session_subchannel} LIKE '%tap%') THEN 'Tapjoy'
     WHEN (${referral_url_lp_referral_code} LIKE 'leadg%') THEN 'Other_Lead_Gen'
     WHEN (${session_channel} LIKE '%rganic%') THEN 'Organic'
     WHEN (${session_channel} LIKE '%eferral%') THEN 'Referrals'
     WHEN (${session_channel} LIKE '%ffiliat%') THEN 'Affiliate'
     WHEN (${session_channel} NOT IN ('Paid')) THEN 'Other_Not_Paid'
     ELSE 'Organic'
     END


# added by SRYU on 6.23.16

  - dimension: count_of_logged_in
    hidden: true
    sql: ${TABLE}.count_of_logged_in

  - dimension: count_of_logged_in_indicator
    label: Logged In Indicator (0/1)
    sql: |
      CASE WHEN ${TABLE}.count_of_logged_in > 0 THEN 1
      ELSE 0
      END

  - measure: count_of_logged_in_indicator_count
    label: Count of Logged In Indicator (0/1)
    type: sum
    sql: ${count_of_logged_in_indicator}

  - dimension: count_of_logged_out
    hidden: true
    sql: ${TABLE}.count_of_logged_out

  - dimension: count_of_logged_out_indicator
    label: Logged Out Indicator (0/1)
    sql: |
      CASE WHEN ${TABLE}.count_of_logged_out > 0 THEN 1
      ELSE 0
      END

  - measure: count_of_logged_out_indicator_count
    label: Count of Logged Out Indicator (0/1)
    type: sum
    sql: ${count_of_logged_out_indicator}

# sryu added 7.1.16 to get to an average, rolling count of sessions based on dynamic timeframes

  - measure: count_of_days
    type: count_distinct
    sql: ${session_start_date}

  - measure: average_count_of_sessions
    label: Avg Count of Sessions
    type: number
    sql: ${count_of_sessions}/${count_of_days}

# added for days between SU and 1TP

  - measure: sum_cal_days_su_to_1tp
    hidden: true
    type: sum
    sql: ${item_order_sequence_for_model_1.cal_days_at_start_of_session}
    filters:
      item_order_sequence_for_model_1.item_order_sequence_at_start_of_session: '0'
#       count_of_paid_item_orders: '1'

  - measure: count_cal_days_su_to_1tp
#    label: Avg Cal Days SU to 1TP
    hidden: true
    #Navneet changed the type to count_distinct from count in order to fix the warnings
    type: count_distinct
    sql: ${session_idx}
    filters:
       item_order_sequence_for_model_1.item_order_sequence_at_start_of_session: '0'

  - measure: days_between_su_and_1TP
    label: Avg Days Between SU and 1TP
    type: number
    value_format: '0.0'
    sql: |
       CASE WHEN ${count_cal_days_su_to_1tp} > 0 THEN ${sum_cal_days_su_to_1tp}/(${count_cal_days_su_to_1tp} * 1.00)
       ELSE 0
       END

# 1TP to 2TP

  - measure: sum_cal_days_1TP_to_2TP
#    hidden: true
    type: sum
    sql: ${item_order_sequence_for_model_1.cal_days_at_start_of_session}
    filters:
       item_order_sequence_for_model_1.item_order_sequence_at_start_of_session: '1'

  - measure: count_cal_days_1TP_to_2TP
#    hidden: true
    type: count_distinct
    sql: ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session}
    filters:
       item_order_sequence_for_model_1.item_order_sequence_at_start_of_session: '1'

  - measure: days_between_1TP_and_2TP
    label: Avg Days Between 1TP and 2TP
    type: number
    value_format: '0.0'
    sql: |
       CASE WHEN ${count_cal_days_1TP_to_2TP} > 0 THEN ${sum_cal_days_1TP_to_2TP}/(${count_cal_days_1TP_to_2TP} * 1.00)
       ELSE 0
       END

  - dimension: user_with_first_to_second_purchase
#    hidden: true
    type: yesno
    sql: ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} >= 1 AND ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} <2

  - measure: count_of_users_with_second_purchase
#    hidden: true
    label: Count of Users with Second Purchase
    type: count_distinct
    sql: ${canonical_user_id}
    filters:
      item_order_sequence_for_model_1.item_order_sequence_at_start_of_session: '1'
      partitioned_item_orders_by_users.item_order_sequence: '2'

  - measure: count_of_sessions_between_1TP_and_2TP_final
    label: Count of Sessions between 1TP and 2TP per User
    type: number
    value_format: '0.0'
    sql: |
      CASE WHEN ${count_of_users_with_second_purchase} > 0 THEN ${count_of_visits_between_1TP_and_2TP}/(${count_of_users_with_second_purchase} * 1.00)
      ELSE 0
      END

  - measure: count_of_visits_between_1TP_and_2TP
#    label: Count of Sessions Between 1TP and 2TP
    hidden: true
    type: count_distinct
    sql: ${session_idx}
    filters:
      user_with_first_to_second_purchase: yes
      partitioned_item_order_sequence_indicator: '1'

# for checkout abandonment rates
  - measure: checkout_abandonment_rate
    label: Checkout Abandonment Rate
    type: number
    value_format_name: percent_2
    sql: |
       CASE WHEN ${count_of_paid_item_orders_v1} > 0 THEN (${count_of_checkout_events_v1} - ${count_of_paid_item_orders_v1})/(${count_of_checkout_events_v1} * 1.00)
       ELSE 0
       END


# SR test

  - dimension: first_item_order_purchased_date
    label: First Item Order Purchase Date
    sql: |
      CASE WHEN ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} = 0 AND ${indicator_for_paid_item_orders} = 1 THEN ${session_start_time}
      ELSE NULL
      END

  - dimension: second_item_order_purchased_date
    label: Second Item Order Purchase Date
    sql: |
      CASE WHEN ${item_order_sequence_for_model_1.item_order_sequence_at_start_of_session} = 1 AND ${indicator_for_paid_item_orders} = 1 THEN ${session_start_time}
      ELSE NULL
      END

#   - measure: date_diff_1tp_2tp
#     sql: DATEDIFF(${second_item_order_purchased_date},${first_item_order_purchased_date})

# Kylie added 09/23/16 blog indicator

  - dimension: count_of_blog_page_indicator
    label: Blog Page Indicator (0/1)
    sql: |
      CASE WHEN ${TABLE}.count_of_blog > 0 THEN 1
      ELSE 0
      END

  - measure: count_of_blog_page_indicator_count
    label: Count Blog Page Indicator (0/1)
    type: sum
    sql: ${count_of_blog_page_indicator}


# AMANE ADDED TWO NEW VARAIBLES PLP WOMEN JEANS AND PDP WOMEN JEANS IMPRESSIONS

  - dimension: count_of_plp_jeans_women
    type: number
    hidden: true
    sql: ${TABLE}.count_of_plp_jeans_women

  - dimension: count_of_pdp_jeans_women
    type: number
    hidden: true
    sql: ${TABLE}.count_of_pdp_jeans_women

  - dimension: count_of_plp_jeans_women_indicator
    label: 'PLP Women Jeans Indicator (0/1)'
    view_label: PLP
    sql: |
       CASE WHEN ${TABLE}.count_of_plp_jeans_women > 0 THEN 1
       ELSE 0
       END

  - dimension: count_of_pdp_jeans_women_indicator
    label: 'PDP Women Jeans Indicator (0/1)'
    view_label: PDP
    sql: |
       CASE WHEN ${TABLE}.count_of_pdp_jeans_women > 0 THEN 1
       ELSE 0
       END

  - measure: sum_of_plp_jeans_women_count
    label: 'Count PLP Women Jeans Indicator (0/1)'
    view_label: PLP
    type: sum
    sql: ${count_of_plp_jeans_women_indicator}

  - measure: sum_of_pdp_jeans_women_count
    label: 'Count PDP Women Jeans Indicator (0/1)'
    view_label: PDP
    type: sum
    sql: ${count_of_pdp_jeans_women_indicator}

# CHETANA ADDED TWO NEW VARAIBLES FOR SIZE PROFILES - WITH MODAL & WITHOUT MODAL on Nov 17/2016

# Issue : When customer chooses sizes via modal/filter without toggling,udo_profile_size is set to NULL
# SCENARIO 1 :
# When the size profile modal appears, select sizes and click NEXT
# Observe the following events and size_profile is NULL
#
# event_action  click
# event_label next
# event_category  onboarding_sizes_modal
#
#
#
# SCENARIO 2 :
# When the size profile modal appears, click on the cross mark (top-right) to close the modal. Do not select sizes
# Hover over the size filter, and select sizes and click on save_your_sizes
# Observe the following events and size_profile is NULL
#
# event_action  click
# event_category  filters
# event_label save_my_sizes

  - dimension: count_of_sp_first_with_modal
    type: number
    hidden: true
    sql: ${TABLE}.count_of_sp_first_with_modal

  - dimension: count_of_sp_first_without_modal
    type: number
    hidden: true
    sql: ${TABLE}.count_of_sp_first_without_modal

  - dimension: indicator_count_of_sp_first_with_modal
    label: 'Size Profile With Modal Indicator (0/1)'
    view_label:  My Sizes/Brands
    sql: |
      CASE WHEN ${count_of_sp_first_with_modal} > 0 THEN 1
      ELSE 0
      END

  - dimension: indicator_of_sp_first_without_modal_indicator
    label: 'Size Profile Without Modal Indicator (0/1)'
    view_label:  My Sizes/Brands
    sql: |
      CASE WHEN ${count_of_sp_first_without_modal} > 0 THEN 1
      ELSE 0
      END

# AM and Chetana on Nov 17 - There are two ways to calc measures shown below
# 1) do sum of indicators or 2) count distinct of session_idx with indicator as filters. Both logic acheive the same purpose

#   - measure: sum_of_sp_first_with_modal_count
#     label: 'Count of Size Profile With Modal Indicator (0/1)'
#     view_label:  My Sizes/Brands
#     type: count_distinct
#     sql: ${session_idx}
#     filters:
#      indicator_count_of_sp_first_with_modal: 1
#
#   - measure: sum_of_sp_first_without_modal_count
#     label: 'Count of Size Profile Without Modal Indicator (0/1)'
#     view_label: My Sizes/Brands
#     type: count_distinct
#     sql: ${session_idx}
#     filters:
#      indicator_of_sp_first_without_modal_indicator: 1


  - measure: sum_of_sp_first_with_modal_count
    label: 'Count of Size Profile With Modal Indicator (0/1)'
    view_label:  My Sizes/Brands
    type: sum
    sql: ${indicator_count_of_sp_first_with_modal}

  - measure: sum_of_sp_first_without_modal_count
    label: 'Count of Size Profile Without Modal Indicator (0/1)'
    view_label: My Sizes/Brands
    type: sum
    sql: ${indicator_of_sp_first_without_modal_indicator}



# Aniket creating measures for Visitor indicator
  - dimension: is_visitor
    label: 'Exclude Visitors sessions'
    type: yesno
    sql: LENGTH(${canonical_user_id}) < 10

# AMANE ADDED ON JAN 2/2017
  - dimension:  is_dressing_room_order
    type: yesno
    sql:  ${dressing_room_orders.id} IS NOT NULL

# AMANE ADDED on JAN 8/2017
#   - dimension:  user_treatments_raw
#     type: hidden
#     sql:  ${TABLE}.user_treatments

#   - filter: split_features
#     label: 'FILTER SPLIT feature'
#     suggestions: [signup_modal_hp_test]
#
#   - dimension: split_feature_parsing
#     hidden: true
#     sql:  RTRIM(${split_features}, '\'')
#{% parameter split_features %}

  - dimension: signup_modal_hp_test_variations
    sql: |
        REPLACE(SPLIT_PART(SPLIT_PART(regexp_substr(${TABLE}.user_treatments,'signup_modal_hp_test[^&]*'),',',1),'|',2),'"','')

  - dimension: signup_modal_collapsible_test_variations
    sql: |
      REPLACE(SPLIT_PART(SPLIT_PART(regexp_substr(${TABLE}.user_treatments,'signup_modal_collapsible_test[^&]*'),',',1),'|',2),'"','')



# # AMANE added on Jan 22/2016
# Added by sryu on 3.21.18 for avg PDP views
  - dimension: count_of_unique_pdp
    label: Count of Unique PDP
    hidden: true
    type: number
    sql: ${TABLE}.count_of_unique_pdp

  - measure: sum_count_of_unique_pdp_views
    #hidden: true
    label: 'Sum of the Count of Unique PDP Views'
    description: 'No of unique PDP in a session for all platforms'
    type: sum
    sql: ${count_of_unique_pdp}

  - measure: avg_count_of_unique_pdp_views
    label: 'Avg Count of Unique PDP Views '
    description: 'Avg Count of unique PDP in a session for all platforms'
    type: number
    value_format_name: decimal_1
    sql: |
      CASE WHEN ${count_of_users_who_view_a_pdp} = 0 THEN 0 ELSE (${sum_count_of_unique_pdp_views}/(${count_of_users_who_view_a_pdp} *1.00)) END

## Chetana added ios/android onboarding dimensions on Mar 09 2017
  - dimension: dim_count_of_mobile_onboarding_via_tap
    label: 'Completed mobile signup via tap (0/1)'
    description: 'Completed mobile signup via tap (0/1)p'
    type: number
    sql: |
       CASE WHEN ${TABLE}.count_of_mobile_onboarding_via_tap > 0 THEN 1
       ELSE 0
       END

  - measure: count_of_mobile_onboarding_via_tap
    label: 'Count of completed mobile signup via tap'
    description: 'Count of completed mobile signup via tap'
    type: sum
    sql: ${dim_count_of_mobile_onboarding_via_tap}

## Chetana added ios/android onboarding dimensions on Mar 18 2017
  - dimension: dim_count_of_mobile_onboarding_via_click
    label: 'Completed mobile signup via click (0/1)'
    description: 'Completed mobile signup via click (0/1)p'
    type: number
    sql: |
       CASE WHEN ${TABLE}.count_of_mobile_onboarding_via_click > 0 THEN 1
       ELSE 0
       END

## Chetana added ios/android onboarding dimensions on Mar 18 2017
  - measure: count_of_mobile_onboarding_via_click
    label: 'Count of completed mobile signup via click'
    description: 'Count of completed mobile signup via click'
    type: sum
    sql: ${dim_count_of_mobile_onboarding_via_click}

  # AMANE ADDED on May 8/2017 DONATED BAG YES NO FILTER
  - measure: count_of_donation_bags
    label: 'Total Donation Bag Orders'
    type: count_distinct
    sql: CASE WHEN ${bag_attributes.id} IS NOT NULL THEN ${first_item_order_id} ELSE NULL END


  - dimension: bag_is_donated
    label: 'Donation Bag Order Indicator'
    type: yesno
    sql: ${bag_attributes.id} IS NOT NULL

  #Fields for Chat Test
  - dimension: PM_hours
    sql: |
      CASE
        WHEN ${session_start_hour_of_day} between 19 and 23 then '7pm - 11pm'
        ELSE 'Other'
      END

# AMANE on JULY 29/2017 Favorite measures
  - measure: total_favorites_done
    #hidden: true
    view_label: 'Favorites'
    label: 'Total Favorites done'
    description: 'Unique no of times the a favorite(heart) action was performed in a session'
    type: sum
    sql: ${count_of_favorites}

  - measure: total_unfavorites_done
    #hidden: true
    view_label: 'Favorites'
    label: 'Total UnFavorites done'
    description: 'Unique no of times the a unfavorite(unheart) action was performed in a session'
    type: sum
    sql: ${count_of_unfavorites}



