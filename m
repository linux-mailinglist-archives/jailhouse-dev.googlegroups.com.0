Return-Path: <jailhouse-dev+bncBDPIBXN2TIERBG6MX3VQKGQE52F3O4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 27046A818A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 13:55:09 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id 19sf1716940oii.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6QXSme3NqJN6WhSCM2+/NAJKkY4KkGCmpXUASbeAzW8=;
        b=eRpDNDp+oFGYvcYBQS5nncy5lI0o+2gwghj2ZZOqqrE+eIWrXHl1j2CzudRS+0Ops2
         8S1/sfwwSOSo6hEbi++82TglHe3pap+QadUzOJ8gdCUeUZzf67uiAtk3ca4lVjErLJAm
         BDTxz4b8zEKVH3MK94ghwvwSgoKt+Es0gG3H3d5+Z/iSQVSo5Lb1Q0lPpatfBrXEYu40
         oI3KBdB0Q1oY6V8j5+IpuEeLfMW+YisueAKSQKwuFcdwkNxfTJ5Zr/S9zsXEl6cffl41
         HN5aMDZ2Ei5mMc38hEVlbiLxWAt4MjLRWw73nhzTfRj7rWm2x7eqSZv40ahi5MHkybEm
         VUvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6QXSme3NqJN6WhSCM2+/NAJKkY4KkGCmpXUASbeAzW8=;
        b=YB8v5oUs/FPwsrJC0llDQBnOK6NqRBafD74kHsssYJOj6aJfVAuXBk3ppvUgaxnLKU
         FiH3zwtqn8dp/fZhDkndr8IMKK+ZUCYMBrnQBdaZJCRx4gPrs3vtZtbzRzjbN/s0ReyF
         LYtxrLhYFVrPg0Z6bS7H0T7ambuVal4xP2dB346ZW6r/p7YDhoQCP+ETKrCyGk1UUTT0
         ow0cCuuihBPf9OWBTGh/Fbt8KbNpvesMfD+LyoOHt3hCt5baLLEhpd4f8itF8vMvTSkv
         +dIyUpGeNorZOwgM1MCX5O+wc+c720/RBt0IjvRDHCb3UeqXULCGCREUVwJL/VZGlkoo
         5mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6QXSme3NqJN6WhSCM2+/NAJKkY4KkGCmpXUASbeAzW8=;
        b=S529SQc1kAAganG7WJPDKHHzho/l4eKqGRbVHrMP/LzTLvjuVhCaLbZ7g409zXUo51
         39F/Gy4rEUXhc1je93xKUnQEn87VOLWkI1MNuxrQULCjs/1wxCDu5apx+Xr/Vv5EEay6
         2EKGs6GrnVURuEKM9tA7Q2XZ9/KpbuHigwfnQBwnXAA8IyLw8lUOc75mSH7B1YEyNlJH
         AwQ0x4oZvkiGXlmZOxiQg6M/lm/6wkq9tjz7XrKCdFv+MuTdApFrMqC5hu3K1eZbdb8r
         N1Ui64kGoKcG2k206RiIGquU3IAFhZFMh5E+aSL+PGst05MrSfTxfFU23dbDypJuPceX
         lj9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX9l2bnOHJysBcCO0OsnrEudrVvVmyfjlIkhojZZqRorL5lz8rh
	iZG9r/aJjSSksxV1pxWRrKc=
X-Google-Smtp-Source: APXvYqyLYm2SDj2/TfXmm0QX5N9QkvejXitpHGzK99MjeSbprC0LqqSXQVhIUcpBq6lzOV3vqOeitg==
X-Received: by 2002:aca:b645:: with SMTP id g66mr3044320oif.1.1567598107765;
        Wed, 04 Sep 2019 04:55:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:5c2:: with SMTP id d2ls2335516oij.16.gmail; Wed, 04
 Sep 2019 04:55:07 -0700 (PDT)
X-Received: by 2002:a05:6808:183:: with SMTP id w3mr1693637oic.147.1567598106802;
        Wed, 04 Sep 2019 04:55:06 -0700 (PDT)
