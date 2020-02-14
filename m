Return-Path: <jailhouse-dev+bncBCKO35F6UENRB6PNTLZAKGQEDNMFRDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5415DA3B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 16:04:27 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id b10sf5238532otp.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 07:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OqCx+SFbnKzbkupKG0iuyTzMhxZPoIikeimxZP/wbyI=;
        b=o20gwaD5JvD6fRy8EpR9p3fj4RgI61OPZfulc6ILJGAcknQoHmwzfQqKoL+JIlTUhs
         3zb5LNWAzUfJBymyZK2OqlltfVVJ2Gfy1WELOIdg8C38O2ho3zSQsvkSpDSUhsrViVzX
         AMjxsLnVIp7BoHTm0UROzcX0vqwszQCyhTmplpnibQO/vW0Dk+MTH+HuSUBRCoDS4oKP
         vZGbuEVwvVLLP69o7bTTunPw4un3niNR47zFUHPqm7at41U/HwUaN/NukQCS7Og3bcDs
         J/9VzDV5agOQmTVo2MxuCkvKe/C9KOAs/YccVyJfaEowANOBCHGlAy2VCE8u0Eq+qFvY
         Y9zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OqCx+SFbnKzbkupKG0iuyTzMhxZPoIikeimxZP/wbyI=;
        b=uOenEVUAyMCPh8IIglLDXs4MtR8mQpAW6H4eZuiO+J3UlxxA/IF82c6xiUL9F7RiYW
         vG7iEeOlo2RU2HtOo+3XwhOKflqiSeyTyHER9DjkMdW3SEJF9W7l7IYoabcL0om1n5kx
         QrGrnVRNSwdx1RtMvbUA3WEf9NvWUmNksehho98QoXkgTPihRqKKStUK/iXo/T8/8j7U
         L6Lm01o3BISk0NsuTUmqrNRknm6v+nmkZdZpWDs1fUjPD2Vec1o9YI5LT5zGP8ayznkn
         P12KHoY6/P9Gv8z+V6Ud1N6I8OO2TiiCgHGaBK/KqqTM+8h13CJZj9bBBb6zb2fPFam4
         h97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OqCx+SFbnKzbkupKG0iuyTzMhxZPoIikeimxZP/wbyI=;
        b=J4Xl50vzeconblXAsr93dcu8UeeZxMz/DjcNenU7q+cVRs5UOocPD800nNA8veBZPn
         nak3lNjJVn5pPZHJ6amANU+1XkuFdoFr8MEfXq7tJdfEetbxTnVst3oHPXFkF1GO1YO8
         DJ/WWXd6jiaqTjKs93zDf1P8Lo3u9uk0fk4Yc+vh7ljEpmfhNiwcz29cKqXUxzKBv5tr
         ygH046qcjw9/eyHAfMDotJKbO7zW4x00Q31dbrxyeOjT/+sMupMMpaOurRc+5Wju2EzW
         OdlwIdtQrL0fybZ0vpY4RDsqJHnEQ6x5JO0MrDyDGf/2EO9xEE85aw4DAtisPpP6tpYg
         jQNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlv6jzQkNuXMeiPto70NFRK24mEU+EVi5El4xlQfr6aDJEjs9t
	Fmidzb6BHGwcMyqMRWvTomQ=
X-Google-Smtp-Source: APXvYqxdOV0IEvSWnalo7qxaI0h12xoKd6h8wW78cKCDKOIrj+jAdMlO0aHjRHgRf8eSgotaSRXJFA==
X-Received: by 2002:aca:44c1:: with SMTP id r184mr2041184oia.151.1581692665960;
        Fri, 14 Feb 2020 07:04:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d549:: with SMTP id m70ls512715oig.10.gmail; Fri, 14 Feb
 2020 07:04:25 -0800 (PST)
X-Received: by 2002:aca:2118:: with SMTP id 24mr2174462oiz.28.1581692665181;
        Fri, 14 Feb 2020 07:04:25 -0800 (PST)
Date: Fri, 14 Feb 2020 07:04:24 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
In-Reply-To: <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
Subject: Re: Linux non-root cell tooling
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3280_239068935.1581692664634"
X-Original-Sender: raymanfx@gmail.com
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

------=_Part_3280_239068935.1581692664634
Content-Type: multipart/alternative; 
	boundary="----=_Part_3281_1568882094.1581692664635"

