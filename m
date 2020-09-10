Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBHNN5D5AKGQEYE33U7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DF2645AE
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 14:05:50 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id a14sf3943048qtp.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GjCvvATFzqUtNVZn3Ii4/iOPC75BONAaWohh+VZ3xgw=;
        b=Xjd+3vFRTweRhzLajN/N9VUItegl1Ap4uYVUy+CyCX7hfiyxYtF32zagZWLcVLt7dd
         A0KKdifMoaMEjILVfjVSjfqffQk+VNi1t469+m8hqwVlEaAVWycfw7e/+t73I07ThvzL
         pDTzEQDpNxEJSb0lDNaDc2JsboRGAr3AMvhYlgJJ31sGl5VF44IcwkLSfBExLdxj0JLE
         YHVgykU1o+oqRxbKbw1FyxDCEp6inHhPFzYlFxUB7LIT6R4Ms6KYuDNbxBYFDfFAnrMP
         TfW0azibSSLblFaUpDYHuraozVAO4UwYJ6D4accW5be9kWFuXpuSouQxP4uIp+/XC66K
         zNDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GjCvvATFzqUtNVZn3Ii4/iOPC75BONAaWohh+VZ3xgw=;
        b=mtNqZqYfOaxY7vPx6rJYvv+ofbFDqYBk9nfVpbEVgpQid2OSsCrvZ9DWTSPcUEguYo
         mcgh0NWRVGjtI5GNZA2i3o/xhzOre+eja/fYDXXUImCSZw8/7Spvc7yjvVK8fOEkMG6H
         Jl6anPd+9WvMGbswHmc1YEY08MdFc1tYnXBmA1CBTKXsqFcrHuTmdgKS4LryTy9X7+b6
         cz4uDew8z2mBBFG9xV0qUpuCvBBsewP4wEJXqq62pdcZ8hexEe13hnyAT6BM4L+2XBLk
         AnXSJdqfB/za3emwSg4NiI+7a9rt3p8W2rWvQsXBirfRwg2vPU4IZUzSF1vfWiqRprzn
         Rarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GjCvvATFzqUtNVZn3Ii4/iOPC75BONAaWohh+VZ3xgw=;
        b=ivduxGo9O2Yz/B0HAYrnCbA9Mdl78CR0SLAAoNJyqNmryGaylOgiZHPeCoX3XmNGGY
         M5R6ceuOojd2vstHeE/yN2VLflDYvIyib3vUbsiwadVZ2RiORfPP6tVTL1sqcmMsGMsg
         vDF+r4BJz24zBphxoIWhLy38qr8Vb6ZlQqN+BiAEHF6McqkYpZKsUy5MP3m89CjPxurV
         hJzE1eEELdHkLPh5sPbcBr4jy6QKFlKnI5kieVnctUz2CKFeluZT9a1oc+col1k4hq7x
         i/+BMZkXSQiGRgHkdiJPicuecGQxle9uoV6D+K13PKhCkuwJurMrtiMwoQuR5u43b2Sx
         gpFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ylJe6fCtDfufW/kAUKpwVUKT0w3n/84EPeSOEdJvHywLzssMr
	ooGIW5Q9ITXW6eYioDBKl1o=
X-Google-Smtp-Source: ABdhPJySG0u7vhQ7/yLP+tVrUB7cHHsjF4MWM3rzeQQp53er6Sg7kjdFNHQex9oSY/NicBvfM7f4AQ==
X-Received: by 2002:ac8:4a84:: with SMTP id l4mr7709099qtq.367.1599739549440;
        Thu, 10 Sep 2020 05:05:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:23c3:: with SMTP id r3ls2395203qtr.11.gmail; Thu, 10 Sep
 2020 05:05:48 -0700 (PDT)
X-Received: by 2002:ac8:1789:: with SMTP id o9mr7166945qtj.351.1599739548742;
        Thu, 10 Sep 2020 05:05:48 -0700 (PDT)
Date: Thu, 10 Sep 2020 05:05:47 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3752cf4d-64e6-4e55-b40d-08800a689f0an@googlegroups.com>
In-Reply-To: <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
 <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
 <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
 <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_326_1567299339.1599739547967"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_326_1567299339.1599739547967
Content-Type: multipart/alternative; 
	boundary="----=_Part_327_1884253149.1599739547967"

------=_Part_327_1884253149.1599739547967
Content-Type: text/plain; charset="UTF-8"

I asked because I didn't get any messages from the serial port "/dev/ttyS0" 
while I'm executing "jailhouse enable ...".

"dmesg | grep ttyS" gives me
dw-apb-uart.0: ttyS0 at MMIO 0x9131e000 (irq = 43, base_baud = 115200) is a 
16550A

