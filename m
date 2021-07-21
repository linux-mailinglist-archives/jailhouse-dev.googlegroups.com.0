Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRP24CDQMGQEH2JI6SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64D3D1265
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:29:10 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id v10-20020a2ea60a0000b029017fd05dc0aasf1357432ljp.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:29:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626881349; cv=pass;
        d=google.com; s=arc-20160816;
        b=XGVvZAMWuLjfyYQYie725oLwo8G9ZIB1971NO+Ax5wO0fbn8D8zJZlKomfdFpA0HmE
         k5GhGX5bVFUs2Myi4NQwZ24xAQ4AJ4LyPte5IrL+/uPobnzPhUMRgRAwLeX1Z1n2TaCG
         KUCFfqmgzKZO3J7cnSsxLnORk6fCn5iFdDjJ2nIDYYo9DioauftEzDsnhlLEISmT+g9w
         qWu592zLmdzLc9pQkVbcunWC5j0ngq3kQhtoacG4H3hYwcWR7B//xRMAXwgEd4ePSkLl
         i//lGpm1hQtMhOhCT6euXCDme6he+HCPJeWv++GMSWbLW7vfby4IBvYahCR0nyLZtfK3
         io5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=gmWKzQiKPSUTCwD6dvmQ05gVzvmPikwUOrNogxN+0kc=;
        b=a9eNIZHNVxG5JlwNz+HbAhN8VWSR3TSeHSimGbjbB/p8d5gpGy85J3Nl2YQo4GsGM8
         UpIPipfYECFyiJdsKgLz6ErGLdpcdDZZCeGYQ9+l5RzvMbUPFAOUkJP88O1ceF7exlK3
         ZxIBeN5+jTONGTRS99vqd1EhpnzaKrCW+XaBasp2zBIS90CNEEtEm7/07MXdy7aes6YW
         EBQv/Qn9/DQZBDNIkon1mNG9DzF4pvCdb0/CDG2pNqM1MAzWEhYsZTebygNqf2jSoDqJ
         JrILxRIPLn4C6MbqRhj0Wlh8SM4tit2zP3bQNQAMK+tUVQDUj2NQJDocy+bM27iv91/t
         Lfjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gmWKzQiKPSUTCwD6dvmQ05gVzvmPikwUOrNogxN+0kc=;
        b=eGKtejO8vwuLWbGgpzNH5B0HdSS1Ccd71Mdx1wzYAECdKKP0dgn+wuzWEivvYQ/ZTm
         5XIOnDTDuqoyMWPAFHgoLqAE9bmQrPCQeWGq9Y9jw6xo2F533UfgrvIY0Ff2sZo/aoMf
         DDYRHRiTFfZ4hcWYga5KAf8SfVQrEOYKe7QQKjVMG4GwUDeFZ2wniyKl0Fcm2NMwqEqa
         zTbfF+fHLejF9NCDcmjx3ipMdbta4rM0bd92du5Qgcmu3cL3PgtsCnd5El+ZgwXBGZtN
         OzKpXnxpPX8oqRUBiqGwvz3+m1k0THxZf9m37UYEGbzKvOj27H0bdiV9avv/DPyfeDbu
         N66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gmWKzQiKPSUTCwD6dvmQ05gVzvmPikwUOrNogxN+0kc=;
        b=OeK96piJsRU53lKGW3kAQ6WEPUBJty103ZFMKi/Ji7rOY14I4i1DLO4XKVc0K4OjxK
         sQZNVvdhPUesRG06tLgF1xN51an3JIC6rfc4uZajhFR+6VuieRNv74OCXMnymsM3hptf
         GTfwTSTYksGqUVVdB7IFZ2aTQc0jk0zd1jdzkLqqS2oFgwlopo2aovGVwQqd9xVA8rU+
         VtM1ru5kNEG/2GNH7gJw4dw7BXgxDeGQVUDnHv29PvJ1sap380L380G0K8Oh7BMz1gBd
         En2fhlBO6w+G5SfBwvQtR6t/QvhBOeGuIj+HV2emmBDqX4BK4Tyq6hrpqedTi7cf6koj
         YdvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530H4yCFO7kXbzKTjALSEucP3Q3uAD+celKZtFxeLrLs4ILqD6UA
	929SllPXxPgpkmb0+Q3q/Ho=
X-Google-Smtp-Source: ABdhPJymZx1Ackq/C4PRhcT62n6WWi2I9PNhEpJVsAZ2ZFlCsfo/6zTTkcKAAwDavBsV+9rZwPyRFA==
X-Received: by 2002:ac2:50c3:: with SMTP id h3mr26665179lfm.126.1626881349675;
        Wed, 21 Jul 2021 08:29:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls1271569lfi.2.gmail; Wed, 21 Jul
 2021 08:29:08 -0700 (PDT)
