Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBX4KW37AKGQESFJ43FY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4532D08DE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 02:29:04 +0100 (CET)
Received: by mail-qt1-x83e.google.com with SMTP id f11sf9860515qth.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 17:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TSFym554AJcUtmgTVXdB4UvhZ2rIMZg+fzMUpjQXZCQ=;
        b=ATONAy7sRO+Z0yDPPeFuiO4kuWc1oJJCX8MxLW6CxMDVcZmbyIFhsGU1bm9CnHYLR9
         9NWAoLukaKweru/Iwbd48S9/XpRBECPfThBsuln4Mwn2emi0m0eR+NdXGHhDA6Vt5Sks
         YmFaXIXXVfbMYD0bE24zutBK9zCpugWWr7R1iHBSETFg/j5Ex6VdnqN8lhtcUWNZC5Qy
         ofUwrNVK5nQ42bBbySfKMAva7AuCQehUhuh/5v2XRk33BU9VoWRh0b1YtRzTR+l7uAtx
         ihKAZfE0QzAEtUIiuYOZ2vVCrSgcmz8NxcJaKVJ96uwlkdcfY6Lu6NAUXS/JRdcDYDAI
         EzMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TSFym554AJcUtmgTVXdB4UvhZ2rIMZg+fzMUpjQXZCQ=;
        b=M7hiRWra/gapZVzW5wz1jBW1StHF04JMfgruv01h+Q+lJVp4j7NzinnwbhFLQ1Hjjq
         TTHKRzbX8uPTEa4hdOiKTxcm5V2IaPLXP22XH/mcqoOQEAjfiQUU7Qzw3laZ8cIRD4Ed
         TH5/WdHR2EeAbYzhmz7yV0E4pRJngHAm26Z+zjsQflLHM9WCN4Gzo2Fn/6Jr/tUSuUoM
         DYL9X51VZFeVFYgsd71gZ9yDOANNDZgOQctjXXoXjzQusmQ5ip5gdVccFEO1Bqp9DBem
         rULgjzTaR/Hwb3UMrxwO5KxYF0mC5oJqfca9rMUOgCUKSZ5ixsOzOVptZ9m3bOiPqh4v
         ZrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TSFym554AJcUtmgTVXdB4UvhZ2rIMZg+fzMUpjQXZCQ=;
        b=mF4sBn/dNLyjSYB27JucqW9gC2lpG/XoFPni5ra62WMPCnSXnQnw+PhmhQ//2asv4+
         jMrZtiRwmgK+7/CvWxBgK1Eoe69ai4GjtSMc2h2w8KeNSkY2LcQf0MbjcU/vzJljWC9S
         OA3YsoPFWys9eiL311itwWiQ0Zgopaa+Xe198wAp5J2NfuTOvBTqJ8OO1I8bZIMfBxHf
         3RDs0HCmHZwrSA+sVc+uHTsj6rSOW/Kx060JJ4dFdYwn51Km8K7NtYF4CHsEEUMyv0wR
         IJ/lly6vQueUgpTw25shmjUR69IlasIVc70YH187vcOXTg2CnJLVwgYtJ9XqtJtbaF4v
         83Jw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Hm2w2ZWIcSuEj/Hc0I1/sFtZFhj56J7pXVjE7bzV2O7O5s4X/
	oADaRYDihMHC4hyiOzaONBs=
X-Google-Smtp-Source: ABdhPJzUCYZKAkLTdG8Ec2UjcYjEerPp54JpKxw21unI/Il1yjqn21Vwb2fFdKukfM8YhjLkxGzNUg==
X-Received: by 2002:ac8:d4d:: with SMTP id r13mr15051820qti.349.1607304543415;
        Sun, 06 Dec 2020 17:29:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:20ea:: with SMTP id 10ls3770005qvk.2.gmail; Sun, 06
 Dec 2020 17:29:02 -0800 (PST)
X-Received: by 2002:ad4:484c:: with SMTP id t12mr8162916qvy.58.1607304542648;
        Sun, 06 Dec 2020 17:29:02 -0800 (PST)
