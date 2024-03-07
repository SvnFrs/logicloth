## list update swp


### role admin 
- cho phép chỉnh sửa edit user

### role seller
- chỉnh sửa cập nhật food
- xem đơn hàng, cập nhật trạng thái đơn hàng.

### role user
- cho phép đặt hàng
- coi được giỏ hàng

### update theo trang 
- load food từ data base show trên home page

### Optional run

```bash
docker exec -it logicloth-postgres-1 psql -U postgres -c 'CREATE DATABASE dacfood'; 
```
```bash
docker exec -it logicloth-postgres-1 psql -U postgres -d dacfood -f docker-entrypoint-initdb.d/postgres.sql;
```

### TODO
- [x] login / register with roles
- [ ] login with google
- [x] create a login page for admin
- [ ] pull data from database
- [ ] pull login states to pages
- [ ] update role admin
- [ ] update role seller
- [ ] update role user
- [ ] add food (seller)
- [ ] update food (seller)
- [ ] update order status (seller)
- [ ] add to cart (user)
- [ ] update cart (user)
- [ ] checkout / create order (user)
- [ ] view order (user)
- [ ] update user (admin)
- [ ] implement cart (user)
- [ ] implement order (user)
- [ ] implement checkout (user)
- [ ] testing / validation (checking duplicate users/ password reset / etc...)