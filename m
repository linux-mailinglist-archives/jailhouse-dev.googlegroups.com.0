Return-Path: <jailhouse-dev+bncBAABB2E2Z3ZAKGQEXFAJ4GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D11616A04E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Feb 2020 09:46:34 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id j1sf1351351lja.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Feb 2020 00:46:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582533993; cv=pass;
        d=google.com; s=arc-20160816;
        b=E/VXmoa9S3tLn1AaIe+TVbamW14MIb6Tb7o+lgIzmiTfUF0HCsGarOE/GeMtpngLS4
         AV4BGizQL4xp3coAJxbn4oMhj6x7GxnkOVdUOdtndg05glEnYvPcfMxdsJ+gdVm1bjNs
         /zT44PPQhSnFcYBvY26tbMhabaMSJrW0yP6hD9GcKUdLs6xmM7N18SDmGruwgA95htC2
         LRrprzyZ2FVITu4qgzSjfCobBWJP69crnxAgrUdTuYPktSjqmA37WJmIYAjn2Bvy0rF2
         APtDgq56Jv8W8CM0xmHzDLQHMqjxZIeOQHqXY0IeSq+h1o0Z4FV982dhSdaAkMgENGO4
         Nuog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=KlqBUsrkUjEeRUNUhJp+oxd/DUJ0g50X2u7L1KUnMNI=;
        b=abXBuMrj8pyIdMgmtgbhZKmCTmlwzXfFkaRpHxRteYdm+FE4oz+Fps2+NQlXR7f6Y8
         lon354gdv9C5I7TkRa92AKT2Dopef1n9R/2LOpuSae3+aEmaiMCJh9zYUyLAzWW9aauJ
         YxebQ4Dcq42oWcPg+D4UO+gTtF0U/Q2yqZNtlEbVbf4FaZrY4m4+eNtrBcZUOCPKg3p2
         8z3dyh6KlK1iylotHGAO4J1TggAtX0gkVtZUk8jD59JYwfauSNWCtP+kAhVplttDZ4C3
         GUjgDmsBul7THzS6w7Eigx2AvC9oN8bjtcTC3g+yoOkCbZsp93iDPxosA+jcdpZSfcZD
         PyPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KlqBUsrkUjEeRUNUhJp+oxd/DUJ0g50X2u7L1KUnMNI=;
        b=pjo9XaflgDkZh5Qs/G6LNVV9tnrRGg5hJvyXzu5W3AJwIlHJgzQDAoGBw1QgOUdjgW
         qghPOM2FzfL6tUWAPQVTMAjLFgpl990OStoeWtFEUYMOYnpn1VJUKX/c7XWAAoO/A6tc
         OS3PgHXZ1+Zjn91zA5UgTCkpS1jcbKmXmORrgQgItB0COXwjxDJc/lZTKn0aCUpBZg9c
         bX+JrwotNiq7lMuEeQvnRmCQ4WPCIF3s9gs9pveoJTAzbIa2iuAvQX7MpfJD8KsEQ/0y
         P3rh/IMsfeRP/AujDWahR9/qo8291pHD79VXtVqR7j4k5GEx02lQt+QihUsF4Yq9y+f7
         WUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KlqBUsrkUjEeRUNUhJp+oxd/DUJ0g50X2u7L1KUnMNI=;
        b=VT6kUglN3NsEIdtJ01x47AObpV1idrR1WD+h9U8wYuUGMejvRdqUVf9I/S0ysehWGo
         IlGX0uVP3pi2RXH3yOSPcFMBYmt1HKRNtzfGBkkeUfzer7H/wNm6efxzF2jVo2T4u5a4
         lOvZxDGXVtnXMvWF70eaMwGq7q+27xwEMKXXNAgPinknLhL2Mnab8N7At4/I9L/NiKww
         ON8ZdrnxhPn5vsWGRrc34AdzPWnrgLRtN3RtkEZ1fKW6jYZsbf8CoNGSTWhMKkxRO9w0
         eLiE4OdTwAFYZU0KjQ+vtKHt5A518jzVRhGdQS2OwBYIjqsfRlh3JGmWIsOpFRGn8eua
         X/UQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWIkLpRkny6uee8E3Lv0lUzm+Yk5O8NnQ9hXvY4FRhu1GYjPzst
	BmmeVdJtalV+D7AI5okePJY=