X-Received: by 2002:a19:c795:: with SMTP id x143mr11486223lff.42.1626881348610;
        Wed, 21 Jul 2021 08:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626881348; cv=none;
        d=google.com; s=arc-20160816;
        b=Bi38xWHi/5DAlK7kYnVL/JThjqBIPAJwW5p4MLtYD0OBsXuNZ/zMqAjAO6LjnlliGv
         vMBpxsXycKzzX6EurIPW2ZplGvLaBFSjYjK/b/unCGexjo4MEAgYzEIQwZRHx0+Lr0qN
         Set5g3ut0HelsRtWAIm/wV2zAC0DO0ZNcnnvpEPZJjFcTrfg9inkQ4ejK1LGcESEvwLU
         GwNYocB6+UCg1WfI+1k5FVrfUiFqWaXWrZcn9S7GROFVj578zKcK1HCDfzXyiwj7pnc7
         gekXGBq5JQU/d9ekGbM3vS8TfaADydPGtoxn2AskGvsfcW9U6TqXWT9AAj+QG6VQNc1y
         b2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+eNBqcFM52RmaTfz9jz5rWpmcyQKtgtL9xis2hLmpR0=;
        b=CSs9iF9RghqkF0omyo2yKXdtkt0fYVKu5ThJN11tux5bMTXvi6ObmaAxyJCIVBzs6r
         mIegbPjDOtZ2EBuh8169BYxZpg2zeL0oO2yag140ZyKQnhFq38EqRNgYWte0QlEM5gT+
         FNBy75L2ZIHAND6N49EqrhiY9dJyxk7lBzkhX1WcK6f/z/XFb82GwpOUidBSgUHzGMjr
         ebQ8qVauYfUqBRDiDTGeHtAj7MQFLl/QZW5qlMegZaqGXdL04SidzZtZ22ANofGa31ue
         1XQ/OXexmgnyMsP00Z+LJlMwL30BoHHBFcovDe8Id0MVeiOBqgw3rV5p4piPccoCkPNL
         j7Fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id g5si343706lfj.3.2021.07.21.08.29.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Jul 2021 08:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 16LFT77G006584
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jul 2021 17:29:07 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16LFT75j016152;
	Wed, 21 Jul 2021 17:29:07 +0200
Subject: Re: custom non-root linux cell doesn't boot on rpi4 board
To: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CAMPOHC=t3oRS=EU+9PoLY--R_8d4V3nhGH0DaEUgJy0AF0U7dg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c4e3071d-cef7-fdec-10f0-255af63ead2e@siemens.com>
Date: Wed, 21 Jul 2021 17:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMPOHC=t3oRS=EU+9PoLY--R_8d4V3nhGH0DaEUgJy0AF0U7dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 01.07.21 10:49, Nikoleta Markela Iliakopoulou wrote:
> Dear all,=C2=A0
>=20
> I have jailhouse running on my rpi4 board (jailhouse-enabling/5.4-rpi
> kernel) and I want to boot a non-root linux cell. At first I tried with

Switch to jailhouse-enabling/5.10 - 5.4-rpi is dead, and 5.10 now nicely
works via upstream on the RPi4.