Date: Wed, 4 Sep 2019 04:55:05 -0700 (PDT)
From: Jan Lipponen <jan.lipponen@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2904512d-e876-4453-88a1-de08439dec14@googlegroups.com>
In-Reply-To: <8e2da73f-ce4f-4999-a7bd-ce4116be8503@googlegroups.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
 <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
 <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
 <1dc9ffa7-64a6-6578-cb29-2573f680b6b3@siemens.com>
 <fd8da5de-70ad-4bf9-b892-3a21d7718ca1@googlegroups.com>
 <8e2da73f-ce4f-4999-a7bd-ce4116be8503@googlegroups.com>
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2093_424312374.1567598106046"
X-Original-Sender: jan.lipponen@gmail.com
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

------=_Part_2093_424312374.1567598106046
Content-Type: multipart/alternative; 
	boundary="----=_Part_2094_519788194.1567598106047"

------=_Part_2094_519788194.1567598106047
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using the *uio_ivshmem* driver from *https://github.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse 
<https://github.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse>* and 
currently not in the need for virtualized networking capability. But who 
knows what comes next so thanks for the contribution :)

I managed to get the ARM-ported version of the *ivshmem-demo* working (from 
https://github.com/evidence/linux-jailhouse-jetson/blob/master/inmates/demos/arm/ivshmem-demo.c) with 
the help of a patch posted by Giovani Gracioli (*https://groups.google.com/d/msg/jailhouse-dev/L2sjyl1xFDg/w2DC3CV5CQAJ 
<https://groups.google.com/d/msg/jailhouse-dev/L2sjyl1xFDg/w2DC3CV5CQAJ>). *The 
patch needed a couple small additions to get it working with my v0.11 
Jailhouse. I'm now able to send an interrupt from *ivshmem-demo* to root 
cell and access the shared memory region from the *uio_ivshme*m interrupt 
handler.

I'll attach the working configurations for ZCU104 board in case some is 
trying to achieve the same. Not really sure they are 100% correct, but 
working at least. I'll also add the updated patch.

I noticed that there used to be a *wip/arm-ivshmem* branch in the Jailhouse 
repository. Any idea when an ARM version of *ivshmem* *demo *will be 
officially supported by Jailhouse?

-Jan


On Friday, 30 August 2019 12:30:38 UTC+3, sebastian...@gmail.com wrote:
>
>
> Hey Jan and Jan,
>
> I was later able to see the device and assign an IP address but I was not 
> able to send pings back and forth.
>
> Just using Ifconfig did not work.
>
> I had to use ifup and of course create an interface for them. See code
>
> root@tsn-inmate:/etc/network/interfaces.d# ls
> enp0s6
> root@tsn-inmate:/etc/network/interfaces.d# less enp0s6 
> auto enp0s6
> iface enp0s6 inet static
>     address 192.168.3.2
>     netmask 255.255.255.0
>
>
> Maybe it will save you a few minutes of work ;)
>
> Sebastian
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2904512d-e876-4453-88a1-de08439dec14%40googlegroups.com.

------=_Part_2094_519788194.1567598106047
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m using the <b>uio_ivshmem</b=
> driver from=C2=A0<i><a href=3D"https://github.com/henning-schild-work/ivs=
hmem-guest-code/tree/jailhouse">https://github.com/henning-schild-work/ivsh=
mem-guest-code/tree/jailhouse</a></i>=C2=A0and currently not in the need fo=
r virtualized networking capability. But who knows what comes next so thank=
s for the contribution :)</div><div><br></div><div>I managed to get the ARM=
-ported version of the <i>ivshmem-demo</i>=C2=A0working (from=C2=A0<a href=
=3D"https://github.com/evidence/linux-jailhouse-jetson/blob/master/inmates/=
demos/arm/ivshmem-demo.c">https://github.com/evidence/linux-jailhouse-jetso=
n/blob/master/inmates/demos/arm/ivshmem-demo.c</a>)=C2=A0with the help of a=
 patch posted by=C2=A0Giovani Gracioli (<i><a href=3D"https://groups.google=
.com/d/msg/jailhouse-dev/L2sjyl1xFDg/w2DC3CV5CQAJ">https://groups.google.co=
m/d/msg/jailhouse-dev/L2sjyl1xFDg/w2DC3CV5CQAJ</a>). </i>The patch needed a=
 couple small additions to get it working with my v0.11 Jailhouse.=C2=A0I&#=