My root cell configuration contains this entry for "debug_console":
.debug_console = {
    .address = 0x9131e000,
    .type = JAILHOUSE_CON_TYPE_8250,
    .size = 0x1000,
    .flags = JAILHOUSE_CON_ACCESS_MMIO |
         JAILHOUSE_CON_REGDIST_4,
}
(I've attached the root cell configuration file "q7al.c".)

I've tested the serial port with "minicom" *before* starting "jailhouse".
On a connected Linux-PC with running "minicom" I get the transmitted 
characters.

So it all seems fine.

But I didn't get any message while I'm running "jailhouse enable ..." and 
the system freezes.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3752cf4d-64e6-4e55-b40d-08800a689f0an%40googlegroups.com.

------=_Part_327_1884253149.1599739547967
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I asked because I didn't get any messages from the serial port "/dev/t=
tyS0" while I'm executing "jailhouse enable ...".</div><div><br></div><div>=
<div>"dmesg | grep ttyS" gives me<br><span>dw-apb-uart.0: ttyS0 at MMIO 0x9=
131e000 (irq =3D 43, base_baud =3D 115200) is a 16550A</span></div><div><sp=
an></span></div><div><span><br></span></div>My root cell configuration cont=
ains this entry for "debug_console":</div><div></div><div><span style=3D"fo=
nt-family: Courier New;">.debug_console =3D {<br>&nbsp;&nbsp;&nbsp; .addres=
s =3D 0x9131e000,<br>&nbsp;&nbsp;&nbsp; .type =3D JAILHOUSE_CON_TYPE_8250,<=
br>&nbsp;&nbsp;&nbsp; .size =3D 0x1000,<br>&nbsp;&nbsp;&nbsp; .flags =3D JA=
ILHOUSE_CON_ACCESS_MMIO |<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; JAILHOUSE_CON_REGDIST_4,<br>}<br></span></div><div>(I've attached the ro=
ot cell configuration file "q7al.c".)<br></div><div><br></div><div>I've tes=
ted the serial port with "minicom" <u>before</u> starting "jailhouse".</div=
><div>On a connected Linux-PC with running "minicom" I get the transmitted =
characters.<br></div><br><div class=3D"gmail_quote"><span>So it all seems f=
ine.</span></div><div class=3D"gmail_quote"><span><br></span></div><div cla=
ss=3D"gmail_quote"><span>But I didn't get any message while I'm running "ja=
ilhouse enable ..." and the system freezes.<br></span><div><span><br><br></=
span></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3752cf4d-64e6-4e55-b40d-08800a689f0an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3752cf4d-64e6-4e55-b40d-08800a689f0an%40googlegroups.co=
m</a>.<br />

------=_Part_327_1884253149.1599739547967--

