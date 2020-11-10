Return-Path: <jailhouse-dev+bncBCALNYGP4YHRBKWUVP6QKGQE3IJFRAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DE92ADF53
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 20:29:47 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id y8sf5588688qvu.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Nov 2020 11:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L4VZji8b4eVRPru5qTp1b8dLj4wnbcDsK0I/yrLfZ+U=;
        b=VnUxJ6tIhQP6uXa5b7msKIjhPwJTqTGxgfBnNXIlfp2157l9fy7soSfsWH+ep9HFBn
         abk+qtPIwBNwdkjDE8GWtGjB/mvm/SKiljBT7DMYXj1dA3l62p1QeCreGdv5esvMqC6m
         ZL07mqGfgIo+Hok9G7uAVf3peXLMvRaZpDpvaeAfLi4rVwg6V9w58i0wc+4+Fn/LkRji
         9lziNN02admlvydu9f+IgXNJQV2v+hYEvIPzrdK+JR8M9YvL9pGGQ498HydYtm/W9GF+
         k3YO9Ovi25GUziV8ycZsi32AQtYX4dPyTTu+7YgfeEhTDTna1vZcfgqw7xb3evzHUo0m
         1dEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L4VZji8b4eVRPru5qTp1b8dLj4wnbcDsK0I/yrLfZ+U=;
        b=fazbf9nG5qdIaA5WYXkLJTRwBT78aF1MXdJTPh8Trx79Rft+zKaiEhpCpuWB5hnYoL
         tgd3JVtFmyUscR4qwILKBcTsrZES8ZtFevzU/ruMhSlT7ToTHdzmm2cfQRiWBUPedXw+
         FYD+DLFbfhCDklOyLqQzA3VFg7/dr4uJs1t0GXmYO5q0ymDtCkRJu4Tp2eeiNu3JaZCZ
         N4yyjG5yjOpG4UdD6K8d3RxzU9BKOGZZDfaiOcv2z/lgEZxfc4oSWCGhM0xgDqxCUFBN
         kUjpHUZSbESrAI7mj4gs7nTAsa+4c3PpVwsAnjwAaJzJANu8tApqi+7qWkrDk4uWtsid
         dCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L4VZji8b4eVRPru5qTp1b8dLj4wnbcDsK0I/yrLfZ+U=;
        b=Zq6p4kn+Wx6vADPek9agRtRKANy5qzMf+xCW4zwTaZwljZ21hKbIqDYZrrqmpHfLeE
         PiJe4Iu756vSqHviOrTRiZlJQwq+UfR2d+mjgbqox2ybX8fjQJAVZ63KlotTRm+HSDrM
         biXOX2U07Kmpmp07j6CSBFHUsQVSpyH3GSD4ivJXQOmN6EO9gIOvYZdayt6EXPSdMcKG
         mLALkRPAWnYWin+TS1ESKg4mMVnbzfluwcwdSXARC9vygbSHUPk61nF9i0M7xaNb5eF/
         oTQklrmGk8WFYtUZMcus45Lr17lkjmlLXMJfn6J5jxn2z3vN89OHi4r2wCngYhzdmWd8
         hltA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532G8/HylrDA9JQkC1gfWHYSOv2u/u+GfgPrN9VyIAzwdWAb6ifJ
	ljoydSwmOU1bZ2pbCb20IdU=
X-Google-Smtp-Source: ABdhPJzLyESaVfOc7Xfr6Qy8o4Eo+YpK+pANo7JogRGtSD6H1ZxsHompYlUN/xAxEosU3FU22y0KUQ==
X-Received: by 2002:a05:620a:1647:: with SMTP id c7mr12447334qko.455.1605036586731;
        Tue, 10 Nov 2020 11:29:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4e29:: with SMTP id d9ls4839111qtw.10.gmail; Tue, 10 Nov
 2020 11:29:46 -0800 (PST)
X-Received: by 2002:ac8:4311:: with SMTP id z17mr18984948qtm.90.1605036585530;
        Tue, 10 Nov 2020 11:29:45 -0800 (PST)
Date: Tue, 10 Nov 2020 11:29:44 -0800 (PST)
From: Kai-Feng Chou <mapleelpam@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com>
In-Reply-To: <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de>
 <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4218_993483497.1605036584446"
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

------=_Part_4218_993483497.1605036584446
Content-Type: multipart/alternative; 
	boundary="----=_Part_4219_500813772.1605036584446"

