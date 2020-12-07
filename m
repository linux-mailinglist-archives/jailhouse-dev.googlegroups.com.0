Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBGNOW77AKGQEW2GHPAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB9D2D0B05
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 08:17:46 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id cu18sf10732807qvb.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 23:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oSDclCNjDYNGuQqKbt0ZW8PfmatcKyoGCgjfe3tA7GA=;
        b=RkmKn1RwDbywJUu/gZ4nsu7G+NcNF5DzgEQXwuy0Fi/M4kYBbea4RIRo5OoAC+V6wI
         BrfVmEWs0vtt0FV8vmEfbWTT3coZBeAI/NoqQSY4KHQ0BhIswLGCDrTvzwTct1hhj8Cj
         rcB1KlDj8j+SeXrYxjwSWPO5l0pwRO+NeAxKMUafFrERyiCtabiil5dIiOczDTZOJnhb
         FjDhcQvdWlhlUoDUAl91y/xhbNyoOFBxNOHo7kuS37UdWzB/wKFuPF+a7y2lBdJ0ltIT
         cQsQk5hy9EGyvNPYCU9O/T2N99l2DAQkMYHx5oTT+Z/0jpZ3zPLFGg/YDX1ggubBayMC
         FtxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oSDclCNjDYNGuQqKbt0ZW8PfmatcKyoGCgjfe3tA7GA=;
        b=rZDRa3ksvt/e1VA/sFZx7oGwbJCVVo556rOoxhUCq+aH83u4FLLJgTPfeJevxpiF0Q
         /UFL9GJAvjRWkzMYQv60A9pTczSUHYKrnUMWdusDl248pBxL0mEHz/+w8CUS3b0yo1Ho
         y3H1RocO1yke8JLbGyqDJyvtD+ozbQEy099SfGWNWlSm8Ztah/Jla8NOVsMvfkMp+HV9
         KOvFM82n6Bf4EuEB10PO4E6YKE+zqBDisptobRrD/CLmfL6rwCYxdVr5wOTSO8iAHHci
         Q25Y75Xc3yJKXszDwNuSpjjf3qmH2NTmSkBY+V4GMljIDQPsjZ0xZVSVkOVcdXh8cr8v
         Ucxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oSDclCNjDYNGuQqKbt0ZW8PfmatcKyoGCgjfe3tA7GA=;
        b=Jokh4A5g5Hni07IrlyGVtwNCFCoyDbBFCphVVSvUrxZwIZRuGgANxr8Eg7OgwjLRYx
         rjFKgV1X/tN94TXeTgguS/q6DA30YdwPnYyAz87RSLqn/xI2qjXgaHa5Qxes7PMnvw7M
         DHDLQ65IHCk9mIOWDM4v6xXupLnvdzCPHy2RjFlU1V0r4unYzdYi+c2JHfxKEk3LUM0g
         /6cliQcMaTk8Qmzyu88e/+0rQtyfWRWhxUyS7iCCzdLRMMNddtWwUspymH2g8cuLlfSz
         GwmjANDZugNrbgmYfHEwPHVcjSSp0lytfAJVv1mjTkw+M2ikUy24J/b55yeCwDW6CyYF
         R6yg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531AKUF3WHCzqw1CSmEgG95dN4Zxlc/AdYNeMZER5cAWpoqwL7M0
	AQQKUJHQrf1YpkWqj1DoVDk=
X-Google-Smtp-Source: ABdhPJwMjjlTM25V+2x0PXZe+gIIAOsIBL5mqjD/7Q9rUwBqoOPIZsJp71kY/Zc4piEJKJL/OVCWrQ==
X-Received: by 2002:a05:6214:15c3:: with SMTP id p3mr9057364qvz.16.1607325465336;
        Sun, 06 Dec 2020 23:17:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:70ca:: with SMTP id g10ls472281qtp.3.gmail; Sun, 06 Dec
 2020 23:17:44 -0800 (PST)
X-Received: by 2002:ac8:724d:: with SMTP id l13mr22426922qtp.373.1607325464560;
        Sun, 06 Dec 2020 23:17:44 -0800 (PST)
Date: Sun, 6 Dec 2020 23:17:43 -0800 (PST)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <313f42e9-5551-4f77-afc1-498f355d3e95n@googlegroups.com>
In-Reply-To: <b6206c2f-ea42-a3ec-d95c-5e84931ece21@siemens.com>
References: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
 <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
 <126f7b0c-2fa6-4329-bb95-bddead90c9f7n@googlegroups.com>
 <b6206c2f-ea42-a3ec-d95c-5e84931ece21@siemens.com>
Subject: Re: Jailhouse on R-Pi4 with Debian rootfs
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1247_1458584981.1607325463824"
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