X-Google-Smtp-Source: APXvYqyHC0xbC38+eBjRYAX+bWzAdxrGncFzLitVwDTP9UqAuddLD+sKRKxKGLJIyBmQvH42X9MEHg==
X-Received: by 2002:a19:ee0a:: with SMTP id g10mr8315757lfb.182.1582533993399;
        Mon, 24 Feb 2020 00:46:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5096:: with SMTP id f22ls931115lfm.2.gmail; Mon, 24 Feb
 2020 00:46:32 -0800 (PST)
X-Received: by 2002:a05:6512:10ca:: with SMTP id k10mr18522287lfg.154.1582533992534;
        Mon, 24 Feb 2020 00:46:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582533992; cv=none;
        d=google.com; s=arc-20160816;
        b=JjpSWNLi2RURNdom9D8WRNu4WbLYMGmLZbuIun2lVG8V7rXyTQCAuNl4qoRTspzVUA
         65dHEPTGvPGwBVyFTJkdC0bWxTzUCIHzLeKD1NcEBYClA4svJYyuaLgiz3Pm7MPN4O1r
         sJbdVBGbpJawZtkBZB9pPHiqSNJODSMpEvUY5sFlN4rOgJcuFEcKw0LZ3CPS9pp2Sja5
         OYrJBrXZY7/2Eg5jGbv2CDB3Cj7bfFOA3grM1VIuWBe/yhOpRgbD7cht8jhPz35Qm7bO
         Tml4YCjcDYu3l6bZLGy8aMKMChyzQqu2eXhpKpzgBUIp9eAhbn0UOqg/ta6pkADZoUgK
         +AGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:from:references
         :to:subject;
        bh=1IvH+f+jBrAWOnp9RgJSYNnWsiUfaTLQ0HFqkc0S6qM=;
        b=wgrCMQ0cUfXIyvjkYzBK19keOkO+3J86aZnA3LMowyb6s+YcxQsP9uF4C2RGWbuFiS
         XDkbLksQfwuo4uuIkVyga3zraybVvoDFA7oavUteGaPyzGGawHMQVSZnRZNtZgF71OsH
         +lSnjgyvzKxuidfEmwooSNxCmruqKncoOtO+IOoUxLPkjyHaNfOHDnPakBtNvGJQDL61
         4vGEDUS1FGfoZ0ZQesb+BZjVo1ncz1eb+sYq6efEjSCCCKZ/id0EGCyFiKGd5yNFBGA4
         gPOIEdUnBXwwm4En+Y/vfieGd7xbkLAkylGhmQcLD1Y+Sf52zpY2XsKwz0Ak53GQItBa
         ddzw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id v2si810083lfn.4.2020.02.24.00.46.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 24 Feb 2020 00:46:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=[10.23.2.107])
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1j69Nm-0005Go-Oa; Mon, 24 Feb 2020 09:46:30 +0100
Subject: Re: Linux non-rootcell with IVSHMEM
To: Jan Kiszka <jan.kiszka@siemens.com>,
 jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
 <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Autocrypt: addr=p.rosenberger@linutronix.de; prefer-encrypt=mutual; keydata=
 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
 c7AAe3l97AutscBJpp+BBQBj4nPXfw==
Organization: linutronix GmbH
Message-ID: <1bd62035-a671-a269-3c8e-82ba3063d1c0@linutronix.de>
Date: Mon, 24 Feb 2020 09:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: p.rosenberger@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of p.rosenberger@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
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

Hi Jan,

thanks for the fast reply.

