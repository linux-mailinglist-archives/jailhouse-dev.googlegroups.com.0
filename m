Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2NKX3ZAKGQE3NYF2EA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F659167594
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Feb 2020 09:31:38 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id b19sf403617lfb.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Feb 2020 00:31:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582273897; cv=pass;
        d=google.com; s=arc-20160816;
        b=j+1sYfWKqQj/RKiKWdXFTpm/Avd+j63ePmLrcAzPWXbUG4UVNdNWSKzUmvYOLCyOf0
         tWSGpu76K0LnrilXcR6ZJjUlfmxdGQ8d4Ly5u7VbNByhPz21XxZijXAociKU/LrHSIgF
         v/LoAkxo+Bv5aPGFgfPr8GzjVCTHuB13Tq8Z4W9lTNTVQcxPL1cRVdfuc0l0Qif2j+YD
         OASU/tSBPPHNRzgBeLI1tlXUneln0O3RotpzRyyVx2PmKD6j+UPT2vq3DSTFO+EwsvP+
         JAaq4nYcw+PRAVd/xQ+sfLAn1Jbtop62xEAdZKnB4tFY31vAL/Nv822w6Oy5iTZnr6NN
         w/hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=iRY+2UzGhVVeQiNr/4vbaQW5E4V0p9r7zu2WMAYAd6E=;
        b=OgtWDNOTCKhWckkay+o7ZxWx7sW5PjUcMuOTMrftN3tMQyMGyMDTr8Ky2nBUKugKnL
         etSTYUBagNdFBF3fjhjmyspTBfKZNicol64OOwS07s2hUlvIFYBszdcRCfU43St8PEwK
         RXMkuvc3staoMOadY23BSHR6xrAU7kHzX0albpn4nrZc/zX8WDybgJztPTZAciGuZ2NW
         a9uR3jDCgm4NzFyPnkfMZYD62KzcTeDF9CpiLRwgvvLFy17wTLmOyLVd4Ysc72yQyE+0
         bqO0AJWB+SWyt2L0GELlTvl6YiGMNQ+t2rvVwOaF2YwwuDoaj0x8ZeNYcDRRhoyvMwS0
         FdaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iRY+2UzGhVVeQiNr/4vbaQW5E4V0p9r7zu2WMAYAd6E=;
        b=ktHmoyCziCXc0Tag9GauAONOXSpgLIrl2WVaf8iln/cRciIBCxQGSo89XANnaQhI5y
         exW+2uxxSYZ8wPMINYjTpUyvQbQaSWS1T6Yg3kg9iJFJT1aUU8E44QWJJPlhT5hRSNEZ
         oQUZuwHZlzo8nSBAahwhfFwWewenq6uaRIv9iXzL6gKn+Q2RiuZrWAO32qCaLL93uwAZ
         XqJ4a2BBzU/ZfJESTboHpoqiQt89env6GJsgG7dnD5cy/2TObSmWK8+5y23amv04YOqU
         rPD6yrnCkv0vgk9yiFmqxN6QVi1+cJinkt7l9PtQiQZ2/8n4si/6CzbqfFt3XbtpdlfH
         raow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iRY+2UzGhVVeQiNr/4vbaQW5E4V0p9r7zu2WMAYAd6E=;
        b=nE3J+aLSZOGNDV1xiHHZ+5nzQxv6lr247PXMs364fwmfx5VWbeo6h9IvS1CB0x8cJm
         Z13iH/wTk2CunZ4slULOEx23zw6Llb+7va30P7krIB1rpcnvQHthtowKShFpY7rLMf3F
         8zCqYPsJxRAQGu8p+R6kb+HQubrKBKLvp6oSRxZhaaaliZH0OzVaKVvEQzR+EifmBZJd
         W/5Pc35cKqpGtg5phCNw1UWTHLd9QbqQMTW0bRS7v3PiECI4aNgNLSlGiKvLkDqVv6KK
         QNKls97XNXkywdWNnb2SuQ3S5d/lgSD6UsJxmUBDK2+wg4CPeQXgIpUt6NnZ32XYvAIY
         kg3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUfRAKv2ZgqqqXiMno9WWhAFbO7Qe7D59BqeYNdCnNPjCiXTRHF
	kKpoqQkO1KhP/Z6M+pnQ6lg=