------=_Part_1247_1458584981.1607325463824
Content-Type: multipart/alternative; 
	boundary="----=_Part_1248_1758378595.1607325463824"

------=_Part_1248_1758378595.1607325463824
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 15:14:50 UTC+=
9 j.kiszka...@gmail.com:

> On 07.12.20 02:29, Chung-Fan Yang wrote:=20
> > Thanks you for the suggestion of using an approved image.=20
> > I will try it out.=20
> >=20
> > However, I really like to know the root cause and get the current Debia=
n=20
> > setup working.=20
>
> [1] officially supports the RPi4 on buster (despite the pain that=20
> brings, hope 5.10 improves the situation at bit). You should derive from=
=20
> that, specifically the DT overlay-based memory reservation which was=20
> fixed not so long ago.=20
>

Thank you.
I see the commit now.
So basically I have to include an additional dtbo the the boot process, am=
=20
I right?
Will it work only on the device-tree from rpi-firmware or also the in=20
kernel-tree one?
I am currently using the in-tree device tree from  kernel 5.9 without any=
=20
overlay.

By the way, by pain, what do you mean?

---
Yang
=20

>
> For the kernel, I didn't do a rebase of your patch series yet. [2] is=20
> the latest upstream based queue.=20
>
> Jan=20
>
> [1] https://github.com/siemens/jailhouse-images=20
> [2]=20
> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/j=
ailhouse=20
>
> >=20
> > Yang=20
> >=20
> >=20
> > 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5:01:26 U=
TC+9 jsmo...@linuxfoundation.org:=20
> >=20
> > Check our GSoC project on Automotive Grade Linux:=20
> >=20
> https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhous=
e=20
> > <
> https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhous=
e>=20
>
> >=20
> > It can build for PI.=20
> >=20
> > An it can serve as inspiration for the values needed.=20
> >=20
> >  =20
> >=20
> >=20
> > js=20
> >=20
> > Chung-Fan Yang <sonic...@gmail.com> schrieb am So., 6. Dez. 2020,=20
> 17:34:=20
> >=20
> > Hi,=20
> >=20
> > I am working to get jailhouse work with my R-Pi4.=20
> >=20
> > I have been using a 64bit Debian buster rootfs with=20
> > a custom compiled 5.9 preempt-rt kernel.=20
> >=20
> > I have successful reserved >736M for jailhouse and inserted the=20
> > jailhouse.ko, but when I do jailhouse enable I got the following=20
> > error on uart.=20
> >=20
> > Any suggestions are appreciated.=20
> >=20
> > Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1=20
> > Code location: 0x0000ffffc0200800=20
> > Page pool usage after early setup: mem 39/994, remap 0/131072=20
> > Initializing processors:=20
> >  CPU 1...=20
> > FATAL: Unhandled HYP exception: synchronous abort from EL2=20
> >  pc: 0000ffffc0203864   lr: 0000ffffc0203850 spsr: 200003c9     EL2=20
> >  sp: 0000ffffc0222e40  elr: 0000ffffc0203864  esr: 00 1 0000000=20
> >  x0: 0000000084000000   x1: 0000000000000000   x2: 0000000080003580=20
> >  x3: 0000000000000014   x4: 0000000000000002   x5: 0000000000000001=20
> >  x6: 0000000000000029   x7: 0000ffffc0219ec0   x8: 000000000000002a=20
> >  x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001=20
> > x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000=20
> > x15: 0000ffffc0015040  x16: 0000ffffc020da50  x17: ffffaf45951e7518=20
> > x18: 0000000000000001  x19: 0000ffffc0222000  x20: 0000ffffc0219000=20
> > x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000001=20
> > x24: 0000000000000001  x25: 0000ffffc0222000  x26: 0000ffffc0223000=20
> > x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc0222e40=20
> >=20
> > Hypervisor stack before exception Stopping CPU 1 (Cell:=20
> > "Raspberry-Pi4")=20
> >=20
> > PS. I did noticed there is a similar post, but it has no solution.=20
> >=20
> > --=20
> > You received this message because you are subscribed to the=20
> > Google Groups "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from=20
> > it, send an email to jailhouse-de...@googlegroups.com.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-9=
1524477c7e1n%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-9=
1524477c7e1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-b=
ddead90c9f7n%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-b=
ddead90c9f7n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/313f42e9-5551-4f77-afc1-498f355d3e95n%40googlegroups.com.

------=_Part_1248_1758378595.1607325463824
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">2=
020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 15:14:50 UTC+9=
 j.kiszka...@gmail.com:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-le=
