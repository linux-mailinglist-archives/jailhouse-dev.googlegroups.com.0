Return-Path: <jailhouse-dev+bncBDPODWHAYYOBBKXEVGCAMGQEEZT6TAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id E315136E740
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 10:45:41 +0200 (CEST)
Received: by mail-qk1-x73c.google.com with SMTP id e4-20020a37b5040000b02902df9a0070efsf27435041qkf.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UTbAZGzwPXNpVGupmzS0lwzgo5BTAQPJyBbj3HmU404=;
        b=N9WHJjCSPgpq/k/lpw3xzmitGlwAuidH0757exs7E00YX9Ff81EOW6gbikpIDqDbco
         7QK8nB5muDl9vtwdwGFA3vmOKM7fhLYPjJPMrgoHTGGHbaSoDWZxma27LUPuBrnfOQum
         DrzyBDFIBrDPY55AJ96djBEuH8k5HKWWAdAASYQ0i+B6pG7+SObWCiRAd/Kro+focb4F
         U5bU9pM7w/WLZRYcMjne1RP8DlpVvZVftDIpWysTLoBL5ZWXEupBRtXaEljRlw/uBUAp
         wdYtOV+DS30VcFsMCQ5A24Al1NZ8YGRE1KvumfRQq2/6ZriTFL9i5G9FtOmgdIUGP36z
         QuCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UTbAZGzwPXNpVGupmzS0lwzgo5BTAQPJyBbj3HmU404=;
        b=hsLePYfqhfl46qR77dC+v29gC+iGruUjj73W207zZDp9nz8kmxPDhGRG4cyrhTBERe
         v+CT8lk56K+HQRGHizKFFgh/RqYRnXr5aUN9kgJeza0gst++MEjq4tf1gnNmL4MEJcQL
         AkC+RPssUqq4ySixtH/q3oG62/h0qaef2maH75bWoNwv5MXETlEmaRfJWIcv2fIXTqbF
         ksQ7UanPDe5ezLWynNwiAf762BkkkM5qdbgfR+so3vAs/EzMUEn82WLnjnDutWFMtnUi
         s16xRzFbbV54OZD01su9F9upMHFBgL74RRTf9qhB08u8Eb09RKYD8/RQEspG7niNEm9m
         Oh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UTbAZGzwPXNpVGupmzS0lwzgo5BTAQPJyBbj3HmU404=;
        b=Q8x1pc2lj/7MO5SoAbV9ck9GvRiht+XIo1jbX3mPBSvPJSBo2Vh63yag+WpWWlkoA5
         XgxAeIMS71DgbgYnposaLHBuq+5KUDhnDZ8RSx49eW7pwq4YoIMHqZwGCAALSy/sOSys
         8sqxhQLugTJkCBw7pHWa+NsfBS4gavo+bYfJ2oPQdp2+LjH0wmeCdAbOz3wZH52TwHvb
         EMzE245AYB3Rh61H3GRzpJYaOTHqm1SjbWw8FObHaxqe1Tj3HKfxLis3XE1bvUgqVPql
         9DoQgzkBm6w28Q+nP0iXB9UEZPDtrVfcJ2pe9ExhOeC4Sgk7N9wVQIXsd8vlGTEmKrp6
         P+0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Q0KliyeZ2o7w8xYvCtd3uWeM0dx88Tx8gvvjAie5hZRibr/yR
	5MKatkqKAFkILlg46bEARWw=
X-Google-Smtp-Source: ABdhPJwNORNm1VQGNTwcTaFpyd6yxBJEo71qjk5b8dk+xlCkN7lrWac3pvV+YLJfJl2NJ3kAcOVCtg==
X-Received: by 2002:a37:6196:: with SMTP id v144mr33880616qkb.128.1619685930380;
        Thu, 29 Apr 2021 01:45:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:6756:: with SMTP id n22ls1049047qtp.1.gmail; Thu, 29 Apr
 2021 01:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:164a:: with SMTP id y10mr2088364qtj.373.1619685929644;
        Thu, 29 Apr 2021 01:45:29 -0700 (PDT)
Date: Thu, 29 Apr 2021 01:45:28 -0700 (PDT)
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n@googlegroups.com>
Subject: use uart3 from inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_534_1416784873.1619685928818"
X-Original-Sender: gurrieristefano@gmail.com
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

------=_Part_534_1416784873.1619685928818
Content-Type: multipart/alternative; 
	boundary="----=_Part_535_1499963551.1619685928818"

------=_Part_535_1499963551.1619685928818
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Hello,

I=E2=80=99ve experimented succefully jailhouse on my target (var-som-mx8m-m=
ini +=20
symphony carrier board); specifically I=E2=80=99ve tested a second linux an=
d other=20
demos (ivshmem-demo, gic-demo...).=20