On 21.02.20 09:31, Jan Kiszka wrote:
>> I start the non-rootcell with the following command:
>> jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
>> "console=3DttyS0,115200 8250_core.skip_old_serial_uarts=3D0xE
>> earlyprintk=3DttyS0,115200 ip=3Ddhcp root=3D/dev/nfs rw
>> nfsroot=3D10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"
>>
>> Here is the log from the hypervisor:
>>> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
>>> Shared memory connection established, peer cells:
>>> =C2=A0 "RootCell"
>>> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
>>> Shared memory connection established, peer cells:
>>> =C2=A0 "RootCell"
>>> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
>>> Shared memory connection established, peer cells:
>>> =C2=A0 "RootCell"
>>> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
>>> Shared memory connection established, peer cells:
>>> =C2=A0 "RootCell"
>>> Adding PCI device 02:00.0 to cell "my-inmate"
>>> Reserving 5 interrupt(s) for device 02:00.0 at index 136
>>> Removing PCI device 00:00.0 from cell "RootCell"
>>> Adding PCI device 00:00.0 to cell "my-inmate"
>>> Created cell "my-inmate"
>>> Page pool usage after cell creation: mem 377/975, remap 65546/131072
>>> Cell "my-inmate" can be loaded
>>> CPU 3 received SIPI, vector 100
>>> Started cell "my-inmate"
>>
>> I get no errors or anything. The cell starts without problems when I
>> remove the IVSHMEM parts from the config.
>>
>> I use the following kernel:
>> http://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/=
jailhouse
>>
>>
>> And the jailhouse from the current master branch
>> (5dbdcbc720c94f79913b1c1b966f87d314d333b5)
>=20
> That kernel contains support for virtio over ivshmem, and you are
> exposing two frontend devices, likely without having the backends
> running. Start with removing those frontends again if you are only
> interested in ivshmem-net or custom ivshmem (via uio etc.). If you want
> to try virtio, make sure the root cell has the backend demos running
> (tools/virtio/ivshmem-*). See also
> https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.jan.=
kiszka%40siemens.com.
>=20

In the end I want to run the whole ivshmem stuff including the virtio-*.
 For now I removed everything except the SHMEM net stuff.

The rootcell looks ok:
> [   27.704596] jailhouse: loading out-of-tree module taints kernel.
> [   30.266681] hpet: Lost 1859 RTC interrupts
> [   30.266938] pci 0000:00:0f.0: [110a:4106] type 00 class 0xff0001
> [   30.266961] pci 0000:00:0f.0: reg 0x10: [mem 0x00000000-0x00000fff]
> [   30.266969] pci 0000:00:0f.0: reg 0x14: [mem 0x00000000-0x000001ff]
> [   30.267208] pci 0000:00:0f.0: BAR 0: assigned [mem 0x90400000-0x90400f=
ff]
> [   30.267214] pci 0000:00:0f.0: BAR 1: assigned [mem 0x90401000-0x904011=
ff]
> [   30.267295] ivshmem-net 0000:00:0f.0: enabling device (0000 -> 0002)
> [   30.267339] ivshmem-net 0000:00:0f.0: TX memory at 0x0000000100701000,=
 size 0x000000000007f000
> [   30.267342] ivshmem-net 0000:00:0f.0: RX memory at 0x0000000100780000,=
 size 0x000000000007f000
> [   30.267809] The Jailhouse is opening.
> [   30.273553] ivshmem-net 0000:00:0f.0 enp0s15: renamed from eth0

But when I start my non-rootcell it just hangs like before.

