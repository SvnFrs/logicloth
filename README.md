## list update swp


### role admin 
- cho phép chỉnh sửa edit user
- admin quản lý các quán, user và doanh thu của từng quán

### role seller
- chỉnh sửa cập nhật food
- xem đơn hàng, cập nhật trạng thái đơn hàng.
- xem doanh thu của quán mình

### role user
- cho phép đặt hàng
- coi được giỏ hàng
- cho phép xem lịch sử đơn hàng
- cho phép đánh giá quán

### update theo trang 
- load food từ data base show trên home page

### Optional run

```bash
docker exec -it logicloth-postgres-1 psql -U postgres -c 'CREATE DATABASE dacfood'; 
```
```bash
docker exec -it logicloth-postgres-1 psql -U postgres -d dacfood -f docker-entrypoint-initdb.d/postgres.sql;
```

### Order states
- 0: pending
- 1: accepted
- 2: shipping
- 3: delivered
- 4: canceled
- 5: completed
- 6: rejected

### TODO
- [x] login / register with roles
- [ ] login with google
- [x] create a login page for admin
- [x] pull data from database
- [x] pull login states to pages
- [ ] update role admin
- [ ] update role seller
- [ ] update role user
- [ ] add food (seller)
- [ ] update food (seller)
- [ ] update order status (seller)
- [x] add to cart (user)
- [ ] update cart (user)
- [ ] checkout / create order (user)
- [ ] view order (user)
- [x] implement restaurant (user)
- [ ] implement products page (user)
- [ ] implement order page (user)
- [ ] update user (admin)
- [ ] implement cart page (user)
- [ ] implement order (user)
- [ ] implement checkout (user)
- [ ] testing / validation (checking duplicate users/ password reset / etc...)