Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBUPCUHYQKGQEFE3FMJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A001145928
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 16:59:14 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id c16sf2269845lfm.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jan 2020 07:59:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579708754; cv=pass;
        d=google.com; s=arc-20160816;
        b=CdA5TWkF6lV4u/fJ+57+cCob1HVfpmQaksPoc7F0QMU/kE01TDGjMfCrBaOUEgcVqk
         w2lI2pHE9oWd0tzx5Ic3j1JdvYAGQaT+0Pb3vmACFEpYL9Em/SGuWwgJ0Fc7DXOzPuYz
         a12JDDChbicDFtR4rtvELOxK6RKDn6KnOGObTEUDeFmEvjobSJT4Cxksm4ay9YNALMVn
         O+JsWX3aWOXd79h3b8sdIWyTzsI8KEAi45dFaOMqiIyUndZf88vm+a9vubXn88Ej+2I8
         buPlsUynDvpZTXTUAs2pwC3XZJLXBq+JADKUo3T7yNVxE6JGfWo0CmR1jKDgnXNv3449
         erMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=B7/F5o0zqRmSc63X/1ziA9HEOQW/WAzLWdVcJ4sdZZ4=;
        b=QIUfNrSLYVbwIeIAi15WyiA5S0sGYfJ5dk+FvaIFP6Dm3YHVlkcMyUAl99MVwTZNmm
         51uXwLXcs2jmGdftQb3+CyHyQNyn4NmhvMnGWigbhDr51Aq8iSmBRpSsSk1AJcjJTqld
         +WRR8QgEWs2tIKC/aoNFOJOP1sLVvMwB5s0ITFjSBpFAxbW2rk/4r3gcC4e/Mwi6zy30
         xOlxqwTiYKVaA4YMcV10SlPqRDyVcMxRiPCTo8zFo+b+OTprJ5+CNVuoQSP9vDhaegJe
         gR1umfywppI7DPyCLZGbemjGJxv0vGSPDm6TweInKn4GlH5vcqAWEaV0hcAVdChwPOvG
         qZtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TkSLqalY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B7/F5o0zqRmSc63X/1ziA9HEOQW/WAzLWdVcJ4sdZZ4=;
        b=PQy7kTTh/Q0CV/FELS6ysBFOAYFTQyl7O2sHbvjWs0SCdnVGhqNNsPlXoTPWDO2mZx
         /Abv3DbLYqJc3mWEvVf7KnfOg5BYWKkIPk72Rw+bYYj04RS0IbdUkveQzcoCq1lQmPzx
         0qUkuFS+EzMhU0y3EEgfv3rBUAIqL6HlHZCU6QotMtC2XhN6cg1Eus6Q6foQ9H79hrCU
         zXZyrhiLn/2YhKKyQMhQKhECQG3tceOW4bfL6zsf/tEr12hFm4lm80vus0avnPpZS1XG
         aH/Y7EuXgz8zWk0aIcHM/rPj7CiXtlrImX8WfqJ5uqI0nLaQw8uUQHGEGe8ZAV5g1UhS
         2pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B7/F5o0zqRmSc63X/1ziA9HEOQW/WAzLWdVcJ4sdZZ4=;
        b=Wj0IYOubFEhqJ1qJkRqFGUTMw0he5Jaljz4yoY0uHQZfevvr+u3hvKPs8gAoimcKS4
         HVnQieX/on9KNTg9cg51idOmMcbSclXkhyAhHSLEv1OD0rikLaolYdswBl2BZhDWNmLb
         npZ9tgFMKuIHy1cbGMGTz2VfQcHssmozp10DO6R97w4gtmEMzZpXhjIVUU89p6iClwJn
         LqMmowSZcfH6gEqRCaLaWQK4T7l7EXRMdXr5R2m85AmboAJ6rYgxIIj7vgX73z7qnYhj
         Xy3s5reLwlXJGfTYO0SqXX/hsg7SKdMFPbMgtHy/GEhigmVTWEvJYBUEvAhUNAqEKhc8
         JYaQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0LzdTSWlOmuIWT0AUNJao+Ty0mows2XEwtsvkGpTChHBMqVuj
	rlz7KTmg8qQboz38FhufYhQ=
