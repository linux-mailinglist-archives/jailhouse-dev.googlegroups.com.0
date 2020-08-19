Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWOX6P4QKGQE7K5DR2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A263249907
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 11:07:38 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id e15sf8031041ejk.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 02:07:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597828058; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZPVxvV95AkeKEgsrNDCQkJwMZOrTWRycL2DeP/BfqWqyE2baGZziDf2ek33l8rnjDn
         39uT86suIFyJQLdQpPLlv3PEiy/8xU9fu/VuytHdwA9olinVlAbVnvIl57sI4O371B5w
         1WkaQZ6VLpd2GjaFj75JDsSfsXkVukUb5FLHbYbit/SV5Gp98Jq4LgHGUx9AjbSp1ocK
         h5erXw/4ehF6AmfsY/l/5BR+kR1vaB/ZxvKCDp0laCVo72dXBUmfdnZnk/7OQHleMVFG
         AZRQa7nIXz77DIW6U/8fLjjP7QcsU3NOi/SLS9XG6+rbQDx7f+gtgY0CU7jjk6rOws7H
         IzSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=9t2PWJ4iBFG/djTOlbq5ZgXMAmSeIBFWmwfN9FFtJtk=;
        b=CzhseFD6cJGmVOm7YRS5nGrA5EYf/dXP/4OqZWpXJ8kzLfZ79WQUUe5hFtMe52t2tJ
         uO0SktajAiz2nikpFulGXMHiDh2mhHJ6zSDytyzNFBdwpUowUtlaWiVDZWHvfKhdKoXL
         1PmfD6ygxMitKgRlrHNeAMTTBbM1hCvBrm6PHNZVoj3OuzudptILD1X3I/wzYIYcsyg8
         RsI2JYA31r8630rObAGgwqM6mrm8GQ/8HiPBh55GLDqSfGqOiOtmQ7cRTGQBTDEpolVz
         Elkvzx7khHskPwxR14me41Aem7BpPx7uFN7fYGTZ1NmJ58AaLZAcABswkRNLCMqOmEe0
         W+Nw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9t2PWJ4iBFG/djTOlbq5ZgXMAmSeIBFWmwfN9FFtJtk=;
        b=OtRlqvO0MkteAUqebYD7xPCzw6FNZ9k8zKtErw0EG8sosl9S48SLVImxR6V9NVff03
         JnZZjCBoFMmQJyFTsM3l1jp7XFrodE/CTvbGd3kPlxb1DUsbS72X1dG+sA4OGEzUO8u9
         MgDlSGqgYNdb+vtsNi5+4NFz4i8QEFLQOPtoJkvXHS52xTa71YRm65bGla8vDC/kXShx
         7mhQf9KOApCcp3CJBf8uKz2j0O1rUxa6SrB8v2cMtaL0sQJ8eRJ360UVnNvHRqLPo+Sh
         i886UcD5ALL/sHKGvo+aImUhvab3qwbuvP3F356QAZCL+dHgY43rsUzOBPYccrtW6Zef
         cukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9t2PWJ4iBFG/djTOlbq5ZgXMAmSeIBFWmwfN9FFtJtk=;
        b=RnxNxLuVyuMRq+0mZe2QbAIX4kdi838vzqWNJB1qs5RYkL+K7FUoxD6AOyDSisP8ub
         CIXANXnL3Ci+N6b69XWTH9/MMuwSxh2W7MvQRM9wZc/NLBXBF2duyffz8nYyq37yLvPC
         SfDl4IJ6gK2fdL4a3QWHY9bfL+qai+ZsQQpahfikhLeQHMNwFzAqrq3Wz4x2FXbwcsDx
         0eFUDdX5fTm6Rdm0fhkpNC2Tgpyey95lorEbLwE8NZNAJ3Y5+opxKVyQH7Wg2S9K56zw
         jsWwzi9v3Nsp3q+/why6ldO3WwNkW9rbSqkqV/3xeEMfXdN8PFiyqzcfNjUJF/7xAj+X
         SKpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YQdkfQhpHnOQ+ahiNFpQq0/aN8m9/92R0VV+VFYeQm0oP9pvx
	Dlllup+D6xxXe2Fn3BnKVDk=