Furthermore, I=E2=80=99ve cross-compiled a very easy bare-metal application=
, but=20
I=E2=80=99m not able to use UART3 (second uart) from this cell (linux root =
cell=20
send correctly debug messages on UART4 -first uart-). Attached you can find=
:

- *imx8mm-uart-demo.c*                  my config cell

- *uart-demo.c*                                   demo loaded into inmate=
=20
cell

Runtime, after enabling jailhouse, I enter:

jailhouse cell create /usr/share/jailhouse/cells/imx8mm-uart-demo.cell

jailhouse cell load 1 /usr/share/jailhouse/inmates/uart-demo.bin

jailhouse cell start 1

In theory, I should be able to see =E2=80=9C*printk(=E2=80=9Dblablabla=E2=
=80=9D)* messages on my=20
uart3 console (the second serial console), but I don=E2=80=99t see anything=
.

***

Questions:

1. Have you some idea? What I got wrong?

2. The config cell seems correct, but I=E2=80=99m asking who initialize uar=
t3=20
serial? Linux? Because if it=E2=80=99s linux, the uart3 is disabled in the =
dtb. Is=20
it possible initialize uart3 serial also into jailhouse?

Thanks a lot for your help in advance!

Kind regards.

Stefano

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n%40googlegroups.com.

------=_Part_535_1499963551.1619685928818
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hello,</p><p>I=E2=80=99ve experimented succefully jailhouse on my target=
 (var-som-mx8m-mini + symphony carrier board); specifically I=E2=80=99ve te=
sted a second linux and other demos (ivshmem-demo, gic-demo...).&nbsp;</p><=
p>Furthermore, I=E2=80=99ve cross-compiled a very easy bare-metal applicati=
on, but I=E2=80=99m not able to use UART3 (second uart) from this cell (lin=
ux root cell send correctly debug messages on UART4 -first uart-). Attached=
 you can find:</p><p>-&nbsp;<b>imx8mm-uart-demo.c</b>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; my&nbsp;config cell</p><p>-&nbsp;<=
b>uart-demo.c</b>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dem=
o loaded into inmate cell</p><p>Runtime, after enabling jailhouse, I enter:=
<br></p><p>jailhouse cell create /usr/share/jailhouse/cells/imx8mm-uart-dem=
o.cell</p><p>jailhouse cell load 1 /usr/share/jailhouse/inmates/uart-demo.b=
in</p><p>jailhouse cell start 1</p><p>In theory, I should be able to see =
=E2=80=9C<i>printk(=E2=80=9Dblablabla=E2=80=9D)</i>&nbsp;messages on my uar=
t3 console (the second serial console), but I don=E2=80=99t see anything.</=
p><p>***</p><p>Questions:</p><p>1. Have you some idea? What I got wrong?</p=
><p>2. The config cell seems correct, but I=E2=80=99m asking who initialize=
 uart3 serial? Linux? Because if it=E2=80=99s linux, the uart3 is disabled =
in the dtb. Is it possible initialize uart3 serial also into jailhouse?</p>=
<p>Thanks a lot for your help in advance!</p><p>Kind regards.</p><p>Stefano=
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n%40googlegroups.co=
m</a>.<br />

------=_Part_535_1499963551.1619685928818--

------=_Part_534_1416784873.1619685928818
Content-Type: text/plain; charset=US-ASCII; name=imx8mm-uart-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=imx8mm-uart-demo.c
X-Attachment-Id: 63d3e5ea-be77-4158-932d-5fd22e403727
Content-ID: <63d3e5ea-be77-4158-932d-5fd22e403727>

/*
 * iMX8MM target - uart-demo
 *
 * Copyright 2018-2019 NXP
 *
 * Authors:
 *  Peng Fan <peng.fan@nxp.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[3];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "uart-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = 0,
		.num_pci_devices = 0,

		.console = {
			.address = 0x30880000,
			.type = JAILHOUSE_CON_TYPE_IMX,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
	},

	.cpus = {
		0x8,
	},

	.mem_regions = {
		/* UART3 */ {
			.phys_start = 0x30880000,
			.virt_start = 0x30880000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM: start from the bottom of inmate memory */ {
			.phys_start = 0xb3c00000,
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
	}
};

------=_Part_534_1416784873.1619685928818
Content-Type: text/plain; charset=US-ASCII; name=uart-demo.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=uart-demo.c
X-Attachment-Id: b29c6910-c7d3-4353-b753-756cc94c9cf5
Content-ID: <b29c6910-c7d3-4353-b753-756cc94c9cf5>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) ARM Limited, 2014
 *
 * Authors:
 *  Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <inmate.h>

void inmate_main(void)
{
	unsigned int i = 0, j;
	/*
	 * The cell config can set up a mapping to access UARTx instead of UART0
	 */
	while(++i) {
		for (j = 0; j < 100000000; j++);
		printk("Hello Stefano from baremetal cell!\n");
	}

	/* lr should be 0, so a return will go back to the reset vector */
}

------=_Part_534_1416784873.1619685928818--
