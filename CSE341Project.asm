.model small
.stack 200h
.data
    ; ========== FEATURE 1: USER AUTHENTICATION SYSTEM - Messages & Buffers ==========
    login_menu db 10, 13, '1. Login', 10, 13, '2. Signup', 10, 13, '3. Exit', 10, 13, 'Choose: $'
    enter_user db 10, 13, 'Enter Username: $'
    enter_pass db 10, 13, 'Enter Password: $'
    
    login_ok db 10, 13, 'Login Successful!', 10, 13, '$'
    login_fail db 10, 13, 'Invalid Login!', 10, 13, '$'
    signup_ok db 10, 13, 'Signup Successful! Please Login.', 10, 13, '$'
    saved_user db 20 dup('$')         ; FEATURE 1: Stores registered username
    saved_pass db 20 dup('$')         ; FEATURE 1: Stores registered password
    
    input_user db 20 dup('$')         ; FEATURE 1: Input buffer for login username
    input_pass db 20 dup('$')         ; FEATURE 1: Input buffer for login password
    
    ; ========== FEATURE 2: MENU MANAGEMENT AND ORDER PROCESSING - UI Messages ==========
    welcome_banner  db 10, 13, '=========================================', 10, 13
                   db ' WELCOME TO RESTAURANT ORDERING SYSTEM', 10, 13
                   db '=========================================', 10, 13, '$'
    welcome_msg     db 10, 13, '=======================================', 10, 13
                   db '      Welcome to Our Restaurant!', 10, 13
                   db '=======================================', 10, 13, '$'
    categories_msg  db 10, 13, '============ Categories ============', 10, 13, '$'
    sort_msg        db 10, 13, 'Sort by Price? (Y/N): $'
    select_cat_msg  db 10, 13, 'Select category (0-5): $'
    menu_title_msg  db 10, 13, '============ Menu Items ============', 10, 13, '$'
    select_food_msg db 10, 13, 'Select food item (Enter number): $'
    quantity_msg    db 10, 13, 'Enter quantity (1-9): $'   ; FEATURE 2: Quantity input (1-9)
    total_msg       db 10, 13, 'Current Total: BDT $'      ; FEATURE 2: Running total display
    invalid_cat     db 10, 13, 'Invalid category! Enter 0-5.', 10, 13, '$'
    invalid_item    db 10, 13, 'Invalid item! Select 1-8.', 10, 13, '$'
    invalid_qty     db 10, 13, 'Invalid quantity! Enter 1-9.', 10, 13, '$'
    
    ; ========== FEATURE 5: BILL GENERATION - Bill Display Messages ==========
    bill_title      db 10, 13, '==========================================', 10, 13
                   db '              YOUR BILL', 10, 13
                   db '==========================================', 10, 13, '$'
    bill_msg        db 10, 13, 'Item Count: $'             ; FEATURE 5: Display item count
    bill_total      db 10, 13, 'Subtotal: BDT $'           ; FEATURE 5: Display subtotal

    ; File-safe versions (no trailing $ terminator, used only for writing to bill.txt)
    bill_title_file db 10, 13, '==========================================', 10, 13
                   db '              YOUR BILL', 10, 13
                   db '==========================================', 10, 13
    bill_msg_file   db 10, 13, 'Item Count: '
    bill_total_file db 10, 13, 'Subtotal: BDT '
    
    ; ========== FEATURE 4: COUPON/DISCOUNT SYSTEM - Messages ==========
    discount_prompt db 10, 13, 'Do you want to apply a coupon? (Y/N): $'
    enter_coupon    db 10, 13, 'Enter coupon code : $'
    invalid_coupon  db 10, 13, 'Invalid coupon code!', 10, 13, '$'
    
    ; ========== FEATURE 3: REPEAT PREVIOUS ORDER - Message ==========
    no_prev_order   db 10, 13, 'No previous order found.', 10, 13, '$'
    
    discount_msg    db 10, 13, 'Discount Applied: BDT $'   ; FEATURE 4: Discount amount display
    discount_msg_file db 10, 13, 'Discount Applied: BDT '  ; For file writing (no $)
    final_total_msg db 10, 13, 'Final Total: BDT $'        ; FEATURE 5: Final total after discount
    final_total_msg_file db 10, 13, 'Final Total: BDT '    ; For file writing (no $)
    ; ========== FEATURE 6: FILE OPERATIONS - Save Bill Messages ==========
    save_bill_msg   db 10, 13, 'Save bill to file? (Y/N): $'
    save_success    db 10, 13, 'Bill saved to bill.txt!', 10, 13, '$'
    
    options_msg     db 10, 13, 10, 13, '1. Add More Items', 10, 13
                   db '2. View Bill', 10, 13
                   db '3. Exit', 10, 13
                   db '4. Repeat Previous Order', 10, 13, 10, 13, 'Select: $'
    
    exit_thank_you  db 10, 13, 10, 13, 'Thank you for ordering! Goodbye!', 10, 13, '$'
    
    ; ========== FEATURE 2: MENU MANAGEMENT - Category Labels ==========
    cat1 db '0. Exit Program$'
    cat2 db 10, 13, '1. Breakfast$'
    cat3 db 10, 13, '2. Lunch$'
    cat4 db 10, 13, '3. Dinner$'
    cat5 db 10, 13, '4. Snacks$'
    cat6 db 10, 13, '5. Drinks$'
    cat_all db '0. Exit Program', 10, 13
        db '1. Breakfast', 10, 13
        db '2. Lunch', 10, 13
        db '3. Dinner', 10, 13
        db '4. Snacks', 10, 13
        db '5. Drinks', 10, 13, '$'
    
    ; ========== FEATURE 2: MENU MANAGEMENT - Breakfast Menu (8 items) ==========
    b_menu1 db '1. Porota           - BDT 10$'
    b_menu2 db 10, 13, '2. Ruti             - BDT 10$'
    b_menu3 db 10, 13, '3. Naan             - BDT 20$'
    b_menu4 db 10, 13, '4. Daal             - BDT 20$'
    b_menu5 db 10, 13, '5. Egg              - BDT 25$'
    b_menu6 db 10, 13, '6. Mixed Vegetables - BDT 20$'
    b_menu7 db 10, 13, '7. Halwa            - BDT 30$'
    b_menu8 db 10, 13, '8. Milk Tea         - BDT 15$'
    b_menu_all db '1. Porota           - BDT 10', 10, 13
               db '2. Ruti             - BDT 10', 10, 13
               db '3. Naan             - BDT 20', 10, 13
               db '4. Daal             - BDT 20', 10, 13
               db '5. Egg              - BDT 25', 10, 13
               db '6. Mixed Vegetables - BDT 20', 10, 13
               db '7. Halwa            - BDT 30', 10, 13
               db '8. Milk Tea         - BDT 15', 10, 13, '$'
    b_price dw 10, 10, 20, 20, 25, 20, 30, 15  ; FEATURE 2: Breakfast item prices
    
    ; ========== FEATURE 2: MENU MANAGEMENT - Lunch Menu (8 items) ==========
    l_menu1 db '1. Kacchi Biryani   - BDT 180$'
    l_menu2 db 10, 13, '2. Tehari           - BDT 100$'
    l_menu3 db 10, 13, '3. Beef Polao       - BDT 150$'
    l_menu4 db 10, 13, '4. Chicken Polao    - BDT 130$'
    l_menu5 db 10, 13, '5. Beef Khichuri    - BDT 150$'
    l_menu6 db 10, 13, '6. Egg Polao        - BDT 60$'
    l_menu7 db 10, 13, '7. Chatni           - BDT 20$'
    l_menu8 db 10, 13, '8. Jali Kabab       - BDT 40$'
    l_menu_all db '1. Kacchi Biryani   - BDT 180', 10, 13
               db '2. Tehari           - BDT 100', 10, 13
               db '3. Beef Polao       - BDT 150', 10, 13
               db '4. Chicken Polao    - BDT 130', 10, 13
               db '5. Beef Khichuri    - BDT 150', 10, 13
               db '6. Egg Polao        - BDT 60', 10, 13
               db '7. Chatni           - BDT 20', 10, 13
               db '8. Jali Kabab       - BDT 40', 10, 13, '$'
    l_price dw 180, 100, 150, 130, 150, 60, 20, 40  ; FEATURE 2: Lunch item prices
    
    ; ========== FEATURE 2: MENU MANAGEMENT - Dinner Menu (8 items) ==========
    d_menu1 db '1. Plain Rice       - BDT 30$'
    d_menu2 db 10, 13, '2. Fish Curry       - BDT 130$'
    d_menu3 db 10, 13, '3. Beef Curry       - BDT 170$'
    d_menu4 db 10, 13, '4. Chicken Curry    - BDT 150$'
    d_menu5 db 10, 13, '5. Mixed Vegetable  - BDT 30$'
    d_menu6 db 10, 13, '6. Daal             - BDT 30$'
    d_menu7 db 10, 13, '7. Chicken Liver    - BDT 100$'
    d_menu8 db 10, 13, '8. Beef Liver       - BDT 120$'
    d_menu_all db '1. Plain Rice       - BDT 30', 10, 13
               db '2. Fish Curry       - BDT 130', 10, 13
               db '3. Beef Curry       - BDT 170', 10, 13
               db '4. Chicken Curry    - BDT 150', 10, 13
               db '5. Mixed Vegetable  - BDT 30', 10, 13
               db '6. Daal             - BDT 30', 10, 13
               db '7. Chicken Liver    - BDT 100', 10, 13
               db '8. Beef Liver       - BDT 120', 10, 13, '$'
    d_price dw 30, 130, 170, 150, 30, 30, 100, 120  ; FEATURE 2: Dinner item prices
    
    ; ========== FEATURE 2: MENU MANAGEMENT - Snacks Menu (8 items) ==========
    s_menu1 db '1. Singara         - BDT 10$'
    s_menu2 db 10, 13, '2. Samosa          - BDT 10$'
    s_menu3 db 10, 13, '3. Chicken Roll    - BDT 35$'
    s_menu4 db 10, 13, '4. Vegetable Roll  - BDT 20$'
    s_menu5 db 10, 13, '5. Shawarma        - BDT 60$'
    s_menu6 db 10, 13, '6. Chicken Burger  - BDT 130$'
    s_menu7 db 10, 13, '7. French Fries    - BDT 90$'
    s_menu8 db 10, 13, '8. Chicken Fry     - BDT 100$'
    s_menu_all db '1. Singara         - BDT 10', 10, 13
               db '2. Samosa          - BDT 10', 10, 13
               db '3. Chicken Roll    - BDT 35', 10, 13
               db '4. Vegetable Roll  - BDT 20', 10, 13
               db '5. Shawarma        - BDT 60', 10, 13
               db '6. Chicken Burger  - BDT 130', 10, 13
               db '7. French Fries    - BDT 90', 10, 13
               db '8. Chicken Fry     - BDT 100', 10, 13, '$'
    s_price dw 10, 10, 35, 20, 60, 130, 90, 100  ; FEATURE 2: Snacks item prices
    
    ; ========== FEATURE 2: MENU MANAGEMENT - Drinks Menu (8 items) ==========
    dr_menu1 db '1. Mineral Water   - BDT 15$'
    dr_menu2 db 10, 13, '2. Coca Cola       - BDT 20$'
    dr_menu3 db 10, 13, '3. Pepsi           - BDT 20$'
    dr_menu4 db 10, 13, '4. Lemonade        - BDT 30$'
    dr_menu5 db 10, 13, '5. Orange Juice    - BDT 50$'
    dr_menu6 db 10, 13, '6. Apple Juice     - BDT 70$'
    dr_menu7 db 10, 13, '7. Milk Shake      - BDT 100$'
    dr_menu8 db 10, 13, '8. Lacchi          - BDT 90$'
    dr_menu_all db '1. Mineral Water   - BDT 15', 10, 13
                db '2. Coca Cola       - BDT 20', 10, 13
                db '3. Pepsi           - BDT 20', 10, 13
                db '4. Lemonade        - BDT 30', 10, 13
                db '5. Orange Juice    - BDT 50', 10, 13
                db '6. Apple Juice     - BDT 70', 10, 13
                db '7. Milk Shake      - BDT 100', 10, 13
                db '8. Lacchi          - BDT 90', 10, 13, '$'
    dr_price dw 15, 20, 20, 30, 50, 70, 100, 90  ; FEATURE 2: Drinks item prices
    
    ; ========== FEATURE 2: ORDER PROCESSING - Order Tracking Variables ==========
    total_price dw 0          ; FEATURE 2: Accumulates total order price
    subtotal_price dw 0       ; FEATURE 5: Subtotal before discount
    final_price dw 0          ; FEATURE 5: Final price after discount
    discount_amount dw 0      ; FEATURE 4: Calculated discount in BDT
    item_count dw 0           ; FEATURE 5: Total number of items ordered
    current_price dw ?        ; FEATURE 2: Price of currently selected item
    current_quant db ?        ; FEATURE 2: Quantity of currently selected item
    current_category db ?     ; FEATURE 2: Currently selected category
    discount_percent dw 0     ; FEATURE 4: Discount percentage from coupon
    sorted_flag db 0
    
    ; ========== FEATURE 2: ORDER PROCESSING - Input Buffers ==========
    category_input_buffer db 3, 0, 3 dup(0)
    item_input_buffer db 3, 0, 3 dup(0)
    coupon_input_buffer db 8, 0, 8 dup(0)  ; FEATURE 4: Buffer for coupon code input
    login_input_buffer db 20, 0, 20 dup(0) ; FEATURE 1: Buffer for username/password input
    temp_buffer db 10 dup(0)

    ; ========== FEATURE 3: REPEAT PREVIOUS ORDER - Order Storage Arrays ==========
    current_item_index dw 0
    order_qty dw 40 dup(0)         ; FEATURE 3: Stores quantities for current order (40 items)
    prev_order_qty dw 40 dup(0)    ; FEATURE 3: Stores quantities of previous order for repeat

    ; ========== FEATURE 2: MENU MANAGEMENT - Item Labels & Price Lookup Tables ==========
    item_labels dw offset b_menu1, offset b_menu2, offset b_menu3, offset b_menu4
                dw offset b_menu5, offset b_menu6, offset b_menu7, offset b_menu8
                dw offset l_menu1, offset l_menu2, offset l_menu3, offset l_menu4
                dw offset l_menu5, offset l_menu6, offset l_menu7, offset l_menu8
                dw offset d_menu1, offset d_menu2, offset d_menu3, offset d_menu4
                dw offset d_menu5, offset d_menu6, offset d_menu7, offset d_menu8
                dw offset s_menu1, offset s_menu2, offset s_menu3, offset s_menu4
                dw offset s_menu5, offset s_menu6, offset s_menu7, offset s_menu8
                dw offset dr_menu1, offset dr_menu2, offset dr_menu3, offset dr_menu4
                dw offset dr_menu5, offset dr_menu6, offset dr_menu7, offset dr_menu8

    item_prices dw 10, 10, 20, 20, 25, 20, 30, 15   ; Breakfast prices
                dw 180, 100, 150, 130, 150, 60, 20, 40 ; Lunch prices
                dw 30, 130, 170, 150, 30, 30, 100, 120 ; Dinner prices
                dw 10, 10, 35, 20, 60, 130, 90, 100    ; Snacks prices
                dw 15, 20, 20, 30, 50, 70, 100, 90     ; Drinks prices
    
    ; ========== UTILITY ==========
    newline db 10, 13, '$'
    newline_file db 10, 13              ; Newline for file writing (no $ terminator)
    space db ' $'
    filename db 'bill.txt', 0   ; FEATURE 6: Output file name for bill
    file_handle dw 0            ; FEATURE 6: File handle for bill.txt

