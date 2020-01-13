Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBUES6DYAKGQEBX56RBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A3138BA1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 07:08:16 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id u18sf4522600wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Jan 2020 22:08:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578895696; cv=pass;
        d=google.com; s=arc-20160816;
        b=IGPJeA8rrzyC4uidwyD240oe4NbTScRVxIF24ZGnEmq76eEh98V2ZO7ya0RYY7e6vT
         FVvsI1aIurc3+SLxU3RDeLrWiJ8jSG8BCVpKm9Zq8IcX6mxrXhnMGStrzhBewLDVhg8C
         3FcCeN1f/GYBhosknwA1ZLmwUWP9EGwLtkuZQjTLJko3uSvDV4W+JULrnvMCTe9hn+v3
         fPLsXl12B9Z5sSccntYIXEIrtfsUcuugWmxn4seOcbb/5V8nbnWiualXOKHfftdjYsoP
         tQ6Yid6psF4d+li2vFQd2KR9kCAr414TZUNntm2nZw/Q6KvqleybfCyZAlhYZ4o0ajoS
         uBIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=GGCNKv8xp6JaWHUCLab6blSmtfhnKhpKF1uw0tveBiw=;
        b=Pa3KRdsnaQF72dyidp/57lzhRwudhKn/n8EOyYdeAU2JxwtPIsvwPsRf+/8T5wM4hl
         zgzgBNWf0wundhOcaLG0ItIYElOdfEabFXG/OGyQVG5Lwgxrx6vkxJbsJRHXqRROyQVI
         90Vvu1gSi8lMKoBKlsorLBRYB6rwPb249VGfx4xl5bD3Ks7hvnwUCvRqLKRBplawDBet
         vxN+89PYsSQKYglCYr503zAXnq6LZUQsiHdk5jSgNf4deBZuiZnRV16tb46Xw4CIrM5+
         /O4q/JDLLqQfB/ax9MgP7mVUI5pirckHelCywv+LHOr8hH9gPq9DdslXIwm8RUTf63fS
         xddA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=moDCvNxi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GGCNKv8xp6JaWHUCLab6blSmtfhnKhpKF1uw0tveBiw=;
        b=MBn+7uUMLAsZNylMUQR3Mrsq7pU2GJdwne/sXsBtdm4hWfC/tMeK32X1bw6z3V6YFC
         l2YdawDt+H9Wt09Xyr8svfbuvb4OrtIBvUZfsLdxiItMzz3VQ38Jd3vTPbztk6Si+Yqt
         JLRHVVP8qxtUd5vKzyGBmOdPnrk8oSEBHQWLiq9yauySdUqu1fascIOf2EkZAkfP9mYA
         b3GsmhRHfNY09gKL+H2J55r9+oKCtzRfi1n4qfQKsD6a18SwIltPjUEuz99cvASFO0wP
         8z8kplTNiKd2h2+Cem25r6AjLNjyCEqI4TAlip00b4pPnIShvJJ58YIGjTTJvF1rd/4j
         DJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GGCNKv8xp6JaWHUCLab6blSmtfhnKhpKF1uw0tveBiw=;
        b=ga9YaZzavNuPs8MIKaIsUHsl0oJbhKXl8MFpTuujlUXm25IwZXwiLHneoOy5n95EBH
         l7tY/YWon3C7eWyEv64BimdjxeWBIpa+LWr4FdJ0Ngc4pYKHCzklgltrfM1B2bKdPP3A
         12I6HMWjIyYCS0O9iNWJ6hdBJEP30yiuFjPUFSOeLtF1piwlQXsIXoRHWU/pU/Bwc34Q
         SykNo5UIjcVvYBfBFpEPZwSdFsIq2H5iQenIz+zKBkKKsCE2sE6b4kdRNDJoSfrnNq77
         UYfiYXzjVfP0bClFBxxrCSjk/ST6O6Rng3KACNvu7f27uysgTHCmCP/qFDeih5fJz78p
         tdlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWydaEPfes2u0zSvRvDH3f8TYpqVcbdqynCt57akhckZxtStDOe
	8N+aNK5QKqkTmSGJr57ddqw=
X-Google-Smtp-Source: APXvYqwce3kOnQtPmrL61IqeAF4bfS7K2/Xa9gU4lFcF/BBaLwcM/4ZILEI+0IUGKWNHMk+8G1WLxw==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr18159396wmc.21.1578895696191;
        Sun, 12 Jan 2020 22:08:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3c43:: with SMTP id j64ls5630388wma.5.gmail; Sun, 12 Jan
 2020 22:08:15 -0800 (PST)
