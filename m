Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBNV6YLUQKGQEETJP5UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847F6D206
	for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Jul 2019 18:32:56 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id h184sf11267087oif.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Jul 2019 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3VZoqnX1qceRESHeGqSdFIFOzD6ny2N6jHkPc8rkj8w=;
        b=moy8sDAdM+jfM3y0uteR5WN7UU6cvZ1zUUMB5fstmg7DSSoYYBuw0Vuof9C+JGzgh8
         /oKl/pMstC4HlyTfLvzH8soeUUgSuTDfw4r1riM9IFFRBT18GI5PKp74PXhgMbgRkIMC
         dayA00NHp8hNRihi7gi4wJ12HVdhht6s8X6SZb24yfVySM2p+nGHBRc1Vc+FnZY7GNAt
         n6TaTg5VJ0WSpS9OMP3OvUr2u0iCsDDRT2XGIFJJdp1ahVB+LOsydfBa24ou7hLFkKDx
         Xfh13iberOQ/aNe9z8nRQydbpklm7cv6kMV3vhi8o/QyW4jJ14l8/Qq0G0x7fht23Rxi
         nvTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3VZoqnX1qceRESHeGqSdFIFOzD6ny2N6jHkPc8rkj8w=;
        b=ZCuKhnB7xP6n0KFKdk2iehVM6kbuwv4dU66pXjEIGdJQuOh6XZWpZxPjRPxKONjTqz
         0d8H66xoeaSQnxGN3f6r5cReE96NOmNYgfE+X5XQjrfrip2+zdTnWcDLoHUrldx6UTkG
         35NB5hOhW/Fg5fWFYKEXIiD2zbd9fzFIJ4JCyglioe2RDcQb1sDQ2qLikglGWXhl/0gR
         X5b4SbnVxLpw5zheiOvcgvdajY7SWr1vrZSDK2ZgCf8z35g0RVnrd5SoZGiLXlpkIbUz
         5nlzupivu3ReCu5C5uLPKuIRdB6cmbUMEXJzRlb5FHsnxQufs+nAo0AU9Nfe6KDdK3nV
         5a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3VZoqnX1qceRESHeGqSdFIFOzD6ny2N6jHkPc8rkj8w=;
        b=UUVrj5f9xNRiFRDCaCUWJr2Sk4xu3kbhBOBUiqVBpllbByBoiCnQG4+/PLNuyZx1ux
         bLTanibd6zY6meNF4VMlfJNCNpbLPS2PdmikMvETXYoiUZZUYeKCxF3jbndB/Rf0a4Nu
         aJkXf7FMF0HLevhxVzKQyBEpf/BL3pfdPbOmtAXT4HwTY5USNrX4GvecTl2otOqvckVg
         BQZ9V/OmW9rREjU3QkdgU95FKUishZRxA55+27ogRGvvKK7SbA+oh5Kyh1A5uKf98gru
         VCCUv8Wlg9myOPqct3lg+SoYJulhYT2TTIWd2pNM+NDiamMw7NGJleUXvNBXJf69L3bk
         dABQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6fP7omCkyTdTIicCdxdBdluZVrFjjv19VmyImkHVQ6IFIoQnr
	mDW1wx0vA8/55KOVeUYs014=
X-Google-Smtp-Source: APXvYqzX04lGXioXjy2BGX3Dm5kGbWYKNhCY9IRuTXqJCPmFNGtm11BEm9BD472me9R8ETcIRh42iw==
X-Received: by 2002:aca:b808:: with SMTP id i8mr22815228oif.160.1563467574630;
        Thu, 18 Jul 2019 09:32:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3e45:: with SMTP id h5ls5408766otg.11.gmail; Thu, 18 Jul
 2019 09:32:54 -0700 (PDT)
X-Received: by 2002:a9d:7f0f:: with SMTP id j15mr8530947otq.156.1563467574040;
        Thu, 18 Jul 2019 09:32:54 -0700 (PDT)
Date: Thu, 18 Jul 2019 09:32:53 -0700 (PDT)
From: Alejandro Largacha <alexlargacha@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e10f5a45-4913-4b28-b896-0ac6b381e183@googlegroups.com>
In-Reply-To: <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
References: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
 <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
Subject: Re: PL interrupt in UltraZed
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4060_814428380.1563467573376"
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

------=_Part_4060_814428380.1563467573376
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you very much for the reply. I tried adding the irqchip entry to the =
cell config but no success. I have a doubt about the pin_bitmap entry. Is i=
t divided in 4 groups of 32 bits? Then, how should be the entry like for th=
e irq num 136. Like this?=20

.irqchips =3D {
           /* GIC */ {
               .address =3D 0xf9010000,
               .pin_base =3D 32,
               .pin_bitmap =3D {
                   1 << (54 - 32),
                   0,
                   0,
                   1 << (136 - 128)
               },
           },
       }


I attach my new cell config file.

El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56 (UTC+2), Jan Kiszka  escrib=
i=C3=B3:
> On 10.07.19 06:57, Alejandro Largacha wrote:
> > Hello,
> >=20
> > I have been paying with jailhouse in a UltraZed SoM with AES-ZU-IOCC-G =
carrier
> > card from avnet.
> > So far, I have been able to enable the root cell, create a aremetal cel=
l where I
> > was able to load the baremetal
> > examples like gic-demo and a custom one where I was able to turn on som=
e leds
> > via axi gpio in PL side.
> >=20
> > Now I'm trying to run an example where I can catch the interrupt from a=
n axi
> > gpio in PL and I am not able to do that.
> > I'm using PL to PS interrupts in my design and the signal is being gene=
rated. I
> > also tested with Xilinx SDK.
> > I tried with PS to PL group 0 and group 1. Irq numbers 121 and 136 and =
no
> > success. I don't know what I'm missing.
> > I attach the cells and the demo source.
> >=20
>=20
> Your baremetal cell config is not permitting the cell access to the GIC
> interrupt 136 you are using. Replicate the irqchip entry and create bitma=
sk
> where only bit 136 - 32 (32 is the base) is set. See also other examples
> in-tree, including those for the zcu102 or the ultra96. Both grant their
> non-root linux cells access to certain interrupts.
>=20
> Jan
>=20
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e10f5a45-4913-4b28-b896-0ac6b381e183%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_4060_814428380.1563467573376
Content-Type: text/x-csrc; charset=US-ASCII; name=ultrazed_ehu_leds.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ultrazed_ehu_leds.c
X-Attachment-Id: b5d11616-460f-4533-a068-4168e7e0870e
Content-ID: <b5d11616-460f-4533-a068-4168e7e0870e>

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
	}
};

------=_Part_4060_814428380.1563467573376--
