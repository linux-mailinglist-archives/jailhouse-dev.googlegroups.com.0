Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBKVWX37AKGQEPG3BE4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 7739F2D2E2C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Dec 2020 16:26:35 +0100 (CET)
Received: by mail-qt1-x840.google.com with SMTP id j1sf13781645qtd.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Dec 2020 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7ADagtm4gNO/cD+Bx1kn3Hzz+tzWQCkWdTi2leXBdDs=;
        b=tMAhzZGLHBnt6D02qm3t6dox57Y/NhsSCe7cxpMmb7du2dkn7kYdu8Z85jwUHH9qU1
         sjPYF5wzRxOIVoBeX/RZ+3pxIeCFYZiHkJxa1dhdtkg+McKbsuPFUiPKmO0HtFoWlH+c
         WR2kEXLoHCcNtlOxzsofc/Io4EZUSfooTO2b0zL5/Lv4FvgXSuorjW0QwgVmz91UOoSc
         gHIUd1ZmbnRjMI14G26dr4TL1HZYSmuUffNhioqDz964A2tx1vt9cB64DETAWYVieANb
         8xXSCPQYCRmWV6sKHGvsX8o51Rp0+fIGWhX0QrDnmBAHHq17qBdo3vJHigowO2EoPHoS
         WSSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7ADagtm4gNO/cD+Bx1kn3Hzz+tzWQCkWdTi2leXBdDs=;
        b=Ny+wrkkWbT4r2Eao4xE69o1HsgduOSNb2bJOsz5bIV5cW7dBhGYmdGED41mz8mEIGd
         fJRx8b4A2V5qeaAFKHPd89yDqEt+n2Wdzxj5/tLr5C21I8nLmHWo5Nd/dSIzqOvtR7L8
         9TbArskmjOUrotivWKQETmJUqbC4ee+riP03z0b7xO+Z5UF98/e6i8v7khW3MBxj6Sxb
         MrQ1QAtfP/ed1MbamnYxkLKb9jHKGrh4rOqgmQjhxhFXnrFad56HXts57NBs6cE7Mkl8
         SV1Pw70mKr8+nyT++rKLxQ8R174kw84mhh5CBovMtrumzxbCyrBOd+PDfxITEVv/lA/6
         ja4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7ADagtm4gNO/cD+Bx1kn3Hzz+tzWQCkWdTi2leXBdDs=;
        b=aQ+8ptZo2LNnhwdGCD9y9y8PRq91np6/asWpUiA46DXHOYngzzZ4GuPlGJkdAwej6G
         XlNuCVfcy1pyvFUa2zDf1/Mg6BMAb5RxskWLGtm6aa06DUsq47UlvYjf0l2VYqulAW4o
         XAPcpNuIXnYBgCwBDc10hNYUlCj67vRNEn50mSSEXTVISJxepPL36eIBfWAQFpPqM1Fv
         Kwb/Nw+efvDYMcXpUsHG2TEH+omE8POFnBr+LZTbTPEigShnkr1HQgcNiL7CBPIc3LXe
         05zH/BOCniMQv8/dYoCD+7VBmcmwImC8Mv0/GjuUzRyb3WaEcg5PumU1D56auelGZm7i
         M+xA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530u9YGjCMAefTILMyVsp+joC0oB4B/Xsd9P/gGtUsksJUXBlW8s
	FOv2ejA4i6SiC66C1eO6fFk=
X-Google-Smtp-Source: ABdhPJy2JyOHjAi45ZT6B8SmLJMM1W6jHwF1UYBDZ46/3CYHFpwrDMGspd+acN9h9QLEHkjgX5u5gQ==
X-Received: by 2002:a05:620a:218e:: with SMTP id g14mr3097724qka.243.1607441194278;
        Tue, 08 Dec 2020 07:26:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:572:: with SMTP id p18ls9878665qkp.0.gmail; Tue, 08
 Dec 2020 07:26:33 -0800 (PST)
X-Received: by 2002:a37:b0c6:: with SMTP id z189mr20308299qke.312.1607441193509;
        Tue, 08 Dec 2020 07:26:33 -0800 (PST)
