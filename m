Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJMQ3T6AKGQE3GDSY6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id C61582993E0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 18:32:22 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id pk23sf4042305ejb.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 10:32:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603733542; cv=pass;
        d=google.com; s=arc-20160816;
        b=qb7OJUBlpU8OoLXbt4uKGBb7oURv08EcOJS4k9FuMt8xgXKcoYysfkqfb+QVMNMDvM
         ADDUUqsLII1zWWwveemgE/BJGFf7aB9p24SOejEhXnr7YE0erXV8U1q1YP9vPxoqRn7r
         MrrW0h/CvxTLkRAcnG9a8m019X3iVjMSelXNzHDibmYPO2pWv/f/gWWAGw1BbWlDqrbv
         jCSerzVLM1Lh1Mt/JyGa+6nenSYkFnAyepu8Mi5ry96RlRywfiBNg9yRdsLaKwpqov3c
         AQ1QnTFmJNMbbj9MYpE2QFK97CAXYT8gNogAnrHOLe7A0sMqHq/BYPS8usqhvMJf93fB
         gQDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=xTqOXHEJ4kO/qyHkGrLtUbodFBGngKqaJgX4y07rf1A=;
        b=Oc0QeXZyInloyn3HHrUeMy7KW8rQo0PbIz/wv6M3KcA4CZYbkg5B77OIhLiY4Tj28L
         tzRy4nlvHEKzyeojdRc70wht5OObZImc8rAYw80PU7Btg8zwW21MkNcrJ6TshFepgZmt
         lIDpye34rwZW+r6MtwNYRvBhDb69exSTP/kCyGEMf1X/saBG7AohGkZvlnJ9iuFN5ZA6
         tssE2/UKXZdDwN7eA4sRlM6+3Y726SCEkrRGthhuVcUWqGsmGvN7FkISuyyx59t6KpT0
         45SnPx+WV7ehDgT5CU/o9oY4kUGuYNe3cbfA8CnXYLuNYDYjaymiOBzav4rxo0tIe5Gp
         CNzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xTqOXHEJ4kO/qyHkGrLtUbodFBGngKqaJgX4y07rf1A=;
        b=X7bbhCIDNGb8qqB/7ZNcgYLMu4hJ99YE7h72ZZbW5eDP9wwZfQnpZncitvLaZY0lre
         6MCmeAfzEglBsQwCLMcSjVASvsxwhNNjn30/snAYF8x9ahQ+bDNM35lsU/M6fAHWvPji
         JW/lTwbULjb3KNMx9oxcp5CgR6GIOyYBJ5JjL4RuU+ReVf+t8Vmh6UzPFU9WMQfjagVq
         FFomp04yemzvmWoRVL0BJutxNbQ0CBeXW3prwQggz6LaIFwz1oL5MylpldrrHu4jz5i3
         QQwS4nsVBewh+IRQM9oSVGJKNXDM6oMRglXaiQJEVWgQzhb38Z24c170Gqf0tUcKGvox
         xwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xTqOXHEJ4kO/qyHkGrLtUbodFBGngKqaJgX4y07rf1A=;
        b=sK6rboRwxwOcSxMcYFPSpdcjvWMaD94xzW54rKWzL/Gs5E1wkHvlUuKH1uId6W8I6Q
         tqtEjjudSA87jE49tkUx9dD9MsMSn2O7GvSTdadnE2agj94OUqQaXZy5FRv0f04mqymC
         eMh7UtyvofDCiVrj1p6gjtGy9dGqPix3opyqWnyXZ8A5ujmTNU2DdEwRj3G2hBA/iZKL
         mR39ZfoDtJ28ssyZHnavF5m9WrjjIf/5CWOn9LlqB/AJK49RGgmcHv77xovl4HPJ/FPd
         +DdRtUd7DTyuGgztZVsucssfJZXD9mk9CKYzA9g6cz7VqoKAlXH4ExybircJ4gp45R7U
         3ABA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530CHOER69KySopGiFtweJgZ9And341qNyBs+Jj3iXrYJ0GV8ZmK
	P8nszG6JN8do6XMNqD2OhPI=