------=_Part_3281_1568882094.1581692664635
Content-Type: text/plain; charset="UTF-8"

That was indeed the issue, so thank you very much for the quick response!
I'm now facing the next problem:

Adding virtual PCI device 00:0c.0 to cell "linux-x86-demo"
Adding virtual PCI device 00:0d.0 to cell "linux-x86-demo"
Adding virtual PCI device 00:0e.0 to cell "linux-x86-demo"
Adding virtual PCI device 00:0f.0 to cell "linux-x86-demo"
Created cell "linux-x86-demo"
Page pool usage after cell creation: mem 375/975, remap 16395/131072
Cell "linux-x86-demo" can be loaded
CPU 2 received SIPI, vector 100
CPU 3 received SIPI, vector 100
Started cell "linux-x86-demo"
FATAL: xAPIC access in x2APIC mode
FATAL: Unhandled APIC access, qualification 20
RIP: 0xffffffff81649d42 RSP: 0xffffffff82a03e98 FLAGS: 10046
RAX: 0xffffffff81649d40 RBX: 0x000000000479f000 RCX: 0x0000000002410067
RDX: 0xffffffff82fbc796 RSI: 0xffff9de180000000 RDI: 0x0000000000000020
CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x000000000240a000 CR4: 0x00000000000626b0
EFER: 0x0000000000000d01
Parking CPU 2 (Cell: "linux-x86-demo")

From what I can gather from the source code, my system is able to use the 
faster x2APIC mode (programmed using MSRs), but Jailhouse is trying to 
perform MMIO accesses which are only possible in legacy xAPIC mode.

Is there a guide somewhere that documents the steps necessary for adjusting 
the linux-x86-demo cell config?

Am Freitag, 14. Februar 2020 15:15:34 UTC+1 schrieb Jan Kiszka:
>
> On 14.02.20 14:31, raym...@gmail.com <javascript:> wrote: 
> > Hi all, 
> > 
> > I'm trying to create a non-root Linux cell but I'm stuck on the 
> > userspace tooling apparently. 
> > I can run the apic-demo on x86 just fine, but trying to create the Linux 
> > cell yields the following output: 
> > 
> > | 
> > $ sudo jailhouse cell linux linux-x86-demo.cell bzImage 
> > Traceback(most recent call last): 
> > File"/usr/libexec/jailhouse/jailhouse-cell-linux",line 850,in<module> 
> >      cell =JailhouseCell(config) 
> > File"/usr/lib/python3.7/site-packages/pyjailhouse/cell.py",line 
> > 36,in__init__ 
> > raisee 
> > File"/usr/lib/python3.7/site-packages/pyjailhouse/cell.py",line 
> > 33,in__init__ 
> >      fcntl.ioctl(self.dev,JailhouseCell.JAILHOUSE_CELL_CREATE,create) 
> > OSError:[Errno7]Argumentlist too long 
> > | 
> > 
> > I have been following the documentation from here: 
> > 
> https://github.com/siemens/jailhouse/blob/master/Documentation/non-root-linux.txt. 
>
> > "bzImage" is the compiled guest cell kernel. The linux-x86-demo config 
> > was not altered from the default one in the GIT repository. 
> > 
> > The version of Jailhouse I'm using is 0.12 
> > (92db71f257fabd3c08fa4b99498fa61a41ea831d). 
> > My root cell config and all the other stuff is the same as stated here: 
> > https://groups.google.com/forum/#!topic/jailhouse-dev/p0fcHAib0rw. 
> > Right now I am loading the driver (jailhouse.ko) as out-of-tree module, 
> > but I made sure the version matches with the userspace tools (both built 
> > from the same GIT revision). 
> > 
> > Cheers 
> > 
>
> You likely have to patch the ID of the ioapic in linux-x86-demo.c to the 
> value used in your generated config. 
>
> If that doesn't help: Youcan build Jailhouse with CONFIG_TRACE_ERROR 
> (see Documentation/hypervisor-configuration.md). That will report where 
> the error is thrown and may give us another hint what is causing this. 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/439a798e-f9c3-4455-8128-e4047e5aa9e3%40googlegroups.com.

------=_Part_3281_1568882094.1581692664635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That was indeed the issue, so thank you very much for=
 the quick response!</div><div>I&#39;m now facing the next problem:</div><d=
