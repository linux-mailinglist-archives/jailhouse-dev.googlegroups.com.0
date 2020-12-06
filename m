Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBB4QWT7AKGQESJQ6EVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF52D05FD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  6 Dec 2020 17:34:20 +0100 (CET)
Received: by mail-qk1-x739.google.com with SMTP id u67sf10218987qkd.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7fQIIy2FJk4hSsEwGTYjbP8d6G0543F48WEmjxXr6bE=;
        b=iKCeAtl60/z+A5jo8d8Bq/m1EhyWoBxIUfvXU9JEEAEWmx8ki11edjufDuE9hCFulU
         x1648c6vCX7qtUZTvvPF6pBAGfZSzidGZFRANa8MzRXKoAE4zgRyAJgjyN3zCoz3f9qH
         PcOxeGXfOXkPxv9hGpLDH/ToN0r8Xr9QqC3/jCYAwX5yAImPeTfyE7zXu54H+i5+nZZu
         sJ32Ryj6sR1JxlboTQCqQq7NPCkGw/Mmcvb252kHHm8PcFscgvpjupdgErdODSGK+qIk
         eeMtb2VsXkuUUF7w1dSGHjKO6FFOwGGU4Z/6q7Ey0Q242m/qbVc5uHtdcpP5ovuYa1of
         Y8jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7fQIIy2FJk4hSsEwGTYjbP8d6G0543F48WEmjxXr6bE=;
        b=lnNwYvAg8vTQNY8R8FGCSScL9EakikQ5ri5vPgECwr4aHiXmjdXFdPvgaYEBU2vWDr
         hH2n3bVkbXWKThUklChWOv/NfiSy3+m6o803z5f0MdgpwL8KdpEz4xJMmyW3W0z+K6oJ
         yoiScaojywd0pLoTwteIZC7Y2m2iyx8mAt0WmCpy/pTyklkqIEDg3B+UJbi1LwlHPZ9L
         v6ShkOIxL/IQRe1ovF5Uxi44R651Bdzwa9E9g15/t7yoDzkS9RMLivSXnavOd8Jz3Z3Y
         7H3+Fuhx+iX+EqgpvYC1mHb0Hv/3E5TPXq5/HWGx//HGZgGuu/BXoOD4R0QQKTaOlAK1
         YajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7fQIIy2FJk4hSsEwGTYjbP8d6G0543F48WEmjxXr6bE=;
        b=dH2ovI77h1J32A9TdL1T55xQAVL6MygCH/JDMneW/18S71ocxVhOpD6L221AUnArne
         KmSIe6nJXxtUTUelCF/v7YsLRfzntYt0Gdh7kkHMB4Xblmi52SJv76TNQvfpUbZmGDU7
         AwALlgxc0zSI81VavlEYEWZS0MGqlE7S3GXBoH0G49jYnMRlERJm76VWAr60SC374h0/
         ubHeRGTbiyVXE2u6TtUxfus7lNUOu6pdkUAnRK1cNx16NlnbBuoiBrecMoijhl3Pkcpl
         Lh1EELgTqtBrPrQr1sMfP8jskXaD5mhJGfC7oKzOk7kgX6+zN0QLiGs5HbWYRNKFQQMy
         F3ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531HULX6+DsVsedZ8QF9szG+PLKGwCwDOuyB+wC13GDzephCS9Dm
	nImA4VomOTyMEU+vpgS8Vd4=
X-Google-Smtp-Source: ABdhPJwM24SCV+P5oAljutqSYUWWlruRAfRlFk+Gt4PU4fsosVWrEdr3Xg2nK7w68WzwZavB+d+F+w==
X-Received: by 2002:ac8:53c2:: with SMTP id c2mr20023989qtq.245.1607272455515;
        Sun, 06 Dec 2020 08:34:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4e29:: with SMTP id d9ls5333685qtw.10.gmail; Sun, 06 Dec
 2020 08:34:15 -0800 (PST)
X-Received: by 2002:ac8:70c1:: with SMTP id g1mr3758280qtp.108.1607272454775;
        Sun, 06 Dec 2020 08:34:14 -0800 (PST)
Date: Sun, 6 Dec 2020 08:34:14 -0800 (PST)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
Subject: Jailhouse on R-Pi4 with Debian rootfs
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3456_1513058477.1607272454135"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_3456_1513058477.1607272454135
Content-Type: multipart/alternative; 
	boundary="----=_Part_3457_176361611.1607272454135"

