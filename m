Return-Path: <jailhouse-dev+bncBCALNYGP4YHRBCOUWD6QKGQEN4CNSPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7F22AF7C8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 19:14:35 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id o1sf1679905qtp.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 10:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/xHBhde3EJ+vQ7j51Va0DTK8QDKLsZ2Tm47R3lONgh0=;
        b=N9HbxEXYa/ROpyA+oB8DZX4r/UiVE7rmWi4eWZKNXBfapR1pLylUjMtPoE2Dg40neB
         bhMVg4T6E+uJHi5wMlbap9I7CLYQ9Xs6GlIjR1N15LpuhaMpGqSPW8CUvNor7OHTZ3wl
         f6eed2gwVcLiSfmM8rW481tnvT3XQA2e9sv6VdH3fxDfTqRYour1gI/CP7UZgkKgdS89
         EdRBECYMYnaalJk0yikrWz27AEUQeYaZ0t8zP3T2vucWiRVSyRjhu7n0Z/d+/gyFweYs
         iKJ3W41n9T5qXVZ6aYnbSRq+Xl7WfPe6i9JwhlfgQmXmwZHEqImo6HWPzJQhaMHL3KvP
         VcyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/xHBhde3EJ+vQ7j51Va0DTK8QDKLsZ2Tm47R3lONgh0=;
        b=SNi3Ns2YVR2tmST9f5ArqtpY+yT2M3CWSAmC5PeVEXh4bVE7Z+kc7CxuqB/Xz0RRJ/
         z6KAWVsfiSpp1OupUecR9B8qOfbaE9s2s0J3WDCEqMjvW5h+qhvUDnmfXSeFUoz+ziop
         4/cFItDk0DkbbW5UmejaRbYXQ25uRW0yNDbWdcotbYu1uaetkM0M9cx7vrG2U3aATu6m
         3Sve+SLoHwWx+8qCqpdP1kWpmeb5CobaKPDN3AtaWhQu7dpp64NHPXipPYk3Hh/hjJaD
         hJYl2C5lNFcjU7N50iTkrib00SwOaoXolBSfUytB8uistmvOPybNfukCX3zQ09H0FxIT
         DyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/xHBhde3EJ+vQ7j51Va0DTK8QDKLsZ2Tm47R3lONgh0=;
        b=pOj178cWQt5ogvi20n9djSRUYwhKR1STaJ7jc7cAWkUojZxobLNnDVtpy9QuLWe++J
         2YwcDcpP4vL+3vHPr/eR7Hla6htsvDMwXxM6ERRh4slJOCn0f/F10PdzKDPDScAMhZ1K
         GbcOCfewE6VOXRUbCqLxzwmv3m1vH/HLHVFHZRoNVpjb5R7ZzaT6Szy0oRV0OCZhZw1z
         fhKCxkOXK3xEBcajV/qZaEAiLVfCJ+5TZmk6ZTdxqpqnx93/6R3crdsbLutgexjiBMWt
         xT5IpXZFCZHFYioU4mfjDjuwos0PGCoDypIIgYDy6vejIbwdHXcYgnLdyV9+31AwhxVN
         QznQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+voTzLCOh0VrfHSo3IkXPD6tbmiQ5RRkbn3UNtCQNicTud6LN
	CmKWSZjbpsJwmgfatCB6dls=
X-Google-Smtp-Source: ABdhPJzxK6gMdGhRxkGtffMdrMH5BdBH5iHe/xJbB8hyXt+uzc9HShlbeJsY9GpM/jXbEgi3iaO03g==
X-Received: by 2002:ac8:53c8:: with SMTP id c8mr24726044qtq.39.1605118474272;
        Wed, 11 Nov 2020 10:14:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:24c2:: with SMTP id m2ls98868qkn.2.gmail; Wed, 11
 Nov 2020 10:14:33 -0800 (PST)
X-Received: by 2002:a37:7246:: with SMTP id n67mr27622434qkc.144.1605118473098;
        Wed, 11 Nov 2020 10:14:33 -0800 (PST)