X-Google-Smtp-Source: APXvYqwEOLBKJYy/YO7dJjARKcyLWVlKar0k92K5mpCXecXd2FKZ+ZturbSvNAteLqHZrE0JCKn+CQ==
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr19197508lfo.36.1582273897619;
        Fri, 21 Feb 2020 00:31:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5d9:: with SMTP id g25ls197011ljn.9.gmail; Fri, 21 Feb
 2020 00:31:36 -0800 (PST)
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr22251546ljc.39.1582273896572;
        Fri, 21 Feb 2020 00:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582273896; cv=none;
        d=google.com; s=arc-20160816;
        b=kkwOBggp95WAuiYkAWfwMm2fFpsFsEmzVL/UV8VF1nHJTozPGGwI1bRGUo1qnU5LrH
         SFZT86YVZSUqz37mE76xzFxw06ZQqdEJebuMwB0l7ryn9+eG8DlBihNPGiBOeUTcCZWU
         x1CX1Z6VtE6+0fxdgTm508p/xzSQNBAYwLVxREdgobTfGep7LLd+B8320hCug4FkJakd
         rSGZUAP7b6rdp8qb4xxTwQ9BVxYV/fi+zxfTXeOMDu+Ke6pmDc3nAhZCCJKIwlws/8FW
         kAHorNcW+5gXYyKD1kS3xmHUr550JRndlEU/nlv6A7j0stjYNKi7CNKaJf4pDLU45PmY
         jhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=BrJ1KJ6aJw094evkwxaFlGe8wC4SMF1zqirc+sgfh/k=;
        b=rnqRdUtjR9urIY5nh6soR75Ila6sCNxHrv6bjejcsD3TS4TYeN3/2/vgQzkMTPGzdQ
         N6c08C5Wdh7e2g+ehThoPbWdc7Zh8v/Sd2hPnkvWeZM72JWOJQOsWtOre/1WYRxb/Lug
         D7wqNAcV+pdRUFFwfaXBkPhRItFoyirthzRJPVA4Jl3QY8NlP0krIvZjld9gPtMwxshL
         zlwFRCQfdso66rTDMqU+Y6OcS8gq3/8snmN/Ucx/lfD1CZuoSYxGtGaoLCg5f37q7PIL
         3YVTS5ZJhrM84JdxM8hPoxOo5zTU9u6qpFNMq6Y9l+jgy5t4niO1ItRHBQWVbBAZC7pc
         a/RQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h8si109996ljj.3.2020.02.21.00.31.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2020 00:31:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01L8VZmt017792
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2020 09:31:35 +0100
Received: from [167.87.145.172] ([167.87.145.172])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01L8VXP0002411;
	Fri, 21 Feb 2020 09:31:34 +0100
