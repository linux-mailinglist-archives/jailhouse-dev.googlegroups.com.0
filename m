Return-Path: <jailhouse-dev+bncBC653PXTYYERBBUYRKEQMGQEDOFYTZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E373F40B3
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 19:40:34 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id x19-20020a05620a099300b003f64d79cbbasf4636592qkx.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5poEhA0LjQwojYVFVyoayQYRZdRaVK2piyYzNFEeorE=;
        b=Hu1vZ4DMWOcH34pj82i26iESfTzHRwCHgdgwLrvSTwdFFeimwCCga3K+LNTWeiTSUH
         j9yMOeKX9fjsonfHwHYCWtDWMgylZCkiFSni5qb68YpILgTXEZRdYcViD1MrcmCwprOC
         lnT2QNXVJEqYm47FwlBMXm0KKWvAmgcx1sXGOywoqovXV5PcPRAYuz3u3K869Phrxq8E
         juprFbWLLR0A/hXsOpN08mwPnFPsGDVpbkR6zcTDrw9YED9DtWGd0KpiDTG34HN35Gmi
         iSPRnv94FSeISREQI6WIPHgDxBBt+GGCcwHKnu8CQPMNkoGHHz/jZ9F6gNuQnnPmuYoX
         hZaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5poEhA0LjQwojYVFVyoayQYRZdRaVK2piyYzNFEeorE=;
        b=GlY7Yc0PuEqA6nk7CjqEjCT4DtEhoVlMuQFvMKAiw0UZxdH+Y7N7k1YF5CRmpzmoPZ
         aG2Tjs3dEm+9XxwWprWSZjSyMaoNO4BY5yxZUft+4xN9/fLdQu8CAmkkKMFZh6jtvZal
         28SG+tC2kkKQKW+0iXfEiP6pYngk6+EUpNEBsvGhxBY+tmBhcVXa9sLJEywFrAtcMFlc
         LoVpHl8piMgIKpUoO0waA4hAYdzzPTmCRrFIFguyfdjBiiL5GKnje6vb2RGCTnFZV7h+
         FwxQPRyAyZkzE5dZd+ZgxbT3T5H8+SZnlulJHucmDMBz6RW+jSu2S1l00qRwFIAwUYqG
         GpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5poEhA0LjQwojYVFVyoayQYRZdRaVK2piyYzNFEeorE=;
        b=SpZNcqQSIW2TfHlNX7ooSxp63OIwlXajqT8vXdwQfo2a5baGumKWSf7HHRXm7X/uPL
         IwcMpeYVTP4D4UusdfxTFfpTZE+pPpk70m5fZ99wF1y8eV4+LflXE68hfjYuHdY9jgf3
         U9APYxfu74xzk/i2LhNdCuR1eiNg+owf5ex7kZ0DvKDAWAbgE5b1YU/U9cBO7rqCmNy1
         7BgyJ6rolbVXLfMqx3+3uZaCzLHl53pscVt1Qf9dm/g4pnKEAmV4CafhQhmvu1OSeSY5
         JsRMeQxSwLVpFQZZgRLLv/Pg4jtTQyR93AY4chvJKZL0cknuo36raoYKx2H8kZIwmNjH
         f/uQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530aspEcfjE+wVpabLEa4AWwfXS3CJA6xP38begTjmumWy2C6MgY
	wZDzrqsUspQOuWgm24skvgw=
X-Google-Smtp-Source: ABdhPJwmn9+pyXeGqvuW5EYVXPsk5X+8mVU9H33NfkCtZ2Dz0HDUwMlQpWsDy5aOFQNHECyO85sc0g==
X-Received: by 2002:ac8:140b:: with SMTP id k11mr25821081qtj.48.1629654022907;
        Sun, 22 Aug 2021 10:40:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:298b:: with SMTP id r11ls6610510qkp.5.gmail; Sun,
 22 Aug 2021 10:40:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4306:: with SMTP id u6mr18303144qko.468.1629654021973;
        Sun, 22 Aug 2021 10:40:21 -0700 (PDT)
Date: Sun, 22 Aug 2021 10:40:21 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
In-Reply-To: <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4144_1710130345.1629654021214"
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

------=_Part_4144_1710130345.1629654021214
Content-Type: multipart/alternative; 
	boundary="----=_Part_4145_1777717185.1629654021215"

------=_Part_4145_1777717185.1629654021215
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On Sunday, 22 August 2021 at 15:42:12 UTC+2 Ralf Ramsauer wrote:

>
>
> On 22/08/2021 12:45, Moustafa Nofal wrote:=20
> >=20
> > Hi,=20
> > I build Jailhouse on RPi4 using 5.3 Kernel and it is working nice. I=20
> > need to toggle a GPIO pin. I tried baremetal code but I figured out,=20
> > that I must map the peripheral using specifically this function:=20
> > p->mem_fd =3D open("/dev/mem", O_RDWR|O_SYNC);=20
> > So, I need the following headers to be included:=20
> > /*For munmap, MAP_FAILED, MAP_SHARED, PROT_READ, PROT_WRITE*/> #include=
=20
> <sys/mman.h>=20
> > /* For open(), creat() */=20
> > #include <unistd.h>=20
> > /* For O_RDWR */=20
> > #include <fcntl.h>=20
>
> >>Do I understand correctly, that you want those header in your inmate?=
=20
> I am not sure about it, but I needed to know the correct procedure.
>
=20

> > What could be a clean way, to add such headers into jailhouse, I have m=
y=20
> > own header-which describes addresses of GPIO registers- added to=20
> > /inmates/lib/include, but is there any possible way to add these=20
> headers?=20
>
> >That's not the right approach to solve your issue. Having those standard=
=20
> >library functions means that you need tons of logic in your inmate,=20
> >including a fully-fledged operating systems.=20
>
> >What you actually want to do:=20
> >0. Pass the GPIO device to the inmate in your cell's config=20
> >1. Figure out the memory address of your GPIO controller + pin. For=20
> >reference, consider looking at datasheets or device trees.=20
>

I have done this in the inmate file, read the datasheet and device tree and=
=20
edited also the .dts file in jailhouse, I wonder, whether it is necessary.=
=20

> >2. Map that address to your inmate using map_range()=20
> >(instead of opening /dev/mem, there is no semantic at all for devices=20
> >in our tiny libinmate)=20
>
=20

> Yes, that was my problem, I tried accessing the registers directly, but i=
t=20
> must be mapped first, there are two solutions for this, either using=20
> assembly code or use such a function.=20
> I did not know about map_range, or whether jailhouse uses it, but I will=
=20
> check and get back to you.
> On the other hand, I found mmio_write32() for writing registers, but I=20
> could not find the source file. Also timer_start(), I do not know where i=
s=20
> the definition of this function.=20
> One more question, I think you must have mapped the timer and UART0=20
> peripherals, in order to be able to trigger it. I saw the memory region=
=20
> structure  in *rpi4-inmate-demo.c *and could understand, how could you=20
> make it and implemented something similar for the GPIO.  But where the=20
> initialization of the timer and uart, I mean in which file, or how is tha=
t=20
> made
>
> >3. directly write to the address=20
>
> >Other than that, have a look at demos/arm/gic-demo.c or=20
> >demos/x86/apic-demo.c. There we have the cmdline argument that allows=20
> >for specifying a led-pin, which is nothing else but a GPIO.=20
> Yes, this part I understand, but my experience was with ARM-Cortex-M, so =
I=20
> thought I could just write to the register without mapping it. But thanks=
=20
> for the information and would really appreciate, if you could tell in whi=
ch=20
> direction shall I dig.=20
>
>
> >@Jan, BTW, I think I just found a bug in demos/arm/gic-demo.c: Since I=
=20
> >introduced arch_mmu_enable(), I forgot to map physical addresses for=20
> >map_range() for the led_reg. Will provide a patch soon=E2=80=A6=20
>
> >Ralf=20
> Best regards,=20
> Moustafa Noufale
> >=20
> > Thanks in advance=20
> > Moustafa Noufale=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-3=
71ae1754cdan%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-3=
71ae1754cdan%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/560fff74-e071-4713-a1ec-e29b842f7564n%40googlegroups.com.

------=_Part_4145_1777717185.1629654021215
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">O=
n Sunday, 22 August 2021 at 15:42:12 UTC+2 Ralf Ramsauer wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: =
1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 22/08/2021 12:45, Moustafa Nofal wrote:
<br>&gt;=20
<br>&gt; Hi,
<br>&gt; I build Jailhouse on RPi4 using 5.3 Kernel and it is working nice.=
 I