Date: Wed, 11 Nov 2020 10:14:32 -0800 (PST)
From: Kai-Feng Chou <mapleelpam@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dcc8d9b8-4b0a-4b7e-b075-c3a20e332e10n@googlegroups.com>
In-Reply-To: <b62cf553-ad22-4a2b-9386-d7448fa79043n@googlegroups.com>
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
 <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
 <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com>
 <38b5b700-e09d-6f36-1dda-2310b5465771@siemens.com>
 <CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eYQ@mail.gmail.com>
 <f7cf4733-ad92-ae81-3d4c-acdffc81a57b@siemens.com>
 <b62cf553-ad22-4a2b-9386-d7448fa79043n@googlegroups.com>
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_158_2114544316.1605118472213"
X-Original-Sender: mapleelpam@gmail.com
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

------=_Part_158_2114544316.1605118472213
Content-Type: multipart/alternative; 
	boundary="----=_Part_159_1316686895.1605118472213"

------=_Part_159_1316686895.1605118472213
Content-Type: text/plain; charset="UTF-8"

Thanks for the talk. I found some root cause. and run gic-demo successfully.

Will refine / integrate and put them to the public later.


On Wednesday, 11 November 2020 at 23:55:30 UTC+8 Kai-Feng Chou wrote:

> 1. what you meant about "backed any RAM" ?  I used mem=1024M to test. And 
> my DDR4 is 4G for now.
> 2. nope only 4G . / thanks for notice. let me remove some unused region.
> On Wednesday, 11 November 2020 at 23:52:16 UTC+8 j.kiszka...@gmail.com 
> wrote:
>
>> On 11.11.20 16:34, maple Chou wrote: 
>> > " 
>> > Last login: Mon May 11 15:35:01 +0000 2020 on /dev/ttyS0. 
>> > root@stratix10:~# cat /proc/iomem 
>> > 01000000-7fffffff : System RAM 
>> >   02080000-02eaffff : Kernel code 
>> >   02eb0000-0309ffff : reserved 
>> >   030a0000-031bbfff : Kernel data 
>> >   79800000-7f7fffff : reserved 
>> >   7fa30000-7fa34fff : reserved 
>> > ff800000-ff801fff : ff800000.ethernet 
>> > ff808000-ff808fff : ff808000.dwmmc0 
>> > ff8d2000-ff8d20ff : ff8d2000.spi 
>> > ff900000-ff9fffff : ff8d2000.spi 
>> > ffb00000-ffb3ffff : ffb00000.usb 
>> > ffc02000-ffc0201f : serial 
>> > ffc02900-ffc029ff : ffc02900.i2c 
>> > ffc03300-ffc033ff : ffc03300.gpio 
>> > ffd00200-ffd002ff : ffd00200.watchdog 
>> > ffd10000-ffd10fff : ffd10000.clock-controller 
>> > ffd11000-ffd11fff : ffd11000.rstmgr 
>> > ffda0000-ffda0fff : pdma@ffda0000 
>> >   ffda0000-ffda0fff : ffda0000.pdma 
>> > ffe00000-ffefffff : ffe00000.sram 
>> > 180000000-1ffffffff : System RAM 
>> >   1fae00000-1fb5fffff : reserved 
>> >   1fb7fe000-1ff5fffff : reserved 
>> >   1ff72d000-1ff78cfff : reserved 
>> >   1ff78d000-1ff78dfff : reserved 
>> >   1ff78e000-1ff7e5fff : reserved 
>> >   1ff7e8000-1ff7e8fff : reserved 
>> >   1ff7e9000-1ff7edfff : reserved 
>> >   1ff7ee000-1ffffffff : reserved 
>> > root@stratix10:~# 
>> > 
>>
>> But you are using address 8,0000,0000 for loading the hypervisor. That 
>> seems to like it's not backed by any RAM, is it? 
>>
>> > " 
>> > 
>> > and I'd reference this 
>> > - 
>> https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c 
>> > <
>> https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c> 
>>
>>
>> That seems to describe possible occupations - or die you really have 124 
>> GB on your board? 
>>
>> Jan 
>> -- 
>> Siemens AG, T RDA IOT 
>> Corporate Competence Center Embedded Linux 
>>
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dcc8d9b8-4b0a-4b7e-b075-c3a20e332e10n%40googlegroups.com.