X-Google-Smtp-Source: ABdhPJzr3xLcnwiMzkAHt/QxBIW5DbO7LMpmj8Vmra1lBiqOyyIfqheyINmZ2yJjF/eg/hDP+ZZAKw==
X-Received: by 2002:a17:906:ca4f:: with SMTP id jx15mr25350468ejb.449.1597828057992;
        Wed, 19 Aug 2020 02:07:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:fb86:: with SMTP id e6ls203701edq.3.gmail; Wed, 19 Aug
 2020 02:07:36 -0700 (PDT)
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr23895783edv.145.1597828056769;
        Wed, 19 Aug 2020 02:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597828056; cv=none;
        d=google.com; s=arc-20160816;
        b=mvzvbyjx4bbvWofuNoQDTma9w+YKb3BLwSw4JlKk7f93Mm+HGAIqKxegwcNLy6u13V
         QEzH+/6URimXSWmdkqvzwDCm+s2neP7p6jrRchCgggjwnzaIl+4+tbqvX9MJcDU0r5/i
         HoX3w5QEILEAnS6ABN5WJcFIWxqRPM7KxQ6bZGOtmJDHXRcrgkwXN/XSQ/D9lS0/4kIE
         yyuGyxYjrcTqVt+MkkzM1/OhC4b6GQBwiXPaE/eCZhhKic4ru4KC/iXOByLqgjD8Yc93
         gslDXvlh/F1Q+EAtX2Muc++KuaIGic+oA8KEou5mb4kcmGvh4oh7IlDV8MYaKdo7zhVy
         RNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=wJ0qwwPZ3LLEDPzp6qUOWowBpyAm1JKdNOZYH0mnKlQ=;
        b=lh/I7jBsDd5uRGNcj4yydW1IEcqjfVWJ+7hpdnCSbEID0gVB+6Po8EB+sVDMZrdBeD
         H3DMhh+cr2kDVSjU1M10WSjse5D1A8nekgeGTRKK6ob/gN8DOSaWvhMrVyS1sq/+UCLp
         Vp26lFwP/aLMgifiMekcFntiTah4KY4yV8I0rHFaxYSzU9hoyMsnCW8AuH6lG0bmhNqw
         4FavHbG0br7YwSgFp55fWPHaAQw9cvk8bAegK1Igq0bX+z6ew53F2gq0rBdEydnC0qio
         iMRm86TKhsfkH20Uz/Bv0GdKDG4DnP4A2y5/aAaWcR6AO5B6gNENZnJwftz1QcRB363s
         MXTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q14si706472ejo.0.2020.08.19.02.07.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 02:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07J97aGo017686
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 11:07:36 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07J97ZlT022892;
	Wed, 19 Aug 2020 11:07:36 +0200
Subject: Re: [PATCH] arm64: mitigate Straight-line Speculation
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200819090350.22368-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9fbca684-b12d-d1b0-02c1-f056ce35af4b@siemens.com>
Date: Wed, 19 Aug 2020 11:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819090350.22368-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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

On 19.08.20 11:03, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> From Linux Kernel
> commit 679db70801da ("arm64: entry: Place an SB sequence following an ERET instruction")
> "
> Some CPUs can speculate past an ERET instruction and potentially perform
> speculative accesses to memory before processing the exception return.
> Since the register state is often controlled by a lower privilege level
> at the point of an ERET, this could potentially be used as part of a
> side-channel attack.
> "
> 
> Use Speculation barrier sequences:
>  - SB
>  - DSB followed by ISB
> 
> Since we not have ARMv8.5 with SB extension hardware, so only
> use the 2nd approach now.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> Take from OP-TEE commit: abfd092aa19f9c025
> "
> It was fixed by Linux [1], FreeBSD [2] and OpenBSD [3]. The misbehavior
> is demonstrated in [4] and [5].
> 
> Link: [1] torvalds/linux@679db70
> Link: [2] freebsd/freebsd@29fb48a
> Link: [3] openbsd/src@3a08873
> Link: [4] https://github.com/google/safeside/blob/master/demos/eret_hvc_smc_wrapper.cc
> Link: [5] https://github.com/google/safeside/blob/master/kernel_modules/kmod_eret_hvc_smc/eret_hvc_smc_module.c
> "
> 
>  hypervisor/arch/arm64/entry.S | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index 27e148c6..1b6fa696 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -378,6 +378,14 @@ el1_trap:
>  	ldr	x4, [sp, #(2 * 16 + 1 * 8)]
>  	add	sp, sp, #(16 * 16)
>  	eret
> +	/*
> +	 * Mitigate Straight-line Speculation.
> +	 * Guard against Speculating past an ERET instruction and
> +	 * potentially perform speculative accesses to memory before
> +	 * processing the exception return
> +	 */
> +	dsb nsh
> +	isb
>  .endm
>  
>  /*
> @@ -522,4 +530,12 @@ __vmreturn:
>  	ldr	    x0, [sp, #(1 * 8)]
>  	add	sp, sp, #(16 * 16)
>  	eret
> +	/*
> +	 * Mitigate Straight-line Speculation.
> +	 * Guard against Speculating past an ERET instruction and
> +	 * potentially perform speculative accesses to memory before
> +	 * processing the exception return
> +	 */
> +	dsb nsh
> +	isb
>  	.popsection
> 

Thanks for taking care! Applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9fbca684-b12d-d1b0-02c1-f056ce35af4b%40siemens.com.