print macro msg
    push ax
    push dx
    lea dx, msg
    mov ah, 09h
    int 21h
    pop dx
    pop ax
endm

.code

main proc
    mov ax, @data
    mov ds, ax
    
    call login_screen       ; FEATURE 1: Launch login/signup screen before access
    call init_order         ; FEATURE 2: Initialize order tracking variables
    
start:
    call clear_screen
    print welcome_msg
    
show_menu:
    ; FEATURE 2: MENU MANAGEMENT - Display all 5 categories for selection
    print categories_msg
    print cat_all
    print select_cat_msg
    
    lea dx, category_input_buffer
    call read_number
    mov current_category, al
    
    cmp al, '0'
    je exit_program
    cmp al, '1'
    je breakfast
    cmp al, '2'
    je lunch
    cmp al, '3'
    je dinner
    cmp al, '4'
    je snacks
    cmp al, '5'
    je drinks
    
    jmp process_menu_after_selection

process_menu_after_selection:
    call clear_screen
    print invalid_cat
    jmp show_menu

return_to_category:
    mov al, current_category
    cmp al, '1'
    je breakfast
    cmp al, '2'
    je lunch
    cmp al, '3'
    je dinner
    cmp al, '4'
    je snacks
    cmp al, '5'
    je drinks
    jmp show_menu