------=_Part_3457_176361611.1607272454135
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working to get jailhouse work with my R-Pi4.

I have been using a 64bit Debian buster rootfs with 
a custom compiled 5.9 preempt-rt kernel.

I have successful reserved >736M for jailhouse and inserted the 
jailhouse.ko, but when I do jailhouse enable I got the following error on 
uart.

Any suggestions are appreciated.

Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/994, remap 0/131072
Initializing processors:
 CPU 1... 
FATAL: Unhandled HYP exception: synchronous abort from EL2
 pc: 0000ffffc0203864   lr: 0000ffffc0203850 spsr: 200003c9     EL2
 sp: 0000ffffc0222e40  elr: 0000ffffc0203864  esr: 00 1 0000000
 x0: 0000000084000000   x1: 0000000000000000   x2: 0000000080003580
 x3: 0000000000000014   x4: 0000000000000002   x5: 0000000000000001
 x6: 0000000000000029   x7: 0000ffffc0219ec0   x8: 000000000000002a
 x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001
x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000
x15: 0000ffffc0015040  x16: 0000ffffc020da50  x17: ffffaf45951e7518
x18: 0000000000000001  x19: 0000ffffc0222000  x20: 0000ffffc0219000
x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000001
x24: 0000000000000001  x25: 0000ffffc0222000  x26: 0000ffffc0223000
x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc0222e40

Hypervisor stack before exception Stopping CPU 1 (Cell: "Raspberry-Pi4")

PS. I did noticed there is a similar post, but it has no solution.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com.

------=_Part_3457_176361611.1607272454135
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>I am working to get jailhouse work with m=
y R-Pi4.</div><div><br></div><div>I have been using a 64bit Debian buster r=
ootfs with <br></div><div>a custom compiled 5.9 preempt-rt kernel.</div><di=
v><br></div><div>I have successful reserved &gt;736M for jailhouse and inse=
rted the jailhouse.ko, but when I do jailhouse enable I got the following e=
rror on uart.</div><div><br></div>Any suggestions are appreciated.<br><div>=
<br></div><div>Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on C=
PU 1<br>Code location: 0x0000ffffc0200800<br>Page pool usage after early se=
tup: mem 39/994, remap 0/131072<br>Initializing processors:<br>&nbsp;CPU 1.=
.. <br>FATAL: Unhandled HYP exception: synchronous abort from EL2<br>&nbsp;=
pc: 0000ffffc0203864&nbsp;&nbsp; lr: 0000ffffc0203850 spsr: 200003c9&nbsp;&=
nbsp;&nbsp;&nbsp; EL2<br>&nbsp;sp: 0000ffffc0222e40&nbsp; elr: 0000ffffc020=
3864&nbsp; esr: 00 1 0000000<br>&nbsp;x0: 0000000084000000&nbsp;&nbsp; x1: =
0000000000000000&nbsp;&nbsp; x2: 0000000080003580<br>&nbsp;x3: 000000000000=
0014&nbsp;&nbsp; x4: 0000000000000002&nbsp;&nbsp; x5: 0000000000000001<br>&=
nbsp;x6: 0000000000000029&nbsp;&nbsp; x7: 0000ffffc0219ec0&nbsp;&nbsp; x8: =
000000000000002a<br>&nbsp;x9: 0000000000000000&nbsp; x10: 0000000000000000&=
nbsp; x11: 0000000000000001<br>x12: 0000000000000015&nbsp; x13: 00000000000=
00001&nbsp; x14: 0000ffffc0219000<br>x15: 0000ffffc0015040&nbsp; x16: 0000f=
fffc020da50&nbsp; x17: ffffaf45951e7518<br>x18: 0000000000000001&nbsp; x19:=
 0000ffffc0222000&nbsp; x20: 0000ffffc0219000<br>x21: 0000ffffc0200000&nbsp=
; x22: 0000ffffc0219000&nbsp; x23: 0000000000000001<br>x24: 000000000000000=
1&nbsp; x25: 0000ffffc0222000&nbsp; x26: 0000ffffc0223000<br>x27: 0000ffffc=
020f000&nbsp; x28: 0000ffffc0218000&nbsp; x29: 0000ffffc0222e40<br><br>Hype=
rvisor stack before exception Stopping CPU 1 (Cell: "Raspberry-Pi4")</div><=
div><br></div><div>PS. I did noticed there is a similar post, but it has no=
 solution.<br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.co=
m</a>.<br />

------=_Part_3457_176361611.1607272454135--

------=_Part_3456_1513058477.1607272454135--
