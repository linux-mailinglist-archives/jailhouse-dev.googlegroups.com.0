Return-Path: <jailhouse-dev+bncBC2PLTFIYAJBBQFA4T5AKGQEVB3E5JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1A263492
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Sep 2020 19:26:26 +0200 (CEST)
Received: by mail-pj1-x1039.google.com with SMTP id gc24sf2170134pjb.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 10:26:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599672384; cv=pass;
        d=google.com; s=arc-20160816;
        b=reoD44lyBAjfcXtQvl5CKPE8/sXCCBzGBm3E9kjj+0czfsUClQMh2H8WAw80XDI9Ot
         F3Vs1nTfLEo+/QRog8Cbyg3LQW8G7JucqTo/k12I9A1f++IoGV72bM8kU99/7zMwjkzN
         MN4QSsproKk7FlKfJfqrWrSsA6moV3A6dQ8t1CPDycp5N7YI1tvkgEJFGnLu0Pwmtbg7
         PjzeQXpnrliLWgh31587GkxhxPMgttDzMJxhDeL9dToMFiLh4d2bOjYOg7nFkRafzUmO
         FJv4hUeEBb0B1RkIDV3YMO6hbmgNfV7nvmqoK3VQyZU5vWpG1sXEYKwjVGXvZI+PCPyz
         1dVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=GD1c1IJaps+z4MMyXMz0CywvPqnno0DM5p6tGtK3kZk=;
        b=qDMzSDwtpg4DSowKiK5lKUaFrHeVZwPArK0BbHF1YlWrivgMquNW7eGECOpCPZXMsA
         izdYgGUOeU5DMfVCctQqEPKjuUhukGD0+zDVPmqeuxAv8lghz5oHW4rulaKj1rO/seKJ
         mHHlO4Acind5RKUxCADhYib88P1Xk5837RwlriDPi/6ZEMvFg2XyO19FxXEF1AeruvWx
         xM+5poS/3CIdvZhgWr+SHrwX6riyhJEghj4cVbTSXSdJZqpQzqmTVLp+/I4N5iKkXpaH
         I+Ixo5n/B+0wx1omWUXWmn5XYK8THkdfaKyL10SizeQWtcan/7oEM+hrKhlLGffOoWpu
         bibw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ubwe74j+;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2e as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GD1c1IJaps+z4MMyXMz0CywvPqnno0DM5p6tGtK3kZk=;
        b=YSYvmhQWwvXj/2CzM126D+e0Tpw1GyaBuRYrScaGnqD4Ka9uGbNcNAaCq/fnWe8xSG
         6lKel4eovaxc9OwwhCh20Z3/b1UKZENPUbzzcsu48er34ufULeWbEz1eo3s5g5FsCmaV
         obhWNbcZXO57Waul6abSVau8y3vhU27B4Aflz8HJkRnTfojLvmk3ZwsEw+kLUyNkcXUi
         WfjluMsA6WiFTllXTwzPB8v2THAqRaWyRcL8KDqjuniu5oBRVgag+fAqIedt7JSJnzP9
         cDwzt22ViebeDOP/jq+/QH/FbscjHAbovgiZkjsMdth+ARkosaKNvtcD2qKHyaMWc1uO
         gOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GD1c1IJaps+z4MMyXMz0CywvPqnno0DM5p6tGtK3kZk=;
        b=NFTVv8H8PX/gT9ovKCY+vL65/h6qRVIwJueptqCGyyQQ/YvNF7wvwQ/XyQ9rVI0xQi
         kVO+UCEKTgvqfe6awPXPeGgGz+Tpv7b6XcjmMtD8Ie5v7wbGizqsXCRH5FVzfWnnxUv+
         l0OfzXEM7q+BJu6WSjYSh5Z2lAg+s7cEQKmyw4dQ1XdZ+UcKeid8m3iJL7WxI/3FEav+
         CcK8SWpphDeutnwRANGVCVvWfiPXv0loh20qixBbA4hZ6Kof+RXXdBJxFDNg5qYWyQnY
         TfcqiLnIOylGhPkd24EefUwhtRDOpWK8VYrhV5aTO4HSYI6E+jT+2ENWI6XLLsFmGMXg
         GTrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532T3xc71O3tzxO4oYt8nQwsnzoLXdAJxdHxkJ03h6t3Bwfvat4o
	Z3Ny5JDOqDpGImcH/3fu+18=