X-Google-Smtp-Source: APXvYqznKMmOunaESN7eZQH4eYsNb8DmVbsoqmkLFQ6EqRisfszahWPGk5ecxukp4m2BSKzDZQsknQ==
X-Received: by 2002:a2e:810d:: with SMTP id d13mr20304485ljg.113.1579708754038;
        Wed, 22 Jan 2020 07:59:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c09:: with SMTP id j9ls5544531lja.2.gmail; Wed, 22 Jan
 2020 07:59:13 -0800 (PST)
X-Received: by 2002:a2e:7009:: with SMTP id l9mr19544418ljc.96.1579708753340;
        Wed, 22 Jan 2020 07:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579708753; cv=none;
        d=google.com; s=arc-20160816;
        b=F5ykTWJTdrUOY/0C+GERuoKDtoUweMDoFXCEfr932yqf7NoG2XBuzOf1HUWUBbkjz+
         vU5uNtHJgH1dKEtXHgNOK9Erti8mn5mL3PHF8ygCOTRoyJG3XmRV1waKuQpVmzTi8fmn
         cdR64yfkZVigrEzSHvaLEJGJT/ctsZD0eCq44G4bLJCeH09SZTLMJDRdY0/DCe8ewFdi
         i+e2S78flvnqoTepwQe8Ra8UHhQLbkpu5WLElwpoW//vKHFzeHS1zaKHYH4z2dLtLwVD
         /idkR4r8l8jAUJ6fwlwpWsYenx4dODAuBue5F/tWeR0pQ8EctOIPczfY0EhqXJTAO1YC
         7saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=peTwvGhoT5YMccSM1zID6LjjTl3tvL7K/d2Sp3enzLY=;
        b=wK2F2VkkZ3HnIpnAheJraDSWYqJgoRRygkAuTs6zYQW5HLOC3PnsDkemMrYTHEawk5
         oIxVweR64qaZ83oGzE5lzPYrtkeWT2FQQdjbKxrZvYEXM0QrBE/Sbkq0wvSIMOYa635c
         zpL/W2p41+0ESf6C1IqGWIo5ER+foow/lpZh74EeWcWtIRpCnSWKqf5udNd7MjOayM6s
         WsjYFdVdTSlq7fuVmgse19ympAwEr0AU3Tg8tUe8C0I08vDUiBhdUEjsFn7qifeAVP4d
         tP/5x5m1jbfn5KuZRCnOvcAizsT8D4S3+mS+GxTdZ4cgb12LkoSJ+tgOBgWLcTWvFG5u
         jKRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TkSLqalY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id z16si1475631ljk.0.2020.01.22.07.59.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 07:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.40.128.162]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MABh3-1ijXqI429J-00BMPY; Wed, 22
 Jan 2020 16:59:12 +0100
Subject: Re: [PATCH v2 2/2] configs/arm64: Add gic demo for pine64-plus board
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
 jailhouse-dev@googlegroups.com
References: <CALLGG_KzRM+g3+eJf7Y6q7_Bpt-RtFciHSPPr+At96FXakzgBQ@mail.gmail.com>
 <20200121044255.6924-1-vijaikumar.kanagarajan@gmail.com>
 <20200121044255.6924-2-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <958f542e-f268-ad51-27f0-2ac9d0ac9fb5@web.de>
