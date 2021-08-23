Return-Path: <jailhouse-dev+bncBC653PXTYYERB3G2R2EQMGQEBUFPLCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3b.google.com (mail-qv1-xf3b.google.com [IPv6:2607:f8b0:4864:20::f3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C1B3F4C28
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 16:15:10 +0200 (CEST)
Received: by mail-qv1-xf3b.google.com with SMTP id iw1-20020a0562140f2100b0035f58985cecsf12382329qvb.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NNn2SefxzoGFs6zqQSi3iLofEhimPCudly7xfroAvik=;
        b=MFFH/dqTfOX2y06KFS4cg7UW4EjVwXXXc8TYyLhhvvb8Lw2X0wlkPVTe8nmRnV0QKB
         g2s+2sFfBk1uNAqUBuN+BqpU2k28MhHScSq+MhUmLdVmRjApKIEpi7XnTkFTVlxkr1I3
         HkQndSBKvdI8hWc07r0FZkuaXXsDnTp8QmyFvWCkVz3Oh1oC16lH6LCM4CiM4/j6vFRd
         fCb87Jc2aNjqu0xX3vcGqpqpSWjaoJOCmBFM5xCnZ+B9tZLl5QKkm0Vd2MfJiN80BNV8
         mlzCUObFKbh80VhGyNUjH0JCWNNXNU0feeC6mLyjgNK7xPhOcF/YQf4U6YiTcXoNiXFU
         7nfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NNn2SefxzoGFs6zqQSi3iLofEhimPCudly7xfroAvik=;
        b=FdO7T96vRMLrMu8i1IotUTyuuSv1xg2vRfY2NS+iwmfIvkjctd7RPDA6rYitvp9LZ7
         4xDb0JYK0Uy5iQyaVUhh7xfeAD+LEkVm4nK3Gm3k4J8F3CyZpSuTbRPVdjFQ8RsmTGag
         nfFEdzr/CnTyt8Ed7eXU+OfytcLKL7KsGLPo9VtYQXbP9seqT72TSlISgx3N2S4prxuO
         yxw+aY4M9tofIQ411/fHyEo/ajpYAvQ5qXgZz+8tjAyc5jwM3pAr6p67YKZ5ZQC4caDr
         8nnkn0pREn/kyZZHc0cVCxze2Rr/3IoWcGO6akIRgyjXldDyWa9ejJHtIWwy045NKoe3
         WDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NNn2SefxzoGFs6zqQSi3iLofEhimPCudly7xfroAvik=;
        b=rFU3sbtj5oe8D3YpHnEgGEmxOYjcWn/K+p9xkHtIDtpTYqC3rXE915+ccZTN6ta7X3
         1qaW6lA5o+BdI27jvqWERYxyzOjLRrC/JisJA57mxsPrrU9ASxSINh1j1puFuxarrvqL
         iX41ZAmOyxXrQsd2JHA/58vrrrHXE3k2wwixYcyef+YllXhBFXcDenyiegOph3qwK1X+
         ZBj88l+xRrN+LJQaRzxgS9JERMqbRtdZb6yYuDS0ppB0qaef5MpejmjXyWYi/jLt7WKF
         hZvabpgbXl47cVAr2CtgbL7NWMpFTRJBj1StCHGWhG7bnng7mD31JPxDTChKvnue+JDb
         Av2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5308obWLL7F+2o05S2XSLggRpLHzUr8l89UTwQVB30EtFoeXAYDH
	FgdisKXQ4A04ii0/NMeE0ws=
X-Google-Smtp-Source: ABdhPJwQXy1BjhW9chk7cGQd35l6UjgJ+iGFBXpKyQ++IuVrGrwj23/vBVqYkThY4+1ZQhfE/pEOMA==
X-Received: by 2002:a0c:f248:: with SMTP id z8mr33094656qvl.5.1629728109223;
        Mon, 23 Aug 2021 07:15:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4c12:: with SMTP id bz18ls4762955qvb.6.gmail; Mon, 23
 Aug 2021 07:15:08 -0700 (PDT)
X-Received: by 2002:a05:6214:268e:: with SMTP id gm14mr5658978qvb.51.1629728107059;
        Mon, 23 Aug 2021 07:15:07 -0700 (PDT)
Date: Mon, 23 Aug 2021 07:15:05 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bf8c269c-0868-4296-b97a-edc841ac530cn@googlegroups.com>
In-Reply-To: <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de>
References: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
 <434c3e0d-3f9d-cef4-faa8-e94248176db8@oth-regensburg.de>
 <560fff74-e071-4713-a1ec-e29b842f7564n@googlegroups.com>
 <a30c722d-4fc3-fd3a-f2c2-5dd80b2d8887@oth-regensburg.de>
 <12f6f39b-14fa-47c4-9fe6-6ca0897e14c0n@googlegroups.com>
 <66d9ac5b-8e2c-621d-d948-ff921aa0aa5e@oth-regensburg.de>
Subject: Re: Editing Inmate to add GPIO for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_10132_785506253.1629728105865"
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

------=_Part_10132_785506253.1629728105865
Content-Type: multipart/alternative; 
	boundary="----=_Part_10133_1090898912.1629728105865"

------=_Part_10133_1090898912.1629728105865
Content-Type: text/plain; charset="UTF-8"

>Last warning. :) 

>You answer in html inside response and use strange formatting: it's 
>really hard to read your mails and a fiddling finding out the spots 
>where you responded. 
I deleted the whole message and am answering to your message exactly, sorry 
for disturbance.

>You need to use MAP_UNCACHED for MMIO devices. But keep in mind that we 
>use huge pages on arm, so 2MiB will get mapped, but that shouldn't be an 
>issue in your case. 

> I could not find a signature, but I think I need a void pointer with 
> address as an argument, am I correct? 

>How can you even not find the signature? There's nothing easier like that: 
>$ git grep map_range 
>void map_range(void *start, unsigned long size, enum map_type map_type) 

>But yes, besides you should use MAP_UNCACHED, this looks good. 

Yes, I have done all of this till here


>OK - I think I don't understand what you refer to with "signature". 


>>Ok, now things get a bit complicated: 

>Usually, the finest granularity for assigning memory is the PAGE_SIZE, 
>which is, in case of ARM, 4KiB (0x1000). If you map anything below 
>0x1000 (e.g., 0xb4), then Jailhouse implements subpaging: The hypervisor 
>will trap on access, and dispatch the access. In this case, you must 
>specify JAILHOUSE_MEM_IO_${WIDTH} (with WIDTH=8,16,32,64), in order to 
>allow access within a specified width. 

Yes, this was tricky and I made your recommendation and used JAILHOUSE_MEM_IO_32  
in inmate configuration file.

>Otherwise, you will fault, as you can see here. "size 4" tells you that 
>the width was 4*8=32 bit (obviously, you used mmio_write32). 

>So now there are two possibilities how you can fix this issue: 

>1. Change the config flags of the memory region to: 
>.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | 
>JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 

>Advantage: You *exactly* only map 0xb4 byte of the device 
>Disadvantage: The hypervisor will trap on every access 
This option is working and does not contradict with the concept of static 
partitioning. There are different Peripherals in this area and It would be 
better to distribute on cells.

>2. Change .size from 0xb4 to 1*PAGE_SIZE. This will map 4KiB instead of 
>0xb4 byte. If there are no other devices behind that physical memory 
>region, then this should be the preferred choice, as no further 
>hypervisor activity will be involved. 

I used the first option and it is working like a charm. The second option I 
tried with .size=0x1000 and I got:
unhandled data write at 0xfe2000020(4), which is the GPIO_SET_Register
unhandled trap (exception class 0x24)
Then CPU 0 was parked 

unhandled data write at 0xfe2000028(4), which is the GPIO_CLR_Register
unhandled trap (exception class 0x24)
Then CPU 2 was parked 

So, I will avoid it apparently, unless you have an idea. 
Thanks so much for your help and I tried to avoid HTML emails as much as I 
can. 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bf8c269c-0868-4296-b97a-edc841ac530cn%40googlegroups.com.

------=_Part_10133_1090898912.1629728105865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>&gt;Last warning. :)
<br>
<br>&gt;You answer in html inside response and use strange formatting: it's
<br>&gt;really hard to read your mails and a fiddling finding out the spots
<br>&gt;where you responded.
<br>I deleted the whole message and am answering to your message exactly, s=
orry for disturbance.<br></span><br>&gt;You need to use MAP_UNCACHED for MM=
IO devices. But keep in mind that we
<br>&gt;use huge pages on arm, so 2MiB will get mapped, but that shouldn't =
be an
<br>&gt;issue in your case.
<br><br><div><span>&gt;     I could not find a signature, but I think I nee=
d a void pointer with
<br>&gt;     address as an argument, am I correct?
<br>
<br></span></div><span>&gt;How can you even not find the signature? There's=
 nothing easier like that:
<br>&gt;$ git grep map_range
<br>&gt;void map_range(void *start, unsigned long size, enum map_type map_t=
ype)
<br>
<br>&gt;But yes, besides you should use MAP_UNCACHED, this looks good.
<br><br>Yes, I have done all of this till here<br></span><div><span>
<br>
<br></span></div><span>&gt;OK - I think I don't understand what you refer t=
o with "signature".
<br></span><div><span>
<br>
<br></span></div><span>&gt;&gt;Ok, now things get a bit complicated:
<br>
<br>&gt;Usually, the finest granularity for assigning memory is the PAGE_SI=
ZE,
<br>&gt;which is, in case of ARM, 4KiB (0x1000). If you map anything below
<br>&gt;0x1000 (e.g., 0xb4), then Jailhouse implements subpaging: The hyper=
visor
<br>&gt;will trap on access, and dispatch the access. In this case, you mus=
t
<br>&gt;specify JAILHOUSE_MEM_IO_${WIDTH} (with WIDTH=3D8,16,32,64), in ord=
er to
<br>&gt;allow access within a specified width.
<br></span><div><span>
<br>Yes, this was tricky and I made your recommendation and used <span>JAIL=
HOUSE_MEM_IO_32&nbsp; in inmate configuration file.</span><br>
<br></span></div><span>&gt;Otherwise, you will fault, as you can see here. =
"size 4" tells you that
<br>&gt;the width was 4*8=3D32 bit (obviously, you used mmio_write32).
<br>
<br>&gt;So now there are two possibilities how you can fix this issue:
<br>
<br>&gt;1. Change the config flags of the memory region to:
<br>&gt;.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt;JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32
<br>
<br>&gt;Advantage: You *exactly* only map 0xb4 byte of the device
<br>&gt;Disadvantage: The hypervisor will trap on every access
<br>This option is working and does not contradict with the concept of stat=
ic partitioning. There are different Peripherals in this area and It would =
be better to distribute on cells.<br>
<br>&gt;2. Change .size from 0xb4 to 1*PAGE_SIZE. This will map 4KiB instea=
d of
<br>&gt;0xb4 byte. If there are no other devices behind that physical memor=
y
<br>&gt;region, then this should be the preferred choice, as no further
<br>&gt;hypervisor activity will be involved.
</span><br><br>I used the first option and it is working like a charm. The =
second option I tried with .size=3D0x1000 and I got:<br><div>unhandled data=
 write at 0xfe2000020(4), which is the GPIO_SET_Register<br></div><div>unha=
ndled trap (exception class 0x24)<br>Then CPU 0 was parked <br><br><div>unh=
andled data write at 0xfe2000028(4), which is the GPIO_CLR_Register<br></di=
v><div>unhandled trap (exception class 0x24)<br>Then CPU 2 was parked <br><=
br>So, I will avoid it apparently, unless you have an idea. <br>Thanks so m=
uch for your help and I tried to avoid HTML emails as much as I can. <br></=
div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bf8c269c-0868-4296-b97a-edc841ac530cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bf8c269c-0868-4296-b97a-edc841ac530cn%40googlegroups.co=
m</a>.<br />

------=_Part_10133_1090898912.1629728105865--

------=_Part_10132_785506253.1629728105865--