------=_Part_159_1316686895.1605118472213
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the talk. I found some root cause. and run gic-demo successfully=
.<div><br></div><div>Will refine / integrate and put them to the public lat=
er.</div><div><br></div><div><br></div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Wednesday, 11 November 2020 at 23:55:30 U=
TC+8 Kai-Feng Chou wrote:<br/></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;">1. what you meant about &quot;backed any RAM&quot; ?=C2=A0 I u=
sed mem=3D1024M to test. And my DDR4 is 4G for now.<br>2. nope only 4G . / =
thanks for notice. let me remove some unused region.<div class=3D"gmail_quo=
te"><div dir=3D"auto" class=3D"gmail_attr">On Wednesday, 11 November 2020 a=
t 23:52:16 UTC+8 <a href data-email-masked rel=3D"nofollow">j.kiszka...@gma=
il.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 1=
1.11.20 16:34, maple Chou wrote:
<br>&gt; &quot;
<br>&gt; Last login: Mon May 11 15:35:01 +0000 2020 on /dev/ttyS0.
<br>&gt; root@stratix10:~# cat /proc/iomem
<br>&gt; 01000000-7fffffff : System RAM
<br>&gt; =C2=A0 02080000-02eaffff : Kernel code
<br>&gt; =C2=A0 02eb0000-0309ffff : reserved
<br>&gt; =C2=A0 030a0000-031bbfff : Kernel data
<br>&gt; =C2=A0 79800000-7f7fffff : reserved
<br>&gt; =C2=A0 7fa30000-7fa34fff : reserved
<br>&gt; ff800000-ff801fff : ff800000.ethernet
<br>&gt; ff808000-ff808fff : ff808000.dwmmc0
<br>&gt; ff8d2000-ff8d20ff : ff8d2000.spi
<br>&gt; ff900000-ff9fffff : ff8d2000.spi
<br>&gt; ffb00000-ffb3ffff : ffb00000.usb
<br>&gt; ffc02000-ffc0201f : serial
<br>&gt; ffc02900-ffc029ff : ffc02900.i2c
<br>&gt; ffc03300-ffc033ff : ffc03300.gpio
<br>&gt; ffd00200-ffd002ff : ffd00200.watchdog
<br>&gt; ffd10000-ffd10fff : ffd10000.clock-controller
<br>&gt; ffd11000-ffd11fff : ffd11000.rstmgr
<br>&gt; ffda0000-ffda0fff : pdma@ffda0000
<br>&gt; =C2=A0 ffda0000-ffda0fff : ffda0000.pdma
<br>&gt; ffe00000-ffefffff : ffe00000.sram
<br>&gt; 180000000-1ffffffff : System RAM
<br>&gt; =C2=A0 1fae00000-1fb5fffff : reserved
<br>&gt; =C2=A0 1fb7fe000-1ff5fffff : reserved
<br>&gt; =C2=A0 1ff72d000-1ff78cfff : reserved
<br>&gt; =C2=A0 1ff78d000-1ff78dfff : reserved
<br>&gt; =C2=A0 1ff78e000-1ff7e5fff : reserved
<br>&gt; =C2=A0 1ff7e8000-1ff7e8fff : reserved
<br>&gt; =C2=A0 1ff7e9000-1ff7edfff : reserved
<br>&gt; =C2=A0 1ff7ee000-1ffffffff : reserved
<br>&gt; root@stratix10:~#
<br>&gt;=20
<br>
<br>But you are using address 8,0000,0000 for loading the hypervisor. That
<br>seems to like it&#39;s not backed by any RAM, is it?
<br>
<br>&gt; &quot;
<br>&gt;=20
<br>&gt; and I&#39;d reference this
<br>&gt; -=C2=A0<a href=3D"https://github.com/altera-opensource/u-boot-socf=
pga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c" rel=3D"nof=
ollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Den-GB&amp;q=3Dhttps://github.com/altera-opensource/u-boot-socfpga/blo=
b/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c&amp;source=3Dgmail=
&amp;ust=3D1605204793678000&amp;usg=3DAFQjCNEspoNsWxDxH22B22Ls9waHwfy0iA">h=
ttps://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/ar=
ch/arm/mach-socfpga/mmu-arm64_s10.c</a>
<br>&gt; &lt;<a href=3D"https://github.com/altera-opensource/u-boot-socfpga=
/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c" rel=3D"nofoll=
ow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den-GB&amp;q=3Dhttps://github.com/altera-opensource/u-boot-socfpga/blob/s=
ocfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c&amp;source=3Dgmail&am=
p;ust=3D1605204793679000&amp;usg=3DAFQjCNGjVtBT_YQ2KyueE542ye5Lu9ynYg">http=
s://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/=
arm/mach-socfpga/mmu-arm64_s10.c</a>&gt;
<br>
<br>That seems to describe possible occupations - or die you really have 12=
4
<br>GB on your board?
<br>
<br>Jan
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br>
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/dcc8d9b8-4b0a-4b7e-b075-c3a20e332e10n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/dcc8d9b8-4b0a-4b7e-b075-c3a20e332e10n%40googlegroups.co=
m</a>.<br />

