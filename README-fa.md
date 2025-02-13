<div align="center"><img src="https://raw.githubusercontent.com/MrAminiDev/Tabchi-Mokhber/main/Tabchi-Mokhber.png" width="500"></div>
  <br><br>

# 🤖 ربات مخبر - ربات تبلیغاتی و جمع‌آوری کاربران

مخبر یک ربات پیشرفته تلگرامی است که برای ارسال تبلیغات خودکار و جمع‌آوری کاربران طراحی شده است. این ربات به شما امکان می‌دهد آی‌دی کاربران را از گروه‌ها و چت‌های خصوصی جمع‌آوری کرده، ذخیره کنید و پیام‌های تبلیغاتی هدفمند ارسال نمایید. با استفاده از زمان‌بندی هوشمند، تأخیرهای تصادفی و تشخیص کاربران فعال، مخبر تبلیغات را به شکلی بهینه ارسال کرده و احتمال مسدود شدن توسط تلگرام را کاهش می‌دهد.<br>
ویژگی‌های کلیدی:

✅ جمع‌آوری خودکار کاربران از گروه‌ها و چت‌های خصوصی <br>
✅ ارسال انبوه پیام‌ها با تأخیرهای هوشمند و زمان‌بندی‌شده <br>
✅ به‌روزرسانی خودکار بیو برای طبیعی‌تر جلوه دادن ربات<br>
✅ تشخیص کاربران فعال جهت افزایش بازدهی تبلیغات<br>
✅ ارسال پیام تبلیغاتی به چندین گروه به‌صورت هم‌زمان<br>
✅ ارائه گزارش‌های دقیق از وضعیت ارسال پیام‌ها<br>

مخبر یک ابزار ایده‌آل برای کسب‌وکارها و افرادی است که به دنبال افزایش مخاطبین و گسترش تبلیغات خود در تلگرام هستند، در حالی که امنیت و کارایی را حفظ می‌کنند. 🚀

1- اپدیت سرور  :
```shell
sudo apt update && sudo apt upgrade -y
```

2- نصب پایتون
```shell
sudo apt install python3 python3-pip -y
```

3- نصب پیش نیاز ها
```shell
pip install uv
```

4- دانلود پروژه
```shell
apt install wget unzip
mkdir -p mokhber
wget -O tabchi-mokhber.zip https://github.com/MrAminiDev/Tabchi-Mokhber/archive/refs/heads/main.zip
unzip tabchi-mokhber.zip -d mokhber
mv mokhber/Tabchi-Mokhber-main/* mokhber/
rm -r mokhber/Tabchi-Mokhber-main
rm tabchi-mokhber.zip
```

5- با استفاده از دستور زیر وارد فولدر مخبر بشید 
```shell
cd mokhber
```

6- فایل main.py رو ادیت بکنید و در لاین 14 و 13 اطلاعات توکن خودتون رو بزارید 
```shell
nano main.py
```
برای دریافت API ID , HASH ID به ادرس https://my.telegram.org برید و برنامه خودتون رو ایجاد کنید 
در خط 15 ای دی عددی ادمین رو بزارید که میتونه ربات رو کنترل بکنه 

8- دستور زیر رو برای اجرا شدن ربات بزنید
```shell
uv run main.py
```
## برای ران نگه داشتن بات به صورت دائمی باید از سرویس استفاده کنید
```sh
nano /etc/systemd/system/mokhber.service
```
متوا زیرو داخل فایل سرویس بزارید
```service
[Unit]
Description=mokhber
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/root/mokhber
ExecStart=/usr/local/bin/uv run main.py
Restart=always

[Install]
WantedBy=multi-user.target
```
فعالسازی:
```sh
sudo systemctl daemon-reload
sudo systemctl enable mokhber.service
sudo systemctl start mokhber.service
```

خاموش کردن ربات:
```sh
sudo systemctl stop mokhber.service
```
مشاهد لاگهای ربات:
```sh
journalctl -u mokhber.service -f
```

## حمایت از پروژه با ارز دیجیتال
- TRX : `TLfVhyK6ihTuPNtFpuhULNuJaiKFLHxMFL`

## حمایت با ستاره در مدت زمان
[![Stargazers over time](https://starchart.cc/MrAminiDev/Tabchi-Mokhber.svg?variant=adaptive)](https://starchart.cc/MrAminiDev/Tabchi-Mokhber)