X-Received: by 2002:a1c:6707:: with SMTP id b7mr18489219wmc.54.1578895695488;
        Sun, 12 Jan 2020 22:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578895695; cv=none;
        d=google.com; s=arc-20160816;
        b=N9x+Q74tA7Ho/AgFsBQMdZX2PmLrMb6EZTCE9aX76Erd2v5iZI3j7kqoI5sEZdMMWS
         wts25yoWNkow7HPSdHUJCuk3aAsUcQrB20wW4Pt/G1MryAT4YADH6STtIMIGFJezrzoV
         uwBUNLPCA/nAayjGc525bvp+efQBLIzirIrU9+K+NJKtVAsff0OlYqs2Z7mi1eyN+Ebf
         zgPUht7DiPFVrRbXSBmG+x0XNLPdcwP+30SvXfUI/4KzJPMYSgO9WG1AYRcNjSYG3VgV
         kiDIjLbUYZxi4V2TLWwJt7Au+gnAINBNsQehd2oRFd8uvyn22l8WVh6FCmehESLyYnfS
         N5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=uZOkhl7yDS7Bhv9PLL/URz/yi7EVo24lPcYVAXQ4Lcg=;
        b=z8AscPaO3KLfuhpWe4mZhfPKF5H4m7ANXEzIJUserUfJW1V9mfn3zNGJUUiMMLnviw
         Hx0qrErEfT4BcIekle+nGCpXAlqVlkA9WtM1j6IKpZUWaz9dCIuV09iuzx+/BKswOKSw
         fTe+GyNuCzQZcBU2H/jXRP2ollDREsL+ZtySYoA3kE0pwpqBL22NlyKqY38WYSVouU6J
         +71DTsAtiVQeheLYhALuoT0T3btaMNnQ9YaDPwJdsWfEZN++X1xsNviEm/G65Ar5nsei
         CYz2jiGn93p/elYNCx0n5iK6OBhxrpnhyOet2mRpoy4DtK0OFB7tyMwXPnYDRRMRO9dR
         azuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=moDCvNxi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id x5si708761wmk.1.2020.01.12.22.08.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jan 2020 22:08:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LoHP7-1jJu3b2Twf-00gESw; Mon, 13
 Jan 2020 07:08:14 +0100
Subject: Re: [PATCH 1/2] configs/arm64: Add support for pine64-plus board
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
 jailhouse-dev@googlegroups.com
References: <20200111165134.1421-1-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <991592dc-0482-d4cf-47dd-fe198cc78bc3@web.de>
Date: Mon, 13 Jan 2020 07:08:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200111165134.1421-1-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:OSMPDFyUlsq8+SOx8/LQzWqYh3HNOC+fegHYAgE4ivelnO0hQ8x
 /AJjbleWYGuq76nWQ6o3fvr73SqdhZ7ONKHo1BTfXkusf97S2PD7myePnJ/5QaNq3kbCHfr
 9htSijqb7X3VqzAx+TiP4YvCAlppQGxJhRxHnKoWUsNFA4eShh/rRK/pchcq8a29hK76Yej
 ZE0SG+qmjfTZxqvgk8YBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/dLJHFd/tPk=:6WE1mPfMTs8nf41E+ZEjfD
 5tAUcm5QavD2KYNKDaIoDaIlQJkDgbzZ48nW8HhEUZ6BNcOUsWKQFWW/L7440c1KptR3T8zFE
 en6HVQAZdTHyzIEw+zIbdoqCr4JevayKCwEh+WJmP3481+PhV6xF2zeOokOkb0hq3AY+PPlf6
 djDfkoC6HpoD2+RvTUv3BRUZvblI4EgsRYMUuj3tCeqqXJxNtWgKolzRF4DrWsnBaYgF5N8JY
 TlTw9aQcCZdD1mthUliArLKXeoUKL6q7Oa2ObpG3VbbBTBRjBWXIS+vxGRNfCLiJdlFy6qlMp
 YqX4UtYCOG8/O+W/UMUEWLHvUFwkYrareDU+EntI3k704hhrxxU6IclKr10EWLsNGXBcVpJHG
 3yJ86sjtQXDU5bVuS7tsCzxknLoYLdEqx6mPLer+fhSY4T9weEwenO6Q16BplKE4hyfA4VgpP
 9UfJ8w4m6bFfPPaHWS9X1XYUVnqyH5r18PKf8z8AE6zcHJ/4CNKbIiHZedzdYXQ9rP30kdg4p
 vLee1GWhwgp9qvX5kjUBHTuDBQcELzQ5qrY4Nfa6yKIHcEk4fahz2CP6cgV6uNBWdfhn9Ji/M
 WpRBSBETcpA4/gaSGc/utLfZfwOofQUSPF+TefiI+T+K8yquNqgXpEdvegjU8bXQthBTY437S
 Hah5WaVGDRnK2q1NfVgEdO7afpQcyva5ErFJi4K5EhP8PsbLVvf/dJsaV7UuN4Ta6Jo6mGjWz
 IXunY2iuPV4F0qoJhYuvDYcv6ByciZThCqJjUacoegE3/4h7jsz8uNsUPGNZWKocEre1RSYDJ
 qy19E3YKSEe1UvNAs/7NDNYkpjHv0on2csMRRL6VmlaYzhIZl07jml3QMu9qLtPxLGdQu7jxH
 SU2xLNDlHdwbDhX9aosvbKEyfjYGzh/DYOnbDRHSPo8QUvJBHwACJBWiQkDpIDno1fU3vQYL4
 7ZTK8/6KnWMTP8YVWO4MbtyeeeozTGdhK4rTz/Pn97dGYu0GnqIB4jA0+WQWig2yNTweQDnap
 1KlEIwMxkt6krTXCQJcL5KR3WIrCvWcm18xbiVbcjlIwt+SO2SnCExsqgFLxGGsIJWyNbQyWq
 HmYgkwNlI/OxcOol8+6LlU18+2xnNcMar6/cKNsZUZDKtjS0Go0vhiX+I6JysGxTzihqUMe7b
 pqao6uLoEJjVgZPwf4bnbQ2hJyKAhzOjkiMNQjdBbI1pPVVOrUVkm51bcit2zuFRjGkg4Qdji
 avALeNWNKFqaYVLsGbts6YlQDecrtCwdPtXTUNFAiLUXT7wfvymSidea1hM0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=moDCvNxi;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.01.20 17:51, Vijai Kumar K wrote:
> Add config for Pine64+ board.
> https://www.pine64.org/devices/single-board-computers/pine-a64/
>
> Allwinner A64(Quad core A53) + 2GB RAM
>
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   configs/arm64/pine64-plus.c | 339 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 339 insertions(+)
>   create mode 100644 configs/arm64/pine64-plus.c
>
> diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
> new file mode 100644
> index 00000000..9a0730c0
> --- /dev/null
> +++ b/configs/arm64/pine64-plus.c
> @@ -0,0 +1,339 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for Pine64+ board, 2 GB
> + *
> + * Copyright (c) Vijai Kumar K, 2019
> + *
> + * Authors:
> + *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_system header;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[35];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[1];
> +} __attribute__((packed)) config = {
> +	.header = {
> +		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> +		.hypervisor_memory = {
> +			.phys_start = 0xbc000000,
> +			.size =       0x04000000,
> +		},
> +		.debug_console = {
> +			.address = 0x01c28000,
> +			.size = 0x400,
> +			.type = JAILHOUSE_CON_TYPE_PL011,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +		.platform_info = {
> +			.pci_mmconfig_base = 0xfc000000,
> +			.pci_mmconfig_end_bus = 0,
> +			.pci_is_virtual = 1,
> +			.arm = {
> +				.gic_version = 2,
> +				.gicd_base = 0x01c81000,
> +				.gicc_base = 0x01c82000,
> +				.gich_base = 0x01c84000,
> +				.gicv_base = 0x01c86000,
> +				.maintenance_irq = 25,
> +			},
> +		},
> +		.root_cell = {
> +			.name = "Pine64-Plus",
> +
> +			.cpu_set_size = sizeof(config.cpus),
> +			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +			.num_irqchips = ARRAY_SIZE(config.irqchips),
> +
> +			.vpci_irq_base = 108,
> +		},
> +	},
> +
> +	.cpus = {
> +		0xf,
> +	},
> +
> +	.mem_regions = {
> +                /* SRAM */ {
> +                        .phys_start = 0x00018000,
> +                        .virt_start = 0x00018000,
> +                        .size =       0x00028000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_EXECUTE,
> +                },
> +                /* Clock */ {
> +                        .phys_start = 0x01000000,
> +                        .virt_start = 0x01000000,
> +                        .size =       0x00100000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* 1100000.mixer */ {
> +                        .phys_start = 0x01100000,
> +                        .virt_start = 0x01100000,
> +                        .size =       0x00100000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* 1200000.mixer */ {
> +                        .phys_start = 0x01200000,
> +                        .virt_start = 0x01200000,
> +                        .size =       0x00100000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* Syscon */ {
> +                        .phys_start = 0x01c00000,
> +                        .virt_start = 0x01c00000,
> +                        .size =       0x00001000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* DMA */ {
> +                        .phys_start = 0x01c02000,
> +                        .virt_start = 0x01c02000,
> +                        .size =       0x00001000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* LCD1 */ {
> +                        .phys_start = 0x01c0c000,
> +                        .virt_start = 0x01c0c000,
> +                        .size =       0x00001000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* LCD2 */ {
> +                        .phys_start = 0x01c0d000,
> +                        .virt_start = 0x01c0d000,
> +                        .size =       0x00001000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* MMC */ {
> +                        .phys_start = 0x01c0f000,
> +                        .virt_start = 0x01c0f000,
> +                        .size =       0x00001000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* EEPROM */ {
> +                        .phys_start = 0x01c14000,
> +                        .virt_start = 0x01c14000,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c19000,
> +                        .virt_start = 0x01c19000,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c19400,
> +                        .virt_start = 0x01c19400,
> +                        .size =       0x00000014,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c1a000,
> +                        .virt_start = 0x01c1a000,
> +                        .size =       0x00000100,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c1a400,
> +                        .virt_start = 0x01c1a400,
> +                        .size =       0x00000100,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c1a800,
> +                        .virt_start = 0x01c1a800,
> +                        .size =       0x00000100,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c1b000,
> +                        .virt_start = 0x01c1b000,
> +                        .size =       0x00000100,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c1b400,
> +                        .virt_start = 0x01c1b400,
> +                        .size =       0x00000100,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* USB */ {
> +                        .phys_start = 0x01c1b800,
> +                        .virt_start = 0x01c1b800,
> +                        .size =       0x00000004,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* Clock */ {
> +                        .phys_start = 0x01c20000,
> +                        .virt_start = 0x01c20000,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* Pincontrol */ {
> +                        .phys_start = 0x01c20800,
> +                        .virt_start = 0x01c20800,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* Watchdog */ {
> +                        .phys_start = 0x01c20ca0,
> +                        .virt_start = 0x01c20ca0,
> +                        .size =       0x00000020,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* UART */ {
> +                        .phys_start = 0x01c28000,
> +                        .virt_start = 0x01c28000,
> +                        .size =       0x00000020,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* I2C */ {
> +                        .phys_start = 0x01c2b000,
> +                        .virt_start = 0x01c2b000,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* Ethernet */ {
> +                        .phys_start = 0x01c30000,
> +                        .virt_start = 0x01c30000,
> +                        .size =       0x00010000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* GPU */ {
> +                        .phys_start = 0x01c40000,
> +                        .virt_start = 0x01c40000,
> +                        .size =       0x00010000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* SRAM */ {
> +                        .phys_start = 0x01d00000,
> +                        .virt_start = 0x01d00000,
> +                        .size =       0x00040000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_EXECUTE,
> +                },
> +                /* HDMI */ {
> +                        .phys_start = 0x01ee0000,
> +                        .virt_start = 0x01ee0000,
> +                        .size =       0x00010000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* HDMI */ {
> +                        .phys_start = 0x01ef0000,
> +                        .virt_start = 0x01ef0000,
> +                        .size =       0x00010000,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +                /* RTC */ {
> +                        .phys_start = 0x01f00000,
> +                        .virt_start = 0x01f00000,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* Interrupt Controller */ {
> +                        .phys_start = 0x01f00c00,
> +                        .virt_start = 0x01f00c00,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* Clock */ {
> +                        .phys_start = 0x01f01400,
> +                        .virt_start = 0x01f01400,
> +                        .size =       0x00000100,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* Pincontrol */ {
> +                        .phys_start = 0x01f02c00,
> +                        .virt_start = 0x01f02c00,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> +                },
> +                /* RSB(Reduced Serial Bus) */ {
> +                        .phys_start = 0x01f03400,
> +                        .virt_start = 0x01f03400,
> +                        .size =       0x00000400,
> +                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                                JAILHOUSE_MEM_IO,
> +                },
> +		/* System RAM */ {
> +			.phys_start = 0x40000000,
> +			.virt_start = 0x40000000,
> +			.size = 0x7c000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE,
> +		},
> +		/* IVSHMEM shared memory region */ {
> +			.phys_start = 0xbbf00000,
> +			.virt_start = 0xbbf00000,
> +			.size = 0x100000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> +		},
> +	},
> +
> +	.irqchips = {
> +		/* GIC */ {
> +			.address = 0x01c81000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 0001:00:00.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0x00,
> +			.bar_mask = {
> +				0xffffff00, 0xffffffff, 0x00000000,
> +				0x00000000, 0x00000000, 0x00000000,
> +			},
> +			.shmem_region = 34,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};
>

Thanks for adding this board. That's this
https://store.pine64.org/?product=pine-a64-board-2gb, right? Will that
config also cover the LTS variant? Just curious.

Could you rebase your patches over next (will be master soon)? This
specifically affects the ivshmem devices and memory regions. And could
you also add a linux-demo config?

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/991592dc-0482-d4cf-47dd-fe198cc78bc3%40web.de.
