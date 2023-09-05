Return-Path: <jailhouse-dev+bncBCWY74EX3IPRBO6A3OTQMGQERR3ZCWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD0B7920EB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Sep 2023 10:01:01 +0200 (CEST)
Received: by mail-pl1-x640.google.com with SMTP id d9443c01a7336-1b88decb2a9sf32565735ad.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693900860; x=1694505660; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7QN0NjCUS/WRV4FW8SxMarlebp3aRBtPuYNHq2WObs=;
        b=daGi6W5PVXg56YdDfgwFX2obEp7uJ/LPgQkydTDJJ3eirLEjvnxVtru3FS6PcLY+ro
         Iv8nEav528r4nfriuxWhHELvO0viMTlQk7jBfvQ69Dg3eyVn+HypFeY4i0K/b6ymfCTt
         2FgcnuJY8UNWXmOs2fvJfqgWRF7y+GPUly2m1/y6m/onXTGNTWx1O/8b7T1OI8Zbb9Af
         /Rgj99WSevT6+lY8/nysE1mF4afnduhIIiYDYZgFPWH0t5jmxJfc2XT09AwxlQoefEGf
         rMbdT/WV4+ASV0t9vZGZF6M49NoqkWLSJ3Hyp1mbHVQuVZ6tjp+6W+YzPBucfV0Db5SC
         sqIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693900860; x=1694505660; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7QN0NjCUS/WRV4FW8SxMarlebp3aRBtPuYNHq2WObs=;
        b=eGaMuS5NOGtzYW22hC/Vs1oODZUoEphy+YqioygRqzN3RitX6LOiyrAIcoDVqRjzBr
         AAbmkPSVnWp3y34LmvkVKhcsztdXMryB/J3d915phZGu4rY05m69VBUcbQXvlavmnIwO
         LaXSbpz2CoEtkrRWRPiUaUE7Ps2aHEMOxvRBhc12Sx7xdHqQe7f/svOt7eHGVpExw7e5
         BMhTaskNJQXqODxRAO3LEtROIdfNLAty3oQgOaYhq5NPmjc7636wlYZyFV4ZIscYf+gi
         44YdY//dgeAdkEjYpBr6t2c+u8MbOTa3UyZDC4tE5kPl4CScP+SQqJG5CCHSAoA8sX2t
         cmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693900860; x=1694505660;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7QN0NjCUS/WRV4FW8SxMarlebp3aRBtPuYNHq2WObs=;
        b=PFKDOPDKDEvLswYHZzpnYEBPqEHHJzsls7CZITlYg44kc1miEtQafB6hVASJpCCqde
         4tXsRKaUwr/I6+dPd+JkjXFb0blKL+ojXadz4pWIyhbdggM37w3CLRM39qtNWpTehFNi
         SKrjouD17x7Ri1pDsDNpuR7ehrFlu0btkqGIhLcqcz8u89PxbrSrzUgzSNLD29FKbP12
         bUkoYiUkGEhvVu06kxvWK6L+Lqi3upNxt3FWnhi9Ydt7eI9WylL2wGkK6Zp/EEksfeEe
         jsHM9D2YJzW6ZULO84fu7mYM4Cw/EQUuVmeilN4SHFR6nPU8Cn4hr1oVfY8seWIbPPZ0
         ZMfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz1WTbG+K5w9UhTroDpLJMWGP2l+C27UDGXpcOwJkuBHLVWujen
	/TqLLCZu8ukD1ryxY9gZ8FE=
X-Google-Smtp-Source: AGHT+IGCRkb7AfHNHlCOXT3PurQfGKm7OnTdbuOqcOUk5zpOD0GplwYicsBXFTJ/eomqg8A0SXudXQ==
X-Received: by 2002:a17:902:c409:b0:1c0:af36:e178 with SMTP id k9-20020a170902c40900b001c0af36e178mr19385358plk.11.1693900859909;
        Tue, 05 Sep 2023 01:00:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:64c8:b0:1b8:c50d:56e4 with SMTP id
 y8-20020a17090264c800b001b8c50d56e4ls470593pli.1.-pod-prod-07-us; Tue, 05 Sep
 2023 01:00:58 -0700 (PDT)