Date: Tue, 8 Dec 2020 07:26:32 -0800 (PST)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0031a2f2-07ed-453e-924a-8b9756af8ff9n@googlegroups.com>
In-Reply-To: <313f42e9-5551-4f77-afc1-498f355d3e95n@googlegroups.com>
References: <f0e8ee0a-e874-428e-a97c-91524477c7e1n@googlegroups.com>
 <CADja47Ob29sD_YXYwnxiauGse4sd8MHqhBRq2hy+94JTW2dgyA@mail.gmail.com>
 <126f7b0c-2fa6-4329-bb95-bddead90c9f7n@googlegroups.com>
 <b6206c2f-ea42-a3ec-d95c-5e84931ece21@siemens.com>
 <313f42e9-5551-4f77-afc1-498f355d3e95n@googlegroups.com>
Subject: Re: Jailhouse on R-Pi4 with Debian rootfs
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2334_653770469.1607441192809"
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

------=_Part_2334_653770469.1607441192809
Content-Type: multipart/alternative; 
	boundary="----=_Part_2335_2134031842.1607441192809"

------=_Part_2335_2134031842.1607441192809
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I made some progress.

I successful applied the device tree overlay and BL31 firmware.
Now, the hypervisor did see the reserved memory and starts loading with a=
=20
mainline 5.9 PREEMPT_RT patched kernel.
(I did add the extra EXPORT_SYMBOLS for this to work.)
Not yet tested with any additional cell.=20

Thank you guys for the hints on the device tree fix.

I also tried the jailhouse-image repository, that works fine too.

I would like to ask an additional question:

Why is it necessary to load a custom BL31 firmware instead of the in EEPROM=
=20
one?
Is it for the PSCI CPU on/offlining?


---
Yang

2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 16:17:44 UTC+=
9 Chung-Fan Yang:

>
>
> 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 15:14:50 UT=
C+9 j.kiszka...@gmail.com:
>
>> On 07.12.20 02:29, Chung-Fan Yang wrote:=20
>> > Thanks you for the suggestion of using an approved image.=20
>> > I will try it out.=20
>> >=20
>> > However, I really like to know the root cause and get the current=20
>> Debian=20
>> > setup working.=20
>>
>> [1] officially supports the RPi4 on buster (despite the pain that=20
>> brings, hope 5.10 improves the situation at bit). You should derive from=
=20
>> that, specifically the DT overlay-based memory reservation which was=20
>> fixed not so long ago.=20
>>
>
> Thank you.
> I see the commit now.
> So basically I have to include an additional dtbo the the boot process, a=
m=20
> I right?
> Will it work only on the device-tree from rpi-firmware or also the in=20
> kernel-tree one?
> I am currently using the in-tree device tree from  kernel 5.9 without any=
=20
> overlay.
>
> By the way, by pain, what do you mean?
>
> ---
> Yang
> =20
>
>>
>> For the kernel, I didn't do a rebase of your patch series yet. [2] is=20
>> the latest upstream based queue.=20
>>
>> Jan=20
>>
>> [1] https://github.com/siemens/jailhouse-images=20
>> [2]=20
>>
>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/=
jailhouse=20
>>
>> >=20
>> > Yang=20
>> >=20
>> >=20
>> > 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5:01:26 =
UTC+9 jsmo...@linuxfoundation.org:=20
>> >=20
>> > Check our GSoC project on Automotive Grade Linux:=20
>> >=20
>> https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhou=
se=20
>> > <
>> https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhou=
se>=20
>>
>> >=20
>> > It can build for PI.=20
>> >=20
>> > An it can serve as inspiration for the values needed.=20
>> >=20
>> >  =20
>> >=20
>> >=20
>> > js=20
>> >=20
>> > Chung-Fan Yang <sonic...@gmail.com> schrieb am So., 6. Dez. 2020,=20
>> 17:34:=20
>> >=20
>> > Hi,=20
>> >=20
>> > I am working to get jailhouse work with my R-Pi4.=20
>> >=20
>> > I have been using a 64bit Debian buster rootfs with=20
>> > a custom compiled 5.9 preempt-rt kernel.=20
>> >=20
>> > I have successful reserved >736M for jailhouse and inserted the=20
>> > jailhouse.ko, but when I do jailhouse enable I got the following=20
>> > error on uart.=20
>> >=20
>> > Any suggestions are appreciated.=20
>> >=20
>> > Initializing Jailhouse hypervisor v0.12 (223-g097bed0f) on CPU 1=20
>> > Code location: 0x0000ffffc0200800=20
>> > Page pool usage after early setup: mem 39/994, remap 0/131072=20
>> > Initializing processors:=20
>> >  CPU 1...=20
>> > FATAL: Unhandled HYP exception: synchronous abort from EL2=20
>> >  pc: 0000ffffc0203864   lr: 0000ffffc0203850 spsr: 200003c9     EL2=20
>> >  sp: 0000ffffc0222e40  elr: 0000ffffc0203864  esr: 00 1 0000000=20
>> >  x0: 0000000084000000   x1: 0000000000000000   x2: 0000000080003580=20
>> >  x3: 0000000000000014   x4: 0000000000000002   x5: 0000000000000001=20
>> >  x6: 0000000000000029   x7: 0000ffffc0219ec0   x8: 000000000000002a=20
>> >  x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000001=20
>> > x12: 0000000000000015  x13: 0000000000000001  x14: 0000ffffc0219000=20
>> > x15: 0000ffffc0015040  x16: 0000ffffc020da50  x17: ffffaf45951e7518=20
>> > x18: 0000000000000001  x19: 0000ffffc0222000  x20: 0000ffffc0219000=20
>> > x21: 0000ffffc0200000  x22: 0000ffffc0219000  x23: 0000000000000001=20
>> > x24: 0000000000000001  x25: 0000ffffc0222000  x26: 0000ffffc0223000=20
>> > x27: 0000ffffc020f000  x28: 0000ffffc0218000  x29: 0000ffffc0222e40=20
>> >=20
>> > Hypervisor stack before exception Stopping CPU 1 (Cell:=20
>> > "Raspberry-Pi4")=20
>> >=20
>> > PS. I did noticed there is a similar post, but it has no solution.=20
>> >=20
>> > --=20
>> > You received this message because you are subscribed to the=20
>> > Google Groups "Jailhouse" group.=20
>> > To unsubscribe from this group and stop receiving emails from=20
>> > it, send an email to jailhouse-de...@googlegroups.com.=20
>> > To view this discussion on the web visit=20
>> >=20
>> https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-=
91524477c7e1n%40googlegroups.com=20
>> > <
>> https://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-=
91524477c7e1n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=
=20
>>
>> >=20
>> > --=20
>> > You received this message because you are subscribed to the Google=20
>> > Groups "Jailhouse" group.=20
>> > To unsubscribe from this group and stop receiving emails from it, send=
=20
>> > an email to jailhouse-de...@googlegroups.com=20
>> > <mailto:jailhouse-de...@googlegroups.com>.=20
>> > To view this discussion on the web visit=20
>> >=20
>> https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-=
bddead90c9f7n%40googlegroups.com=20
>> > <
>> https://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-=
bddead90c9f7n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=
=20
>>
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0031a2f2-07ed-453e-924a-8b9756af8ff9n%40googlegroups.com.

------=_Part_2335_2134031842.1607441192809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I made some progress.</div><div><br></div><div>I successful applied th=
e device tree overlay and BL31 firmware.</div><div>Now, the hypervisor did =
see the reserved memory and starts loading with a mainline 5.9 PREEMPT_RT p=
atched kernel.</div><div>(I did add the extra EXPORT_SYMBOLS for this to wo=
rk.)</div><div>
Not yet tested with any additional cell. <br></div><div><br></div><div>Than=
k you guys for the hints on the device tree fix.</div><div><br></div><div>I=
 also tried the jailhouse-image repository, that works fine too.<br></div><=
div><br></div><div>I would like to ask an additional question:</div><div><b=
r></div><div>Why is it necessary to load a custom BL31 firmware instead of =
the in EEPROM one?</div><div>Is it for the PSCI CPU on/offlining?</div><div=
><br></div><div><br></div><div>---</div><div>Yang<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">2020=E5=B9=B412=E6=
=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 16:17:44 UTC+9 Chung-Fan Yang:<=
br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; b=
order-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br><br><div =
class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">2020=E5=B9=B41=
2=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 15:14:50 UTC+9 <a href data=
-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</a>:<br></div></div><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 07.=
12.20 02:29, Chung-Fan Yang wrote:
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
<br></blockquote><div><br></div></div><div class=3D"gmail_quote"><div>Thank=
 you.<br></div><div>I see the commit now.</div><div>So basically I have to =