; FEATURE 2: MENU MANAGEMENT - Breakfast category display and item selection
breakfast:
    call clear_screen
    print menu_title_msg
    print b_menu_all
    print select_food_msg
    lea dx, item_input_buffer
    call read_number
    mov bx, offset b_price
    jmp process_selection_buffered

; FEATURE 2: MENU MANAGEMENT - Lunch category display and item selection
lunch:
    call clear_screen
    print menu_title_msg
    print l_menu_all
    print select_food_msg
    lea dx, item_input_buffer
    call read_number
    mov bx, offset l_price
    jmp process_selection_buffered

; FEATURE 2: MENU MANAGEMENT - Dinner category display and item selection
dinner:
    call clear_screen
    print menu_title_msg
    print d_menu_all
    print select_food_msg
    lea dx, item_input_buffer
    call read_number
    mov bx, offset d_price
    jmp process_selection_buffered

; FEATURE 2: MENU MANAGEMENT - Snacks category display and item selection
snacks:
    call clear_screen
    print menu_title_msg
    print s_menu_all
    print select_food_msg
    lea dx, item_input_buffer
    call read_number
    mov bx, offset s_price
    jmp process_selection_buffered

; FEATURE 2: MENU MANAGEMENT - Drinks category display and item selection
drinks:
    call clear_screen
    print menu_title_msg
    print dr_menu_all
    print select_food_msg
    lea dx, item_input_buffer
    call read_number
    mov bx, offset dr_price
    jmp process_selection_buffered

