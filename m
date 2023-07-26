Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBV5LQOTAMGQERMGY6PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3f.google.com (mail-oo1-xc3f.google.com [IPv6:2607:f8b0:4864:20::c3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C626762F64
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 10:14:17 +0200 (CEST)
Received: by mail-oo1-xc3f.google.com with SMTP id 006d021491bc7-5667356cfcesf10266898eaf.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690359256; x=1690964056;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7S5a7nPCKnoHl8YygZOtUoDr0voF/Viq1XeBbNylNQ=;
        b=H3j/ArniAJNHi4jQVRfCj2Wn/5u8EOQzzXtGa87ThonqNNNBLy6Jp6jL0Xn8mk/9g3
         035mJDIO6y3SDlYoLy0y8mt7pN8AJpFi77V6DULtnOT7CTLwEBoY8Lsu3Njg78POn70K
         FFX5ItMr8TTjP+9PVZguOHeMMsNrkCHi2FFG3YEGrt7DoHl7hePyo751jTY6Vgk2ngIe
         11BXnRsGjktqUbhM5kIQ1qZpNy/++IFaY5C/ggDm0nIdCMsshXWDRhDeAmrWnkxw6ZJF
         ccp8wF48UoQs7ZRyeKU9SCaXIF6DcYsJ00bVY56cTUKqfg3FPv7Dz5ljC77Ypa+BUiZE
         Eaqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690359256; x=1690964056;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7S5a7nPCKnoHl8YygZOtUoDr0voF/Viq1XeBbNylNQ=;
        b=apPRpEozTBA5mj2NJlIQ5dHQbPUMMFAcuCAIhUn/RAK/bZ5UGjCirA8huQ+2xW7D7W
         Q+iztJ1MBPRz9MHwoYDNM/TBqNTJk9NRPAHY1pOFBxdzuYbsU0TIWc0hlHLencGtjXXD
         quXpMe8o6ev5iPcBvywDnty/iIRKZvHslWoGWGqZkrDMx5p6VG+zUceMF0KLQQfXamFo
         VpYYOlYfmzSdKfemTYb7yQ57NCjOM+L8d1iE6uKM1vHIvQzi4jmxGTjqq+K4V4X0BxcV
         N8Q9GbpFQD2Hd3fNN1hu6asDwZ0Uu5hxl7+t9e7Xg3oTJVznKiGJ0W143X8G8vVu6DRv
         FAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690359256; x=1690964056;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7S5a7nPCKnoHl8YygZOtUoDr0voF/Viq1XeBbNylNQ=;
        b=jKmI6UyIJZGr+Azgu7290XXsxy67gOI1IGhL+5wEkA42QfovqxfjxY5pKZOhluYZB6
         JgToJ/Gy///DKSUVhzeofethZIsOdTtEf+6S6BY5hnSukC+4wtfplKQrm5U+ufAjhVOs
         /HVc6PyS4decUPPnMyyTvvBvgA61yQ3cqz9wvjGWtyyqHJx+Ke8oJEB4Tyd2B6geGIHP
         Z5qC3Scdphj/Ja7PHPLE3Y2jGnmR/inIuU2YxnXIcOalVUykeWHrVOQQZAVoCoNL1zEp
         jqza3j7TOLj+38O1IQtldIht5DrAL0nDkD5D/1PDOGzwQGmDcG7nHpULYYJ5etFEKt25
         5sMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLZYM40wDXTwUGlTkCvPBml6fDg+QU+BkzNxfwcfyCX/SGF5Pq3Q
	7RKy+qrRsizd9SvninkY6HE=
X-Google-Smtp-Source: APBJJlHLAQImA9aoMjPYZNrqx3uLgSY/zyKdnsHbDowqGa/1O6BlEIQD8/E9SU5okJfgGNVBW4qzbw==
X-Received: by 2002:a4a:2a49:0:b0:566:f6a0:87e4 with SMTP id x9-20020a4a2a49000000b00566f6a087e4mr919696oox.0.1690359255706;
        Wed, 26 Jul 2023 01:14:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:4146:0:b0:566:a929:67e7 with SMTP id x67-20020a4a4146000000b00566a92967e7ls2260083ooa.2.-pod-prod-09-us;
 Wed, 26 Jul 2023 01:14:14 -0700 (PDT)
X-Received: by 2002:a4a:4f09:0:b0:55b:85b9:68ed with SMTP id c9-20020a4a4f09000000b0055b85b968edmr2333543oob.0.1690359254621;
        Wed, 26 Jul 2023 01:14:14 -0700 (PDT)
Date: Wed, 26 Jul 2023 01:14:13 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
Subject: Configuration with 2 guest cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_940_1880925127.1690359253971"
X-Original-Sender: stranzjanmarc@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_940_1880925127.1690359253971
Content-Type: multipart/alternative; 
	boundary="----=_Part_941_1115202120.1690359253971"

------=_Part_941_1115202120.1690359253971
Content-Type: text/plain; charset="UTF-8"

I have a HW target with Intel core i5  (11th generation) and 32 GB RAM.

In the hypervisor configuration for the root cell, 1 GiB (1024 MiB) is 
reserved for guest cells:

        /* MemRegion: 110600000-1505fffff : guest cells (1024 MiB) */
        {
            .phys_start = 0x110600000,
            .virt_start = 0x110600000,
            .size = 0x40000000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
        },

In the configurations for the guest cells, this area is divided so that 
each guest cell can use a maximum of 512 MiB:

Guest 1:

        /* MemRegion: 110600000-1305fffff : Guest Cell (1) (max. 512 MiB) */
        /* Low RAM (1 MiB) */ 
        {
            .phys_start = 0x110600000,
            .virt_start = 0,
            .size = 0x100000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
        },
        /* Communication region (4 KiB) */ 
        {
            .virt_start = 0x00100000,
            .size = 0x1000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_COMM_REGION,
        },
        /* High RAM (max. 511 MiB) */ 
        {
            .phys_start = 0x110700000,
            .virt_start = 0x00200000,
            .size = 0x1ff00000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
        },

Guest 2:

        /* MemRegion: 130600000-1505fffff : Guest Cell (2) (max. 512 MiB) */
        /* Low RAM (1 MiB) */ 
        {
            .phys_start = 0x130600000,
            .virt_start = 0,
            .size = 0x100000 ,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
        },
        /* Communication region (4 KiB) */ 
        {
            .virt_start = 0x00100000,
            .size = 0x100000 ,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_COMM_REGION,
        },
        /* High RAM (max. 511 MiB) */ 
        {
            .phys_start = 0x130700000,
            .virt_start = 0x00200000,
            .size = 0x1ff00000 ,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,
        },

If only 320 MiB is used in both guest cells, then the guest cells can be 
successfully started one after the other with the command "jailhouse cell 
linux".

However, if more than 320 MiB is used in guest cells (e.g. 336 MiB), then 
only one of the two guest cells can be successfully started.
When the 2nd guest cell is started, an error message is issued:

Traceback (most recent call last):
  File "/usr/libexec/jailhouse/jailhouse-cell-linux", line 737, in <module>
    cell = JailhouseCell(config)
  File "/usr/lib/python3.8/site-packages/pyjailhouse/cell.py", line 36, in 
__init__
    raise e
  File "/usr/lib/python3.8/site-packages/pyjailhouse/cell.py", line 33, in 
__init__
    fcntl.ioctl(self.dev, JailhouseCell.JAILHOUSE_CELL_CREATE, create)
OSError: [Errno 12] Cannot allocate memory
ERROR: Linux guest cell not started!

I have now run numerous tests with different sizes for the guest cells and 
have come to the limit of 320 MiB, at which both guest cells can still be 
started.

However, I cannot see why both guest cells cannot be started.
Actually, in the configuration for the root cell, enough memory has been 
reserved for both guest cells.

Is there an explanation for this unexpected behavior?

Jan-Marc.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/81fa9191-18dd-4003-9cfb-bed496d5723fn%40googlegroups.com.

------=_Part_941_1115202120.1690359253971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a HW target with Intel core i5=C2=A0 (11th generation) and 32 GB RAM=
.<br /><br />In the hypervisor configuration for the root cell, 1 GiB (1024=
 MiB) is reserved for guest cells:<br /><div><span style=3D"font-family: Co=
urier New;"><br /></span></div><div><span style=3D"font-family: Courier New=
;">=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MemRegion: 110600000-1505fffff : guest ce=
lls (1024 MiB) */<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br />=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x110600000,<br />=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x110600000,<br />=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x40000000,<br />=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 },</span><br /></div><div><br /></div><=
div>In the configurations for the guest cells, this area is divided so that=
 each guest cell can use a maximum of 512 MiB:</div><div><br /></div><div>G=
uest 1:</div><div><br /></div><span style=3D"font-family: Courier New;">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* MemRegion: 110600000-1305fffff : Guest Cell (1)=
 (max. 512 MiB) */<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Low RAM (1 MiB) */ <=
br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .phys_start =3D 0x110600000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 .virt_start =3D 0,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .=
size =3D 0x100000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE | JAIL=
HOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 },=
<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Communication region (4 KiB) */ <br />=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .virt_start =3D 0x00100000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .size =3D 0x1000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_COMM_REGION,<=
br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Hig=
h RAM (max. 511 MiB) */ <br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br />=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .phys_start =3D 0x110700000,<br />=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D 0x00200000,<br />=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D 0x1ff00000,<br />=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_=
WRITE | JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAILHOUSE_MEM_LOADABLE,=
<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br /></span><div><br /></div><div>Gues=
t 2:</div><div><br /></div><div><span style=3D"font-family: Courier New;">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MemRegion: 130600000-1505fffff : Guest Cell =
(2) (max. 512 MiB) */<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Low RAM (1 MiB) *=
/ <br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 .phys_start =3D 0x130600000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .virt_start =3D 0,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 .size =3D=20
0x100000