<br>&gt; need to toggle a GPIO pin. I tried baremetal code but I figured ou=
t,
<br>&gt; that I must map the peripheral using specifically this function:
<br>&gt; p-&gt;mem_fd =3D open("/dev/mem", O_RDWR|O_SYNC);
<br>&gt; So, I need the following headers to be included:
<br>&gt; /*For munmap, MAP_FAILED, MAP_SHARED, PROT_READ, PROT_WRITE*/&gt; =
#include &lt;sys/mman.h&gt;
<br>&gt; /* For open(), creat() */
<br>&gt; #include &lt;unistd.h&gt;
<br>&gt; /* For O_RDWR */
<br>&gt; #include &lt;fcntl.h&gt;
<br>
<br>&gt;&gt;Do I understand correctly, that you want those header in your i=
nmate?
<br>
I am not sure about it, but I needed to know the correct procedure.<br></bl=
ockquote><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin=
: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex=
;">&gt; What could be a clean way, to add such headers into jailhouse, I ha=
ve my
<br>&gt; own header-which describes addresses of GPIO registers- added to
<br>&gt; /inmates/lib/include, but is there any possible way to add these h=
eaders?
<br>
<br>&gt;That's not the right approach to solve your issue. Having those sta=
ndard
<br>&gt;library functions means that you need tons of logic in your inmate,
<br>&gt;including a fully-fledged operating systems.
<br>
<br>&gt;What you actually want to do:
<br>&gt;0. Pass the GPIO device to the inmate in your cell's config
<br>&gt;1. Figure out the memory address of your GPIO controller + pin. For
<br>&gt;reference, consider looking at datasheets or device trees.
<br></blockquote><div><br></div><div>I have done this in the inmate file, r=
ead the datasheet and device tree and edited also the .dts file in jailhous=
e, I wonder, whether it is necessary. <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">&gt;2. Map that address to your inmate using map_r=
ange()
<br>&gt;(instead of opening /dev/mem, there is no semantic at all for devic=
es
<br>&gt;in our tiny libinmate)
<br></blockquote><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">Yes, that was my problem, I tried accessing the registers dire=
ctly, but it must be mapped first, there are two solutions for this, either=
 using assembly code or use such a function. <br>I did not know about map_r=
ange, or whether jailhouse uses it, but I will check and get back to you.<b=
r>On the other hand, I found <span>mmio_write32() for writing registers, bu=
t I could not find the source file. Also timer_start(), I do not know where=
 is the definition of this function. <br>One more question, I think you mus=
t have mapped the timer and UART0 peripherals, in order to be able to trigg=
er it. I saw the memory region structure&nbsp; in <span><strong>rpi4-inmate=
-demo.c </strong></span>and could understand, how could you make it and imp=
lemented something similar for the GPIO.&nbsp; But where the initialization=
 of the timer and uart, I mean in which file, or how is that made</span><br=
><br>&gt;3. directly write to the address
<br>
<br>&gt;Other than that, have a look at demos/arm/gic-demo.c or
<br>&gt;demos/x86/apic-demo.c. There we have the cmdline argument that allo=
ws
<br>&gt;for specifying a led-pin, which is nothing else but a GPIO.
<br>
Yes, this part I understand, but my experience was with ARM-Cortex-M, so I =
thought I could just write to the register without mapping it. But thanks f=
or the information and would really appreciate, if you could tell in which =
direction shall I dig. <br><br>
<br>&gt;@Jan, BTW, I think I just found a bug in demos/arm/gic-demo.c: Sinc=
e I
<br>&gt;introduced arch_mmu_enable(), I forgot to map physical addresses fo=
r
<br>&gt;map_range() for the led_reg. Will provide a patch soon=E2=80=A6
<br>
<br>  &gt;Ralf
<br>
Best regards, <br>Moustafa Noufale<br>&gt;=20
<br>&gt; Thanks in advance
<br>&gt; Moustafa Noufale
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/cd1adc5=
9-e867-4ce1-a6ea-371ae1754cdan%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den-GB&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6=
ea-371ae1754cdan%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D16297395=
74353000&amp;usg=3DAFQjCNHQmHDS1rSOLuktuNgu623z0fd69Q">https://groups.googl=
e.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-371ae1754cdan%40googleg=
roups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/cd1=
adc59-e867-4ce1-a6ea-371ae1754cdan%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://groups.google.=
com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-371ae1754cdan%2540googleg=
roups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;u=
st=3D1629739574354000&amp;usg=3DAFQjCNF8OL91wBWj5uUCI6YUMTmfNsFAZQ">https:/=
/groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-371ae1754c=
dan%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/560fff74-e071-4713-a1ec-e29b842f7564n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/560fff74-e071-4713-a1ec-e29b842f7564n%40googlegroups.co=
m</a>.<br />

------=_Part_4145_1777717185.1629654021215--

------=_Part_4144_1710130345.1629654021214--