39;m now able to send an interrupt from <i>ivshmem-demo</i> to root cell an=
d access the shared memory region from the <i>uio_ivshme</i>m interrupt han=
dler.</div><div><br></div><div>I&#39;ll attach the working configurations f=
or ZCU104 board in case some is trying to achieve the same. Not really sure=
 they are 100% correct, but working at least. I&#39;ll also add the updated=
 patch.</div><div><br></div><div>I noticed that there used to be a=C2=A0<i>=
wip/arm-ivshmem</i> branch in the Jailhouse repository. Any idea when an AR=
M version of=C2=A0<i>ivshmem</i>=C2=A0<i>demo=C2=A0</i>will be officially s=
upported by Jailhouse?</div><div><br></div><div>-Jan<br><br><br>On Friday, =
30 August 2019 12:30:38 UTC+3, sebastian...@gmail.com  wrote:<blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px =
#ccc solid;padding-left: 1ex;"><div dir=3D"ltr"><br>Hey Jan and Jan,<br><br=
>I was later able to see the device and assign an IP address but I was not =
able to send pings back and forth.<br><div><br></div><div>Just using Ifconf=
ig did not work.</div><br><div>I had to use ifup and of course create an in=
terface for them. See code<br><br><div style=3D"margin-left:40px"><div styl=
e=3D"background-color:rgb(250,250,250);border-color:rgb(187,187,187);border=
-style:solid;border-width:1px"><code><div><span style=3D"color:#000">root@t=
sn</span><span style=3D"color:#660">-</span><span style=3D"color:#000">inma=
te</span><span style=3D"color:#660">:</span><span style=3D"color:#080">/etc=
/</span><span style=3D"color:#000">network</span><span style=3D"color:#660"=
>/</span><span style=3D"color:#000">i<wbr>nterfaces</span><span style=3D"co=
lor:#660">.</span><span style=3D"color:#000">d</span><span style=3D"color:#=
800"># ls</span><span style=3D"color:#000"><br>enp0s6<br>root@tsn</span><sp=
an style=3D"color:#660">-</span><span style=3D"color:#000">inmate</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#080">/etc/</span><spa=
n style=3D"color:#000">network</span><span style=3D"color:#660">/</span><sp=
an style=3D"color:#000">i<wbr>nterfaces</span><span style=3D"color:#660">.<=
/span><span style=3D"color:#000">d</span><span style=3D"color:#800"># less =
enp0s6 </span><span style=3D"color:#000"><br></span><span style=3D"color:#0=
08">auto</span><span style=3D"color:#000"> enp0s6<br>iface enp0s6 inet </sp=
an><span style=3D"color:#008">static</span><span style=3D"color:#000"><br>=
=C2=A0 =C2=A0 address </span><span style=3D"color:#066">192.168</span><span=
 style=3D"color:#660">.</span><span style=3D"color:#066">3.2</span><span st=
yle=3D"color:#000"><br>=C2=A0 =C2=A0 netmask </span><span style=3D"color:#0=
66">255.255</span><span style=3D"color:#660">.</span><span style=3D"color:#=
066">255.0</span></div></code></div></div><br></div><div><br></div>Maybe it=
 will save you a few minutes of work ;)<br><br>Sebastian<br></div></blockqu=
ote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2904512d-e876-4453-88a1-de08439dec14%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2904512d-e876-4453-88a1-de08439dec14%40googlegroups.com<=
/a>.<br />

------=_Part_2094_519788194.1567598106047--

------=_Part_2093_424312374.1567598106046
Content-Type: text/x-csrc; charset=US-ASCII; name=zynqmp-zcu104-baremetal.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=zynqmp-zcu104-baremetal.c
X-Attachment-Id: 0c76f64b-e3dd-40d7-b2d8-6294a34ccf69
Content-ID: <0c76f64b-e3dd-40d7-b2d8-6294a34ccf69>