exit_program:
    call clear_screen
    print exit_thank_you
    mov ah, 4ch
    int 21h

main endp

; ========== FEATURE 1: USER AUTHENTICATION SYSTEM ==========
; Handles login loop, signup, and credential validation before granting access
login_screen proc
    call clear_screen
    print welcome_banner
    
login_loop:
    print login_menu
    
    lea dx, category_input_buffer
    call read_number
    
    cmp al, '1'
    je login_label
    cmp al, '2'
    je signup_label
    cmp al, '3'
    je exit_program
    
    jmp login_loop

; FEATURE 1: Signup - stores new username and password
signup_label:
    print enter_user
    lea di, saved_user
    call input_string
    
    print enter_pass
    lea di, saved_pass
    call input_string
    
    print signup_ok
    jmp login_loop

; FEATURE 1: Login - reads credentials and validates against stored values
login_label:
    print enter_user
    lea di, input_user
    call input_string
    
    print enter_pass
    lea di, input_pass
    call input_string
    
    ; FEATURE 1: Compare entered username with saved username
    lea si, input_user
    lea di, saved_user
    call compare_string
    cmp al, 1
    jne login_fail_label
    
    ; FEATURE 1: Compare entered password with saved password
    lea si, input_pass
    lea di, saved_pass
    call compare_string
    cmp al, 1
    jne login_fail_label
    
    print login_ok
    ret