ft: 1ex;">On 07.12.20 02:29, Chung-Fan Yang wrote:
<br>&gt; Thanks you for the suggestion of using an approved image.
<br>&gt; I will try it out.
<br>&gt;=20
<br>&gt; However, I really like to know the root cause and get the current =
Debian
<br>&gt; setup working.
<br>
<br>[1] officially supports the RPi4 on buster (despite the pain that
<br>brings, hope 5.10 improves the situation at bit). You should derive fro=
m
<br>that, specifically the DT overlay-based memory reservation which was
<br>fixed not so long ago.
<br></blockquote><div><br></div><div>Thank you.<br></div><div>I see the com=
mit now.</div><div>So basically I have to include an additional dtbo the th=
e boot process, am I right?</div><div>Will it work only on the device-tree =
from rpi-firmware or also the in kernel-tree one?</div><div>I am currently =
using the in-tree device tree from&nbsp;
 kernel 5.9

 without any overlay.</div><div><br></div><div>By the way, by pain, what do=
 you mean?</div><div><br></div><div>---</div><div>Yang<br></div><div>&nbsp;=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>For the kernel, I didn't do a rebase of your patch series yet. [2] is
<br>the latest upstream based queue.
<br>
<br>Jan
<br>
<br>[1] <a href=3D"https://github.com/siemens/jailhouse-images" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Dja&amp;q=3Dhttps://github.com/siemens/jailhouse-images&amp;source=3Dgm=
ail&amp;ust=3D1607411614548000&amp;usg=3DAFQjCNGLjDA5A41ZcwDyMyvgh35Ik3PmZg=
">https://github.com/siemens/jailhouse-images</a>
<br>[2]
<br><a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/h=
eads/queues/jailhouse" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttp://git.kiszka.org/?p%=
3Dlinux.git;a%3Dshortlog;h%3Drefs/heads/queues/jailhouse&amp;source=3Dgmail=
&amp;ust=3D1607411614549000&amp;usg=3DAFQjCNG2sa3_XgbkZOTPM46x1F2wPO3-Rw">h=
ttp://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jail=
house</a>
<br>
<br>&gt;=20
<br>&gt; Yang
<br>&gt;=20
<br>&gt;=20
<br>&gt; 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5:01=
:26 UTC+9 <a href=3D"" data-email-masked=3D"" rel=3D"nofollow">jsmo...@linu=
xfoundation.org</a>:
<br>&gt;=20
<br>&gt;     Check our GSoC project on Automotive Grade Linux:
<br>&gt;     <a href=3D"https://git.automotivelinux.org/AGL/meta-agl-devel/=
tree/meta-agl-jailhouse" target=3D"_blank" rel=3D"nofollow" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://git.automotivel=
inux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse&amp;source=3Dgmail&amp;=
ust=3D1607411614549000&amp;usg=3DAFQjCNEZCh0R9NMMqdZ-u7Cc9TnE_xwHhg">https:=
//git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse</a>
<br>&gt;     &lt;<a href=3D"https://git.automotivelinux.org/AGL/meta-agl-de=
vel/tree/meta-agl-jailhouse" target=3D"_blank" rel=3D"nofollow" data-safere=
directurl=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://git.automot=
ivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse&amp;source=3Dgmail&=
amp;ust=3D1607411614549000&amp;usg=3DAFQjCNEZCh0R9NMMqdZ-u7Cc9TnE_xwHhg">ht=
tps://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse</a=
>&gt;
<br>&gt;=20
<br>&gt;     It can build for PI.
<br>&gt;=20
<br>&gt;     An it can serve as inspiration for the values needed.
<br>&gt;=20
<br>&gt; &nbsp;
<br>&gt;=20
<br>&gt;=20
<br>&gt;     js
<br>&gt;=20
<br>&gt;     Chung-Fan Yang &lt;<a href=3D"" data-email-masked=3D"" rel=3D"=
nofollow">sonic...@gmail.com</a>&gt; schrieb am So., 6. Dez. 2020, 17:34:
<br>&gt;=20
<br>&gt;         Hi,
<br>&gt;=20
<br>&gt;         I am working to get jailhouse work with my R-Pi4.
<br>&gt;=20
<br>&gt;         I have been using a 64bit Debian buster rootfs with
<br>&gt;         a custom compiled 5.9 preempt-rt kernel.
<br>&gt;=20
<br>&gt;         I have successful reserved &gt;736M for jailhouse and inse=
rted the
<br>&gt;         jailhouse.ko, but when I do jailhouse enable I got the fol=
lowing
<br>&gt;         error on uart.
<br>&gt;=20
<br>&gt;         Any suggestions are appreciated.
<br>&gt;=20
<br>&gt;         Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on=
 CPU 1