X-Google-Smtp-Source: ABdhPJzPRdNQmff0R+bz4Ut89FikfAcptpbH1Y5U1rtERRdAGKd/2qDHg7wC4IzOKp3SVtBKr28gHg==
X-Received: by 2002:a05:6a00:15c1:b029:13e:d13d:a04d with SMTP id o1-20020a056a0015c1b029013ed13da04dmr1712636pfu.19.1599672384563;
        Wed, 09 Sep 2020 10:26:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8348:: with SMTP id z8ls1793434pln.11.gmail; Wed, 09
 Sep 2020 10:26:23 -0700 (PDT)
X-Received: by 2002:a17:902:598c:b029:d0:cbe1:e77a with SMTP id p12-20020a170902598cb02900d0cbe1e77amr1838820pli.33.1599672383561;
        Wed, 09 Sep 2020 10:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599672383; cv=none;
        d=google.com; s=arc-20160816;
        b=svDCY7lF1buaL9yXYhiwqHK9MdhRXO4o53AiRU+5Eol9cj9x6LDpNYMwD0FBIDjGVH
         PVsQwIsG7qOLC00c9IsmE6Ut694VhC8YLIUlc7ajRBIRmFDK0xio+6YRC3OKJ7oH9i2C
         7bnFeBKR+QK4bAH+rK4oROdYM4uoyuF6/47lowFTdADdbBC6+2qhBdt8Q8KOp/C0oNgJ
         91u4PY99+egrpJPYeIv5sS7MzdoTVZqgMBuCLkGWdJXrKaylBa1XJZ0uZ9TDsD1BVO9X
         wfrYmFZITOO4IsA0mMX36sYTI4eZTQxZJF2zbWyf0/QTfeCLsFfD/7vODOZ9igk+/6ZQ
         EmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hwczqX0KYMiBy8wjDbLa5tmTxj92LlZRJEOlpLVZXQ8=;
        b=lGaxW+q+nfLqOGmpWM2maZqEgDmDrqK5a6Of4W0jK2jSMZj4+DT65+BCsfvTP60h19
         IHMiuRnp1qAWtYsV0ooysqDpyoznx70yr1MP9KkLOx+/rEkhONHrfwDjH7e1zVfGcjlu
         I0BBEakGAep9r8v2zuGgc2Ovfl7gjdNQbfxiCKAVipCPgjSZz/ktXiTlGdAgBxd8mnN3
         yu/2jSzPMABtfTYoP3tUsu0VD2BCuomnlQ/4/3/jhUZZ+w5HYEg+XcIvIwd2nD0I2627
         Y/gxd/jXEuN0Gu/k+dANrOPHZvscLVU+1yVp6kJOLqKhwRbq0A/5cGFogdYJl9m32yOb
         8YKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ubwe74j+;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2e as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com. [2607:f8b0:4864:20::e2e])
        by gmr-mx.google.com with ESMTPS id bk9si192687pjb.1.2020.09.09.10.26.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 10:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsmoeller@linuxfoundation.org designates 2607:f8b0:4864:20::e2e as permitted sender) client-ip=2607:f8b0:4864:20::e2e;
Received: by mail-vs1-xe2e.google.com with SMTP id x203so1790727vsc.11
        for <jailhouse-dev@googlegroups.com>; Wed, 09 Sep 2020 10:26:23 -0700 (PDT)
X-Received: by 2002:a05:6102:453:: with SMTP id e19mr1499350vsq.120.1599672382604;
 Wed, 09 Sep 2020 10:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com> <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster> <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com> <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com> <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
In-Reply-To: <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Date: Wed, 9 Sep 2020 19:25:46 +0200
Message-ID: <CADja47MrkFH+YS+qA+s5PCMRLb1EWriG5yTc9F+t9tfTEw00mw@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="0000000000001f71dd05aee4c06d"
X-Original-Sender: jsmoeller@linuxfoundation.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linuxfoundation.org header.s=google header.b=Ubwe74j+;
       spf=pass (google.com: domain of jsmoeller@linuxfoundation.org
 designates 2607:f8b0:4864:20::e2e as permitted sender) smtp.mailfrom=jsmoeller@linuxfoundation.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linuxfoundation.org
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

--0000000000001f71dd05aee4c06d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan-Marc,