; FEATURE 1: Login failure - show error and return to login loop
login_fail_label:
    print login_fail
    jmp login_loop

login_screen endp

; Reads a single buffered character input using DOS INT 21h / 0Ah
read_number proc
    mov ah, 0Ah
    int 21h
    
    mov si, dx
    inc si
    inc si
    mov al, [si]
    ret
read_number endp

; FEATURE 1: USER AUTHENTICATION - Reads a string input into destination buffer (di)
input_string proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    
    lea dx, login_input_buffer
    mov ah, 0Ah
    int 21h
    
    ; Clear destination buffer with '$' terminators
    mov bx, di
    mov cx, 20
clear_login_loop:
    mov byte ptr [di], '$'
    inc di
    loop clear_login_loop
    
    ; Copy input into destination buffer
    mov di, bx
    lea si, login_input_buffer
    mov cl, [si+1]
    xor ch, ch
    add si, 2
copy_login_loop:
    cmp cx, 0
    je input_done
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec cx
    jmp copy_login_loop

input_done:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
input_string endp

; FEATURE 2: ORDER PROCESSING - Initializes all order tracking variables to zero
init_order proc
    push ax
    push cx
    push di
    
    mov total_price, 0
    mov subtotal_price, 0
    mov final_price, 0
    mov discount_amount, 0
    mov item_count, 0
    mov discount_percent, 0
    
    ; FEATURE 3: Clear current order quantity array (40 slots for 5 categories x 8 items)
    lea di, order_qty
    mov cx, 40
clear_order_loop:
    mov word ptr [di], 0
    add di, 2
    loop clear_order_loop
    
    pop di
    pop cx
    pop ax
    ret
init_order endp

; FEATURE 1: USER AUTHENTICATION - String comparison for username/password validation
compare_string proc
compare_loop:
    mov al, [si]
    mov bl, [di]
    
    cmp al, bl
    jne not_equal
    
    cmp al, '$'
    je equal
    
    inc si
    inc di
    jmp compare_loop
    
not_equal:
    mov al, 0
    ret
    
equal:
    mov al, 1
    ret
compare_string endp