<br>&gt;         Code location: 0x0000ffffc0200800
<br>&gt;         Page pool usage after early setup: mem 39/994, remap 0/131=
072
<br>&gt;         Initializing processors:
<br>&gt;         &nbsp;CPU 1...
<br>&gt;         FATAL: Unhandled HYP exception: synchronous abort from EL2
<br>&gt;         &nbsp;pc: 0000ffffc0203864&nbsp;&nbsp; lr: 0000ffffc020385=
0 spsr: 200003c9&nbsp;&nbsp;&nbsp;&nbsp; EL2
<br>&gt;         &nbsp;sp: 0000ffffc0222e40&nbsp; elr: 0000ffffc0203864&nbs=
p; esr: 00 1 0000000
<br>&gt;         &nbsp;x0: 0000000084000000&nbsp;&nbsp; x1: 000000000000000=
0&nbsp;&nbsp; x2: 0000000080003580
<br>&gt;         &nbsp;x3: 0000000000000014&nbsp;&nbsp; x4: 000000000000000=
2&nbsp;&nbsp; x5: 0000000000000001
<br>&gt;         &nbsp;x6: 0000000000000029&nbsp;&nbsp; x7: 0000ffffc0219ec=
0&nbsp;&nbsp; x8: 000000000000002a
<br>&gt;         &nbsp;x9: 0000000000000000&nbsp; x10: 0000000000000000&nbs=
p; x11: 0000000000000001
<br>&gt;         x12: 0000000000000015&nbsp; x13: 0000000000000001&nbsp; x1=
4: 0000ffffc0219000
<br>&gt;         x15: 0000ffffc0015040&nbsp; x16: 0000ffffc020da50&nbsp; x1=
7: ffffaf45951e7518
<br>&gt;         x18: 0000000000000001&nbsp; x19: 0000ffffc0222000&nbsp; x2=
0: 0000ffffc0219000
<br>&gt;         x21: 0000ffffc0200000&nbsp; x22: 0000ffffc0219000&nbsp; x2=
3: 0000000000000001
<br>&gt;         x24: 0000000000000001&nbsp; x25: 0000ffffc0222000&nbsp; x2=
6: 0000ffffc0223000
<br>&gt;         x27: 0000ffffc020f000&nbsp; x28: 0000ffffc0218000&nbsp; x2=
9: 0000ffffc0222e40
<br>&gt;=20
<br>&gt;         Hypervisor stack before exception Stopping CPU 1 (Cell:
<br>&gt;         "Raspberry-Pi4")
<br>&gt;=20
<br>&gt;         PS. I did noticed there is a similar post, but it has no s=
olution.
<br>&gt;=20
<br>&gt;         --=20
<br>&gt;         You received this message because you are subscribed to th=
e
<br>&gt;         Google Groups "Jailhouse" group.
<br>&gt;         To unsubscribe from this group and stop receiving emails f=
rom
<br>&gt;         it, send an email to <a href=3D"" data-email-masked=3D"" r=
el=3D"nofollow">jailhouse-de...@googlegroups.com</a>.
<br>&gt;         To view this discussion on the web visit
<br>&gt;         <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com" target=3D"_blank=
" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
ja&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-42=
8e-a97c-91524477c7e1n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D160=
7411614549000&amp;usg=3DAFQjCNFjGxSoo8oJtMB6W1Zk_BdTejor_g">https://groups.=
google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40go=
oglegroups.com</a>
<br>&gt;         &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://groups.go=
ogle.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%2540go=
oglegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&=
amp;ust=3D1607411614550000&amp;usg=3DAFQjCNHFw1bA_FTojnXmi7yFkwFfUWZwEA">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524=
477c7e1n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&=
gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups "Jailhouse" group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a href=3D"" data-email-masked=3D"" rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"" data-email-masked=3D"" rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/126f7b0=
c-2fa6-4329-bb95-bddead90c9f7n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dja&amp;q=
=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-=
bddead90c9f7n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16074116145=
50000&amp;usg=3DAFQjCNFHx4kCG0nryM5ClIfPT6vg4opk_A">https://groups.google.c=
om/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegrou=
ps.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/126=
f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://groups.google.com=
/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%2540googlegrou=
ps.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=
=3D1607411614550000&amp;usg=3DAFQjCNHF6V7xA5Pq3lrEStgiLbR9GFuvxg">https://g=
roups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7=
n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/313f42e9-5551-4f77-afc1-498f355d3e95n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/313f42e9-5551-4f77-afc1-498f355d3e95n%40googlegroups.co=
m</a>.<br />

------=_Part_1248_1758378595.1607325463824--

------=_Part_1247_1458584981.1607325463824--
