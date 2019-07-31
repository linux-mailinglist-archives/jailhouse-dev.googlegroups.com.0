Return-Path: <jailhouse-dev+bncBC7MJ2PM5UERBWVZRDVAKGQEUDEE7EI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DBA7D19B
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 00:57:32 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id m16sf38352454otq.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Jul 2019 15:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i5oK9zfmXYUR9Uhwyxcvi7TbmZ10y1rVwQQ6sVMqQBw=;
        b=cSLZ3YoIhxHhcfZamPEVMq5O9JbxSNkkbrH+innj7CrVFzYz1IT3BxBVZiU2Hr14Gw
         NVhPCdMlFpVf1e8lJtVTTXHaam8qa7PLckXC4J8meRGYEjwRY4WSu0sPkJ8gV9cf/di7
         GjOBOyieptksxbW2LwiiGPAWKNvohAo+9IUJn9rVb4ZvvD0MkxOzQQ6IAw+OtWlhQ8Qz
         1HXQsCzAT7Pms1yMCE5/1Av/4xzLEG7paHNAmcUSU+wjeNqnreJgXjr61DehGDwPCzqk
         j4inHIXs4EttsNUkXX1Q5rwHPDbxinL22JH6zbq+d1oIY6YFkd61bCiCz/04i46Hffvm
         P71A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i5oK9zfmXYUR9Uhwyxcvi7TbmZ10y1rVwQQ6sVMqQBw=;
        b=tAqagwP8j86zPH7No5hOojF+QnnbC66+iCurbD5i956NdrIZ0SaiTmhj74VpTbhdwG
         uT4v9YkR9B21R6ARs69gu7p7cIR6Kot9SU8pFg7V/wxbHlDfRE2BdkqX3FfJytZQ1f5O
         mBxrfItGB9diE8GdqA+rdsv7FO+Ib8yj8fQTzt89tlBmmyHSuGqvsvutjLiyybGLd+IO
         9P/54nEbrxDf5dP+Tbgeq5I+9JtsTWiuam9A1ZVfZN2fGTy71Np7UGFQoBainwQUpyPf
         99narabJRnmz6E7Kg7HfsV0xw6OQLoIgj5xAWgeWq9YX2LRPzxDXJAXVs+MGJ1RuvSSS
         Ri3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=i5oK9zfmXYUR9Uhwyxcvi7TbmZ10y1rVwQQ6sVMqQBw=;
        b=TeO88XxIkEl5ThZ7a82LiU4AZNzW79BxIyjCz6hhrjhDryhG2gnG+m60YGfnTAjjPC
         lXzAtUmT/4mNHdkvZ76oQDE7QRQwWzw4Bc8U1hoA7VAsEmrirrHMkieF3GqHxGLz3f+W
         wI5rBMPyZfWrbaC2T9C2WBbqK4pqACIqDixhGV7PkcFSPuKlrR6ev7r4eAOUdcPxGNY5
         IQc5UXrI6khq0VS7NS2MGeCy7+1vCAhMTquqe6ExCVZuWWPQsSDsFj9ocKqE9rfbwgEi
         9c/ZpKU/hM2dk1ko07xVKn6TR2twyAYdn+5uRNjK25SPmP18x9f/YMqw10AJxuLI5dIt
         6xJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWped3pvjBaH9hVThn6CIFMxsBVMZ3CFKu0YWAI5B+3SHjNE3B5
	J4eSyO29RvKtXC0HzeGz1E8=
X-Google-Smtp-Source: APXvYqzv3ACwQpZmtYe3odhr0BdgAS/ZKxpL363EZ/Co6dQaRWgESUIeKRDa04sa8BjLOntz2E9xjA==
X-Received: by 2002:a9d:4b15:: with SMTP id q21mr87968373otf.3.1564613850948;
        Wed, 31 Jul 2019 15:57:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3db7:: with SMTP id l52ls13869924otc.15.gmail; Wed, 31
 Jul 2019 15:57:30 -0700 (PDT)
X-Received: by 2002:a05:6830:16:: with SMTP id c22mr7042125otp.116.1564613850286;
        Wed, 31 Jul 2019 15:57:30 -0700 (PDT)