; ========== FEATURE 2: ORDER PROCESSING - Item Selection, Quantity, Price Calculation ==========
; Validates item number (1-8), gets quantity (1-9), calculates and adds to running total
process_selection_buffered proc
    cmp al, '1'
    jl invalid_item_error
    cmp al, '8'
    jg invalid_item_error
    
    ; FEATURE 2: Convert item number to price array index
    sub al, '1'
    mov ah, 0
    mov si, ax
    add si, si
    
    mov ax, [bx+si]
    mov current_price, ax
    
    ; FEATURE 3: Calculate flat index into order_qty array (category * 8 + item)
    mov bl, current_category
    sub bl, '1'
    mov bh, 0
    mov ax, bx
    shl ax, 3
    mov bx, si
    shr bx, 1
    add ax, bx
    mov current_item_index, ax
    
    ; FEATURE 2: Prompt for quantity input (1-9)
    print quantity_msg
    lea dx, item_input_buffer
    call read_number
    
    cmp al, '1'
    jl invalid_qty_error
    cmp al, '9'
    jg invalid_qty_error
    
    ; FEATURE 2: Automatic price calculation - multiply price by quantity, add to total
    sub al, '0'
    mov current_quant, al
    mov bl, al
    mov bh, 0
    mov ax, current_price
    mul bx
    add total_price, ax
    
    ; FEATURE 2: Update running item count
    mov al, current_quant
    mov ah, 0
    add item_count, ax
    
    ; FEATURE 3: Store item quantity in order_qty array for repeat order functionality
    mov ax, current_item_index
    shl ax, 1
    lea di, order_qty
    add di, ax
    mov ax, [di]
    mov bl, current_quant
    mov bh, 0
    add ax, bx
    mov [di], ax
    
    ; FEATURE 2: Display running total after each item is added
    call clear_screen
    print total_msg
    mov ax, total_price
    call print_number
    
    print options_msg
    lea dx, category_input_buffer
    call read_number
    
    cmp al, '1'
    je show_menu                    ; Add more items - return to category selection
    cmp al, '2'
    je show_bill_with_discount      ; FEATURE 5: View bill
    cmp al, '3'
    je exit_program
    cmp al, '4'
    je repeat_previous_order        ; FEATURE 3: Repeat previous order
    
    jmp process_selection_buffered

invalid_item_error:
    call clear_screen
    print invalid_item
    lea dx, item_input_buffer
    call read_number
    jmp process_selection_buffered

invalid_qty_error:
    call clear_screen
    print invalid_qty
    lea dx, item_input_buffer
    call read_number
    jmp process_selection_buffered

    ret
process_selection_buffered endp

; ========== FEATURE 5: BILL GENERATION & FEATURE 4: COUPON/DISCOUNT SYSTEM ==========
; Displays item count, subtotal, handles coupon validation, and shows final total
show_bill_with_discount proc
    call clear_screen
    print bill_title
    
    ; FEATURE 5: Display item count
    print bill_msg
    mov ax, item_count
    call print_number
    
    ; FEATURE 5: Display subtotal
    print bill_total
    mov ax, total_price
    call print_number
    print newline
    
show_final_bill:
    ; FEATURE 4: Prompt user if they want to apply a coupon
    print discount_prompt
    lea dx, category_input_buffer
    call read_number
    
    cmp al, 'Y'
    je apply_discount_prompt
    cmp al, 'y'
    je apply_discount_prompt
    
    ; No coupon - set final price equal to total price
    mov discount_percent, 0
    mov discount_amount, 0
    mov ax, total_price
    mov final_price, ax
    
    ; FEATURE 5: Display final total without discount
    print final_total_msg
    mov ax, final_price
    call print_number
    jmp save_bill_prompt

; FEATURE 4: COUPON/DISCOUNT SYSTEM - Accept and validate coupon code
apply_discount_prompt:
    print enter_coupon
    lea dx, coupon_input_buffer
    mov ah, 0Ah
    int 21h
    
    ; FEATURE 4: Validate coupon (SAVE10 = 10%, SAVE20 = 20%)
    mov dx, offset coupon_input_buffer
    call compare_coupon
    mov discount_percent, ax
    cmp ax, 0
    je invalid_coupon_error
    jmp apply_discount_calc

invalid_coupon_error:
    call clear_screen
    print invalid_coupon
    mov discount_percent, 0
    mov discount_amount, 0
    mov ax, total_price
    mov final_price, ax
    
    ; FEATURE 5: Display final total (no discount applied due to invalid coupon)
    print final_total_msg
    mov ax, final_price
    call print_number
    jmp save_bill_prompt

; FEATURE 4: Calculate discount amount and apply to total
apply_discount_calc:
    mov ax, total_price
    mov bx, discount_percent
    mul bx
    mov bx, 100
    xor dx, dx
    div bx
    mov discount_amount, ax
    
    call clear_screen
    
    ; FEATURE 4: Display discount amount applied
    print discount_msg
    mov ax, discount_amount
    call print_number
    print newline
    
    ; FEATURE 5: Calculate and display final total after discount
    mov ax, total_price
    sub ax, discount_amount
    mov final_price, ax
    
    print final_total_msg
    mov ax, final_price
    call print_number