Date: Sun, 6 Dec 2020 17:29:01 -0800 (PST)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <126f7b0c-2fa6-4329-bb95-bddead90c9f7n@googlegroups.com>
In-Reply-To: <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
References: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
 <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
Subject: Re: Jailhouse on R-Pi4 with Debian rootfs
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2554_1675708448.1607304541894"
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

------=_Part_2554_1675708448.1607304541894
Content-Type: multipart/alternative; 
	boundary="----=_Part_2555_380148512.1607304541894"

------=_Part_2555_380148512.1607304541894
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=20
Thanks you for the suggestion of using an approved image.
I will try it out.

However, I really like to know the root cause and get the current Debian=20
setup working.

Yang


2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5:01:26 UTC+9=
 jsmo...@linuxfoundation.org:

> Check our GSoC project on Automotive Grade Linux:
> https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhous=
e
>
> It can build for PI.
>
> An it can serve as inspiration for the values needed.
>
> =20

>
> js
>
> Chung-Fan Yang <sonic...@gmail.com> schrieb am So., 6. Dez. 2020, 17:34:
>
>> Hi,
>>
>> I am working to get jailhouse work with my R-Pi4.
>>
>> I have been using a 64bit Debian buster rootfs with=20
>> a custom compiled 5.9 preempt-rt kernel.
>>
>> I have successful reserved >736M for jailhouse and inserted the=20
>> jailhouse.ko, but when I do jailhouse enable I got the following error o=
n=20
>> uart.
>>
>> Any suggestions are appreciated.
>>
>> Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1
>> Code location: 0x0000ffffc0200800
>> Page pool usage after early setup: mem 39/994, remap 0/131072
>> Initializing processors:
>>  CPU 1...=20
>> FATAL: Unhandled HYP exception: synchronous abort from EL2
>>  pc: 0000ffffc0203864   lr: 0000ffffc0203850 spsr: 200003c9     EL2
>>  sp: 0000ffffc0222e40  elr: 0000ffffc0203864  esr: 00 1 0000000
>>  x0: 0000000084000000   x1: 0000000000000000   x2: 0000000080003580
>>  x3: 0000000000000014   x4: 0000000000000002   x5: 0000000000000001
>>  x6: 0000000000000029   x7: 0000ffffc0219ec0   x8: 000000000000002a
>>  x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001
>> x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000
>> x15: 0000ffffc0015040  x16: 0000ffffc020da50  x17: ffffaf45951e7518
>> x18: 0000000000000001  x19: 0000ffffc0222000  x20: 0000ffffc0219000
>> x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000001
>> x24: 0000000000000001  x25: 0000ffffc0222000  x26: 0000ffffc0223000
>> x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc0222e40
>>
>> Hypervisor stack before exception Stopping CPU 1 (Cell: "Raspberry-Pi4")
>>
>> PS. I did noticed there is a similar post, but it has no solution.
>>
>> --=20
>> You received this message because you are subscribed to the Google Group=
s=20
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n=20
>> email to jailhouse-de...@googlegroups.com.
>> To view this discussion on the web visit=20
>> https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-=
91524477c7e1n%40googlegroups.com=20
>> <https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c=
-91524477c7e1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
>> .
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegroups.com.

------=_Part_2555_380148512.1607304541894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>
<span></span><div></div><div>Thanks you for the suggestion of using an appr=
oved image.</div><div>I will try it out.<br></div><div><br></div><div>Howev=
er, I really like to know the root cause and get the current Debian setup w=
orking.</div><div><br></div><div>Yang<br></div>

</div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"auto" class=
=3D"gmail_attr">2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=
=A5 5:01:26 UTC+9 jsmo...@linuxfoundation.org:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;"><div dir=3D"auto">Check our GSoC project=
 on Automotive Grade Linux:<div dir=3D"auto"><a href=3D"https://git.automot=
ivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse" target=3D"_blank" =
rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dja=
&amp;q=3Dhttps://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-j=
ailhouse&amp;source=3Dgmail&amp;ust=3D1607390746003000&amp;usg=3DAFQjCNH3hJ=
IQjRo3zk91qFSoxW_e41s5tQ">https://git.automotivelinux.org/AGL/meta-agl-deve=
l/tree/meta-agl-jailhouse</a><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">It can build for PI.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">An it can serve as inspiration for the values needed.</div><br></div=
></blockquote><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">js</div></div><br><div class=3D"gmail_quote"></div><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Chung-Fan Yan=
g &lt;<a href=3D"" data-email-masked=3D"" rel=3D"nofollow">sonic...@gmail.c=
om</a>&gt; schrieb am So., 6. Dez. 2020, 17:34:<br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div>Hi,</div><div><br></di=
v><div>I am working to get jailhouse work with my R-Pi4.</div><div><br></di=
v><div>I have been using a 64bit Debian buster rootfs with <br></div><div>a=
 custom compiled 5.9 preempt-rt kernel.</div><div><br></div><div>I have suc=
cessful reserved &gt;736M for jailhouse and inserted the jailhouse.ko, but =
when I do jailhouse enable I got the following error on uart.</div><div><br=
></div>Any suggestions are appreciated.<br><div><br></div><div>Initializing=
 Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1<br>Code location: 0x00=
00ffffc0200800<br>Page pool usage after early setup: mem 39/994, remap 0/13=
1072<br>Initializing processors:<br>&nbsp;CPU 1... <br>FATAL: Unhandled HYP=
 exception: synchronous abort from EL2<br>&nbsp;pc: 0000ffffc0203864&nbsp;&=
nbsp; lr: 0000ffffc0203850 spsr: 200003c9&nbsp;&nbsp;&nbsp;&nbsp; EL2<br>&n=
bsp;sp: 0000ffffc0222e40&nbsp; elr: 0000ffffc0203864&nbsp; esr: 00 1 000000=
0<br>&nbsp;x0: 0000000084000000&nbsp;&nbsp; x1: 0000000000000000&nbsp;&nbsp=
; x2: 0000000080003580<br>&nbsp;x3: 0000000000000014&nbsp;&nbsp; x4: 000000=
0000000002&nbsp;&nbsp; x5: 0000000000000001<br>&nbsp;x6: 0000000000000029&n=
bsp;&nbsp; x7: 0000ffffc0219ec0&nbsp;&nbsp; x8: 000000000000002a<br>&nbsp;x=
9: 0000000000000000&nbsp; x10: 0000000000000000&nbsp; x11: 0000000000000001=
<br>x12: 0000000000000015&nbsp; x13: 0000000000000001&nbsp; x14: 0000ffffc0=
219000<br>x15: 0000ffffc0015040&nbsp; x16: 0000ffffc020da50&nbsp; x17: ffff=
af45951e7518<br>x18: 0000000000000001&nbsp; x19: 0000ffffc0222000&nbsp; x20=
: 0000ffffc0219000<br>x21: 0000ffffc0200000&nbsp; x22: 0000ffffc0219000&nbs=
p; x23: 0000000000000001<br>x24: 0000000000000001&nbsp; x25: 0000ffffc02220=
00&nbsp; x26: 0000ffffc0223000<br>x27: 0000ffffc020f000&nbsp; x28: 0000ffff=
c0218000&nbsp; x29: 0000ffffc0222e40<br><br>Hypervisor stack before excepti=
on Stopping CPU 1 (Cell: "Raspberry-Pi4")</div><div><br></div><div>PS. I di=
d noticed there is a similar post, but it has no solution.<br></div><div><b=
r></div>

<p></p></blockquote></div><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

-- <br>
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"" rel=3D"noreferrer nofollow" data-email-masked=3D"">jai=
lhouse-de...@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"noreferrer nofoll=
ow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Dja&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874=
-428e-a97c-91524477c7e1n%2540googlegroups.com?utm_medium%3Demail%26utm_sour=
ce%3Dfooter&amp;source=3Dgmail&amp;ust=3D1607390746003000&amp;usg=3DAFQjCNE=
EE-aesoXzKuKDUeWnduhaXXhohA">https://groups.google.com/d/msgid/jailhouse-de=
v/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com</a>.<br>
</blockquote></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegroups.co=
m</a>.<br />

------=_Part_2555_380148512.1607304541894--

------=_Part_2554_1675708448.1607304541894--