X-Received: by 2002:a17:902:d504:b0:1c1:fbec:bc2a with SMTP id b4-20020a170902d50400b001c1fbecbc2amr4471091plg.5.1693900858546;
        Tue, 05 Sep 2023 01:00:58 -0700 (PDT)
Date: Tue, 5 Sep 2023 01:00:57 -0700 (PDT)
From: Zhan Zheng <zzlossdev@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
Subject: when enter_hypervisor on rk3568, system reboot without oops
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_33575_526722665.1693900857467"
X-Original-Sender: zzlossdev@gmail.com
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

------=_Part_33575_526722665.1693900857467
Content-Type: multipart/alternative; 
	boundary="----=_Part_33576_1737558340.1693900857467"

------=_Part_33576_1737558340.1693900857467
Content-Type: text/plain; charset="UTF-8"

hello, everyone. I'm porting jailhouse to rk3568 which running open 
harmony. 
jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a basic root 
cell to test it.
but when i `jailhouse enable rk3568.cell`, the system reboot. can someone 
help me pls?
thanks

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ca381c51-0921-42cf-ad8f-2b6f6727ce6dn%40googlegroups.com.

------=_Part_33576_1737558340.1693900857467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello, everyone. I'm porting jailhouse to rk3568 which running open harmony=
.=C2=A0<div>jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote =
a basic root cell to test it.</div><div>but when i `jailhouse enable rk3568=
.cell`, the system reboot. can someone help me pls?</div><div>thanks</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ca381c51-0921-42cf-ad8f-2b6f6727ce6dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ca381c51-0921-42cf-ad8f-2b6f6727ce6dn%40googlegroups.co=
m</a>.<br />

------=_Part_33576_1737558340.1693900857467--

------=_Part_33575_526722665.1693900857467
Content-Type: text/x-csrc; charset=US-ASCII; name=rk3568.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=rk3568.c
X-Attachment-Id: fd580c82-cea1-46cc-bfd9-8da88025f9a9
Content-ID: <fd580c82-cea1-46cc-bfd9-8da88025f9a9>

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[4];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[0];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.architecture = JAILHOUSE_ARM64,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,

		.hypervisor_memory = {
			.phys_start = 0x7a000000,	// reserved
			.size = 0x01000000,		// 16M
		},

		.debug_console = {
			.address = 0xfe660000, // uart2
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},

		.platform_info = {
			.pci_mmconfig_base = 0xfe280000, // PCIe3x2_APB
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.pci_domain = 1,
			.arm = {
				.gic_version = 3,
				.gicd_base = 0xfd400000,
				.gicr_base = 0xfd460000,
				.maintenance_irq = 25,
			},
		},

		.root_cell = {
			.name = "RK3568",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		},
	},

	.cpus = {
		0b1111,
	},

	.mem_regions = {
		{
			.phys_start = 0x110000,
			.virt_start = 0x110000,
			.size = 0xf0000,
			.flags = JAILHOUSE_MEM_READ	|
				 JAILHOUSE_MEM_WRITE	|
				 JAILHOUSE_MEM_EXECUTE,
		},

		{
			.phys_start = 0x200000,
			.virt_start = 0x200000,
			.size = 0x8200000,
			.flags = JAILHOUSE_MEM_READ	|
				 JAILHOUSE_MEM_WRITE	|
				 JAILHOUSE_MEM_EXECUTE,
		},

		{
			.phys_start = 0x9400000,
			.virt_start = 0x9400000,
			.size = 0x67e00000,
			.flags = JAILHOUSE_MEM_READ	|
				 JAILHOUSE_MEM_WRITE	|
				 JAILHOUSE_MEM_EXECUTE,
		},

		{
			.phys_start = 0xfe660000,
			.virt_start = 0xfe660000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ	|
				 JAILHOUSE_MEM_WRITE	|
				 JAILHOUSE_MEM_IO	|
				 JAILHOUSE_MEM_ROOTSHARED,
		},
	},

	.irqchips = {
		{
			.address = 0xfd400000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

	.pci_devices = {
	},
};

------=_Part_33575_526722665.1693900857467--