Date: Wed, 22 Jan 2020 16:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200121044255.6924-2-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:w7wXkU+cNPt8+ITLOLEfyrsJB8hrnvsAUYFBbAityPYIIBuV8N+
 W3nM2NOOEvm8h7N8e+LVsu9DsUvob6Ob78pwZoxp7W7P0laN2zQPcstAMpbfo9+f1Zgp50y
 zz/Yit1kHRzZiPG4UtE6cXkHHbRMo+W9LxndiHigaL55bO1DXIW14eIvDLlt39qp77tciaU
 frAAOIg4AP3HMuDio7qig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ueoNIwTu2Ag=:7O75aHiYBgV+wpn0nz7M/k
 BRTWPgmMrcjdODxp3YDnnpw6A0TUHNTFSbVXXjSoo90GByEQFjRpkMCRSUbwnc+mG4MKkEh53
 qleeMqXvo1NeoQL3cQd2KGFK+GMLksVKuFEt6joPYkNiECm5Vvt6QoHmozw+H7nRRqopz8HU3
 H5Sv12cSktMzKqPQTcwbvapDCjkB+CKu5WO27Gvz5Sw4cweTzUVoj6ZB4aJ1FEkf22BN/xVOO
 rArVNnsf2hgXMS7RTDOMhiTg/uUPBlLNNIAcjlnCy7O6TFUEmbP8H2zrk7r2Ii6WkUxkQ2Zmn
 mY3KmZZarJXNpGPvlV8rb4BIr85N+gd2CPYPZjeUNpi0saDWviTQ9vWthIP1jMgbqLUrl+cpt
 8qXFHUF5nQhyQcGK2Uu2IXHIip/dDc8Oj+AOL/c1q0RX3SQZZOmhLr5JajKQJSFcZRzBK7qgg
 OcipZNzHmaJthWkKgnP8tZi57ARsDfSUozidh+Z1F/M+nV5tA2C9iMvxKUJPM8dfam97FKFAv
 w70s7cSchyXeh8IQ7wE9z5hmSzzztJCkTfkEtQFw0r7Md+shRQiER3n6nXfpE1a6SKzzQCapa
 U0dBC5rCT6nC/AZIvWjwSuo+O/V60xG+VOJbxB/amC00r41ujSkdOwxEHhOqwvYGoesRbl3uR
 L/cGe4tqN2xvgHZpyGZERZqsxmdFov4+aCfK7p6QCNMk1vpmSosravR+kMWdVpxPwoSQ/HvE2
 50AKgbs7M+j6i2po9z6xeDpgw/PYvLNFfvyu52RtY8B59LDUSGxDJoRyQfuqofx99XsUD1fiA
 3swsnWN030vZSg4ichtjSB87ZR1iymL79Rr/IcX1qFT2VpGwHdseU92uYTCS5nZ9V86dENp3n
 z+GLYZ26u/KJFqYWDoFyK/fYdzefYz+seMKI4RgeasCwgcIDu+KUg1fQ98jskZJwk+JNATgQz
 ghMyEKALHo/GDudNFqg3um20vftRw/smYYMTu/YjOEBLhOLJmq9aroLbR7oDyCZj7GUWkkd9i
 S+oY93AnePkl/p2U50Wut0Wf4YMDqzxB26/Myyq0Uj9WPllEpCgfyOxeGAepcao4YFrK9Babp
 JDpHynXf7/mJE4Eunb5sGOMXY5rc2fot8cupwfnkyM6lWMIz+6Uxk2ZqEpeYW2sBMC2/WCkJN
 du4ka7tyKE2k0ZGFXT8EHmd5Io3ExhL9MavkytiZULLn9x3G+vu7D0YO0y/HdmIcEjzoKtBfC
 BG/yOP7885muIg4Jq
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=TkSLqalY;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
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

On 21.01.20 05:42, Vijai Kumar K wrote:
> Add GIC demo for Pine64+ Board.
>
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   configs/arm64/pine64-plus-inmate-demo.c | 69 +++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 configs/arm64/pine64-plus-inmate-demo.c
>
> diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
> new file mode 100644
> index 00000000..7f43444c
> --- /dev/null
> +++ b/configs/arm64/pine64-plus-inmate-demo.c
> @@ -0,0 +1,69 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for gic-demo inmate on Pine64+ board
> + *
> + * Copyright (c) Vijai Kumar K, 2019-2020
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
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[3];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "gic-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = 0,
> +		.num_pci_devices = 0,
> +
> +		.console = {
> +			.address = 0x1c28000,
> +			.type = JAILHOUSE_CON_TYPE_PL011,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x1,
> +	},
> +
> +	.mem_regions = {
> +		/* UART */ {
> +			.phys_start = 0x1c28000,
> +			.virt_start = 0x1c28000,
> +			.size = 0x400,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0xbbfe0000,
> +			.virt_start = 0,
> +			.size = 0x00010000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	}
> +};
>

This should become a generic "inmate-demo" config, also including one of
the ivshmem devices (see qemu-arm64*). Along with a linux-demo, that
would make the config set round.

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/958f542e-f268-ad51-27f0-2ac9d0ac9fb5%40web.de.