; FEATURE 6: FILE OPERATIONS - Prompt user to save bill to file
save_bill_prompt:
    print save_bill_msg
    lea dx, category_input_buffer
    call read_number
    
    cmp al, 'Y'
    je save_to_file
    cmp al, 'y'
    je save_to_file
    
    jmp done_coupon

; FEATURE 6: FILE OPERATIONS - Save bill to bill.txt
save_to_file:
    call write_bill_to_file
    print save_success

done_coupon:
    ; FEATURE 3: Store current order as previous order before resetting
    call store_previous_order
    call init_order
    jmp start

show_bill_with_discount endp

; ========== FEATURE 3: REPEAT PREVIOUS ORDER ==========
; Loads the previously saved order quantities and recalculates totals
repeat_previous_order proc
    call load_previous_order
    cmp ax, 0
    jne repeat_done
    call clear_screen
    print no_prev_order
    jmp show_menu
repeat_done:
    jmp show_bill_with_discount
repeat_previous_order endp

; FEATURE 3: REPEAT PREVIOUS ORDER - Copy current order_qty to prev_order_qty for storage
store_previous_order proc
    push ax
    push cx
    push si
    push di
    
    lea si, order_qty
    lea di, prev_order_qty
    mov cx, 40
store_prev_loop:
    mov ax, [si]
    mov [di], ax
    add si, 2
    add di, 2
    loop store_prev_loop
    
    pop di
    pop si
    pop cx
    pop ax
    ret
store_previous_order endp

; FEATURE 3: REPEAT PREVIOUS ORDER - Restore prev_order_qty into order_qty and recalculate totals
load_previous_order proc
    push ax
    push bx
    push cx
    push si
    push di
    
    mov ax, 0
    mov total_price, 0
    mov item_count, 0
    mov discount_percent, 0
    mov discount_amount, 0
    mov final_price, 0
    
    lea si, prev_order_qty
    lea di, order_qty
    lea bx, item_prices
    mov cx, 40

load_prev_loop:
    mov dx, [si]
    mov [di], dx
    cmp dx, 0
    je load_next
    
    ; FEATURE 3: Recalculate total from stored quantities and item prices
    add item_count, dx
    mov ax, [bx]
    mul dx
    add total_price, ax
    mov ax, 1

load_next:
    add si, 2
    add di, 2
    add bx, 2
    loop load_prev_loop
    
    mov ax, total_price
    mov final_price, ax
    
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret
load_previous_order endp

; ========== FEATURE 4: COUPON/DISCOUNT SYSTEM - Coupon Code Validation ==========
; Checks if entered code is SAVE10 (10% off) or SAVE20 (20% off)
; Returns discount percentage in AX, or 0 if invalid
compare_coupon proc
    push bx
    push si
    
    mov si, dx
    mov al, [si+1]
    cmp al, 6          ; FEATURE 4: Coupon codes must be exactly 6 characters
    jne coupon_fail
    
    ; FEATURE 4: Validate prefix "SAVE" characters
    mov al, [si+2]
    cmp al, 'S'
    jne coupon_fail
    mov al, [si+3]
    cmp al, 'A'
    jne coupon_fail
    mov al, [si+4]
    cmp al, 'V'
    jne coupon_fail
    mov al, [si+5]
    cmp al, 'E'
    jne coupon_fail
    
    ; FEATURE 4: Check for SAVE10 or SAVE20 suffix
    mov al, [si+6]
    cmp al, '1'
    je coupon_10_check
    cmp al, '2'
    je coupon_20_check
    jmp coupon_fail

; FEATURE 4: Validate SAVE10 - returns 10% discount
coupon_10_check:
    mov al, [si+7]
    cmp al, '0'
    jne coupon_fail
    mov ax, 10
    jmp coupon_done

; FEATURE 4: Validate SAVE20 - returns 20% discount
coupon_20_check:
    mov al, [si+7]
    cmp al, '0'
    jne coupon_fail
    mov ax, 20
    jmp coupon_done

coupon_fail:
    mov ax, 0          ; FEATURE 4: Return 0 to signal invalid coupon

coupon_done:
    pop si
    pop bx
    ret
compare_coupon endp