include an additional dtbo the the boot process, am I right?</div><div>Will=
 it work only on the device-tree from rpi-firmware or also the in kernel-tr=
ee one?</div><div>I am currently using the in-tree device tree from=C2=A0
 kernel 5.9

 without any overlay.</div><div><br></div><div>By the way, by pain, what do=
 you mean?</div><div><br></div><div>---</div><div>Yang<br></div></div><div =
class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>For the kernel, I didn&#39;t do a rebase of your patch series yet. [2] =
is
<br>the latest upstream based queue.
<br>
<br>Jan
<br>
<br>[1] <a href=3D"https://github.com/siemens/jailhouse-images" rel=3D"nofo=
llow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Dja&amp;q=3Dhttps://github.com/siemens/jailhouse-images&amp;source=3Dgm=
ail&amp;ust=3D1607525378625000&amp;usg=3DAFQjCNEZj4smdPeViz9Jr_pfRTvuyvA4gA=
">https://github.com/siemens/jailhouse-images</a>
<br>[2]
<br><a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/h=
eads/queues/jailhouse" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttp://git.kiszka.org/?p%=
3Dlinux.git;a%3Dshortlog;h%3Drefs/heads/queues/jailhouse&amp;source=3Dgmail=
&amp;ust=3D1607525378625000&amp;usg=3DAFQjCNFDRBSDW5fMkanbxALsWZNlJVN0LQ">h=
ttp://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jail=
house</a>
<br>
<br>&gt;=20
<br>&gt; Yang
<br>&gt;=20
<br>&gt;=20
<br>&gt; 2020=E5=B9=B412=E6=9C=887=E6=97=A5=E6=9C=88=E6=9B=9C=E6=97=A5 5:01=
:26 UTC+9 <a rel=3D"nofollow">jsmo...@linuxfoundation.org</a>:
<br>&gt;=20
<br>&gt;     Check our GSoC project on Automotive Grade Linux:
<br>&gt;     <a href=3D"https://git.automotivelinux.org/AGL/meta-agl-devel/=
tree/meta-agl-jailhouse" rel=3D"nofollow" target=3D"_blank" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://git.automotivel=
inux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse&amp;source=3Dgmail&amp;=
ust=3D1607525378625000&amp;usg=3DAFQjCNGdHShwGAhnCXM_5oAB0kGY6W_A1g">https:=
//git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse</a>
<br>&gt;     &lt;<a href=3D"https://git.automotivelinux.org/AGL/meta-agl-de=
vel/tree/meta-agl-jailhouse" rel=3D"nofollow" target=3D"_blank" data-safere=
directurl=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://git.automot=
ivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse&amp;source=3Dgmail&=
amp;ust=3D1607525378625000&amp;usg=3DAFQjCNGdHShwGAhnCXM_5oAB0kGY6W_A1g">ht=
tps://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse</a=
>&gt;
<br>&gt;=20
<br>&gt;     It can build for PI.
<br>&gt;=20
<br>&gt;     An it can serve as inspiration for the values needed.
<br>&gt;=20
<br>&gt; =C2=A0
<br>&gt;=20
<br>&gt;=20
<br>&gt;     js
<br>&gt;=20
<br>&gt;     Chung-Fan Yang &lt;<a rel=3D"nofollow">sonic...@gmail.com</a>&=
gt; schrieb am So., 6. Dez. 2020, 17:34:
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
<br>&gt;         =C2=A0CPU 1...
<br>&gt;         FATAL: Unhandled HYP exception: synchronous abort from EL2
<br>&gt;         =C2=A0pc: 0000ffffc0203864=C2=A0=C2=A0 lr: 0000ffffc020385=
0 spsr: 200003c9=C2=A0=C2=A0=C2=A0=C2=A0 EL2
<br>&gt;         =C2=A0sp: 0000ffffc0222e40=C2=A0 elr: 0000ffffc0203864=C2=
=A0 esr: 00 1 0000000
<br>&gt;         =C2=A0x0: 0000000084000000=C2=A0=C2=A0 x1: 000000000000000=
0=C2=A0=C2=A0 x2: 0000000080003580
<br>&gt;         =C2=A0x3: 0000000000000014=C2=A0=C2=A0 x4: 000000000000000=
2=C2=A0=C2=A0 x5: 0000000000000001
<br>&gt;         =C2=A0x6: 0000000000000029=C2=A0=C2=A0 x7: 0000ffffc0219ec=
0=C2=A0=C2=A0 x8: 000000000000002a
<br>&gt;         =C2=A0x9: 0000000000000000=C2=A0 x10: 0000000000000000=C2=
=A0 x11: 0000000000000001
<br>&gt;         x12: 0000000000000015=C2=A0 x13: 0000000000000001=C2=A0 x1=
4: 0000ffffc0219000
<br>&gt;         x15: 0000ffffc0015040=C2=A0 x16: 0000ffffc020da50=C2=A0 x1=
7: ffffaf45951e7518
<br>&gt;         x18: 0000000000000001=C2=A0 x19: 0000ffffc0222000=C2=A0 x2=
0: 0000ffffc0219000
<br>&gt;         x21: 0000ffffc0200000=C2=A0 x22: 0000ffffc0219000=C2=A0 x2=
3: 0000000000000001
<br>&gt;         x24: 0000000000000001=C2=A0 x25: 0000ffffc0222000=C2=A0 x2=
6: 0000ffffc0223000
<br>&gt;         x27: 0000ffffc020f000=C2=A0 x28: 0000ffffc0218000=C2=A0 x2=
9: 0000ffffc0222e40
<br>&gt;=20
<br>&gt;         Hypervisor stack before exception Stopping CPU 1 (Cell:
<br>&gt;         &quot;Raspberry-Pi4&quot;)
<br>&gt;=20
<br>&gt;         PS. I did noticed there is a similar post, but it has no s=
olution.
<br>&gt;=20
<br>&gt;         --=20
<br>&gt;         You received this message because you are subscribed to th=
e
<br>&gt;         Google Groups &quot;Jailhouse&quot; group.
<br>&gt;         To unsubscribe from this group and stop receiving emails f=
rom
<br>&gt;         it, send an email to <a rel=3D"nofollow">jailhouse-de...@g=
ooglegroups.com</a>.
<br>&gt;         To view this discussion on the web visit
<br>&gt;         <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com" rel=3D"nofollow"=
 target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3D=