------=_Part_159_1316686895.1605118472213--

------=_Part_158_2114544316.1605118472213
Content-Type: text/plain; charset=US-ASCII; name=log.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.txt
X-Attachment-Id: afd89da1-f6fb-4cd5-8903-9ddd422a6bf3
Content-ID: <afd89da1-f6fb-4cd5-8903-9ddd422a6bf3>


Poky (Yocto Project Reference Distro) 3.0.2 stratix10 ttyS0

stratix10 login: root
Last login: Mon May 11 15:33:21 +0000 2020 on /dev/ttyS0.
root@stratix10:~# cd jailhouse
root@stratix10:~/jailhouse# insmod ./driver/jailhouse.ko
[   21.660298] jailhouse: loading out-of-tree module taints kernel.
root@stratix10:~/jailhouse# ./tools/jailhouse enable configs/arm64/socfpga-s10socdk.cell

Initializing Jailhouse hypervisor v0.12 (136-g13c360e0-dirty) on CPU 2
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 45/4063, remap 0/131072
Initializing processors:
 CPU 2... OK
 CPU 3... OK
 CPU 1... OK
 CPU 0... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Page pool usage after late setup: mem 69/4063, remap 5/131072
Activating hypervisor
[   31.015360] The Jailhouse is opening.
root@stratix10:~/jailhouse# [   31.713877] 0.33V: disabling

root@stratix10:~/jailhouse# ./tools/jailhouse cell create configs/arm64/socfpga-s10socdk-inmate-demo.cell
[   66.466143] CPU3: shutdown
[   66.468865] psci: CPU3 killed (polled 0 ms)
Created cell "inmate-demo"
Page pool usage after cell creation: mem 83/4063, remap 5/131072
[   66.483963] Created Jailhouse cell "inmate-demo"
root@stratix10:~/jailhouse# ./tools/jailhouse cell load 1 inmates/demos/arm64/gic-demo.bin
Cell "inmate-demo" can be loaded
root@stratix10:~/jailhouse# ./tools/jailhouse cell start 1
Started cell "inmate-demo"
root@stratix10:~/jailhouse# Initializing the GIC...
Initializing the timer...
Timer fired, jitter:   2264 ns, min:   2264 ns, max:   2264 ns
Timer fired, jitter:    859 ns, min:    859 ns, max:   2264 ns
Timer fired, jitter:    809 ns, min:    809 ns, max:   2264 ns
Timer fired, jitter:    799 ns, min:    799 ns, max:   2264 ns
Timer fired, jitter:    794 ns, min:    794 ns, max:   2264 ns
Timer fired, jitter:    794 ns, min:    794 ns, max:   2264 ns
Timer fired, jitter:    794 ns, min:    794 ns, max:   2264 ns
Timer fired, jitter:    792 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    794 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    809 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    792 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    802 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    802 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    799 ns, min:    792 ns, max:   2264 ns
Timer fired, jitter:    792 ns, min:    792 ns, max:   2264 ns

------=_Part_158_2114544316.1605118472213--
