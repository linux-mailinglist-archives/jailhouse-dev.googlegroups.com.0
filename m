Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRW7WCEAMGQEMQRYMNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D23E1B6A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Aug 2021 20:36:54 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id z10-20020adfdf8a0000b02901536d17cd63sf2238072wrl.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Aug 2021 11:36:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628188614; cv=pass;
        d=google.com; s=arc-20160816;
        b=phREajDxdeYgQ6YS+U+rRAyrTBPLsBz4BowOmR9b8GtGhUg/X78NJmNq8RCzr6MiYt
         0N6wXv97KTmJF/yAq9Cw8E3oU4A7HzrKb8JcQ0qeUo+B0Bmapilj/cnQKSLoAvjzSwj1
         sV9acSi3ftnhwbzN3r1NireMlvgl2ieVHTH1A1R+SOCSJkt0G8tq4OCSDQryh0ZRLD8T
         whiTGC9OtsyzkRZGXFlTjdqe9eaTgDMA/4A8h/2OcLZnHlPevZcvmawrWIetN2tZR6/D
         e8YwgSXJowprP+buo/A0EDaLkazIF79banSOl/L4QLIZwRxd7FmFgBRkFzFY4sJwgkhL
         WQjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=tPmH4ku9wnJBrqUdBnYloT6ujT+ibByGMaaWecRUpm0=;
        b=usQFbwkAUGgCgTBkCk/Uk/oUkHBMimuQaCfuOJqExxRcTSkmQCe9TMx3ZIUfRiEuKh
         +7vKB3oybepC36NB5KsBhpZv34GWt4mjxUpKMQmto92oZ40OR5xCl4mt6VSemdfjQeb4
         yGid9664A92tu0WzYyVEZTBXTpcXA1q8UQpRctaymK9HvxcICY1VCUfD+oTqfcwyE1Ha
         4oV/aqMYgIa+oBtS/AlEPWczlnw+deb7+fLYXmKmgG8uvvj2f8FDt2ImfEgCPjWD7603
         CW4TlJlNBwZ4ciIQEtmRgmgIPIoM7NTH2ezq+IMhzgvVhyuwrHHTpApVb1fti1L6VsJx
         +8Dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tPmH4ku9wnJBrqUdBnYloT6ujT+ibByGMaaWecRUpm0=;
        b=ABII3Qtrhm0Mc4FG6rlM7sHugP9kpSN++w1he6R8dJblT6ahORTFzd5t8mELcJDi+q
         BcT3Qo3WxnzRU1qw1KCak8WOuXal+MPqct0tGfuk7T1q+socUwwEsraRJv+w97aD5v1S
         xZ9dOwHfgB9riJTubK1RYfk1iBSq4oBg8N1yA98d/G+7Hka37H6XYAkbsHOAE2m6QWBd
         DOdvCprUZO3XYibINugRTxQZTWo4zMtQ6kT4LDu96w9GFqcNohZbhNetMxuYdyjoaPsw
         k3xunAOH3mexrEFhjoCGKZ1MYffGZhEYRzzs52Lzhwnc+sG1mZoreOkCaBG9fH2UxjNz
         /iJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tPmH4ku9wnJBrqUdBnYloT6ujT+ibByGMaaWecRUpm0=;
        b=Fmu3yULeK7FnORkPLAsZU7p0ydEZ6P/Bc7dbzH1eJ7XJ010WJj+1eDLk9ExIqWHTLV
         OnkvuCixrGisLZVnkwagBVZ7rP+42LvW/HIhzai7a1Kp352novzlZqXK7GT+hxGTtM5T
         0XkfMlDnfywad8SR4uaLm8VQSu3x+wjr2XB7fKOadH+sZC3/H9ujUUNVLkjsueVebecT
         0hE76UznmUrAcqKpKbuNDiU9H53jTxNLBQaL5XQwjUyKlFw9phILn0ondoeQVczpR4AN
         DuUQeVTawxjp+4bYRd7fR6M1apKaKrBQ1ZgLkXYnLbJ1UMrhV6xWbqAH2LC3W+IrHc0h
         OhDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Yjz+qOhumJEK5evhT+l9zqAKR7kPkRRapJJUDKWwTl+NXej4C
	xrczvqLwbM4zz2hcu8EQ1rY=