; ========== FEATURE 6: FILE OPERATIONS - Write Bill to bill.txt ==========
; Creates bill.txt and writes item count, subtotal, discount (if any), and final total
; Uses *_file string variants (no $ terminator) so dollar signs are never written to the file
write_bill_to_file proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    ; FEATURE 6: Create/overwrite bill.txt file
    mov ah, 3Ch
    mov cx, 0
    lea dx, filename
    int 21h
    jc wbf_file_error
    mov file_handle, ax

    ; FEATURE 6: Write bill title header to file (no $ in bill_title_file)
    ; bill_title_file = CR LF (2) + 42 '=' (42) + CR LF (2) + 14 spaces + "YOUR BILL" (23) + CR LF (2) + 42 '=' (42) + CR LF (2) = 115 bytes
    lea dx, bill_title_file
    mov cx, 115
    mov bx, file_handle
    mov ah, 40h
    int 21h

    ; FEATURE 5 / FEATURE 6: Write "Item Count: " label to file (no $)
    ; bill_msg_file = CR LF (2) + "Item Count: " (12) = 14 bytes
    lea dx, bill_msg_file
    mov cx, 14
    mov bx, file_handle
    mov ah, 40h
    int 21h

    mov ax, item_count
    call write_number_to_file

    ; Write newline after item count
    lea dx, newline_file
    mov cx, 2
    mov bx, file_handle
    mov ah, 40h
    int 21h

    ; FEATURE 5 / FEATURE 6: Write "Subtotal: BDT " label to file (no $)
    ; bill_total_file = CR LF (2) + "Subtotal: BDT " (14) = 16 bytes
    lea dx, bill_total_file
    mov cx, 16
    mov bx, file_handle
    mov ah, 40h
    int 21h

    mov ax, total_price
    call write_number_to_file

    ; Write newline after subtotal
    lea dx, newline_file
    mov cx, 2
    mov bx, file_handle
    mov ah, 40h
    int 21h

    ; FEATURE 4 / FEATURE 6: Write discount line only if a coupon was applied
    cmp discount_percent, 0
    je wbf_skip_discount

    ; discount_msg_file = CR LF (2) + "Discount Applied: BDT " (22) = 24 bytes
    lea dx, discount_msg_file
    mov cx, 24
    mov bx, file_handle
    mov ah, 40h
    int 21h

    mov ax, discount_amount
    call write_number_to_file

    ; Write newline after discount
    lea dx, newline_file
    mov cx, 2
    mov bx, file_handle
    mov ah, 40h
    int 21h

wbf_skip_discount:
    ; FEATURE 5 / FEATURE 6: Write "Final Total: BDT " label to file (no $)
    ; final_total_msg_file = CR LF (2) + "Final Total: BDT " (17) = 19 bytes
    lea dx, final_total_msg_file
    mov cx, 19
    mov bx, file_handle
    mov ah, 40h
    int 21h

    mov ax, final_price
    call write_number_to_file

    ; Write newline at end of file
    lea dx, newline_file
    mov cx, 2
    mov bx, file_handle
    mov ah, 40h
    int 21h

    ; FEATURE 6: Close the bill.txt file
    mov ah, 3Eh
    mov bx, file_handle
    int 21h

wbf_file_error:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
write_bill_to_file endp

; FEATURE 6: FILE OPERATIONS - Converts a number in AX to ASCII and writes to bill.txt
write_number_to_file proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov bx, 10
    xor cx, cx
    mov si, offset temp_buffer

wntf_divide:
    xor dx, dx
    div bx
    add dl, '0'
    mov [si], dl
    inc si
    inc cx
    test ax, ax
    jnz wntf_divide

    mov di, cx

    mov si, offset temp_buffer
    add si, cx
    dec si
    mov bx, offset temp_buffer

    push di
    shr di, 1

wntf_reverse:
    cmp di, 0
    je wntf_reverse_done
    mov al, [si]
    mov ah, [bx]
    mov [bx], al
    mov [si], ah
    dec si
    inc bx
    dec di
    jmp wntf_reverse

wntf_reverse_done:
    pop cx

    ; FEATURE 6: Write the number string to the open file handle
    mov ah, 40h
    mov bx, file_handle
    mov dx, offset temp_buffer
    int 21h

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
write_number_to_file endp

; Clears the screen (stub - returns immediately)
clear_screen proc
    ret
clear_screen endp

; FEATURE 2 / FEATURE 5: Prints a 16-bit number in AX to the console using DOS INT 21h
print_number proc
    push ax
    push bx
    push cx
    push dx
    
    mov bx, 10
    xor cx, cx
    
print_number_divide:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz print_number_divide
    
print_number_display:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_number_display
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

end main