Date: Wed, 31 Jul 2019 15:57:29 -0700 (PDT)
From: dianaramos007@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <389dded1-c061-4966-83ac-6e1176dfc152@googlegroups.com>
In-Reply-To: <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
References: <15e809ef-6d04-4df6-a706-7fa43e7deee3@googlegroups.com>
 <f6e7c240-8686-aeff-1167-a8350e0cb03f@siemens.com>
 <0d5266f5-700e-4002-bd8d-4f3f6f65677e@googlegroups.com>
 <64ec235d-fe28-e181-7c7b-c00956fea706@siemens.com>
Subject: Re: Problem with IVSHMEM on Bananapi
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7964_1737181916.1564613849501"
X-Original-Sender: dianaramos007@gmail.com
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

------=_Part_7964_1737181916.1564613849501
Content-Type: multipart/alternative; 
	boundary="----=_Part_7965_1031168123.1564613849501"

------=_Part_7965_1031168123.1564613849501
Content-Type: text/plain; charset="UTF-8"


>
> Your kernel is now accessing a device that is not configured in the 
> original 
> bananapi.cell, likely because that config was for a classic banana pi, 
> yours is 
> an M1. Adjust the config, adding at least a region to cover the 0x100 
> bytes at 
> 0x01c25000, and things should work better. 
>
 
I've modified the configuration file for the banana pi cell, covering both 
addresses by adding the following memory regions:

/* HDMI */ {
            .phys_start = 0x01c16000,
            .virt_start = 0x01c16000,
            .size = 0x1000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
      }

and

/* RTP */ {
            .phys_start = 0x01c25000,
            .virt_start = 0x01c25000,
            .size = 0x100,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
        }