X-Google-Smtp-Source: ABdhPJyHlFMvkqD45PfWBX4kWrKlqt+GveIbzNq7XUbsaLkP2tMaqzzDdyIrMeb8bz4yiqfutEkr9A==
X-Received: by 2002:a17:906:4155:: with SMTP id l21mr17380679ejk.204.1603733541770;
        Mon, 26 Oct 2020 10:32:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:38d0:: with SMTP id r16ls4950428ejd.2.gmail; Mon, 26
 Oct 2020 10:32:20 -0700 (PDT)
X-Received: by 2002:a17:906:564d:: with SMTP id v13mr17448912ejr.217.1603733540477;
        Mon, 26 Oct 2020 10:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603733540; cv=none;
        d=google.com; s=arc-20160816;
        b=dWY5l4irRofJl/v7jluSYvD3FwdY/YLOl6DXO/2aS5bgf+25JaBb8cG8VkJ58WtXJ/
         ntEuPjxPZlzBKbFv0CfksCagIT0ituh8psBwsGvW0bFbF9mmPre8Z7Epkp9uh96G519x
         1DH05SJFQsBNSikjMEO/Llx+clkNjllgtfY+wik5WAO2X9ewHCfjOcWLjuviltiNaJkU
         3+Z3bPSRlqYSxHDL7wb1xyfAbqn6PlVsbPR1YBn2+KYny/1uF74jRmUgYD4qK2QoRCOI
         +vreGTBfVf/evc8ncCeI1P8z4BCwDRt3Gsved0z5gkdD21nG9pTWhXkK8jMwT2F05fTb
         yPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=dFCZJagmTRzTOV9JmgermiM5KOS+KdX5CONaiBLZm64=;
        b=L2kedU4L85Ns/bY0NieP2qaUvTXblGHZ8kvt/t+g/hdXJ1LbE1gmhr9GjZjH/TUghC
         FGcw2ATKwcKjX0Y23xHOGRC5znlLEzVz5obSqmRKdnWtH1Bwb8bdjoOb6lrw+o3wbrYd
         kWTEpdPGwZ0lAb9EpqzuhuKuXO31RekNHX4DufQgSiKzgw+vKEPkPYj4OhnSW9sHkz3L
         ODH2JvQuBZpRIZOx5kqDh6z9pRs67Hjpk0UmmWp4jdVpuocJlIg4cnVKeIHx8csT4j2Y
         U33BbO+Xsd87HObExUbqUwlEqqLcnxYlCAgmkRGDvLFy31aEzK9hDkdpKhA6k30oxGfV
         rMpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u13si148008edb.0.2020.10.26.10.32.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 10:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09QHWJpE000606
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Oct 2020 18:32:20 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09QHWJaY010863;
	Mon, 26 Oct 2020 18:32:19 +0100
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com, Alice Guo <alice.guo@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
Message-ID: <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
Date: Mon, 26 Oct 2020 18:32:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 14.10.20 10:28, Jan Kiszka wrote:
> Changes in v2:
>  - map 52-bit parange to 48
> 
> That wasn't the plan when I started, but the more I dug into the details
> and started to understand the hardware, the more issues I found and the
> more dead code fragments from the Linux usage became visible.
> 
> Highlights of the outcome:
>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>    to understand that...)
>  - Fix programming of CBn_TCR and TTBR
>  - Fix TLB flush on cell exit
>  - Fix bogus handling of Extended StreamID support
>  - Do not pass-through unknown streams
>  - Disable SMMU on shutdown
>  - Reassign StreamIDs to the root cell
>  - 225 insertions(+), 666 deletions(-)
> 
> The code works as expected on the Ultra96-v2 here, but due to all the
> time that went into the rework, I had no chance to bring up my MX8QM so
> far. I'm fairly optimistic that things are not broken there as well, but
> if they are, bisecting should be rather simple with this series. So
> please test and review.
> 

Alice, Peng, already had a chance to review or test (ie. next)?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/78334f5d-b665-8de6-31fc-10599877b3b1%40siemens.com.
