Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBEWRY7UQKGQEXG5LQJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F46E847
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jul 2019 17:58:11 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id n199sf12810813oig.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jul 2019 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=veCzW5tKQm/ery6akwFSOWmvByBbCIavIBTheVWnLvE=;
        b=NmKkyC+UrPn9TVBcuLx7229TgZfdfL3+b0uagtS7O+YRRsKvUf2VdWtyJocC15Gi/A
         Fv8e8bhy+gkXfAiGWZQdFpPToFckMkM4ECXhm+jA39hG/o71Mf7B6hN/6a8kX2ilQN5c
         wS6caZwEj/9ED2MXOie4fcSLJvyf48nEaVvKIJ8sAl5uxWKsliv/FNoBTtX445+bkdvf
         q2UTHyNrfxxYrWJ7S7UfTA076lWIRkEZ87HtuZfps80D2xNBZaundiLs6V1ekghDxrLA
         lsgeQK8BLAtHI98ang6+dVT2npRqkLG8zNwx7p6dM7jY7PRl4jxr94A95//naXi0bkLA
         0w1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=veCzW5tKQm/ery6akwFSOWmvByBbCIavIBTheVWnLvE=;
        b=JEf2JCpFYzA20HnAQwVvc9hM1FjXdHBkste/Ke/5X6IWRxLiRXcRIEL67oA32vHP/h
         CV5TlBYOFSd5VqiQRroO+BimmUb4KaQrFDwoLWON/zzne3KCeLeU6PvLfpWn6LcQO+fG
         FaYSIxaQgA893EJqE0DUanKa5dn1U0RNL0XK9r1UrvVzB0QIOQaXT4aBwUtZPZ/5xege
         /M9mdjHUJ+zm/tBeAWpSwxhmYUucifstNBrNk1XKDEz4xux+43d/E3vig8U5ec+jp0in
         k8Sh2E7fBZRob8t1ZqnQ/LOvujI0uTRBvxP7ZuImvH5aawxUuHlu3fgT2eVSkDGaLTSJ
         Oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=veCzW5tKQm/ery6akwFSOWmvByBbCIavIBTheVWnLvE=;
        b=mrKc8nCOlax5l6wBgITFsPoxP38LY/aDTGgp7Vt1abnVgtkrQzMnjJ6JySRb0vynoj
         ZmBYBm7f9OTjDNS3Fqe5suDs3xllFldNmWHLI29zhA3PWwkbZ4Ty1AOTLeUmayH33KSt
         W3G7rtG9MbexSaqRN/GLs1oD/Etc+dtQ0hQr8m69rAyH8WUHqoLOd3cIyrju/4WJSPbp
         NLS91uIVHUsfRgF8l6vkSM7iASpnTWINXIa3BUkCLJRU2ax1rniAAfSmNYU3CIZRMZBg
         xTOc5T5KCZ+KRKm44GgiCKy5QnOvf+I727rc8KuwY4GgzXVKzIp/eOpSbFxNeBQIcuZJ
         1dHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXffNSM5xiV4vaVcfCVl6lXCzKdgbIIUQU8f4jq5EBSvuW1fSRH
	furZpnuZj4OKbilQYfNA8Rc=
X-Google-Smtp-Source: APXvYqxjCLoHDl8QzGfKyULzw2ARbtjPipzkVhNJJVdGdriXgU02Y2teJ6dRkrTza9ETgWl4Oeho4w==
X-Received: by 2002:a9d:5788:: with SMTP id q8mr37591958oth.237.1563551890403;
        Fri, 19 Jul 2019 08:58:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5015:: with SMTP id e21ls4194366oib.16.gmail; Fri, 19
 Jul 2019 08:58:09 -0700 (PDT)
X-Received: by 2002:a54:4694:: with SMTP id k20mr27564641oic.136.1563551889692;
        Fri, 19 Jul 2019 08:58:09 -0700 (PDT)
Date: Fri, 19 Jul 2019 08:58:08 -0700 (PDT)
From: Alejandro Largacha <alexlargacha@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8@googlegroups.com>
In-Reply-To: <47b00372-adcd-da18-8553-d7085bc6e049@siemens.com>
References: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
 <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
 <e10f5a45-4913-4b28-b896-0ac6b381e183@googlegroups.com>
 <47b00372-adcd-da18-8553-d7085bc6e049@siemens.com>
Subject: Re: PL interrupt in UltraZed
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4588_14398226.1563551889051"
X-Original-Sender: alexlargacha@gmail.com
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

------=_Part_4588_14398226.1563551889051
Content-Type: multipart/alternative; 
	boundary="----=_Part_4589_841865985.1563551889051"

------=_Part_4589_841865985.1563551889051
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just tried and did not work. I don't know what I'm missing
I attach the config and the demo code