X-Google-Smtp-Source: ABdhPJzpjMLFs3rxK0tpkJd4MIVN8KZNJG+wNdTnAemdDLm7wYZpeTRKQ6rXltpfDqNG2H949jbmHw==
X-Received: by 2002:adf:fa11:: with SMTP id m17mr6808301wrr.150.1628188614513;
        Thu, 05 Aug 2021 11:36:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c7c7:: with SMTP id z7ls964144wmk.3.gmail; Thu, 05 Aug
 2021 11:36:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4f0d:: with SMTP id l13mr6382038wmq.18.1628188613188;
        Thu, 05 Aug 2021 11:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628188613; cv=none;
        d=google.com; s=arc-20160816;
        b=pvHbxy2br/WXcnqsXkxiBxyxVou+FY4xhmDU8Fi9bu+lQeuDLmpri4oY7kHjqYql/1
         SIvDBsQwqUpBHBtjhs2me0baa33eJhHoVJPEKXxBBY/dwDKn7vwY/dty0/yA8C0tet1T
         b86ba7Z77ZtwPNN71CnPaQj2hELr4GOInDC+4IHdD6JuXS5tdVfRCeBLyilayiQ2B1Rn
         j6Y2a8hur2rx0385f5JoXlvc6aZf2XSy1jK5ypidcDKeGpN5DsOZq2eh2SWvf3X86lKh
         KcGq/V2VaUMMLfCfoArbOQ+ATfVicP7FID6OcBcM57mMNkgR7o/i9l82Roa/TS0M63a+
         M7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=/2NVjg7AIGvLITtIhgABJ6S5HMoi2xcuL2l2EsB4xwA=;
        b=MmR5EnR/8aaEdGf+97Ewe304n+5S9qpCDPxGdIhW7GhW7GFsDiBiFTMv6rnzfDnD/F
         e+TGngvRKDc67eqvQIwRYs+nrZuBVeGVLnWsURCLivzIhhddp1s9quKSTsZm9pdQvseF
         YNFIv1ETVy/mFcCJDm1Y6PfJH+7Gbx7rjSnetExVfETXalZfABQyo5PtRIMvovdSoi2I
         UCynE4VMIyPrtSOCa/7BDKrEyVSS8w6kbbFTFMBXz8jDH0427oF5f8jcI4yV1OmYLC+g
         xHWqtvPgpcQ6E5+W0KG1vcFRlnIqVFOYwMZBjVAeeabflY/xg8/FV6pHCBiWIXZ6teX9
         OaDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t18si289305wmi.4.2021.08.05.11.36.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Aug 2021 11:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 175IaqVh005922
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Aug 2021 20:36:52 +0200
Received: from [167.87.32.106] ([167.87.32.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 175IaqTe022651;
	Thu, 5 Aug 2021 20:36:52 +0200
Subject: Re: Qemu setup for testing jailhouse on different machines (amd/intel
 host)
To: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWXMpO2tnXQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7c94b762-9d7c-59a4-a997-da39ad1fd122@siemens.com>
Date: Thu, 5 Aug 2021 20:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CADja47POaMbuona6FYVzgzwuQGawEF5x_ma-xAMYWXMpO2tnXQ@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------AB849A75CAC8FF4AEA6E9085"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

This is a multi-part message in MIME format.
--------------AB849A75CAC8FF4AEA6E9085
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 05.08.21 19:25, Jan-Simon Moeller wrote:
> Hi !
>=20
>=20
> Is it possible to test jailhouse on different host machines (amd/intel)
> using the same qemu-system-x86 cmdline and the same cell configs within
> the qemu vm?
>=20
> I looked at start-qemu.sh.=C2=A0 There is still -cpu host, which might le=
ak
> amd vs intel afaikt into the VM .=C2=A0 In my case we'd care more about t=
he
> reproducability (e.g. dev env or ci) than for speed.
>

Unfortunately, you cannot emulated VT-x and AMD hosts or SVM on Intel
hosts. Thus, there is no way for unifying things into a single qemu
command and CPU model.

So you consequently need to run an AMD CPU model on an AMD host. Didn't
try in a while, but maybe you can inject an Intel IOMMU model into such
a setup, in order to keep the config unified.

If not, you also need to switch to an AMD IOMMU model, thus a separate
config. I've attach an old version of a local qemu-amd config that
likely no longer builds. But it may help creating a description of the
IOMMU that QEMU exposes. Wait: There is also the need to patch QEMU or
Jailhouse to fake/ignore missing SMI blocking feature of the virtual
IOMMU (qemu hack attached).

Finally, AMD hosts are rather undertested with Jailhouse. There is one
CPU quirk remaining regarding xAPIC and resets (search the list
archives) that we never properly worked around. Newer CPUs may no longer
be affected - or expose other issues. Just be warned.

If you really don't care about speed: Maybe - but that I really didn't
test for ages and I think it never worked - you can use an emulated AMD
CPU with its SVM support as unified target, ie. no KVM. But I would
really be surprised if that worked out of the box (via my qemu-amd
config e.g.).

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
jailhouse-dev/7c94b762-9d7c-59a4-a997-da39ad1fd122%40siemens.com.

--------------AB849A75CAC8FF4AEA6E9085
Content-Type: text/x-csrc; charset=UTF-8;
 name="qemu-x86-amd.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="qemu-x86-amd.c"

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for QEMU Standard PC (Q35 + ICH9, 2009)
 * created with '/data/jailhouse/tools/jailhouse config create /data/jailhouse/configs/x86/qemu-x86-amd.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[20];
	struct jailhouse_irqchip irqchips[1];
	__u8 pio_bitmap[0x2000];
	struct jailhouse_pci_device pci_devices[8];
	struct jailhouse_pci_capability pci_caps[19];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x4000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.flags = JAILHOUSE_CON_TYPE_8250 |
				 JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xb0000000,
			.pci_mmconfig_end_bus = 0xff,
			.x86 = {
				.pm_timer_address = 0x608,
				.vtd_interrupt_limit = 256,
				.iommu_units = {
					{
						.base = 0xfed80000,
						.size = 0x4000,
						.amd_bdf = 0x10,
						.amd_base_cap = 0x40,
						.amd_msi_cap = 0x58,
						.amd_features = 0x5,
					},
				},
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.pio_bitmap_size = ARRAY_SIZE(config.pio_bitmap),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000000f,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009fbff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000a0000-000bffff : PCI Bus 0000:00 */
		{
			.phys_start = 0xa0000,
			.virt_start = 0xa0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-00ffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0xf00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 01000000-03ffffff : Kernel */
		{
			.phys_start = 0x1000000,
			.virt_start = 0x1000000,
			.size = 0x3000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 04000000-39ffffff : System RAM */
		{
			.phys_start = 0x4000000,
			.virt_start = 0x4000000,
			.size = 0x36000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* RAM (inmates) */ {
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4b00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-3ffdefff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0xddf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: fd000000-fdffffff : vesafb */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe000000-fe003fff : virtio-pci-modern */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb40000-feb7ffff : 0000:00:03.0 */
		{
			.phys_start = 0xfeb40000,
			.virt_start = 0xfeb40000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb80000-feb9ffff : e1000e */
		{
			.phys_start = 0xfeb80000,
			.virt_start = 0xfeb80000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feba0000-febbffff : e1000e */
		{
			.phys_start = 0xfeba0000,
			.virt_start = 0xfeba0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd1000-febd3fff : e1000e */
		{
			.phys_start = 0xfebd1000,
			.virt_start = 0xfebd1000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd4000-febd7fff : ICH HD audio */
		{
			.phys_start = 0xfebd4000,
			.virt_start = 0xfebd4000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 */
		{
			.phys_start = 0xfebd8000,
			.virt_start = 0xfebd8000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: febd9000-febd9fff : ahci */
		{
			.phys_start = 0xfebd9000,
			.virt_start = 0xfebd9000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed80000-fed83fff : amd_iommu */
		{
			.phys_start = 0xfed80000,
			.virt_start = 0xfed80000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-8ffffffff : PCI Bus 0000:00 */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x800000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_bitmap = {
		[     0/8 ...   0x3f/8] = -1,
		[  0x40/8 ...   0x47/8] = 0xf0, /* PIT */
		[  0x48/8 ...   0x5f/8] = -1,
		[  0x60/8 ...   0x67/8] = 0xec, /* HACK: NMI status/control */
		[  0x68/8 ...   0x6f/8] = -1,
		[  0x70/8 ...   0x77/8] = 0xfc, /* RTC */
		[  0x78/8 ...  0x3af/8] = -1,
		[ 0x3b0/8 ...  0x3df/8] = 0x00, /* VGA */
		[ 0x3e0/8 ...  0xcff/8] = -1,
		[ 0xd00/8 ... 0xffff/8] = 0, /* HACK: PCI bus */
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0xff000000, 0x00000000, 0xfffff000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0xfffe0000, 0xfffe0000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 4,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebd0000,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 10,
			.num_caps = 1,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffe0, 0xfffff000,
			},
			.caps_start = 11,
			.num_caps = 2,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0xffffffc0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xff,
			.bar_mask = {
				0xffffffe0, 0xfffff000, 0x00000000,
				0x00000000, 0xffffc000, 0xffffffff,
			},
			.caps_start = 13,
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xfebda000,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:02.0 */
		{
			.id = 0x5,
			.start = 0x60,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x8,
			.start = 0x5c,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x5,
			.start = 0x58,
			.len = 10,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0xf,
			.start = 0x40,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.id = 0x1,
			.start = 0xc8,
			.len = 8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x5,
			.start = 0xd0,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x10,
			.start = 0xe0,
			.len = 20,
			.flags = 0,
		},
		{
			.id = 0x11,
			.start = 0xa0,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 4,
			.flags = 0,
		},
		{
			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 4,
			.flags = 0,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.id = 0x5,
			.start = 0x60,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = 0x5,
			.start = 0x80,
			.len = 14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x12,
			.start = 0xa8,
			.len = 2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.7 */
		{
			.id = 0x11,
			.start = 0x98,
			.len = 12,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x9,
			.start = 0x84,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x9,
			.start = 0x70,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x9,
			.start = 0x60,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x9,
			.start = 0x50,
			.len = 2,
			.flags = 0,
		},
		{
			.id = 0x9,
			.start = 0x40,
			.len = 2,
			.flags = 0,
		},
	},
};

--------------AB849A75CAC8FF4AEA6E9085
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-amd-iommu-advertise-SMI-blocking-feature.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-amd-iommu-advertise-SMI-blocking-feature.patch"

From f949879614f6a471df774472287b32a557f5eba5 Mon Sep 17 00:00:00 2001
From: Jan Kiszka <jan.kiszka@siemens.com>
Date: Sun, 1 Apr 2018 12:58:51 +0200
Subject: [PATCH] amd iommu: advertise SMI blocking feature

---
 hw/i386/amd_iommu.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 79d38a3e41..75af62e7c1 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -159,6 +159,7 @@
 #define AMDVI_FEATURE_GA                  (1ULL << 7) /* guest VAPIC support */
 #define AMDVI_FEATURE_HE                  (1ULL << 8) /* hardware error regs */
 #define AMDVI_FEATURE_PC                  (1ULL << 9) /* Perf counters       */
+#define AMDVI_FEATURE_SMIFSUP             (1ULL << 16) /* SMI filter support */
 
 /* reserved DTE bits */
 #define AMDVI_DTE_LOWER_QUAD_RESERVED  0x80300000000000fc
@@ -176,7 +177,8 @@
 /* extended feature support */
 #define AMDVI_EXT_FEATURES (AMDVI_FEATURE_PREFETCH | AMDVI_FEATURE_PPR | \
         AMDVI_FEATURE_IA | AMDVI_FEATURE_GT | AMDVI_FEATURE_HE | \
-        AMDVI_GATS_MODE | AMDVI_HATS_MODE | AMDVI_FEATURE_GA)
+        AMDVI_GATS_MODE | AMDVI_HATS_MODE | AMDVI_FEATURE_GA | \
+        AMDVI_FEATURE_SMIFSUP)
 
 /* capabilities header */
 #define AMDVI_CAPAB_FEATURES (AMDVI_CAPAB_FLAT_EXT | \
-- 
2.31.1


--------------AB849A75CAC8FF4AEA6E9085--