ja&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-42=
8e-a97c-91524477c7e1n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D160=
7525378625000&amp;usg=3DAFQjCNFMH7YajEErkWjE4SgRQzEkmwi3RQ">https://groups.=
google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40go=
oglegroups.com</a>
<br>&gt;         &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse=
-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%40googlegroups.com?utm_medium=3D=
email&amp;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://groups.go=
ogle.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524477c7e1n%2540go=
oglegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&=
amp;ust=3D1607525378625000&amp;usg=3DAFQjCNEDcZ8XwOzTEEIGVk66pqtYKK_Ocg">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/f0e8ee0a-e874-428e-a97c-91524=
477c7e1n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&=
gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/126f7b0=
c-2fa6-4329-bb95-bddead90c9f7n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dja&amp;=
q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95=
-bddead90c9f7n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1607525378=
626000&amp;usg=3DAFQjCNHzDxgaQ8EA6PXET7MU2-qy_A_hmg">https://groups.google.=
com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegro=
ups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/126=
f7b0c-2fa6-4329-bb95-bddead90c9f7n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dja&amp;q=3Dhttps://groups.google.com=
/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7n%2540googlegrou=
ps.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=
=3D1607525378626000&amp;usg=3DAFQjCNF2ZI1Nmnu6nPOme2vWloQfIgK8lQ">https://g=
roups.google.com/d/msgid/jailhouse-dev/126f7b0c-2fa6-4329-bb95-bddead90c9f7=
n%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0031a2f2-07ed-453e-924a-8b9756af8ff9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0031a2f2-07ed-453e-924a-8b9756af8ff9n%40googlegroups.co=
m</a>.<br />

------=_Part_2335_2134031842.1607441192809--

------=_Part_2334_653770469.1607441192809--