in your nuc8i7.c, there is:

		.debug_console =3D {
			.address =3D 0x3f8,
			.type =3D JAILHOUSE_CON_TYPE_8250,
			.flags =3D JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},


So you define the (debug) console here to be ttyS0

And that is nowhere in the PIO regions there as far as I can see.

IIRC you need to have a matching set and for qemu we did route it to ttyS1
like so:

Correct number of

struct jailhouse_pio pio_regions[14];

[...]

		.debug_console =3D {
			.address =3D 0x2f8,
			.type =3D JAILHOUSE_CON_TYPE_8250,
			.flags =3D JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},

[...]

	.pio_regions =3D {
		/* Port I/O: 0000-001f : dma1 */
           [...]
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),


I don't know how to route this to a USB port ...  check the ioports when
the usb adaptor is plugged in
on the host and adapt this?

Example for qemu is here:
https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailhouse/=
recipes-extended/jailhouse/files/qemu-agl.c

Best regards,
Jan-Simon

------
Jan-Simon M=C3=B6ller


On Wed, Sep 9, 2020 at 4:13 PM Jan-Marc Stranz <stranzjanmarc@gmail.com>
wrote:

> My serial port is "/dev/ttyUSB0".
> I've connected this with an other Linux PC and tested it with "minicom".
>
> But if I start Jailhouse with "jailhouse enable ..." then I do not receiv=
e
> any messages via this serial port.
> Do jailhouse use "/dev/ttyUSB*"?
>
> Jan-Marc Stranz schrieb am Mittwoch, 9. September 2020 um 15:55:31 UTC+2:
>
>> I got it!
>> The entry msut be "memmap=3D0x5200000\$0x3a000000"(only one "\").
>>
>> The command "less /proc/iomem" then shows the following:
>>  ...
>> 3a000000-3f1fffff : Reserved
>> ...
>>
>> So far everything is fine.
>>
>> I've also tried "jailhouse enable nuc8i7.cell"; the system freezes.
>> So now I have to adjust the cell configuration.
>> It could be that I need your help later.
>>
>>
>> j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um 15:35:09
>> UTC+2:
>>
>>> On 09.09.20 15:21, Jan-Marc Stranz wrote:
>>> > I change the kernel command line directly in the "grub.cfg" file; i.e=
.
>>> > the resulting command line is identical to the line specified in the
>>> file.
>>> >
>>> > I've also tried "memmap=3D0x5200000\\\$0x3a000000" with the same resu=
lt.
>>> >
>>>
>>> If the resulting command line of the kernel is actually
>>> "memmap=3D0x5200000$0x3a000000" now (directly in grub.conf, you must on=
ly
>>> quote once: "\$"), you either have some other resources at 0x3a000000,
>>> not just RAM. Check what /proc/iomem reports - when that parameter is
>>> not in use. Or your system has less than 512 MB RAM (unlikely)...
>>>
>>> Maybe share your generated config.c.
>>>
>>> Jan
>>>
>>> > j.kiszka...@gmail.com schrieb am Mittwoch, 9. September 2020 um
>>> 15:10:03
>>> > UTC+2:
>>> >
>>> > On 09.09.20 14:58, Jan-Marc Stranz wrote:
>>> > > I have good news.
>>> > > I now have a Linux system on an Intel NUC8I7 with IOMMU support!.
>>> > >
>>> > > The hardware check of Jalihouse works and I was able to create a
>>> > > configuration for the root cell with "jailhouse config create
>>> > nuc8i7.c".
>>> > > (I've attached this configuration.)
>>> > > I inserted this cell configuration into the Yocto build system and
>>> > the
>>> > > file "nuc8i7.cell" is created and installed under
>>> > > "/usr/share/jailhouse/cells".
>>> > >
>>> > > In order to start Jailhouse with "jailhouse enable nuc8i7.cell" I
>>> > > extended the Linux command line with:
>>> > > intel_iommu=3Doff memmap=3D0x5200000$0x3a000000
>>> > >
>>> > > I took the entry "memmap =3D ..." from the generated configuration
>>> > "nuc8i7.c".
>>> > >
>>> > > While re-booting the system it gets stuck with the following
>>> message:
>>> > > Kernel panic - System is deadlocked on memory
>>> > >
>>> > > The kernel parameter  "memmap =3D ..." should actually work, becaus=
e
>>> > 82M
>>> > > of the following area is reserved:
>>> > >
>>> > > /* MemRegion: 00100000-39ffffff : System RAM */
>>> > > {
>>> > >      .phys_start =3D 0x100000,
>>> > >      .virt_start =3D 0x100000,
>>> > >      .size =3D 0x39f00000,
>>> > >      .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> > >       JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>>> > > }
>>> > >
>>> > > What could I do?
>>> > >
>>> >
>>> > Most probably, that "$" in the kernel command line is prematurely
>>> > resolved as "$0" or so and the resulting kernel command line is
>>> > invalid.
>>> > Depending in how you inject the parameter, make sure quoting or
>>> > escaping
>>> > ("\$", or even more) is correctly done and validate the output of the
>>> > kernel.
>>> >
>>> > Jan
>>> >
>>> > --
>>> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>> > Corporate Competence Center Embedded Linux
>>> >
>>> > --
>>> > You received this message because you are subscribed to the Google
>>> > Groups "Jailhouse" group.
>>> > To unsubscribe from this group and stop receiving emails from it, sen=
d
>>> > an email to jailhouse-de...@googlegroups.com
>>> > <mailto:jailhouse-de...@googlegroups.com>.
>>> > To view this discussion on the web visit
>>> >
>>> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e=
-ea765b28a796n%40googlegroups.com
>>> > <
>>> https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e=
-ea765b28a796n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.
>>>
>>>
>>> --
>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>>> Corporate Competence Center Embedded Linux
>>>
>> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-4=
4474b98d8acn%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-=
44474b98d8acn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CADja47MrkFH%2BYS%2BqA%2Bs5PCMRLb1EWriG5yTc9F%2Bt9tfTEw00mw%4=
0mail.gmail.com.

--0000000000001f71dd05aee4c06d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Jan-Marc,</div><div><br></div><di=
v>in your nuc8i7.c, there is:<br></div><div><br></div><div><pre class=3D"gm=
ail-aLF-aPX-K0-aPE">		.debug_console =3D {
			.address =3D 0x3f8,
			.type =3D JAILHOUSE_CON_TYPE_8250,
			.flags =3D JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},</pre></div><div><br></div><div>So you define the (debug) console here =
to be ttyS0</div><div><br></div><div>And that is nowhere in the PIO regions=
 there as far as I can see.</div><div><br></div><div>IIRC you need to have =
a matching set and for qemu we did route it to ttyS1 like so:</div><div><br=
></div><div>Correct number of<br><pre><code><pre><span class=3D"gmail-k">st=
ruct</span> <span class=3D"gmail-n">jailhouse_pio</span> <span class=3D"gma=
il-n">pio_regions</span><span class=3D"gmail-p">[</span><span class=3D"gmai=
l-mi">14</span><span class=3D"gmail-p">];</span></pre></code></pre></div><d=
iv>[...]</div><div><pre><code><pre>		<span class=3D"gmail-p">.</span><span =
class=3D"gmail-n">debug_console</span> <span class=3D"gmail-o">=3D</span> <=
span class=3D"gmail-p">{</span>
			<span class=3D"gmail-p">.</span><span class=3D"gmail-n">address</span> <=
span class=3D"gmail-o">=3D</span> <span class=3D"gmail-mh">0x2f8</span><spa=
n class=3D"gmail-p">,</span>
			<span class=3D"gmail-p">.</span><span class=3D"gmail-n">type</span> <spa=
n class=3D"gmail-o">=3D</span> <span class=3D"gmail-n">JAILHOUSE_CON_TYPE_8=
250</span><span class=3D"gmail-p">,</span>
			<span class=3D"gmail-p">.</span><span class=3D"gmail-n">flags</span> <sp=
an class=3D"gmail-o">=3D</span> <span class=3D"gmail-n">JAILHOUSE_CON_ACCES=
S_PIO</span> <span class=3D"gmail-o">|</span>
				 <span class=3D"gmail-n">JAILHOUSE_CON_REGDIST_1</span><span class=3D"g=
mail-p">,</span>
		<span class=3D"gmail-p">},<br></span></pre></code></pre></div><div>[...]<=
/div><div><pre><code><pre>	<span class=3D"gmail-p">.</span><span class=3D"g=
mail-n">pio_regions</span> <span class=3D"gmail-o">=3D</span> <span class=
=3D"gmail-p">{</span>
		<span class=3D"gmail-cm">/* Port I/O: 0000-001f : dma1 */</span>
           [...]
		<span class=3D"gmail-cm">/* Port I/O: 02f8-02ff : serial */</span>
		<span class=3D"gmail-n">PIO_RANGE</span><span class=3D"gmail-p">(</span><=
span class=3D"gmail-mh">0x2f8</span><span class=3D"gmail-p">,</span> <span =
class=3D"gmail-mh">0x8</span><span class=3D"gmail-p">),</span></pre></code>=
</pre></div><div><br></div><div>I don&#39;t know how to route this to a USB=
 port ...=C2=A0 check the ioports when the usb adaptor is plugged in</div><=
div>on the host and adapt this? <br></div><div><br></div><div>Example for q=
emu is here:</div><div><a href=3D"https://git.automotivelinux.org/AGL/meta-=
agl-devel/tree/meta-agl-jailhouse/recipes-extended/jailhouse/files/qemu-agl=
.c">https://git.automotivelinux.org/AGL/meta-agl-devel/tree/meta-agl-jailho=
use/recipes-extended/jailhouse/files/qemu-agl.c</a></div><div><br></div><di=
v><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gm=
ail_signature">Best regards,<br>Jan-Simon<br><br>------<br>Jan-Simon M=C3=
=B6ller<br></div></div><br></div></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 9, 2020 at 4:13 PM Jan-M=
arc Stranz &lt;<a href=3D"mailto:stranzjanmarc@gmail.com">stranzjanmarc@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>My serial port is &quot;/dev/ttyUSB0&quot;.</div><div>I&#39;ve c=
onnected this with an other Linux PC and tested it with &quot;minicom&quot;=
.</div><div><br></div><div>But if I start Jailhouse with &quot;jailhouse en=
able ...&quot; then I do not receive any messages via this serial port.</di=
v><div>Do jailhouse use &quot;/dev/ttyUSB*&quot;?<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Jan-Marc Stranz sch=
rieb am Mittwoch, 9. September 2020 um 15:55:31 UTC+2:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div>I got it!</div><div>The entry m=
sut be &quot;memmap=3D0x5200000\$0x3a000000&quot;(only one &quot;\&quot;).<=
/div><div><br></div>The command &quot;less /proc/iomem&quot; then shows the=
 following:<br><div>=C2=A0...</div><div><span style=3D"font-family:Courier =
New">3a000000-3f1fffff : Reserved</span></div><div>...</div><div><br></div>=
<div>So far everything is fine.</div><div><br></div><div>I&#39;ve also trie=
d &quot;jailhouse enable nuc8i7.cell&quot;; the system freezes.<br>So now I=
 have to adjust the cell configuration.<br>It could be that I need your hel=
p later.<br></div><div><br></div><div><br></div><div class=3D"gmail_quote">=
<div dir=3D"auto" class=3D"gmail_attr"><a rel=3D"nofollow">j.kiszka...@gmai=
l.com</a> schrieb am Mittwoch, 9. September 2020 um 15:35:09 UTC+2:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 09.09.20 15:21, Jan-=
Marc Stranz wrote:
<br>&gt; I change the kernel command line directly in the &quot;grub.cfg&qu=
ot; file; i.e.
<br>&gt; the resulting command line is identical to the line specified in t=
he file.
<br>&gt;=20
<br>&gt; I&#39;ve also tried &quot;memmap=3D0x5200000\\\$0x3a000000&quot; w=
ith the same result.
<br>&gt;=20
<br>
<br>If the resulting command line of the kernel is actually
<br>&quot;memmap=3D0x5200000$0x3a000000&quot; now (directly in grub.conf, y=
ou must only
<br>quote once: &quot;\$&quot;), you either have some other resources at 0x=
3a000000,
<br>not just RAM. Check what /proc/iomem reports - when that parameter is
<br>not in use. Or your system has less than 512 MB RAM (unlikely)...
<br>
<br>Maybe share your generated config.c.
<br>
<br>Jan
<br>
<br>&gt; <a rel=3D"nofollow">j.kiszka...@gmail.com</a> schrieb am Mittwoch,=
 9. September 2020 um 15:10:03
<br>&gt; UTC+2:
<br>&gt;=20
<br>&gt;     On 09.09.20 14:58, Jan-Marc Stranz wrote:
<br>&gt;     &gt; I have good news.
<br>&gt;     &gt; I now have a Linux system on an Intel NUC8I7 with IOMMU s=
upport!.
<br>&gt;     &gt;
<br>&gt;     &gt; The hardware check of Jalihouse works and I was able to c=
reate a
<br>&gt;     &gt; configuration for the root cell with &quot;jailhouse conf=
ig create
<br>&gt;     nuc8i7.c&quot;.
<br>&gt;     &gt; (I&#39;ve attached this configuration.)
<br>&gt;     &gt; I inserted this cell configuration into the Yocto build s=
ystem and
<br>&gt;     the
<br>&gt;     &gt; file &quot;nuc8i7.cell&quot; is created and installed und=
er
<br>&gt;     &gt; &quot;/usr/share/jailhouse/cells&quot;.
<br>&gt;     &gt;
<br>&gt;     &gt; In order to start Jailhouse with &quot;jailhouse enable n=
uc8i7.cell&quot; I
<br>&gt;     &gt; extended the Linux command line with:
<br>&gt;     &gt; intel_iommu=3Doff memmap=3D0x5200000$0x3a000000
<br>&gt;     &gt;
<br>&gt;     &gt; I took the entry &quot;memmap =3D ...&quot; from the gene=
rated configuration
<br>&gt;     &quot;nuc8i7.c&quot;.
<br>&gt;     &gt;
<br>&gt;     &gt; While re-booting the system it gets stuck with the follow=
ing message:
<br>&gt;     &gt; Kernel panic - System is deadlocked on memory
<br>&gt;     &gt;
<br>&gt;     &gt; The kernel parameter=C2=A0 &quot;memmap =3D ...&quot; sho=
uld actually work, because
<br>&gt;     82M
<br>&gt;     &gt; of the following area is reserved:
<br>&gt;     &gt;
<br>&gt;     &gt; /* MemRegion: 00100000-39ffffff : System RAM */
<br>&gt;     &gt; {
<br>&gt;     &gt; =C2=A0=C2=A0 =C2=A0 .phys_start =3D 0x100000,
<br>&gt;     &gt; =C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000,
<br>&gt;     &gt; =C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x39f00000,
<br>&gt;     &gt; =C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ | =
JAILHOUSE_MEM_WRITE |
<br>&gt;     &gt; =C2=A0=C2=A0 =C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOU=
SE_MEM_DMA,
<br>&gt;     &gt; }
<br>&gt;     &gt;
<br>&gt;     &gt; What could I do?
<br>&gt;     &gt;
<br>&gt;=20
<br>&gt;     Most probably, that &quot;$&quot; in the kernel command line i=
s prematurely
<br>&gt;     resolved as &quot;$0&quot; or so and the resulting kernel comm=
and line is
<br>&gt;     invalid.
<br>&gt;     Depending in how you inject the parameter, make sure quoting o=
r
<br>&gt;     escaping
<br>&gt;     (&quot;\$&quot;, or even more) is correctly done and validate =
the output of the
<br>&gt;     kernel.
<br>&gt;=20
<br>&gt;     Jan
<br>&gt;=20
<br>&gt;     --=20
<br>&gt;     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt;     Corporate Competence Center Embedded Linux
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/618bbad=
6-8276-476b-934e-ea765b28a796n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/618bbad6-8276-4=
76b-934e-ea765b28a796n%40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/618=
bbad6-8276-476b-934e-ea765b28a796n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank">https://groups.go=
ogle.com/d/msgid/jailhouse-dev/618bbad6-8276-476b-934e-ea765b28a796n%40goog=
legroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-44474b98d8acn%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank">https:=
//groups.google.com/d/msgid/jailhouse-dev/42b8fa41-88cc-4907-bdce-44474b98d=
8acn%40googlegroups.com</a>.<br>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CADja47MrkFH%2BYS%2BqA%2Bs5PCMRLb1EWriG5yTc9F%2Bt9=
tfTEw00mw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CADja47MrkFH%2BYS%2BqA%2Bs5PCMRLb1E=
WriG5yTc9F%2Bt9tfTEw00mw%40mail.gmail.com</a>.<br />

--0000000000001f71dd05aee4c06d--