,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAI=
LHOUSE_MEM_LOADABLE,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br />=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* Communication region (4 KiB) */ <br />=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 {<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virt_start =3D=
 0x00100000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .size =3D=20
0x100000

,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_COMM_REGION,<br />=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 },<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* High RAM (max. 511 MiB=
) */ <br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 .phys_start =3D 0x130700000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .virt_start =3D 0x00200000,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 .size =3D=20
0x1ff00000

,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA | JAI=
LHOUSE_MEM_LOADABLE,<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br /></span></div>=
<br />If only 320 MiB is used in both guest cells, then the guest cells can=
 be successfully started one after the other with the command "jailhouse ce=
ll linux".<br /><br />However, if more than 320 MiB is used in guest cells =
(e.g. 336 MiB), then only one of the two guest cells can be successfully st=
arted.<br />When the 2nd guest cell is started, an error message is issued:=
<br /><div><br /></div><div><span style=3D"font-family: Courier New;">Trace=
back (most recent call last):<br />=C2=A0 File "/usr/libexec/jailhouse/jail=
house-cell-linux", line 737, in &lt;module&gt;<br />=C2=A0 =C2=A0 cell =3D =
JailhouseCell(config)<br />=C2=A0 File "/usr/lib/python3.8/site-packages/py=
jailhouse/cell.py", line 36, in __init__<br />=C2=A0 =C2=A0 raise e<br />=
=C2=A0 File "/usr/lib/python3.8/site-packages/pyjailhouse/cell.py", line 33=
, in __init__<br />=C2=A0 =C2=A0 fcntl.ioctl(self.dev, JailhouseCell.JAILHO=
USE_CELL_CREATE, create)<br />OSError: [Errno 12] Cannot allocate memory<br=
 />ERROR: Linux guest cell not started!<br /></span></div><br /><div>I have=
 now run numerous tests with different sizes for the guest cells and have c=
ome to the limit of 320 MiB, at which both guest cells can still be started=
.</div><div><br /></div><div>However, I cannot see why both guest cells can=
not be started.</div><div></div><div>Actually, in the configuration for the=
 root cell, enough memory has been reserved for both guest cells.</div><br =
/>Is there an explanation for this unexpected behavior?<br /><br /><div>Jan=
-Marc.</div><div><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/81fa9191-18dd-4003-9cfb-bed496d5723fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/81fa9191-18dd-4003-9cfb-bed496d5723fn%40googlegroups.co=
m</a>.<br />

------=_Part_941_1115202120.1690359253971--

------=_Part_940_1880925127.1690359253971--