------=_Part_4219_500813772.1605036584446
Content-Type: text/plain; charset="UTF-8"

Hi, 
 I'm continuing the work and refine my cell description (not perfect but 
trying ). pls see the attached.

But it still cause panic and I notice it happend in 
jailhouse/driver/main.c:492 -
"
           memcpy(hypervisor_mem, hypervisor->data, hypervisor->size);
"

checked my setting -  
"                .hypervisor_memory = {
                        .phys_start = 0x800000000,
                        .size =       0x000400000,
                },
"

Is it the problem? my physical ddr is 4g add linux cmd_line "mem=1024M".

Sorry I can't find the guidance/ document for it. 
Any advice is welcome.
 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7253133c-e79b-4ae7-93bb-7d58e76ed1cdn%40googlegroups.com.

------=_Part_4219_500813772.1605036584446
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,&nbsp;<div>&nbsp;I'm continuing the work and refine my cell description =
(not perfect but trying ). pls see the attached.</div><div><br></div><div>B=
ut it still cause panic and I notice it happend in jailhouse/driver/main.c:=
492 -</div><div>"</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memcpy=
(hypervisor_mem, hypervisor-&gt;data, hypervisor-&gt;size);<br></div><div>"=
</div><div><br></div><div>checked my setting -&nbsp;&nbsp;</div><div>"&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .hypervisor_memory =3D {=
</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; .phys_start =3D 0x800000000,</div><div>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .size =
=3D&nbsp; &nbsp; &nbsp; &nbsp;0x000400000,</div><div>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; },</div><div>"</div><div><br></div><div>I=
s it the problem? my physical ddr is 4g add linux cmd_line "mem=3D1024M".</=
div><div><br></div><div>Sorry I can't find the guidance/ document for it.&n=
bsp;</div><div>Any advice is welcome.</div><div>&nbsp;</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7253133c-e79b-4ae7-93bb-7d58e76ed1cdn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7253133c-e79b-4ae7-93bb-7d58e76ed1cdn%40googlegroups.co=
m</a>.<br />

------=_Part_4219_500813772.1605036584446--

------=_Part_4218_993483497.1605036584446
Content-Type: text/x-csrc; charset=US-ASCII; name=socfpga-s10socdk.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=socfpga-s10socdk.c
X-Attachment-Id: c8534290-6919-492f-80e8-d5d61df9f7e4
Content-ID: <c8534290-6919-492f-80e8-d5d61df9f7e4>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for Xilinx ZynqMP ZCU102 eval board
 *
 * Copyright (c) Siemens AG, 2016
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Reservation via device tree: 0x800000000..0x83fffffff
 */
/* 
 * copy from zcu102 board setting and here's the configuration for socfpga stratix10
 * KFC <mapleelpam@gmail.com>
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[7];
	struct jailhouse_irqchip irqchips[1];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x800000000,
			.size =       0x000400000,
		},
		.debug_console = {
			.address = 0xffc02000,
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.arm = {
				.gic_version = 2,
				.gicd_base = 0xfffc1000,
				.gicc_base = 0xfffc2000,
				.gich_base = 0xfffc4000,
				.gicv_base = 0xfffc6000,
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "Stratix10-SoCfpga-SoCdk",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = 0,

		},
	},

	.cpus = {
		0xf,
	},

	.mem_regions = {
		/* RAM */ {
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x80000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* FPGA 1.5GB */ {
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x60000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* DEVICE 142MB */ {
			.phys_start	= 0xF7000000,
			.virt_start	= 0xF7000000,
			.size 		= 0x08E00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* OCRAM 1MB but available 256KB */ {
			.phys_start	= 0xFFE00000,
			.virt_start	= 0xFFE00000,
			.size 		= 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* DEVICE 32KB */ {
			.phys_start	= 0xFFFC0000,
			.virt_start	= 0xFFFC0000,
			.size 		= 0x00008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* MEM 124GB */ {
			.phys_start	= 0x0100000000,
			.virt_start	= 0x0100000000,
			.size 		= 0x1F00008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* DEVICE 4GB */ {
			.phys_start	= 0x2000000000,
			.virt_start	= 0x2000000000,
			.size 		= 0x0100008000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
	},

	.irqchips = {
		/* GIC */ {
			.address = 0xfffc1000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

};

------=_Part_4218_993483497.1605036584446--
