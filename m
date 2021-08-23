Return-Path: <jailhouse-dev+bncBC653PXTYYERBVMBR2EQMGQEKH2LIUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id E21583F4953
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 13:04:54 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id dv7-20020ad44ee7000000b0036fa79fd337sf1698888qvb.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 04:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ixu4RKqVMiA49Me7f3JgAUgNCDpK0pauRSsbCiaJ4mw=;
        b=MKys12eeuJRGB9fyunjJcGcCeWNoKICCKoKjoQc0OVOdd675QNHhHMhf6QP0V+WD/H
         sPAXZZk0+B+83Zn1Z93iEn6Itj2p+AwbGIaO0MoURTi2J2vFKWn/wu+PRqkxJsa1LuI9
         UexQJgO2uJZ7nJ58d/NYT0myJkKDLQg7ZwJl3HMcGk0/I8qi2Yeq14Z8xZyewJRJFjLb
         CXAlril1CWbfWbsmRdQBZmfsym7MdkIH7OmUWsTbdc6S7g1vg6jJldV59w2NwqHncwjT
         Wdn4ATFUo5DZEdwQVhBgCRSvpJeSPueflTSPnqZp2Kv8jEvspwx7QEcOZgeKo0IHX43N
         FAHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ixu4RKqVMiA49Me7f3JgAUgNCDpK0pauRSsbCiaJ4mw=;
        b=JdGnzP9C7vwJ2mYaVKND29kcIFXn6ZM+JyeHXYoZCDJJdrZSDKRO4C5Bk8Upp1w+Qc
         SdvccR2fGI33kDBY23wUdCDjBIld/SJ2Gfh6fEzBXBPVYeeGg9FSbegiVuq7MlcZf7uV
         Yij6ShmrVmkKU67Gh1KaDvhxR40SFObDRYnWmLPdR2aHC8rN9IzRAW0gqZ3m8DlwFO9+
         Na6Dw+MRJuYngVjrSki6SBR0t/IcSMOryDvWc2c2ssl3LFqG3vCYlk0ejYenxg7OIf59
         7p9e5g+YZW8p1YGDRkITWpnfbOz/n9TT4Go2uH/NdohJsp2OVHchG2oFH+75yRrkQm9H
         N8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ixu4RKqVMiA49Me7f3JgAUgNCDpK0pauRSsbCiaJ4mw=;
        b=s8ksnT9XggzlPGLIbZjU3uBpgVhw+ROXdcyQC/x5X6kfz6J/uruD7sWjVsceNQ26Oi
         af6DlgpR/1RfDvlc31m1x+FzXY6vofY3jG5Bqxo+fCskmeHSp8CIva7m7zNBguoATYp4
         TzEEJhfad1IpyrCEumV+Zo2xmWnW0cRABuuf++u7G8qoy3wlB6HvP2llv/119AhOFnIi
         lebvq7HLifD9ursmX+C24Lz+lV5FjD1IQdnpwsNyuiIQzxCGa8t3R+xLFvAJDMZSt3NK
         3JCNodXrelAdHJDgQBYGpRPBneVsa6r4ErPlBWIqVjNSt01u/AY8oJAmHcIGKPih9qpt
         p35A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318NNFVFtuChVmXiAiYkLfydpuhBqJ8xWtEiX2Gg5UCDkmA21Oz
	+1LHFqzVSLag0rAwXuBTH78=
X-Google-Smtp-Source: ABdhPJwxbsQ7l3g4cfPEAOAZ+l7S4dPC5g61t7YcQ3Gp2dvxYo7Okx8i1jlIzvK031EPqv3d80ZEgg==
X-Received: by 2002:ac8:57cc:: with SMTP id w12mr12989612qta.81.1629716693815;
        Mon, 23 Aug 2021 04:04:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:c5:: with SMTP id d5ls5694364qtg.1.gmail; Mon, 23 Aug
 2021 04:04:53 -0700 (PDT)
X-Received: by 2002:a05:622a:81:: with SMTP id o1mr28496865qtw.361.1629716692928;
        Mon, 23 Aug 2021 04:04:52 -0700 (PDT)
Date: Mon, 23 Aug 2021 04:04:52 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
In-Reply-To: <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
 <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12838_617978490.1629716692345"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_12838_617978490.1629716692345
Content-Type: multipart/alternative; 
	boundary="----=_Part_12839_56138566.1629716692345"

------=_Part_12839_56138566.1629716692345
Content-Type: text/plain; charset="UTF-8"



> >Please do _not_ reply with html mails in future. It's almost impossible 
> >to figure out where you exactly responded. And please always reply to 
> all. 
> Okay, sure.
> > 
> >   
> > 
> > > What could be a clean way, to add such headers into jailhouse, I 
> > have my 
> > > own header-which describes addresses of GPIO registers- added to 
> > > /inmates/lib/include, but is there any possible way to add these 
> > headers? 
>
> >>>Sorry, I think I don't understand the question. Of course, if you have 
> >>>custom modifications, you can place you headers there. 
>
 