/*
 * Configuration for the ZCU104 bare-metal cell. Copied from ultra96-gic-demo.c
 * and changed where needed.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[4];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "ZCU104-baremetal",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),

		.vpci_irq_base = 140-32,

		.console = {
			.address = 0xff000000,
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
			.phys_start = 0xff000000,
			.virt_start = 0xff000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM */ {
			.phys_start = 0x7fa00000,
			.virt_start = 0,
			.size = 0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
        /* IVSHMEM shared memory region for 00:00.0 */ {
			.phys_start = 0x7fb00000,
			.virt_start = 0x7fb00000,
			.size =       0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_ROOTSHARED,
		},
        /* Communication region */ {
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
				(1 << (140 - 128)) | (1 << (142 - 128))
			},
		},
	},

    .pci_devices = {
	/* 0000:00:00.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0,
			.bdf = 0,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.shmem_region = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
			.num_msix_vectors = 0,
		},
	},
};


------=_Part_2093_424312374.1567598106046
Content-Type: text/x-csrc; charset=US-ASCII; name=zynqmp-zcu104-root.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=zynqmp-zcu104-root.c
X-Attachment-Id: 50455d46-e463-4e85-9542-299b0450e6e6
Content-ID: <50455d46-e463-4e85-9542-299b0450e6e6>

/*
 * Configuration for the ZCU104 root cell. Copied from ultra96.c
 * and changed where necessary.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[3];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x7fc00000,
			.size =       0x00400000,
		},
		.debug_console = {
			.address = 0xff000000,
			.size = 0x1000,
			.type = JAILHOUSE_CON_TYPE_XUARTPS,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xfc000000,
			.pci_mmconfig_end_bus = 0,
			.pci_is_virtual = 1,
			.arm = {
				.gic_version = 2,
				.gicd_base = 0xf9010000, /*GIC distributor register base*/
				.gicc_base = 0xf902f000, /*GIC cpu interface register base*/
				.gich_base = 0xf9040000, /*GIC virtual interface control register base*/
				.gicv_base = 0xf906f000, /*GIC virtual cpu interface register base*/
				.maintenance_irq = 25,
			},
		},
		.root_cell = {
			.name = "ZCU104-root",

			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),

			.vpci_irq_base = 136-32,
		},
	},

	.cpus = {
		0xf,
	},

	.mem_regions = {
		/* MMIO (permissive) */ {
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size =	      0x03000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM */ {
			.phys_start = 0x00000000,
			.virt_start = 0x00000000,
			.size =       0x7fb00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE,
		},
		/* IVSHMEM shared memory region for 00:00.0 */ {
			.phys_start = 0x7fb00000,
			.virt_start = 0x7fb00000,
			.size =       0x00100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* GIC */ {
			.address = 0xf9010000,
			.pin_base = 32,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
			},
		},
	},

	.pci_devices = {
		/* 0000:00:00.0 */ {
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.domain = 0,
			.bdf = 0x00 << 3,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.shmem_region = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
		},
	},
};

------=_Part_2093_424312374.1567598106046
Content-Type: text/x-diff; charset=US-ASCII; name=arm-ivshmem-support.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=arm-ivshmem-support.patch
X-Attachment-Id: 2b74ac0f-027a-42fd-aa27-efce250bbfb4
Content-ID: <2b74ac0f-027a-42fd-aa27-efce250bbfb4>

diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index 669ff48..ee34b8c 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -37,8 +37,8 @@
 #
 
 objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
-objs-y += ../printk.o
-objs-y += printk.o gic.o mem.o timer.o setup.o uart.o
+objs-y += ../printk.o ../pci.o
+objs-y += printk.o gic.o mem.o timer.o setup.o uart.o pci.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
 objs-y += uart-pl011.o
 objs-y += gic-v2.o gic-v3.o