------=_Part_326_1567299339.1599739547967
Content-Type: text/x-csrc; charset=US-ASCII; name=q7al.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=q7al.c
X-Attachment-Id: d7eff4e9-cf95-4382-98b7-e6bad85afc29
Content-ID: <d7eff4e9-cf95-4382-98b7-e6bad85afc29>

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
 * Configuration for Default string Default string
 * created with '/usr/libexec/jailhouse/jailhouse config create q7al.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3a000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[54];
	struct jailhouse_irqchip irqchips[1];
	struct jailhouse_pio pio_regions[11];
	struct jailhouse_pci_device pci_devices[19];
	struct jailhouse_pci_capability pci_caps[39];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3a000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x9131e000,
			.type = JAILHOUSE_CON_TYPE_8250,
			.size = 0x1000,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xe0000000,
			.pci_mmconfig_end_bus = 0xff,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfed64000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfed65000,
					.size = 0x1000,
				},
			},
			.x86 = {
				.pm_timer_address = 0x408,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x0000000000000003,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0003efff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0x3f000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00040000-0009dfff : System RAM */
		{
			.phys_start = 0x40000,
			.virt_start = 0x40000,
			.size = 0x5e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-0fffffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0xff00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 12151000-39ffffff : System RAM */
		{
			.phys_start = 0x12151000,
			.virt_start = 0x12151000,
			.size = 0x27eaf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3f200000-609fffff : System RAM */
		{
			.phys_start = 0x3f200000,
			.virt_start = 0x3f200000,
			.size = 0x21800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 60a00000-62ffffff : Kernel */
		{
			.phys_start = 0x60a00000,
			.virt_start = 0x60a00000,
			.size = 0x2600000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 63000000-7035d017 : System RAM */
		{
			.phys_start = 0x63000000,
			.virt_start = 0x63000000,
			.size = 0xd35e000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7035d018-7036cc57 : System RAM */
		{
			.phys_start = 0x7035d018,
			.virt_start = 0x7035d018,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7036cc58-7036d017 : System RAM */
		{
			.phys_start = 0x7036cc58,
			.virt_start = 0x7036cc58,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7036d018-7037d057 : System RAM */
		{
			.phys_start = 0x7036d018,
			.virt_start = 0x7036d018,
			.size = 0x11000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7037d058-77c7dfff : System RAM */
		{
			.phys_start = 0x7037d058,
			.virt_start = 0x7037d058,
			.size = 0x7901000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79d8d000-79dadfff : System RAM */
		{
			.phys_start = 0x79d8d000,
			.virt_start = 0x79d8d000,
			.size = 0x21000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 79dae000-79e0dfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x79dae000,
			.virt_start = 0x79dae000,
			.size = 0x60000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7a19f000-7a532fff : System RAM */
		{
			.phys_start = 0x7a19f000,
			.virt_start = 0x7a19f000,
			.size = 0x394000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7a533000-7a533fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7a533000,
			.virt_start = 0x7a533000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7a54e000-7aae4fff : System RAM */
		{
			.phys_start = 0x7a54e000,
			.virt_start = 0x7a54e000,
			.size = 0x597000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7aae7000-7affffff : System RAM */
		{
			.phys_start = 0x7aae7000,
			.virt_start = 0x7aae7000,
			.size = 0x519000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 80000000-8fffffff : 0000:00:02.0 */
		{
			.phys_start = 0x80000000,
			.virt_start = 0x80000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 90000000-90ffffff : 0000:00:02.0 */
		{
			.phys_start = 0x90000000,
			.virt_start = 0x90000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91000000-910fffff : ICH HD audio */
		{
			.phys_start = 0x91000000,
			.virt_start = 0x91000000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91100000-9111ffff : igb */
		{
			.phys_start = 0x91100000,
			.virt_start = 0x91100000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91121000-91123fff : igb */
		{
			.phys_start = 0x91121000,
			.virt_start = 0x91121000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91200000-9121ffff : igb */
		{
			.phys_start = 0x91200000,
			.virt_start = 0x91200000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91221000-91223fff : igb */
		{
			.phys_start = 0x91221000,
			.virt_start = 0x91221000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91308070-9130846f : intel_xhci_usb_sw */
		{
			.phys_start = 0x91308070,
			.virt_start = 0x91308070,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91310000-91313fff : ICH HD audio */
		{
			.phys_start = 0x91310000,
			.virt_start = 0x91310000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91314000-91315fff : ahci */
		{
			.phys_start = 0x91314000,
			.virt_start = 0x91314000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91316000-913160ff : 0000:00:1f.1 */
		{
			.phys_start = 0x91316000,
			.virt_start = 0x91316000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91317000-91317fff : 0000:00:1c.0 */
		{
			.phys_start = 0x91317000,
			.virt_start = 0x91317000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91318000-91318fff : mmc1 */
		{
			.phys_start = 0x91318000,
			.virt_start = 0x91318000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91319000-91319fff : 0000:00:1b.0 */
		{
			.phys_start = 0x91319000,
			.virt_start = 0x91319000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131a000-9131afff : mmc0 */
		{
			.phys_start = 0x9131a000,
			.virt_start = 0x9131a000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131b000-9131bfff : 0000:00:19.0 */
		{
			.phys_start = 0x9131b000,
			.virt_start = 0x9131b000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131c000-9131c1ff : pxa2xx-spi.1 lpss_dev */
		{
			.phys_start = 0x9131c000,
			.virt_start = 0x9131c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131c200-9131c2ff : lpss_priv */
		{
			.phys_start = 0x9131c200,
			.virt_start = 0x9131c200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131c800-9131cfff : idma64.1 idma64.1 */
		{
			.phys_start = 0x9131c800,
			.virt_start = 0x9131c800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131d000-9131dfff : 0000:00:18.0 */
		{
			.phys_start = 0x9131d000,
			.virt_start = 0x9131d000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131e000-9131e01f : serial */
		{
			.phys_start = 0x9131e000,
			.virt_start = 0x9131e000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131e200-9131e2ff : lpss_priv */
		{
			.phys_start = 0x9131e200,
			.virt_start = 0x9131e200,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131e800-9131efff : idma64.0 idma64.0 */
		{
			.phys_start = 0x9131e800,
			.virt_start = 0x9131e800,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 9131f000-9131f7ff : ahci */
		{
			.phys_start = 0x9131f000,
			.virt_start = 0x9131f000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91320000-913200ff : ahci */
		{
			.phys_start = 0x91320000,
			.virt_start = 0x91320000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 91323000-91323fff : mei_me */
		{
			.phys_start = 0x91323000,
			.virt_start = 0x91323000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fea00000-feafffff : pnp 00:01 */
		{
			.phys_start = 0xfea00000,
			.virt_start = 0xfea00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed03000-fed03fff : pnp 00:01 */
		{
			.phys_start = 0xfed03000,
			.virt_start = 0xfed03000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed06000-fed06fff : pnp 00:01 */
		{
			.phys_start = 0xfed06000,
			.virt_start = 0xfed06000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed08000-fed09fff : pnp 00:01 */
		{
			.phys_start = 0xfed08000,
			.virt_start = 0xfed08000,
			.size = 0x2000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed1c000-fed1cfff : pnp 00:01 */
		{
			.phys_start = 0xfed1c000,
			.virt_start = 0xfed1c000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed40000-fed44fff : MSFT0101:00 MSFT0101:00 */
		{
			.phys_start = 0xfed40000,
			.virt_start = 0xfed40000,
			.size = 0x5000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed80000-fedbffff : pnp 00:01 */
		{
			.phys_start = 0xfed80000,
			.virt_start = 0xfed80000,
			.size = 0x40000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 79d37000-79d56fff : ACPI DMAR RMRR */
		/* PCI device: 00:15.0 */
		{
			.phys_start = 0x79d37000,
			.virt_start = 0x79d37000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7b800000-7fffffff : ACPI DMAR RMRR */
		/* PCI device: 00:02.0 */
		{
			.phys_start = 0x7b800000,
			.virt_start = 0x7b800000,
			.size = 0x4800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3a600000-3f1fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3a600000,
			.virt_start = 0x3a600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 1, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x1faf8,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0077 : rtc0 */
		PIO_RANGE(0x70, 0x8),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 0400-0403 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x400, 0x4), */
		/* Port I/O: 0404-0405 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x404, 0x2), */
		/* Port I/O: 0408-040b : ACPI PM_TMR */
		/* PIO_RANGE(0x408, 0x4), */
		/* Port I/O: 0420-043f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x420, 0x20), */
		/* Port I/O: 0450-0450 : ACPI PM2_CNT_BLK */
		/* PIO_RANGE(0x450, 0x1), */
		/* Port I/O: 0500-05fe : pnp 00:00 */
		/* PIO_RANGE(0x500, 0xff), */
		/* Port I/O: 0600-061f : pnp 00:00 */
		/* PIO_RANGE(0x600, 0x20), */
		/* Port I/O: 0680-069f : pnp 00:00 */
		/* PIO_RANGE(0x680, 0x20), */
		/* Port I/O: d000-d01f : 0000:05:00.0 */
		PIO_RANGE(0xd000, 0x20),
		/* Port I/O: e000-e01f : 0000:01:00.0 */
		PIO_RANGE(0xe000, 0x20),
		/* Port I/O: f000-f03f : 0000:00:02.0 */
		PIO_RANGE(0xf000, 0x40),
		/* Port I/O: f040-f05f : 0000:00:1f.1 */
		PIO_RANGE(0xf040, 0x20),
		/* Port I/O: f060-f07f : 0000:00:12.0 */
		PIO_RANGE(0xf060, 0x20),
		/* Port I/O: f080-f083 : 0000:00:12.0 */
		PIO_RANGE(0xf080, 0x4),
		/* Port I/O: f090-f097 : 0000:00:12.0 */
		PIO_RANGE(0xf090, 0x8),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
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
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0xff000000, 0xffffffff, 0xf0000000,
				0xffffffff, 0xffffffc0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x70,
			.bar_mask = {
				0xffffc000, 0xffffffff, 0x00000000,
				0x00000000, 0xfff00000, 0xffffffff,
			},
			.caps_start = 7,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x78,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 12,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:12.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x90,
			.bar_mask = {
				0xffffe000, 0xffffff00, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfffff800,
			},
			.caps_start = 15,
			.num_caps = 3,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x98,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x99,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:13.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:15.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xa8,
			.bar_mask = {
				0xffff0000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xc0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:19.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xc8,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xd8,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0xfffff000, 0xffffffff, 0xfffff000,
				0xffffffff, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
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
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf9,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 01:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x100,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0x91220000,
		},
		/* PCIDevice: 05:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x500,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 32,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 1,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0x91120000,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:02.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xac,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xd0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:0e.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x80,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:0f.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x8c,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xa4,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:12.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:13.0 */
		/* PCIDevice: 00:13.1 */
		/* PCIDevice: 00:13.2 */
		/* PCIDevice: 00:13.3 */
		/* PCIDevice: 00:14.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PTM | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x220,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:15.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:18.0 */
		/* PCIDevice: 00:19.0 */
		/* PCIDevice: 00:1b.0 */
		/* PCIDevice: 00:1c.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 01:00.0 */
		/* PCIDevice: 05:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0x18,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0x70,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xa0,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1a0,
			.len = 0x4,
			.flags = 0,
		},
	},
};

------=_Part_326_1567299339.1599739547967--