iv><br></div><div><div style=3D"background-color: rgb(250, 250, 250); borde=
r-color: rgb(187, 187, 187); border-style: solid; border-width: 1px; overfl=
ow-wrap: break-word;" class=3D"prettyprint"><code class=3D"prettyprint"><di=
v class=3D"subprettyprint"><span style=3D"color: #606;" class=3D"styled-by-=
prettify">Adding</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">vir=
tual</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> PCI d=
evice </span><span style=3D"color: #066;" class=3D"styled-by-prettify">00</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0c</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">0</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> to cell </span><span style=3D"color: #080;" c=
lass=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Adding</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" clas=
s=3D"styled-by-prettify">virtual</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> PCI device </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">00</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">0d</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> to cell </span><=
span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;linux-x86-de=
mo&quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Adding</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #008;" class=3D"styled-by-prettify">virtual</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> PCI device </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">00</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">0e</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">.</span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">0</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> to cell </span><span style=3D"color: #080;" class=3D"styled-by=
-prettify">&quot;linux-x86-demo&quot;</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D=
"styled-by-prettify">Adding</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-pr=
ettify">virtual</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> PCI device </span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">00</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0f</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> to cell </span><span style=3D"color=
: #080;" class=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">Created</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> cell </span><span style=3D"=
color: #080;" class=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span=
 style=3D"color: #606;" class=3D"styled-by-prettify">Page</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> pool usage after cell creat=
ion</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> mem </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">375</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">975</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> remap </span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">16395</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">/</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">131072</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #606;" class=3D"styled-by-prettify">Cel=
l</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><=
span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;linux-x86-de=
mo&quot;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> c=
an be loaded<br>CPU </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">2</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> received SIPI</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> vec=
tor </span><span style=3D"color: #066;" class=3D"styled-by-prettify">100</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>CPU </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">3</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> received SIPI</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> vector </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">100</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #6=
06;" class=3D"styled-by-prettify">Started</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> cell </span><span style=3D"color: #080;" cl=
ass=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br>FATAL</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> xAPIC access </span><span style=3D"color:=
 #008;" class=3D"styled-by-prettify">in</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> x2APIC mode<br>FATAL</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Unhandled</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> APIC access</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> qualification </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">20</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br>RIP</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0xfff=
fffff81649d42</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> RSP</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">0xffffffff82a03e98</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> FLAGS</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">10046</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"><br>RAX</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0xffffffff81649d40</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> RBX</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
0x000000000479f000</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> RCX</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0x00000000024100=
67</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>RDX<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0xffffffff82fbc796</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> RSI</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">0xffff9de180000000</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> RDI</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0x0000000000000020</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>CS</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">10</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> BASE<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0x0000000000000000</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> AR</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">BYTES</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> a09b EFER</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">LMA </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br>CR0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">0x0000000080050033</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> CR3</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">0x000000000240a000</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> CR4</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0x00000000000626b0</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br>EFER</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x0000000000000d01</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"><br></span><span style=3D"color: #606;" class=3D"styled=
-by-prettify">Parking</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> CPU </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">2</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><spa=
n style=3D"color: #606;" class=3D"styled-by-prettify">Cell</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #080;"=
 class=3D"styled-by-prettify">&quot;linux-x86-demo&quot;</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">)</span></div></code></div><=
/div><div><br></div><div>From what I can gather from the source code, my sy=
stem is able to use the faster x2APIC mode (programmed using MSRs), but Jai=
lhouse is trying to perform MMIO accesses which are only possible in legacy=
 xAPIC mode.<br></div><div><br>Is there a guide somewhere that documents th=
e steps necessary for adjusting the linux-x86-demo cell config?<br></div><b=
r>Am Freitag, 14. Februar 2020 15:15:34 UTC+1 schrieb Jan Kiszka:<blockquot=
e class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: =
1px #ccc solid;padding-left: 1ex;">On 14.02.20 14:31, <a href=3D"javascript=
:" target=3D"_blank" gdf-obfuscated-mailto=3D"K8QagUyvBgAJ" rel=3D"nofollow=
" onmousedown=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D=
"this.href=3D&#39;javascript:&#39;;return true;">raym...@gmail.com</a> wrot=
e:
<br>&gt; Hi all,
<br>&gt;=20
<br>&gt; I&#39;m trying to create a non-root Linux cell but I&#39;m stuck o=
n the=20
<br>&gt; userspace tooling apparently.
<br>&gt; I can run the apic-demo on x86 just fine, but trying to create the=
 Linux=20