El viernes, 19 de julio de 2019, 7:08:41 (UTC+2), Jan Kiszka escribi=C3=B3:
>
> On 19.07.19 01:32, Alejandro Largacha wrote:=20
> > Hello,=20
> >=20
> > Thank you very much for the reply. I tried adding the irqchip entry to=
=20
> the cell config but no success. I have a doubt about the pin_bitmap entry=
.=20
> Is it divided in 4 groups of 32 bits? Then, how should be the entry like=
=20
> for the irq num 136. Like this?=20
> >=20
> > .irqchips =3D {=20
> >            /* GIC */ {=20
> >                .address =3D 0xf9010000,=20
> >                .pin_base =3D 32,=20
>
> This means bit 0 in the first word of pin_bitmap encodes GIC interrupt 32=
.=20
> Then,=20
> when that bit is set, permission is granted.=20
>
> >                .pin_bitmap =3D {=20
> >                    1 << (54 - 32),=20
>
> So this one grants access to GIC int 54 - not sure if you need that.=20
>
> >                    0,=20
> >                    0,=20
> >                    1 << (136 - 128)=20
>
> And this permits access to int 136 because this 4th word controls=20
> interrupts=20
> 128-159.=20
>
> Did you already try out the config?=20
>
> Jan=20
>
> >                },=20
> >            },=20
> >        }=20
> >=20
> >=20
> > I attach my new cell config file.=20
> >=20
> > El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56 (UTC+2), Jan Kiszka=20
>  escribi=C3=B3:=20
> >> On 10.07.19 06:57, Alejandro Largacha wrote:=20
> >>> Hello,=20
> >>>=20
> >>> I have been paying with jailhouse in a UltraZed SoM with AES-ZU-IOCC-=
G=20
> carrier=20
> >>> card from avnet.=20
> >>> So far, I have been able to enable the root cell, create a aremetal=
=20
> cell where I=20
> >>> was able to load the baremetal=20
> >>> examples like gic-demo and a custom one where I was able to turn on=
=20
> some leds=20
> >>> via axi gpio in PL side.=20
> >>>=20
> >>> Now I'm trying to run an example where I can catch the interrupt from=
=20
> an axi=20
> >>> gpio in PL and I am not able to do that.=20
> >>> I'm using PL to PS interrupts in my design and the signal is being=20
> generated. I=20
> >>> also tested with Xilinx SDK.=20
> >>> I tried with PS to PL group 0 and group 1. Irq numbers 121 and 136 an=
d=20
> no=20
> >>> success. I don't know what I'm missing.=20
> >>> I attach the cells and the demo source.=20
> >>>=20
> >>=20
> >> Your baremetal cell config is not permitting the cell access to the GI=
C=20
> >> interrupt 136 you are using. Replicate the irqchip entry and create=20
> bitmask=20
> >> where only bit 136 - 32 (32 is the base) is set. See also other=20
> examples=20
> >> in-tree, including those for the zcu102 or the ultra96. Both grant=20
> their=20
> >> non-root linux cells access to certain interrupts.=20
> >>=20
> >> Jan=20
> >>=20
> >> --=20
> >> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >> Corporate Competence Center Embedded Linux=20
> >=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroups.com.