This  seems to solve the unhandled traps; however, when I try to create 
the  banana-gic-demo cell (by running "./jailhouse cell create  
../configs/arm/bananapi-gic-demo.cell"), another trap appears:

Unhandled data read at 0x1c20060(4)
FATAL: unhandled trap (exception class 0x24)
pc=0xc03f45e8 cpsr=0x60010093 hsr=0x93870007
r0=0x20010093 r1=0x00000191 r2=0x00000060 r3=0xe0009060
r4=0xc0b2b558 r5=0x00000100 r6=0x20010093 r7=0x00000000
r8=0x00000004 r9=0xde22c000 r10=0xc0b04c48 r11=0xde0ddc00
r12=0x00000000 r13=0xde22dc98 r14=0xc03f45d8
Parking CPU 0 (Cell: "Banana-Pi")


According to /proc/iomem, this is related to the clock. I've tried to 
modify the config files, by commenting the console configuration of 
gic-demo cell:

.clock_reg = 0x01c2006c,
.gate_nr = 23,
.divider = 0x0d,

I got the following trap:

Unhandled data read at 0x1c20088(4)
FATAL: unhandled trap (exception class 0x24)
pc=0xc03f457c cpsr=0x60010093 hsr=0x93850007
r0=0xa0010093 r1=0x00000195 r2=0x00000088 r3=0xe0009088
r4=0xc0b2a3dc r5=0xde817cc0 r6=0xa0010093 r7=0x80000000
r8=0xde24a000 r9=0xc0b04c48 r10=0x00000008 r11=0xdf054880
r12=0x00000000 r13=0xde24be68 r14=0xc03f456c
Parking CPU 0 (Cell: "Banana-Pi")

How can I solve this trap?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/389dded1-c061-4966-83ac-6e1176dfc152%40googlegroups.com.

------=_Part_7965_1031168123.1564613849501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin: 0;margi=
n-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Your kernel i=
s now accessing a device that is not configured in the original
<br>bananapi.cell, likely because that config was for a classic banana pi, =
yours is
<br>an M1. Adjust the config, adding at least a region to cover the 0x100 b=
ytes at
<br>0x01c25000, and things should work better.
<br></blockquote><div>=C2=A0</div><div><div dir=3D"ltr" id=3D"divtagdefault=
wrapper" style=3D"color: black; font-size: 12pt; font-family: Calibri, Helv=
etica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI=
 Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Em=
oji&quot;, EmojiSymbols;"><div>I&#39;ve modified the configuration file for=
 the banana pi cell, covering both addresses by adding the following memory=
 regions:<br><br>/* HDMI */ {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 .phys_start =3D 0x01c16000,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0x01c16000,<br>=C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x1000,<br>=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=
 }<br><br>and<br><br>/* RTP */ {<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x01c25000,<br>=C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0x01c25000,<br>=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x100,<br>=C2=A0=C2=
=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }<br><br>This=C2=A0 seems to solve th=
e unhandled traps; however, when I try to create the=C2=A0 banana-gic-demo =
cell (by running &quot;./jailhouse cell create=C2=A0 ../configs/arm/bananap=
i-gic-demo.cell&quot;), another trap appears:<br><br>Unhandled data read at=
 0x1c20060(4)<br>FATAL: unhandled trap (exception class 0x24)<br>pc=3D0xc03=
f45e8 cpsr=3D0x60010093 hsr=3D0x93870007<br>r0=3D0x20010093 r1=3D0x00000191=
 r2=3D0x00000060 r3=3D0xe0009060<br>r4=3D0xc0b2b558 r5=3D0x00000100 r6=3D0x=
20010093 r7=3D0x00000000<br>r8=3D0x00000004 r9=3D0xde22c000 r10=3D0xc0b04c4=
8 r11=3D0xde0ddc00<br>r12=3D0x00000000 r13=3D0xde22dc98 r14=3D0xc03f45d8<br=
>Parking CPU 0 (Cell: &quot;Banana-Pi&quot;)</div><p><br></p><p>According t=
o /proc/iomem, this is related to the clock. I&#39;ve tried to modify the c=
onfig files, by commenting the console configuration of gic-demo cell:<br><=
/p><blockquote><div align=3D"left">.clock_reg =3D 0x01c2006c,<br>.gate_nr =
=3D 23,<br>.divider =3D 0x0d,</div></blockquote><div align=3D"left">I got t=
he following trap:</div><div align=3D"left"><br></div><div align=3D"left">U=
nhandled data read at 0x1c20088(4)<br>FATAL: unhandled trap (exception clas=
s 0x24)<br>pc=3D0xc03f457c cpsr=3D0x60010093 hsr=3D0x93850007<br>r0=3D0xa00=
10093 r1=3D0x00000195 r2=3D0x00000088 r3=3D0xe0009088<br>r4=3D0xc0b2a3dc r5=
=3D0xde817cc0 r6=3D0xa0010093 r7=3D0x80000000<br>r8=3D0xde24a000 r9=3D0xc0b=
04c48 r10=3D0x00000008 r11=3D0xdf054880<br>r12=3D0x00000000 r13=3D0xde24be6=
8 r14=3D0xc03f456c<br>Parking CPU 0 (Cell: &quot;Banana-Pi&quot;)<br></div>=
</div><div dir=3D"ltr" style=3D"color: black; font-size: 12pt; font-family:=
 Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, =
&quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &q=
uot;Android Emoji&quot;, EmojiSymbols;"><br></div><div dir=3D"ltr" style=3D=
"color: black; font-size: 12pt; font-family: Calibri, Helvetica, sans-serif=
, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, Not=
oColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiS=
ymbols;">How can I solve this trap?</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/389dded1-c061-4966-83ac-6e1176dfc152%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/389dded1-c061-4966-83ac-6e1176dfc152%40googlegroups.com<=
/a>.<br />

------=_Part_7965_1031168123.1564613849501--

------=_Part_7964_1737181916.1564613849501
Content-Type: text/x-csrc; charset=US-ASCII; name="bananapi-gic-demo(1).c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bananapi-gic-demo(1).c"
X-Attachment-Id: 2fd12ea1-3dfd-4789-8943-b2ef0d26754b
Content-ID: <2fd12ea1-3dfd-4789-8943-b2ef0d26754b>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for gic-demo inmate on Banana Pi:
 * 1 CPU, 64K RAM, serial ports 4-7, CCU+GPIO
 *
 * Copyright (c) Siemens AG, 2014
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[5];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "bananapi-gic-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),

		.console = {
			.address = 0x01c29c00,
			.clock_reg = 0x01c2006c,
			.gate_nr = 23,
			.divider = 0x0d,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
	},

	.cpus = {
		0x2,
	},

	.mem_regions = {

		/* CCU */ {
			.phys_start = 0x01c20000,
			.virt_start = 0x01c20000,
			.size = 0x400,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* GPIO: port H */ {
			.phys_start = 0x01c208fc,
			.virt_start = 0x01c208fc,
			.size = 0x24,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* UART 4-7 */ {
			.phys_start = 0x01c29000,
			.virt_start = 0x01c29000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x7bfe0000,
			.virt_start = 0,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
	},
};

------=_Part_7964_1737181916.1564613849501
Content-Type: text/x-csrc; charset=US-ASCII; name="bananapi(2).c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bananapi(2).c"
X-Attachment-Id: f3ee4d14-159b-49c7-8d1b-33c14d4ae0f4
Content-ID: <f3ee4d14-159b-49c7-8d1b-33c14d4ae0f4>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Test configuration for Banana Pi board (A20 dual-core Cortex-A7, 1G RAM)
 *
 * Copyright (c) Siemens AG, 2014
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[23];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x7c000000,
			.size = 0x4000000,
		},
		.debug_console = {
			.address = 0x01c28000,
			.size = 0x1000,
			/* .clock_reg = 0x01c2006c, */
			/* .gate_nr = 16 */
			/* .divider = 0x0d, */
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0x2000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.arm = {
				.gic_version = 2,
				.gicd_base = 0x01c81000,
				.gicc_base = 0x01c82000,
				.gich_base = 0x01c84000,
				.gicv_base = 0x01c86000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "Banana-Pi",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),

			.vpci_irq_base = 108,
		},
	},

	.cpus = {
		0x3,
	},

	.mem_regions = {
		/* SPI */ {
			.phys_start = 0x01c05000,
			.virt_start = 0x01c05000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MMC */ {
			.phys_start = 0x01c0f000,
			.virt_start = 0x01c0f000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* USB + PMU1 */ {
			.phys_start = 0x01c14000,
			.virt_start = 0x01c14000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* HDMI */ {
			.phys_start = 0x01c16000,
			.virt_start = 0x01c16000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SATA */ {
			.phys_start = 0x01c18000,
			.virt_start = 0x01c18000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* USB + PMU2 */ {
			.phys_start = 0x01c1c000,
			.virt_start = 0x01c1c000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* CCU */ {
			.phys_start = 0x01c20000,
			.virt_start = 0x01c20000,
			.size = 0x400,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* Ints */ {
			.phys_start = 0x01c20400,
			.virt_start = 0x01c20400,
			.size = 0x400,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* GPIO: ports A-G */ {
			.phys_start = 0x01c20800,
			.virt_start = 0x01c20800,
			.size = 0xfc,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* GPIO: port H */ {
			.phys_start = 0x01c208fc,
			.virt_start = 0x01c208fc,
			.size = 0x24,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* GPIO: port I */ {
			.phys_start = 0x01c20920,
			.virt_start = 0x01c20920,
			.size = 0x24,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* GPIO: intr config */ {
			.phys_start = 0x01c20a00,
			.virt_start = 0x01c20a00,
			.size = 0x1c,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* Timer */ {
			.phys_start = 0x01c20c00,
			.virt_start = 0x01c20c00,
			.size = 0x400,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* RTP */ {
			.phys_start = 0x01c25000,
			.virt_start = 0x01c25000,
			.size = 0x100,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
		},
		/* UART0-3 */ {
			.phys_start = 0x01c28000,
			.virt_start = 0x01c28000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* UART4-7 */ {
			.phys_start = 0x01c29000,
			.virt_start = 0x01c29000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* GMAC */ {
			.phys_start = 0x01c50000,
			.virt_start = 0x01c50000,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* HSTIMER */ {
			.phys_start = 0x01c60000,
			.virt_start = 0x01c60000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x40000000,
			.virt_start = 0x40000000,
			.size = 0x3bf00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* IVSHMEM shared memory regions */ {
			.phys_start = 0x7bf00000,
			.virt_start = 0x7bf00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ,
		},
		{ 0 },
		{
			.phys_start = 0x7bf01000,
			.virt_start = 0x7bf01000,
			.size = 0x7f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		{
			.phys_start = 0x7bf80000,
			.virt_start = 0x7bf80000,
			.size = 0x7f000,
			.flags = JAILHOUSE_MEM_READ,
		},
	},

	.irqchips = {
		/* GIC */ {
			.address = 0x01c81000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.bdf = 0x00,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.shmem_regions_start = 18,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
	},
};

------=_Part_7964_1737181916.1564613849501--