> I want to avoid such headers as much as possible.
>
 

>
>
> >>The device tree is only required if you use Linux in your inmate. If you 
> >>want to use the bare-metal inmate library, then you only need to adjust 
> >>the configuration of your inmate. 
> Okay, I understand it now.
>
> > 
> > >2. Map that address to your inmate using map_range() 
> > >(instead of opening /dev/mem, there is no semantic at all for devices 
> > >in our tiny libinmate) 
> > 
> >   
> > Yes, that was my problem, I tried accessing the registers directly, 
> > but it must be mapped first, there are two solutions for this, 
> > either using assembly code or use such a function. 
> > I did not know about map_range, or whether jailhouse uses it, but I 
> > will check and get back to you. 
>
> >map_range is a routine of libinmate, it /belongs/ to jailhouse. Use "git 
> >grep map_range" to see how it is used. 
> I tried map_range
> #define GPIO_BASE               0xFE200000
>     map_range((void*)GPIO_BASE, 0xb4,MAP_CACHED);
> I could not find a signature, but I think I need a void pointer with 
> address as an argument, am I correct?
>
>
> > On the other hand, I found mmio_write32() for writing registers, but 
> > I could not find the source file. Also timer_start(), I do not know 
> > where is the definition of this function. 
>
> >After you mapped the physical memory, you can then access registers with 
> >mmio_write()-accessors. To find the definition of those routines, just 
> >use git grep: 
>
> >lib/arm-common/include/inmate.h:static inline void mmio_write32 
>
> Okay, great!, I am not sure about the signature as well, but am sure of 
> the address and I added the whole memory starting from 0xFE200000 to 
> 0xFE2000B4 to the inmate-demo.c 
>
> here 
>                            /*GPIO*/{
>             .phys_start = 0xfe200000,
>             .virt_start = 0xfe200000,
>             .size = 0xb4,
>             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
>             JAILHOUSE_MEM_IO,
>         },
>
> and in gic-demo.c
>
> static void *GPIO_GPFSEL2= (void*)0xFE200008;
>     mmio_write32(GPIO_GPFSEL2, mmio_read32(GPIO_GPFSEL2) ^ (1 << 3));  
> I get from the UART console:
>
     FATAL: Invalied MMIO read, address:fe200008, size 4. 

> FATAL: forbidden access (exception class 0x24)
> I am not sure if the mapping was correct.
>
> > One more question, I think you must have mapped the timer and UART0 
> > peripherals, in order to be able to trigger it. I saw the memory 
>
> >In order to trigger what? What is "it"? :) 
> I meant the timer by it :). How is the timer 
> > region structure  in *rpi4-inmate-demo.c *and could understand, how 
> > could you make it and implemented something similar for the GPIO.  
> > But where the initialization of the timer and uart, I mean in which 
> > file, or how is that made 
>
> >On arm, libinmate uses the platform timer. Take a look at 
> >inmates/lib/arm-common/timing.c. 
> Okay, thanks
> > 
> > >3. directly write to the address 
> > 
> > >Other than that, have a look at demos/arm/gic-demo.c or 
> > >demos/x86/apic-demo.c. There we have the cmdline argument that allows 
> > >for specifying a led-pin, which is nothing else but a GPIO. 
> > Yes, this part I understand, but my experience was with 
> > ARM-Cortex-M, so I thought I could just write to the register 
> > without mapping it. But thanks for the information and would really 
> > appreciate, if you could tell in which direction shall I dig. 
>
> >On ARM, we use virtual memory management for inmates. So you definitely 
> >need a mapping prior to accessing MMIO registers. 
> Yeah, I could understand. 
>
> Best Regards, 
> Moustafa Noufale
>
>  
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n%40googlegroups.com.

------=_Part_12839_56138566.1629716692345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">&gt;Please do _not_ reply with html mails in future. It's almost im=
possible
<br>&gt;to figure out where you exactly responded. And please always reply =
to all.
<br>
Okay, sure.<br>&gt;=20
<br>&gt; &nbsp;
<br>&gt;=20
<br>&gt;     &gt; What could be a clean way, to add such headers into jailh=
ouse, I
<br>&gt;     have my
<br>&gt;     &gt; own header-which describes addresses of GPIO registers- a=
dded to
<br>&gt;     &gt; /inmates/lib/include, but is there any possible way to ad=
d these
<br>&gt;     headers?
<br>
<br>&gt;&gt;&gt;Sorry, I think I don't understand the question. Of course, =
if you have
<br>&gt;&gt;&gt;custom modifications, you can place you headers there.
<br></blockquote><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">
I want to avoid such headers as much as possible.<br></blockquote><div>&nbs=
p;</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>
<br>&gt;&gt;The device tree is only required if you use Linux in your inmat=
e. If you
<br>&gt;&gt;want to use the bare-metal inmate library, then you only need t=
o adjust
<br>&gt;&gt;the configuration of your inmate.
<br>Okay, I understand it now.<br><br>&gt;=20
<br>&gt;     &gt;2. Map that address to your inmate using map_range()
<br>&gt;     &gt;(instead of opening /dev/mem, there is no semantic at all =
for devices
<br>&gt;     &gt;in our tiny libinmate)
<br>&gt;=20
<br>&gt; &nbsp;
<br>&gt;     Yes, that was my problem, I tried accessing the registers dire=
ctly,
<br>&gt;     but it must be mapped first, there are two solutions for this,
<br>&gt;     either using assembly code or use such a function.
<br>&gt;     I did not know about map_range, or whether jailhouse uses it, =
but I
<br>&gt;     will check and get back to you.
<br>
<br>&gt;map_range is a routine of libinmate, it /belongs/ to jailhouse. Use=
 "git