------=_Part_4589_841865985.1563551889051
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just tried and did not work. I don&#39;t know what =
I&#39;m missing</div><div>I attach the config and the demo code<br></div><b=
r>El viernes, 19 de julio de 2019, 7:08:41 (UTC+2), Jan Kiszka  escribi=C3=
=B3:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex=
;border-left: 1px #ccc solid;padding-left: 1ex;">On 19.07.19 01:32, Alejand=
ro Largacha wrote:
<br>&gt; Hello,
<br>&gt;=20
<br>&gt; Thank you very much for the reply. I tried adding the irqchip entr=
y to the cell config but no success. I have a doubt about the pin_bitmap en=
try. Is it divided in 4 groups of 32 bits? Then, how should be the entry li=
ke for the irq num 136. Like this?=20
<br>&gt;=20
<br>&gt; .irqchips =3D {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* GIC */ {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.address =
=3D 0xf9010000,
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pin_base =
=3D 32,
<br>
<br>This means bit 0 in the first word of pin_bitmap encodes GIC interrupt =
32. Then,
<br>when that bit is set, permission is granted.
<br>
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pin_bitmap=
 =3D {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 &lt;&lt; (54 - 32),
<br>
<br>So this one grants access to GIC int 54 - not sure if you need that.
<br>
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00,
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A01 &lt;&lt; (136 - 128)
<br>
<br>And this permits access to int 136 because this 4th word controls inter=
rupts
<br>128-159.
<br>
<br>Did you already try out the config?
<br>
<br>Jan
<br>
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0}
<br>&gt;=20
<br>&gt;=20
<br>&gt; I attach my new cell config file.
<br>&gt;=20
<br>&gt; El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56 (UTC+2), Jan Kiszk=
a =C2=A0escribi=C3=B3:
<br>&gt;&gt; On 10.07.19 06:57, Alejandro Largacha wrote:
<br>&gt;&gt;&gt; Hello,
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; I have been paying with jailhouse in a UltraZed SoM with A=
ES-ZU-IOCC-G carrier
<br>&gt;&gt;&gt; card from avnet.
<br>&gt;&gt;&gt; So far, I have been able to enable the root cell, create a=
 aremetal cell where I
<br>&gt;&gt;&gt; was able to load the baremetal
<br>&gt;&gt;&gt; examples like gic-demo and a custom one where I was able t=
o turn on some leds
<br>&gt;&gt;&gt; via axi gpio in PL side.
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; Now I&#39;m trying to run an example where I can catch the=
 interrupt from an axi
<br>&gt;&gt;&gt; gpio in PL and I am not able to do that.
<br>&gt;&gt;&gt; I&#39;m using PL to PS interrupts in my design and the sig=
nal is being generated. I
<br>&gt;&gt;&gt; also tested with Xilinx SDK.
<br>&gt;&gt;&gt; I tried with PS to PL group 0 and group 1. Irq numbers 121=
 and 136 and no
<br>&gt;&gt;&gt; success. I don&#39;t know what I&#39;m missing.
<br>&gt;&gt;&gt; I attach the cells and the demo source.
<br>&gt;&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt; Your baremetal cell config is not permitting the cell access t=
o the GIC
<br>&gt;&gt; interrupt 136 you are using. Replicate the irqchip entry and c=
reate bitmask
<br>&gt;&gt; where only bit 136 - 32 (32 is the base) is set. See also othe=
r examples
<br>&gt;&gt; in-tree, including those for the zcu102 or the ultra96. Both g=
rant their
<br>&gt;&gt; non-root linux cells access to certain interrupts.
<br>&gt;&gt;
<br>&gt;&gt; Jan
<br>&gt;&gt;
<br>&gt;&gt; --=20
<br>&gt;&gt; Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt;&gt; Corporate Competence Center Embedded Linux
<br>&gt;=20
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
om/d/msgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/1fcf087a-14f5-4b96-b95b-bbbd9dafc9b8%40googlegroups.com<=
/a>.<br />

------=_Part_4589_841865985.1563551889051--

------=_Part_4588_14398226.1563551889051
Content-Type: text/x-csrc; charset=US-ASCII; name=ultrazed_ehu_leds.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ultrazed_ehu_leds.c
X-Attachment-Id: 7f0894d6-31b9-4c0c-b0cd-9095aea55e76
Content-ID: <7f0894d6-31b9-4c0c-b0cd-9095aea55e76>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for gic-demo inmate on Xilinx ZynqMP ZCU102 eval board:
 * 1 CPU, 64K RAM, 1 serial port
 *
 * Copyright (c) Siemens AG, 2016
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
    struct jailhouse_irqchip irqchips[1];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "gpio-leds-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.pio_bitmap_size = 0,
		.num_pci_devices = 0,

		.console = {
			.address = 0xff010000,
			.type = JAILHOUSE_CON_TYPE_XUARTPS,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
	},

	.cpus = {
		0x8,
	},

	.mem_regions = {
		/* UART */ {
			.phys_start = 0xff010000,
			.virt_start = 0xff010000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM */ {
			.phys_start = 0x42000000,
			.virt_start = 0,
			.size = 0x00010000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* GPIO_SWITCHES */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* GPIO_LEDS */ {
			.phys_start = 0x80001000,
			.virt_start = 0x80001000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
	},
	.irqchips = {
		/* GIC */ {
			.address = 0xf9010000,
			.pin_base = 32,
			.pin_bitmap = {
				1 << (54 - 32),
				0,
				0,
				1 << (136 - 128)
			},
		},
	},
};

------=_Part_4588_14398226.1563551889051
Content-Type: text/x-csrc; charset=US-ASCII; name=irqbutton_demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=irqbutton_demo.c
X-Attachment-Id: eb269f98-eaeb-4645-b222-d919309babba
Content-ID: <eb269f98-eaeb-4645-b222-d919309babba>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) ARM Limited, 2014
 * Copyright (c) Siemens AG, 2014-2017
 *
 * Authors:
 *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <inmate.h>
#include <gic.h>

#define GPIO_IRQ_NUM		136

#define GPIO_LEDS_BASE_ADDRESS  	0x80001000 
#define GPIO_SWITCH_BASE_ADDRESS  	0x80000000 


static void handle_IRQ(unsigned int irqn)
{

	if (irqn != GPIO_IRQ_NUM)
		return;

	printk("Button pressed\n");

}

void inmate_main(void)
{
	char *p_gpio_leds = (char *)GPIO_LEDS_BASE_ADDRESS;
	char *p_gpio_switch = (char *)GPIO_SWITCH_BASE_ADDRESS;
	printk("Initializing the GIC for GPIO IRQ...\n");

	mmio_write32(p_gpio_leds , 0xA5);
	
	/* AXI GPIO IRQ config */
	mmio_write32((p_gpio_switch + 0x4), 0xFF); /* All inputs */
	mmio_write32((p_gpio_switch + 0x128), 0x1); /* Enable channel 1 interrupts */
	mmio_write32((p_gpio_switch + 0x11C), 0x80000000); /* Enable global interrupt */

	gic_setup(handle_IRQ);
	gic_enable_irq(GPIO_IRQ_NUM);

	halt();
}

------=_Part_4588_14398226.1563551889051--