Subject: Re: Linux non-rootcell with IVSHMEM
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3ecaaaf1-4787-bd02-c272-590eb1d30a08@siemens.com>
Date: Fri, 21 Feb 2020 09:31:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f7fabeb5-5a7e-a886-03ec-417733aa985c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 21.02.20 08:48, Philipp Rosenberger wrote:
> Hi,
> 
> I'm trying to get a non-rootcell with IVSHMEM running. I used the qemu
> configuration as example to copy from. When I start the non-rootcell I
> don't get any errors but the Linux inside the cell dosen't start either.
> 
> This is my rootcell configuration:
>> /*
>>   * created with '/usr/local/libexec/jailhouse/jailhouse config create asdf.c'
>>   *
>>   * NOTE: This config expects the following to be appended to your kernel cmdline
>>   *       "memmap=0x70000000$0x100000000"
>>   */
>>
>> #include <jailhouse/types.h>
>> #include <jailhouse/cell-config.h>
>>
>> struct {
>> 	struct jailhouse_system header;
>> 	__u64 cpus[1];
>> 	struct jailhouse_memory mem_regions[60];
>> 	struct jailhouse_irqchip irqchips[1];
>> 	struct jailhouse_pio pio_regions[6];
>> 	struct jailhouse_pci_device pci_devices[17];
>> 	struct jailhouse_pci_capability pci_caps[35];
>> } __attribute__((packed)) config = {
>> 	.header = {
>> 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>> 		.revision = JAILHOUSE_CONFIG_REVISION,
>> 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
>> 		.hypervisor_memory = {
>> 			.phys_start = 0x100000000,
>> 			.size = 0x600000,
>> 		},
>> 		.debug_console = {
>> 			.address = 0x3f8,
>> 			.type = JAILHOUSE_CON_TYPE_8250,
>> 			.flags = JAILHOUSE_CON_ACCESS_PIO |
>> 				 JAILHOUSE_CON_REGDIST_1,
>> 		},
>> 		.platform_info = {
>> 			.pci_mmconfig_base = 0xe0000000,
>> 			.pci_mmconfig_end_bus = 0xff,
>> 			.x86 = {
>> 				.pm_timer_address = 0x1808,
>> 				.vtd_interrupt_limit = 256,
>> 				.iommu_units = {
>> 					{
>> 						.type = JAILHOUSE_IOMMU_INTEL,
>> 						.base = 0xfed90000,
>> 						.size = 0x1000,
>> 					},
>> 					{
>> 						.type = JAILHOUSE_IOMMU_INTEL,
>> 						.base = 0xfed91000,
>> 						.size = 0x1000,
>> 					},
>> 				},
>> 			},
>> 		},
>> 		.root_cell = {
>> 			.name = "RootCell",
>> 			.cpu_set_size = sizeof(config.cpus),
>> 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> 			.num_irqchips = ARRAY_SIZE(config.irqchips),
>> 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
>> 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> 			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
>> 		},
>> 	},
>>
>> 	.cpus = {
>> 		0x000000000000000f,
>> 	},
>>
>> 	.mem_regions = {
>> 		/* IVSHMEM shared memory region (virtio-blk back-end) */
>> 		{
>> 			.phys_start = 0x100600000,
>> 			.virt_start = 0x100600000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ,
>> 		},
>> 		{
>> 			.phys_start = 0x100601000,
>> 			.virt_start = 0x100601000,
>> 			.size = 0xdf000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		{ 0 },
>> 		{ 0 },
>> 		/* IVSHMEM shared memory region (virtio-con back-end) */
>> 		{
>> 			.phys_start = 0x1006e0000,
>> 			.virt_start = 0x1006e0000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ,
>> 		},
>> 		{
>> 			.phys_start = 0x1006e1000,
>> 			.virt_start = 0x1006e1000,
>> 			.size = 0xf000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		{ 0 },
>> 		{ 0 },
>> 		/* IVSHMEM shared memory regions (demo) */
>> 		{
>> 			.phys_start = 0x1006f0000,
>> 			.virt_start = 0x1006f0000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006f1000,
>> 			.virt_start = 0x1006f1000,
>> 			.size = 0x9000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006fa000,
>> 			.virt_start = 0x1006fa000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006fc000,
>> 			.virt_start = 0x1006fc000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006fe000,
>> 			.virt_start = 0x1006fe000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		/* IVSHMEM shared memory regions (networking) */
>> 		JAILHOUSE_SHMEM_NET_REGIONS(0x100700000, 0),
>> 		/* MemRegion: 00000000-0009dbff : System RAM */
>> 		{
>> 			.phys_start = 0x0,
>> 			.virt_start = 0x0,
>> 			.size = 0x9e000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 00100000-445fffff : System RAM */
>> 		{
>> 			.phys_start = 0x100000,
>> 			.virt_start = 0x100000,
>> 			.size = 0x44500000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 44600000-45ffffff : Kernel */
>> 		{
>> 			.phys_start = 0x44600000,
>> 			.virt_start = 0x44600000,
>> 			.size = 0x1a00000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 46000000-87d9ffff : System RAM */
>> 		{
>> 			.phys_start = 0x46000000,
>> 			.virt_start = 0x46000000,
>> 			.size = 0x41da0000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 87da0000-87da0fff : ACPI Non-volatile Storage */
>> 		{
>> 			.phys_start = 0x87da0000,
>> 			.virt_start = 0x87da0000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: 87dcb000-8c4f8fff : System RAM */
>> 		{
>> 			.phys_start = 0x87dcb000,
>> 			.virt_start = 0x87dcb000,
>> 			.size = 0x472e000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 8c56f000-8c5a3fff : ACPI Tables */
>> 		{
>> 			.phys_start = 0x8c56f000,
>> 			.virt_start = 0x8c56f000,
>> 			.size = 0x35000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: 8c5a4000-8ce96fff : ACPI Non-volatile Storage */
>> 		{
>> 			.phys_start = 0x8c5a4000,
>> 			.virt_start = 0x8c5a4000,
>> 			.size = 0x8f3000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: 8d2ff000-8d2fffff : System RAM */
>> 		{
>> 			.phys_start = 0x8d2ff000,
>> 			.virt_start = 0x8d2ff000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 8d400000-8dffffff : RAM buffer */
>> 		{
>> 			.phys_start = 0x8d400000,
>> 			.virt_start = 0x8d400000,
>> 			.size = 0xc00000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: c0000000-cfffffff : 0000:00:02.0 */
>> 		{
>> 			.phys_start = 0xc0000000,
>> 			.virt_start = 0xc0000000,
>> 			.size = 0x10000000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: de000000-deffffff : 0000:00:02.0 */
>> 		{
>> 			.phys_start = 0xde000000,
>> 			.virt_start = 0xde000000,
>> 			.size = 0x1000000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df100000-df11ffff : e1000e */
>> 		{
>> 			.phys_start = 0xdf100000,
>> 			.virt_start = 0xdf100000,
>> 			.size = 0x20000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df120000-df12ffff : ICH HD audio */
>> 		{
>> 			.phys_start = 0xdf120000,
>> 			.virt_start = 0xdf120000,
>> 			.size = 0x10000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df130000-df13ffff : xhci-hcd */
>> 		{
>> 			.phys_start = 0xdf130000,
>> 			.virt_start = 0xdf130000,
>> 			.size = 0x10000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df140000-df143fff : ICH HD audio */
>> 		{
>> 			.phys_start = 0xdf140000,
>> 			.virt_start = 0xdf140000,
>> 			.size = 0x4000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df144000-df147fff : 0000:00:1f.2 */
>> 		{
>> 			.phys_start = 0xdf144000,
>> 			.virt_start = 0xdf144000,
>> 			.size = 0x4000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df148000-df149fff : ahci */
>> 		{
>> 			.phys_start = 0xdf148000,
>> 			.virt_start = 0xdf148000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df14a000-df14a0ff : 0000:00:1f.4 */
>> 		{
>> 			.phys_start = 0xdf14a000,
>> 			.virt_start = 0xdf14a000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df14b000-df14b7ff : ahci */
>> 		{
>> 			.phys_start = 0xdf14b000,
>> 			.virt_start = 0xdf14b000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df14c000-df14c0ff : ahci */
>> 		{
>> 			.phys_start = 0xdf14c000,
>> 			.virt_start = 0xdf14c000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df14d000-df14dfff : 0000:00:14.2 */
>> 		{
>> 			.phys_start = 0xdf14d000,
>> 			.virt_start = 0xdf14d000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df14e000-df14efff : 0000:00:08.0 */
>> 		{
>> 			.phys_start = 0xdf14e000,
>> 			.virt_start = 0xdf14e000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: dffe0000-dfffffff : pnp 00:0a */
>> 		{
>> 			.phys_start = 0xdffe0000,
>> 			.virt_start = 0xdffe0000,
>> 			.size = 0x20000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fd000000-fdabffff : pnp 00:0b */
>> 		{
>> 			.phys_start = 0xfd000000,
>> 			.virt_start = 0xfd000000,
>> 			.size = 0xac0000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fdac0000-fdacffff : pnp 00:0d */
>> 		{
>> 			.phys_start = 0xfdac0000,
>> 			.virt_start = 0xfdac0000,
>> 			.size = 0x10000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fdad0000-fdadffff : pnp 00:0b */
>> 		{
>> 			.phys_start = 0xfdad0000,
>> 			.virt_start = 0xfdad0000,
>> 			.size = 0x10000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fdae0000-fdaeffff : pnp 00:0d */
>> 		{
>> 			.phys_start = 0xfdae0000,
>> 			.virt_start = 0xfdae0000,
>> 			.size = 0x10000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fdaf0000-fdafffff : pnp 00:0d */
>> 		{
>> 			.phys_start = 0xfdaf0000,
>> 			.virt_start = 0xfdaf0000,
>> 			.size = 0x10000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fdc6000c-fdc6000f : iTCO_wdt */
>> 		{
>> 			.phys_start = 0xfdc6000c,
>> 			.virt_start = 0xfdc6000c,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fe036000-fe03bfff : pnp 00:0b */
>> 		{
>> 			.phys_start = 0xfe036000,
>> 			.virt_start = 0xfe036000,
>> 			.size = 0x6000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fe03d000-fe3fffff : pnp 00:0b */
>> 		{
>> 			.phys_start = 0xfe03d000,
>> 			.virt_start = 0xfe03d000,
>> 			.size = 0x3c3000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fe410000-fe7fffff : pnp 00:0b */
>> 		{
>> 			.phys_start = 0xfe410000,
>> 			.virt_start = 0xfe410000,
>> 			.size = 0x3f0000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
>> 		{
>> 			.phys_start = 0xfed00000,
>> 			.virt_start = 0xfed00000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fed10000-fed17fff : pnp 00:0a */
>> 		{
>> 			.phys_start = 0xfed10000,
>> 			.virt_start = 0xfed10000,
>> 			.size = 0x8000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fed18000-fed18fff : pnp 00:0a */
>> 		{
>> 			.phys_start = 0xfed18000,
>> 			.virt_start = 0xfed18000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fed19000-fed19fff : pnp 00:0a */
>> 		{
>> 			.phys_start = 0xfed19000,
>> 			.virt_start = 0xfed19000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fed20000-fed3ffff : pnp 00:0a */
>> 		{
>> 			.phys_start = 0xfed20000,
>> 			.virt_start = 0xfed20000,
>> 			.size = 0x20000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: fed45000-fed8ffff : pnp 00:0a */
>> 		{
>> 			.phys_start = 0xfed45000,
>> 			.virt_start = 0xfed45000,
>> 			.size = 0x4b000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: 000c0000-000dffff : ROMs */
>> 		{
>> 			.phys_start = 0xc0000,
>> 			.virt_start = 0xc0000,
>> 			.size = 0x20000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: 8c51b000-8c53afff : ACPI DMAR RMRR */
>> 		/* PCI device: 00:14.0 */
>> 		{
>> 			.phys_start = 0x8c51b000,
>> 			.virt_start = 0x8c51b000,
>> 			.size = 0x20000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 8d800000-8fffffff : ACPI DMAR RMRR */
>> 		/* PCI device: 00:02.0 */
>> 		{
>> 			.phys_start = 0x8d800000,
>> 			.virt_start = 0x8d800000,
>> 			.size = 0x2800000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
>> 		},
>> 		/* MemRegion: 100600000-1051fffff : JAILHOUSE Inmate Memory */
>> 		{
>> 			.phys_start = 0x100600000,
>> 			.virt_start = 0x100600000,
>> 			.size = 0x4c00000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 	},
>>
>> 	.irqchips = {
>> 		/* IOAPIC 2, GSI base 0 */
>> 		{
>> 			.address = 0xfec00000,
>> 			.id = 0x1f0f8,
>> 			.pin_bitmap = {
>> 				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
>> 			},
>> 		},
>> 	},
>>
>> 	.pio_regions = {
>> 		PIO_RANGE(0x40, 4), /* PIT */
>> 		PIO_RANGE(0x60, 2), /* HACK: NMI status/control */
>> 		PIO_RANGE(0x64, 1), /* I8042 */
>> 		PIO_RANGE(0x70, 2), /* RTC */
>> 		PIO_RANGE(0x3b0, 0x30), /* VGA */
>> 		PIO_RANGE(0xd00, 0xf300), /* HACK: PCI bus */
>> 	},
>>
>> 	.pci_devices = {
>> 		/* PCIDevice: 00:00.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0x0,
>> 			.bar_mask = {
>> 				0x00000000, 0x00000000, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 0,
>> 			.num_caps = 1,
>> 			.num_msi_vectors = 0,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:02.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 0,
>> 			.domain = 0x0,
>> 			.bdf = 0x10,
>> 			.bar_mask = {
>> 				0xff000000, 0xffffffff, 0xf0000000,
>> 				0xffffffff, 0xffffffc0, 0x00000000,
>> 			},
>> 			.caps_start = 1,
>> 			.num_caps = 7,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:08.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0x40,
>> 			.bar_mask = {
>> 				0xfffff000, 0xffffffff, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 8,
>> 			.num_caps = 3,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:14.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xa0,
>> 			.bar_mask = {
>> 				0xffff0000, 0xffffffff, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 11,
>> 			.num_caps = 2,
>> 			.num_msi_vectors = 8,
>> 			.msi_64bits = 1,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:14.2 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xa2,
>> 			.bar_mask = {
>> 				0xfffff000, 0xffffffff, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 13,
>> 			.num_caps = 2,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:17.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xb8,
>> 			.bar_mask = {
>> 				0xffffe000, 0xffffff00, 0xfffffff8,
>> 				0xfffffffc, 0xffffffe0, 0xfffff800,
>> 			},
>> 			.caps_start = 15,
>> 			.num_caps = 3,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1c.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xe0,
>> 			.bar_mask = {
>> 				0x00000000, 0x00000000, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 18,
>> 			.num_caps = 5,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1c.6 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xe6,
>> 			.bar_mask = {
>> 				0x00000000, 0x00000000, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 23,
>> 			.num_caps = 7,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1f.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xf8,
>> 			.bar_mask = {
>> 				0x00000000, 0x00000000, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 0,
>> 			.num_caps = 0,
>> 			.num_msi_vectors = 0,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1f.2 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xfa,
>> 			.bar_mask = {
>> 				0xffffc000, 0x00000000, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 0,
>> 			.num_caps = 0,
>> 			.num_msi_vectors = 0,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1f.3 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xfb,
>> 			.bar_mask = {
>> 				0xffffc000, 0xffffffff, 0x00000000,
>> 				0x00000000, 0xffff0000, 0xffffffff,
>> 			},
>> 			.caps_start = 30,
>> 			.num_caps = 2,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 1,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1f.4 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xfc,
>> 			.bar_mask = {
>> 				0xffffff00, 0xffffffff, 0x00000000,
>> 				0x00000000, 0xffffffe0, 0x00000000,
>> 			},
>> 			.caps_start = 0,
>> 			.num_caps = 0,
>> 			.num_msi_vectors = 0,
>> 			.msi_64bits = 0,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		/* PCIDevice: 00:1f.6 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0xfe,
>> 			.bar_mask = {
>> 				0xfffe0000, 0x00000000, 0x00000000,
>> 				0x00000000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 32,
>> 			.num_caps = 3,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 1,
>> 			.msi_maskable = 0,
>> 			.num_msix_vectors = 0,
>> 			.msix_region_size = 0x0,
>> 			.msix_address = 0x0,
>> 		},
>> 		{ /* IVSHMEM (virtio-blk back-end) */
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0,
>> 			.bdf = 0x0c << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 2,
>> 			.shmem_regions_start = 0,
>> 			.shmem_dev_id = 0,
>> 			.shmem_peers = 2,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
>> 				VIRTIO_DEV_BLOCK,
>> 		},
>> 		{ /* IVSHMEM (virtio-con back-end) */
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0,
>> 			.bdf = 0x0d << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 3,
>> 			.shmem_regions_start = 4,
>> 			.shmem_dev_id = 0,
>> 			.shmem_peers = 2,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
>> 				VIRTIO_DEV_CONSOLE,
>> 		},
>> 		{ /* IVSHMEM (demo) */
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0000,
>> 			.bdf = 0x0e << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 16,
>> 			.shmem_regions_start = 8,
>> 			.shmem_dev_id = 0,
>> 			.shmem_peers = 3,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> 		},
>> 		{ /* IVSHMEM (networking) */
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0000,
>> 			.bdf = 0x0f << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 2,
>> 			.shmem_regions_start = 13,
>> 			.shmem_dev_id = 0,
>> 			.shmem_peers = 2,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> 		},
>> 	},
>>
>> 	.pci_caps = {
>> 		/* PCIDevice: 00:00.0 */
>> 		{
>> 			.id = PCI_CAP_ID_VNDR,
>> 			.start = 0xe0,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 		/* PCIDevice: 00:02.0 */
>> 		{
>> 			.id = PCI_CAP_ID_VNDR,
>> 			.start = 0x40,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_EXP,
>> 			.start = 0x70,
>> 			.len = 0x3c,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0xac,
>> 			.len = 0xa,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0xd0,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_PASID | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x100,
>> 			.len = 0x8,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_ATS | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x200,
>> 			.len = 0x4,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_PRI | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x300,
>> 			.len = 0x4,
>> 			.flags = 0,
>> 		},
>> 		/* PCIDevice: 00:08.0 */
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x90,
>> 			.len = 0xa,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0xdc,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_AF,
>> 			.start = 0xf0,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 		/* PCIDevice: 00:14.0 */
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0x70,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x80,
>> 			.len = 0xe,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		/* PCIDevice: 00:14.2 */
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0x50,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x80,
>> 			.len = 0xa,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		/* PCIDevice: 00:17.0 */
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x80,
>> 			.len = 0xa,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0x70,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_SATA,
>> 			.start = 0xa8,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 		/* PCIDevice: 00:1c.0 */
>> 		{
>> 			.id = PCI_CAP_ID_EXP,
>> 			.start = 0x40,
>> 			.len = 0x3c,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x80,
>> 			.len = 0xa,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_SSVID,
>> 			.start = 0x90,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0xa0,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x100,
>> 			.len = 0x4,
>> 			.flags = 0,
>> 		},
>> 		/* PCIDevice: 00:1c.6 */
>> 		{
>> 			.id = PCI_CAP_ID_EXP,
>> 			.start = 0x40,
>> 			.len = 0x3c,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x80,
>> 			.len = 0xa,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_SSVID,
>> 			.start = 0x90,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0xa0,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x100,
>> 			.len = 0x40,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x140,
>> 			.len = 0x8,
>> 			.flags = 0,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x220,
>> 			.len = 0x10,
>> 			.flags = 0,
>> 		},
>> 		/* PCIDevice: 00:1f.3 */
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0x50,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x60,
>> 			.len = 0xe,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		/* PCIDevice: 00:1f.6 */
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0xc8,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0xd0,
>> 			.len = 0xe,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_AF,
>> 			.start = 0xe0,
>> 			.len = 0x2,
>> 			.flags = 0,
>> 		},
>> 	},
>> };
> 
> This is my non-rootcell configuration:
>> #include <jailhouse/types.h>
>> #include <jailhouse/cell-config.h>
>>
>> struct {
>> 	struct jailhouse_cell_desc cell;
>> 	__u64 cpus[1];
>> 	struct jailhouse_memory mem_regions[22];
>> 	struct jailhouse_cache cache_regions[1];
>> 	struct jailhouse_irqchip irqchips[1];
>> 	struct jailhouse_pio pio_regions[5];
>> 	struct jailhouse_pci_device pci_devices[6];
>> 	struct jailhouse_pci_capability pci_caps[13];
>>
>> } __attribute__((packed)) config = {
>> 	.cell = {
>> 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>> 		.revision = JAILHOUSE_CONFIG_REVISION,
>> 		.name = "my-inmate",
>> 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
>> 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
>>
>> 		.cpu_set_size = sizeof(config.cpus),
>> 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
>> 		.num_cache_regions = ARRAY_SIZE(config.cache_regions),
>> 		.num_irqchips = ARRAY_SIZE(config.irqchips),
>> 		.num_pio_regions = ARRAY_SIZE(config.pio_regions),
>> 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
>> 		.num_pci_caps = ARRAY_SIZE(config.pci_caps),
>> 	},
>>
>> 	/* CPU 4 */
>> 	.cpus = {
>> 		0x8,
>> 	},
>>
>> 	.mem_regions = {
>> 		/* IVSHMEM shared memory region (virtio-blk front) */
>> 		{
>> 			.phys_start = 0x100600000,
>> 			.virt_start = 0x100600000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x100601000,
>> 			.virt_start = 0x100601000,
>> 			.size = 0xdf000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{ 0 },
>> 		{ 0 },
>> 		/* IVSHMEM shared memory region (virtio-con front) */
>> 		{
>> 			.phys_start = 0x1006e0000,
>> 			.virt_start = 0x1006e0000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006e1000,
>> 			.virt_start = 0x1006e1000,
>> 			.size = 0xf000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{ 0 },
>> 		{ 0 },
>> 		/* IVSHMEM shared memory regions (demo) */
>> 		{
>> 			.phys_start = 0x1006f0000,
>> 			.virt_start = 0x1006f0000,
>> 			.size = 0x1000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006f1000,
>> 			.virt_start = 0x1006f1000,
>> 			.size = 0x9000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006fa000,
>> 			.virt_start = 0x1006fa000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006fc000,
>> 			.virt_start = 0x1006fc000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		{
>> 			.phys_start = 0x1006fe000,
>> 			.virt_start = 0x1006fe000,
>> 			.size = 0x2000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_ROOTSHARED,
>> 		},
>> 		/* IVSHMEM shared memory regions (networking) */
>> 		JAILHOUSE_SHMEM_NET_REGIONS(0x100700000, 1),
>> 		/* low RAM: 1 MiB */ {
>> 			.phys_start = 0x100700000,
>> 			.virt_start = 0,
>> 			.size = 0x00100000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> 				JAILHOUSE_MEM_LOADABLE,
>> 		},
>> 		/* communication region */
>> 		{
>>                          .virt_start = 0x00100000,
>>                          .size = 0x00001000,
>>                          .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>                                  JAILHOUSE_MEM_COMM_REGION,
>>                  },
>> 		/* high RAM: 249 MiB */ {
>> 			.phys_start = 0x100800000,
>> 			.virt_start = 0x00200000,
>> 			.size = 0xf900000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>> 				JAILHOUSE_MEM_LOADABLE,
>> 		},
>> 		/* MemRegion: df000000-df01ffff : 02:00.0/igb */
>> 		{
>> 			.phys_start = 0xdf000000,
>> 			.virt_start = 0xdf000000,
>> 			.size = 0x20000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 		/* MemRegion: df021000-df023fff : 02:00.0/igb */
>> 		{
>> 			.phys_start = 0xdf021000,
>> 			.virt_start = 0xdf021000,
>> 			.size = 0x3000,
>> 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>> 		},
>> 	},
>>
>> 	.cache_regions = {
>> 		{
>> 			.start = 0,
>> 			.size = 2,
>> 			.type = JAILHOUSE_CACHE_L3,
>> 		},
>> 	},
>>
>> 	.irqchips = {
>> 		/* IOAPIC 2, GSI base 0 */
>> 		{
>> 			.address = 0xfec00000,
>> 			.id = 0x1f0f8,
>> 			.pin_bitmap = {
>> 				(1 << 4),
>> 			},
>> 		},
>> 	},
>>
>> 	.pio_regions = {
>> 		PIO_RANGE(0x4e, 4),
>> 		PIO_RANGE(0x2e, 4),
>> 		PIO_RANGE(0x70, 2), /* RTC */
>> 		PIO_RANGE(0x110, 8),
>> 		/* Serial device: ttyS0 with IRQ 4 (see above) */
>> 		PIO_RANGE(0x3f8, 8),
>> 	},
>>
>> 	.pci_devices = {
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0,
>> 			.bdf = 0x0c << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 2,
>> 			.shmem_regions_start = 0,
>> 			.shmem_dev_id = 1,
>> 			.shmem_peers = 2,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
>> 				VIRTIO_DEV_BLOCK,
>> 		},
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0,
>> 			.bdf = 0x0d << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 3,
>> 			.shmem_regions_start = 4,
>> 			.shmem_dev_id = 1,
>> 			.shmem_peers = 2,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
>> 				VIRTIO_DEV_CONSOLE,
>> 		},
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0,
>> 			.bdf = 0x0e << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 16,
>> 			.shmem_regions_start = 8,
>> 			.shmem_dev_id = 2,
>> 			.shmem_peers = 3,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
>> 		},
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> 			.domain = 0x0,
>> 			.bdf = 0x0f << 3,
>> 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
>> 			.num_msix_vectors = 2,
>> 			.shmem_regions_start = 13,
>> 			.shmem_dev_id = 1,
>> 			.shmem_peers = 2,
>> 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
>> 		},
>> 		/* PCIDevice: igb/02:00.0 */
>> 		{
>> 			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>> 			.iommu = 1,
>> 			.domain = 0x0,
>> 			.bdf = 0x200,
>> 			.bar_mask = {
>> 				0xfffe0000, 0x00000000, 0x00000000,
>> 				0xffffc000, 0x00000000, 0x00000000,
>> 			},
>> 			.caps_start = 0,
>> 			.num_caps = 6,
>> 			.num_msi_vectors = 1,
>> 			.msi_64bits = 1,
>> 			.msi_maskable = 1,
>> 			.num_msix_vectors = 5,
>> 			.msix_region_size = 0x1000,
>> 			.msix_address = 0xdf020000,
>> 		},
>> 	},
>> 	.pci_caps = {
>> 		/* PCIDevice: igb/02:00.0 */
>> 		{
>> 			.id = PCI_CAP_ID_PM,
>> 			.start = 0x40,
>> 			.len = 0x8,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSI,
>> 			.start = 0x50,
>> 			.len = 0x18,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_MSIX,
>> 			.start = 0x70,
>> 			.len = 0xc,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_CAP_ID_EXP,
>> 			.start = 0xa0,
>> 			.len = 0x3c,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x100,
>> 			.len = 0x40,
>> 			.flags = JAILHOUSE_PCICAPS_WRITE,
>> 		},
>> 		{
>> 			.id = PCI_EXT_CAP_ID_TPH | JAILHOUSE_PCI_EXT_CAP,
>> 			.start = 0x1a0,
>> 			.len = 0x4,
>> 			.flags = 0,
>> 		},
>> 	},
>> };
> 
> I start the non-rootcell with the following command:
> jailhouse cell linux configs/x86/inmate.cell ~/nfs/bzImage -c
> "console=ttyS0,115200 8250_core.skip_old_serial_uarts=0xE
> earlyprintk=ttyS0,115200 ip=dhcp root=/dev/nfs rw
> nfsroot=10.23.2.107:/home/ilu/projects/autojailhouse/rfs,v3"
> 
> Here is the log from the hypervisor:
>> Adding virtual PCI device 00:0c.0 to cell "my-inmate"
>> Shared memory connection established, peer cells:
>>   "RootCell"
>> Adding virtual PCI device 00:0d.0 to cell "my-inmate"
>> Shared memory connection established, peer cells:
>>   "RootCell"
>> Adding virtual PCI device 00:0e.0 to cell "my-inmate"
>> Shared memory connection established, peer cells:
>>   "RootCell"
>> Adding virtual PCI device 00:0f.0 to cell "my-inmate"
>> Shared memory connection established, peer cells:
>>   "RootCell"
>> Adding PCI device 02:00.0 to cell "my-inmate"
>> Reserving 5 interrupt(s) for device 02:00.0 at index 136
>> Removing PCI device 00:00.0 from cell "RootCell"
>> Adding PCI device 00:00.0 to cell "my-inmate"
>> Created cell "my-inmate"
>> Page pool usage after cell creation: mem 377/975, remap 65546/131072
>> Cell "my-inmate" can be loaded
>> CPU 3 received SIPI, vector 100
>> Started cell "my-inmate"
> 
> I get no errors or anything. The cell starts without problems when I
> remove the IVSHMEM parts from the config.
> 
> I use the following kernel:
> http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse
> 
> And the jailhouse from the current master branch
> (5dbdcbc720c94f79913b1c1b966f87d314d333b5)

That kernel contains support for virtio over ivshmem, and you are 
exposing two frontend devices, likely without having the backends 
running. Start with removing those frontends again if you are only 
interested in ivshmem-net or custom ivshmem (via uio etc.). If you want 
to try virtio, make sure the root cell has the backend demos running 
(tools/virtio/ivshmem-*). See also 
https://groups.google.com/d/msgid/jailhouse-dev/cover.1578407802.git.jan.kiszka%40siemens.com.

Jan

> 
> My system:
> Intel(R) Core(TM) i5-6442EQ
> 4GB RAM
> 2 UARTs (ttyS0/ttyS1)
> 
> Best regards,
> Philipp
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3ecaaaf1-4787-bd02-c272-590eb1d30a08%40siemens.com.