my non-rootcell:
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>=20
> struct {
> 	struct jailhouse_cell_desc cell;
> 	__u64 cpus[1];
> 	struct jailhouse_memory mem_regions[9];
> 	struct jailhouse_cache cache_regions[1];
> 	struct jailhouse_irqchip irqchips[1];
> 	struct jailhouse_pio pio_regions[5];
> 	struct jailhouse_pci_device pci_devices[3];
> 	struct jailhouse_pci_capability pci_caps[13];
>=20
> } __attribute__((packed)) config =3D {
> 	.cell =3D {
> 		.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> 		.revision =3D JAILHOUSE_CONFIG_REVISION,
> 		.name =3D "my-inmate",
> 		.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |
> 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>=20
> 		.cpu_set_size =3D sizeof(config.cpus),
> 		.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> 		.num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
> 		.num_irqchips =3D ARRAY_SIZE(config.irqchips),
> 		.num_pio_regions =3D ARRAY_SIZE(config.pio_regions),
> 		.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
> 		.num_pci_caps =3D ARRAY_SIZE(config.pci_caps),
> 	},
>=20
> 	/* CPU 3 */
> 	.cpus =3D {
> 		0x4,
> 	},
>=20
> 	.mem_regions =3D {
> 		/* IVSHMEM shared memory regions (networking) */
> 		JAILHOUSE_SHMEM_NET_REGIONS(0x100700000, 1),
>=20
> 		/* low RAM: 1 MiB */ {
> 			.phys_start =3D 0x100700000,
> 			.virt_start =3D 0,
> 			.size =3D 0x00100000,
> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> 				JAILHOUSE_MEM_LOADABLE,
> 		},
> 		/* communication region */=20
> 		{
>                         .virt_start =3D 0x00100000,
>                         .size =3D 0x00001000,
>                         .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |
>                                 JAILHOUSE_MEM_COMM_REGION,
>                 },
> 		/* high RAM: 249 MiB */ {
> 			.phys_start =3D 0x100800000,
> 			.virt_start =3D 0x00200000,
> 			.size =3D 0xf900000,
> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> 				JAILHOUSE_MEM_LOADABLE,
> 		},
> 		/* MemRegion: df000000-df01ffff : 02:00.0/igb */
> 		{
> 			.phys_start =3D 0xdf000000,
> 			.virt_start =3D 0xdf000000,
> 			.size =3D 0x20000,
> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 		/* MemRegion: df021000-df023fff : 02:00.0/igb */
> 		{
> 			.phys_start =3D 0xdf021000,
> 			.virt_start =3D 0xdf021000,
> 			.size =3D 0x3000,
> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> 		},
> 	},
>=20
> 	.cache_regions =3D {
> 		{
> 			.start =3D 0,
> 			.size =3D 2,
> 			.type =3D JAILHOUSE_CACHE_L3,
> 		},
> 	},
>=20
> 	.irqchips =3D {
> 		/* IOAPIC 2, GSI base 0 */
> 		{
> 			.address =3D 0xfec00000,
> 			.id =3D 0x1f0f8,
> 			.pin_bitmap =3D {
> 				(1 << 4),
> 			},
> 		},
> 	},
>=20
> 	.pio_regions =3D {
> 		PIO_RANGE(0x4e, 4),
> 		PIO_RANGE(0x2e, 4),
> 		PIO_RANGE(0x70, 2), /* RTC */
> 		PIO_RANGE(0x110, 8),
> 		/* Serial device: ttyS0 with IRQ 4 (see above) */
> 		PIO_RANGE(0x3f8, 8),
> 	},
>=20
> 	.pci_devices =3D {
> 		{
> 			.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> 			.domain =3D 0x0,
> 			.bdf =3D 0x0f << 3,
> 			.bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> 			.num_msix_vectors =3D 2,
> 			.shmem_regions_start =3D 0,
> 			.shmem_dev_id =3D 1,
> 			.shmem_peers =3D 2,
> 			.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> 		},
> 		/* PCIDevice: igb/02:00.0 */
> 		{
> 			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
> 			.iommu =3D 1,
> 			.domain =3D 0x0,
> 			.bdf =3D 0x200,
> 			.bar_mask =3D {
> 				0xfffe0000, 0x00000000, 0x00000000,
> 				0xffffc000, 0x00000000, 0x00000000,
> 			},
> 			.caps_start =3D 0,
> 			.num_caps =3D 6,
> 			.num_msi_vectors =3D 1,
> 			.msi_64bits =3D 1,
> 			.msi_maskable =3D 1,
> 			.num_msix_vectors =3D 5,
> 			.msix_region_size =3D 0x1000,
> 			.msix_address =3D 0xdf020000,
> 		},
> 	},
> 	.pci_caps =3D {
> 		/* PCIDevice: igb/02:00.0 */
> 		{
> 			.id =3D PCI_CAP_ID_PM,
> 			.start =3D 0x40,
> 			.len =3D 0x8,
> 			.flags =3D JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id =3D PCI_CAP_ID_MSI,
> 			.start =3D 0x50,
> 			.len =3D 0x18,
> 			.flags =3D JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id =3D PCI_CAP_ID_MSIX,
> 			.start =3D 0x70,
> 			.len =3D 0xc,
> 			.flags =3D JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id =3D PCI_CAP_ID_EXP,
> 			.start =3D 0xa0,
> 			.len =3D 0x3c,
> 			.flags =3D JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id =3D PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
> 			.start =3D 0x100,
> 			.len =3D 0x40,
> 			.flags =3D JAILHOUSE_PCICAPS_WRITE,
> 		},
> 		{
> 			.id =3D PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
> 			.start =3D 0x1a0,
> 			.len =3D 0x4,
> 			.flags =3D 0,
> 		},
> 	},
> };


>=20
> Jan
>=20

Best regards,
Philipp

>>
>> My system:
>> Intel(R) Core(TM) i5-6442EQ
>> 4GB RAM
>> 2 UARTs (ttyS0/ttyS1)
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1bd62035-a671-a269-3c8e-82ba3063d1c0%40linutronix.de.