> the vmlinuz (5.10.31 )and the rootfs.cpio file produced with
> jailhouse-images ( I attach the config-5.10.31 , default-rootfs-config
> files ) and they seem to run fine. I wanted to customize my rootfs and
> put more packages, so I modified the config file and built it again with
> buildroot-2021.02.3. My rootfs.cpio file is about 210M (I attach the
> custom-config file ), so I tried to modify the memory reservations=C2=A0i=
n
> the necessary files (jailhouse.dts , rpi4-linux-demo.c ).
>=20
> *_rpi4-linux-demo.c
> _*
> /*
> =C2=A0* Jailhouse, a Linux-based partitioning hypervisor
> =C2=A0*
> =C2=A0* Configuration for linux-demo inmate on Raspberry Pi 4:
> =C2=A0* 2 CPUs, 128M RAM, serial port=C2=A0 =C2=A0 =C2=A0 // I just doubl=
ed it=C2=A0
> =C2=A0*
> =C2=A0* Copyright (c) Siemens AG, 2014-2020
> =C2=A0*
> =C2=A0* Authors:
> =C2=A0* =C2=A0Jan Kiszka <jan.kiszka@siemens.com <mailto:jan.kiszka@sieme=
ns.com>>
> =C2=A0*
> =C2=A0* This work is licensed under the terms of the GNU GPL, version 2.=
=C2=A0 See
> =C2=A0* the COPYING file in the top-level directory.
> =C2=A0*/
>=20
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>=20
> struct {
> struct jailhouse_cell_desc cell;
> __u64 cpus[1];
> struct jailhouse_memory mem_regions[13];
> struct jailhouse_irqchip irqchips[2];
> struct jailhouse_pci_device pci_devices[2];
> } __attribute__((packed)) config =3D {
> .cell =3D {
> .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> .revision =3D JAILHOUSE_CONFIG_REVISION,
> .name =3D "rpi4-linux-demo",
> .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG |
> JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>=20
> .cpu_set_size =3D sizeof(config.cpus),
> .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> .num_irqchips =3D ARRAY_SIZE(config.irqchips),
> .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
>=20
> .vpci_irq_base =3D 185-32,
>=20
> .console =3D {
> .address =3D 0xfe215040,
> .type =3D JAILHOUSE_CON_TYPE_8250,
> .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> JAILHOUSE_CON_REGDIST_4,
> },
> },
>=20
> .cpus =3D {
> 0b1100,
> },
>=20
> .mem_regions =3D {
> /* IVSHMEM shared memory regions (demo) */
> {
> .phys_start =3D 0x2faf0000,
> .virt_start =3D 0x2faf0000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x2faf1000,
> .virt_start =3D 0x2faf1000,
> .size =3D 0x9000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x2fafa000,
> .virt_start =3D 0x2fafa000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x2fafc000,
> .virt_start =3D 0x2fafc000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x2fafe000,
> .virt_start =3D 0x2fafe000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> /* IVSHMEM shared memory region */
> JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
> /* UART */ {
> .phys_start =3D 0xfe215040,
> .virt_start =3D 0xfe215040,
> .size =3D 0x40,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
> JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
> },
> /* RAM */ {
> .phys_start =3D 0x2f900000,
> .virt_start =3D 0,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> },
> /* RAM */ {
> .phys_start =3D 0x18000000,
> .virt_start =3D 0x18000000,
> .size =3D 0x10000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> JAILHOUSE_MEM_LOADABLE,
> },
> /* communication region */ {
> .virt_start =3D 0x80000000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_COMM_REGION,
> },
> },
>=20
> .irqchips =3D {
> /* GIC */ {
> .address =3D 0xff841000,
> .pin_base =3D 32,
> .pin_bitmap =3D {
> 0,
> 0,
> 1 << (125 - 96),
> 0,
> },
> },
> /* GIC */ {
> .address =3D 0xff841000,
> .pin_base =3D 160,
> .pin_bitmap =3D {
> (1 << (185 - 160)) | (1 << (186 - 160)),
> 0,
> 0,
> 0
> },
> },
> },
>=20
> .pci_devices =3D {
> { /* IVSHMEM 00:00.0 (demo) */
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .domain =3D 1,
> .bdf =3D 0 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> .shmem_regions_start =3D 0,
> .shmem_dev_id =3D 2,
> .shmem_peers =3D 3,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> },
> { /* IVSHMEM 00:01.0 (networking) */
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .bdf =3D 1 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> .shmem_regions_start =3D 5,
> .shmem_dev_id =3D 1,
> .shmem_peers =3D 2,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> },
> },
> };
>=20
> *_jailhouse.dts
> _*
> /dts-v1/;
> /plugin/;
> / {
> compatible =3D "brcm,bcm2835";
>=20
> fragment@0 {
> target-path =3D "/";
> __overlay__ {
> reserved-memory {
> #address-cells =3D <2>;
> #size-cells =3D <1>;
> ranges;
>=20
> jailhouse@18000000 {
> reg =3D <0 0x18000000 0x18000000>;
> no-map;
> };
> };
> };
> };
>=20
> fragment@1 {
> target =3D <&pcie0>;
> __overlay__ {
> linux,pci-domain =3D <0x00000000>;
> };
> };
> };
>=20
> I adjusted them to be paged aligned. There seems no crashing as the cell
> starts, but the linux doesn't boot at all. I tried again with the
> modifications in memory and the old rootfs.cpio file , as well as with
> the vmlinuz only and they run fine, so I guess there is a problem with
> my new custom rootfs.cpio=C2=A0
>=20
> I'd be grateful if you provided me with some further guidance.
>=20

Debugging this can be tedious as you likely already saw. The general
recommendation for starters therefore is to derive from the reference
image (jailhouse-images) and configuration (this is likely what you did
already), and then slowly adjust what you would like to do differently.

So, do you have a diff between your setting and jailhouse-images? The
above is not quickly to grasp and to manually diff for me.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c4e3071d-cef7-fdec-10f0-255af63ead2e%40siemens.com.