diff --git a/inmates/lib/arm-common/include/inmate.h b/inmates/lib/arm-common/include/inmate.h
index 61e383a..ed097de4 100644
--- a/inmates/lib/arm-common/include/inmate.h
+++ b/inmates/lib/arm-common/include/inmate.h
@@ -41,6 +41,7 @@
 
 #define COMM_REGION_BASE	0x80000000
 #define PAGE_SIZE	(4 * 1024ULL)
+#define PAGE_MASK	(~(PAGE_SIZE - 1))
 
 typedef signed char s8;
 typedef unsigned char u8;
@@ -106,9 +107,39 @@ void timer_start(u64 timeout);
 
 void arch_mmu_enable(void);
 
+#define PCI_CFG_VENDOR_ID	0x000
+#define PCI_CFG_DEVICE_ID	0x002
+#define PCI_CFG_COMMAND		0x004
+#define PCI_CMD_IO			(1 << 0)
+#define PCI_CMD_MEM			(1 << 1)
+#define PCI_CMD_MASTER		(1 << 2)
+#define PCI_CMD_INTX_OFF	(1 << 10)
+#define PCI_CFG_STATUS		0x006
+#define PCI_STS_INT			(1 << 3)
+#define PCI_STS_CAPS		(1 << 4)
+#define PCI_CFG_BAR			0x010
+#define PCI_BAR_64BIT		0x4
+#define PCI_CFG_CAP_PTR		0x034
+
+#define PCI_ID_ANY			0xffff
+
+#define PCI_DEV_CLASS_OTHER	0xff
+
+#define PCI_CAP_MSI			0x05
+#define PCI_CAP_MSIX		0x11
+
+#define MSIX_CTRL_ENABLE	0x8000
+#define MSIX_CTRL_FMASK		0x4000
+
+u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size);
+void pci_write_config(u16 bdf, unsigned int addr, u32 value,
+		      unsigned int size);
+int pci_find_device(u16 vendor, u16 device, u16 start_bdf);
+int pci_find_cap(u16 bdf, u16 cap);
+
 #include <asm/processor.h>
 #include <arch/inmate.h>
 
-#include <inmate_common.h>
+#include "../../include/inmate_common.h"
 
 #endif /* !_JAILHOUSE_INMATE_H */
diff --git a/inmates/lib/arm-common/pci.c b/inmates/lib/arm-common/pci.c
new file mode 100644
index 0000000..c07541e
--- /dev/null
+++ b/inmates/lib/arm-common/pci.c
@@ -0,0 +1,50 @@
+#include <inmate.h>
+
+#define PCI_CFG_BASE	0xfc000000
+
+static void pci_map_region(void);
+
+void pci_map_region(void)
+{
+	static u8 pci_region_mapped;
+
+	/* mapping region */
+	if (!pci_region_mapped) {
+		pci_region_mapped = 1;
+		map_range((void*) PCI_CFG_BASE, 0x100000, MAP_UNCACHED);
+	}
+}
+
+u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size)
+{
+	/* Mapping the PCI configuration space before accessing it*/
+	pci_map_region();
+
+	u64 reg_addr = PCI_CFG_BASE | ((u32)bdf << 8) | (addr & 0xfc);
+	switch (size) {
+	case 1:
+		return mmio_read8((u8 *)(reg_addr + (addr & 0x3)));
+	case 2:
+		return mmio_read16((u16 *)(reg_addr + (addr & 0x3)));
+	case 4:
+		return mmio_read32((u32 *)(reg_addr));
+	default:
+		return -1;
+	}
+}
+
+void pci_write_config(u16 bdf, unsigned int addr, u32 value, unsigned int size)
+{
+	u64 reg_addr = PCI_CFG_BASE | ((u32)bdf << 8) | (addr & 0xfc);
+	switch (size) {
+	case 1:
+		mmio_write8((u8 *)(reg_addr + (addr & 0x3)), value);
+		break;
+	case 2:
+		mmio_write16((u16 *)(reg_addr + (addr & 0x3)), value);
+		break;
+	case 4:
+		mmio_write32((u32 *)(reg_addr), value);
+		break;
+	}
+}

------=_Part_2093_424312374.1567598106046--