<br>&gt; cell yields the following output:
<br>&gt;=20
<br>&gt; |
<br>&gt; $ sudo jailhouse cell linux linux-x86-demo.cell bzImage
<br>&gt; Traceback(most recent call last):
<br>&gt; File&quot;/usr/libexec/jailhouse/<wbr>jailhouse-cell-linux&quot;,l=
ine 850,in&lt;module&gt;
<br>&gt; =C2=A0=C2=A0 =C2=A0 cell =3DJailhouseCell(config)
<br>&gt; File&quot;/usr/lib/python3.7/site-<wbr>packages/pyjailhouse/cell.p=
y&quot;,<wbr>line=20
<br>&gt; 36,in__init__
<br>&gt; raisee
<br>&gt; File&quot;/usr/lib/python3.7/site-<wbr>packages/pyjailhouse/cell.p=
y&quot;,<wbr>line=20
<br>&gt; 33,in__init__
<br>&gt; =C2=A0=C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://self.dev" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.goo=
gle.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAF=
QjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D=
&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26snt=
z\x3d1\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">self=
.dev</a>,<wbr>JailhouseCell.JAILHOUSE_CELL_<wbr>CREATE,create)
<br>&gt; OSError:[Errno7]Argumentlist too long
<br>&gt; |
<br>&gt;=20
<br>&gt; I have been following the documentation from here:=20
<br>&gt; <a href=3D"https://github.com/siemens/jailhouse/blob/master/Docume=
ntation/non-root-linux.txt" target=3D"_blank" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;https://www.google.com/url?q\x3dhttps%3A%2F%2Fgithub.c=
om%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2Fnon-root-linux.t=
xt\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNEBX2-ay3IH7AR0OxwyDCbaDZTGVg&#39=
;;return true;" onclick=3D"this.href=3D&#39;https://www.google.com/url?q\x3=
dhttps%3A%2F%2Fgithub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumenta=
tion%2Fnon-root-linux.txt\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNEBX2-ay3I=
H7AR0OxwyDCbaDZTGVg&#39;;return true;">https://github.com/siemens/<wbr>jail=
house/blob/master/<wbr>Documentation/non-root-linux.<wbr>txt</a>.=20
<br>&gt; &quot;bzImage&quot; is the compiled guest cell kernel. The linux-x=
86-demo config=20
<br>&gt; was not altered from the default one in the GIT repository.
<br>&gt;=20
<br>&gt; The version of Jailhouse I&#39;m using is 0.12=20
<br>&gt; (<wbr>92db71f257fabd3c08fa4b99498fa6<wbr>1a41ea831d).
<br>&gt; My root cell config and all the other stuff is the same as stated =
here:=20
<br>&gt; <a href=3D"https://groups.google.com/forum/#!topic/jailhouse-dev/p=
0fcHAib0rw" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&=
#39;https://groups.google.com/forum/#!topic/jailhouse-dev/p0fcHAib0rw&#39;;=
return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/forum/#=
!topic/jailhouse-dev/p0fcHAib0rw&#39;;return true;">https://groups.google.c=
om/<wbr>forum/#!topic/jailhouse-dev/<wbr>p0fcHAib0rw</a>.
<br>&gt; Right now I am loading the driver (jailhouse.ko) as out-of-tree mo=
dule,=20
<br>&gt; but I made sure the version matches with the userspace tools (both=
 built=20
<br>&gt; from the same GIT revision).
<br>&gt;=20
<br>&gt; Cheers
<br>&gt;=20
<br>
<br>You likely have to patch the ID of the ioapic in linux-x86-demo.c to th=
e=20
<br>value used in your generated config.
<br>
<br>If that doesn&#39;t help: Youcan build Jailhouse with CONFIG_TRACE_ERRO=
R=20
<br>(see Documentation/hypervisor-<wbr>configuration.md). That will report =
where=20
<br>the error is thrown and may give us another hint what is causing this.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/439a798e-f9c3-4455-8128-e4047e5aa9e3%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/439a798e-f9c3-4455-8128-e4047e5aa9e3%40googlegroups.com<=
/a>.<br />

------=_Part_3281_1568882094.1581692664635--

------=_Part_3280_239068935.1581692664634--