<br>&gt;grep map_range" to see how it is used.
<br>I tried map_range<br>#define GPIO_BASE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFE200000<br>&nbsp;&nb=
sp;&nbsp; map_range((void*)GPIO_BASE, 0xb4,MAP_CACHED);<br>I could not find=
 a signature, but I think I need a void pointer with address as an argument=
, am I correct?<br><br><br>&gt;     On the other hand, I found mmio_write32=
() for writing registers, but
<br>&gt;     I could not find the source file. Also timer_start(), I do not=
 know
<br>&gt;     where is the definition of this function.
<br>
<br>&gt;After you mapped the physical memory, you can then access registers=
 with
<br>&gt;mmio_write()-accessors. To find the definition of those routines, j=
ust
<br>&gt;use git grep:
<br>
<br>&gt;lib/arm-common/include/inmate.h:static inline void mmio_write32
<br><br>Okay, great!, I am not sure about the signature as well, but am sur=
e of the address and I added the whole memory starting from 0xFE200000 to 0=
xFE2000B4 to the inmate-demo.c <br><br>here <br>&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; &nbsp;&nbsp; /*GPIO*/{<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=
 &nbsp;&nbsp;&nbsp; .phys_start =3D 0xfe200000,<br>&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .virt_start =3D 0xfe200000,<br>&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .size =3D 0xb4,<br>&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; .flags =3D JAILHOUSE_MEM_REA=
D | JAILHOUSE_MEM_WRITE | <br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp;&nbsp; JAILHOUSE_MEM_IO,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; },<b=
r><br>and in gic-demo.c<br><br>static void *GPIO_GPFSEL2=3D (void*)0xFE2000=
08;<br>&nbsp;&nbsp;&nbsp; mmio_write32(GPIO_GPFSEL2, mmio_read32(GPIO_GPFSE=
L2) ^ (1 &lt;&lt; 3));&nbsp; <br>I get from the UART console:<br></blockquo=
te><div>&nbsp;&nbsp;&nbsp;&nbsp; FATAL: Invalied MMIO read, address:fe20000=
8, size 4. <br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0=
 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">FA=
TAL: forbidden access (exception class 0x24)<br>I am not sure if the mappin=
g was correct.<br>
<br>&gt;     One more question, I think you must have mapped the timer and =
UART0
<br>&gt;     peripherals, in order to be able to trigger it. I saw the memo=
ry
<br>
<br>&gt;In order to trigger what? What is "it"? :)
<br>
I meant the timer by it :). How is the timer <br>&gt;     region structure&=
nbsp; in *rpi4-inmate-demo.c *and could understand, how
<br>&gt;     could you make it and implemented something similar for the GP=
IO.&nbsp;
<br>&gt;     But where the initialization of the timer and uart, I mean in =
which
<br>&gt;     file, or how is that made
<br>
<br>&gt;On arm, libinmate uses the platform timer. Take a look at
<br>&gt;inmates/lib/arm-common/timing.c.
<br>
Okay, thanks<br>&gt;=20
<br>&gt;     &gt;3. directly write to the address
<br>&gt;=20
<br>&gt;     &gt;Other than that, have a look at demos/arm/gic-demo.c or
<br>&gt;     &gt;demos/x86/apic-demo.c. There we have the cmdline argument =
that allows
<br>&gt;     &gt;for specifying a led-pin, which is nothing else but a GPIO=
.
<br>&gt;     Yes, this part I understand, but my experience was with
<br>&gt;     ARM-Cortex-M, so I thought I could just write to the register
<br>&gt;     without mapping it. But thanks for the information and would r=
eally
<br>&gt;     appreciate, if you could tell in which direction shall I dig.
<br>
<br>&gt;On ARM, we use virtual memory management for inmates. So you defini=
tely
<br>&gt;need a mapping prior to accessing MMIO registers.
<br>
Yeah, I could understand. <br><br>Best Regards, <br>Moustafa Noufale<br>
<br>&nbsp;<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n%40googlegroups.co=
m</a>.<br />

------=_Part_12839_56138566.1629716692345--

------=_Part_12838_617978490.1629716692345--
