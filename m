Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJ7W2WFAMGQEQJGGQVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4241D5C6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 10:54:00 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id m20-20020aa7c2d4000000b003d1add00b8asf5590742edp.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 01:54:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632992040; cv=pass;
        d=google.com; s=arc-20160816;
        b=sUM49EqThLUw5bhAl6YcCXgYN2GYs64WDj7+lgtsnkrvaII92h61VtKKvYqvtV5Rus
         5drxdS62XbeCqKyugs97Lh+86dWmgdMeAI1/InwHbJKvoRhVszuVRBnN+TGsajbPIAzK
         S0rjW/4ZiTX4vVFLMC3Pq1F31TG4KhHyZb366ngWNGyVPIewa2yZSkeDj6/Cd2m6TQmZ
         Q2QJPKnaisx5ughTpNkld9cMohoI/YV8RXRRQObmP9ACElsstc3e8entfKu0YccxUjoJ
         nAov9K2CCgaymlhr0AnedS9Y+CLpRqqhnj5O3ArF988z4phhkYq3aOQPiS7O+tDK9kOZ
         UZqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Hj/54A8W27cEkmHo75c+/tf21F/IRlhJHoyObPUpbXA=;
        b=kQzEheFMktvK6bQOIOzcvP2ruOufv61SE6slDYoHyUo6reR3xKsSrwaW1vigvA6qe4
         p7QZlXYCVFxBFReGd70Vmxx259nAQCUkUchZdJlUzKaT0czKHD4YnQ7g0Gjb3D4t8vqj
         Y4AXFpV2ltgsxru1QVY6ok+3QQwkRvxu4mClMO3NHhoWdNwGJ0xAk5ruRfeL6lfDFKtu
         k4yDhIfO1TV4xBVXYe1LgKaj3Q3L076udlIRNRTcJjFExYKAdFkWU2vPJlSpxz6eb0JO
         9hExVjb46a/QH7mnyHi6u4WG7wfY2d8mfz/GvW6KwBlUIiksN8xOZm2CZblXyATCV3gj
         Ck8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Fp9xlaeq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Hj/54A8W27cEkmHo75c+/tf21F/IRlhJHoyObPUpbXA=;
        b=myagxoAQ075bMKVc6DFOHRfJXpUg8x6pnOUAI6+HX4cyq3AvolxLb4zaHA5scbO18j
         gGK3H3/fgSvmX4u1EXf20k/IyMc+3svf+F9qCvXYpbQQxAw0w4hnFV9iG3HnwHy4JHV9
         A00D9JNJnSKZpFtF08pCWwfdbun4Zs0Yuxs22NU68EglqTAPWTi09dnB5XEeuo0oc7YZ
         WP3eUHzQ57S9qAe58Mo/GQs/Q9wAZEOvka4tnrfmaGEr2UPPwvLuc0p99r+gvkkhMAv4
         Q70r/KYdO6mrMYqdsgOsdzgRfxsxEhXjv+Se+Jgi0tgzWtYFkp8OJIeEtAk/G0zzlIYP
         h+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Hj/54A8W27cEkmHo75c+/tf21F/IRlhJHoyObPUpbXA=;
        b=hkp6izyffyG6xw8BgScmXfaMNOKKq/IqG03yB1LEOpaTr7wMmaQR8XjjkHFw6xSBid
         ReFh67LlqrRrEdl2YO0ctSx/xw7c+KId4DOIC3gW4Uc3M9OC3K7N6yRhM+Klia0trCBb
         ipXzqJ4O32fX7D4PwsFlT6zCOo67RdBjr/cB9HQ+eLaN0Zfa3atjzbRR4xqWdtMe45G/
         WviAK2xo0IJL2E1+gUqOwg1yZd46UiTPE/SfJCPfcsSj2w8qCg9dafE3bsmcacheJ+mU
         k64qunjAaikXtR1F4d5ftbAHsF17zRtoYFoQxaqPsA2PdW5z0x2QN3HFvJyxy00Mh0jD
         7iLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Q9yeYZSifKr03OQ6qR+/iwClnJS8ub1JwADXX1UZEJun9KgHa
	zop5DKc6+rW67z69pjNZgus=
X-Google-Smtp-Source: ABdhPJy+0RCn8IkhX5uMuZAXdnE1Wq1vPgZQnZcJptuOYCHQIZ1fPLD9Xb0sleM+cEogPs8UWA4Dww==
X-Received: by 2002:a17:906:8289:: with SMTP id h9mr5500213ejx.540.1632992040070;
        Thu, 30 Sep 2021 01:54:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:18c:: with SMTP id r12ls3151739edv.3.gmail; Thu, 30
 Sep 2021 01:53:59 -0700 (PDT)
X-Received: by 2002:a50:e14c:: with SMTP id i12mr5563826edl.125.1632992038997;
        Thu, 30 Sep 2021 01:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632992038; cv=none;
        d=google.com; s=arc-20160816;
        b=fx8fg7bikHS2QTVV0bC7lErSGjItY0+OfRepU4iwbvEh5oHFu6mzm7gBLY+qBX7d1G
         jB23UOAk7DmPiBt2qHzJY0rcIiV+RU6//Na3VPo00BOLL3F42tgma7j5+tgzntG2bsAk
         +2G7fLM+AYMaHHFMW/8zH3BwwOndxkbJ8ablJHOus7cqiWCI9vCI/a+zz41FQ2dr1OU1
         Q0P/oLkfkUmyhv9z3Bn9McMmcarz1qAnJHNlEJyTaOjKGd+Zw41ALl6nMJDJoY+GKpII
         n2wulOUbIZgK6Y+WsVlEMoUIYTudZ3MOW5NhM7jFNLBGoHbBSaiz/cQJo34/O46qjtev
         IZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=nEVezYSk8lg1zJtZiJwTsWvadsL5mDm62AgsPe2800k=;
        b=PY+2fi99uNBOKAzy0JGRZOKXz659gh0Ni8pNgpI5I48kWWWdxV779f57exZELTNB5P
         HIMAwCByWNLBWaUda0QTm3t9BZhn4X2ZjLHRNVQytHV+k5nxY89+sAG3FAbzeNZuuZQ1
         VxkrnCeUGiOIJRYYu/n/1l3rxygWhIGDnNMb/SHEpRp8YQS8YorswOiomPmp12xBeihK
         AhEqAMns+zXhU5JxV+62Yl5p4uM/S9zOrTK+igY+tkD2GXj82FzFGg6q8uB0Am34/87L
         K1B4iNT3d9+qX77gaBpZ5l3ensWY2o6xO06mjFGvgeYu2tk07ICiSkrMzdkgCqIRwa9j
         J5AA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Fp9xlaeq;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id r23si195175edy.3.2021.09.30.01.53.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 01:53:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([94.217.148.121]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Mb8wp-1mGf9x1C4h-00Kit9; Thu, 30
 Sep 2021 10:53:58 +0200
Subject: Re: [PATCH 1/2] arm: gic-v3: clear SGI GICR active flag
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <0251aa19-a5bf-e19b-344a-92189307f46b@web.de>
Date: Thu, 30 Sep 2021 10:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:nlBzlyz7HLvdIqZCCQaa/k0r6c58pX5C9+kKRB1K3/sfOfVuzO1
 vg91a4FVEi52J6hyaiVAeXFJpCDYGZE8fmE1xj2SGC8MMAlVDZlbZHNJneskRijeVOVYWyL
 UzfNpS5G8AOWtyAR6/1nmha6RC64FUNBUmBDOCWg5pnUGR8ZIrdt1IEgftdxKTi3nA/oeB3
 8ERicXyoosXm+ehcRAryA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YarIJvKtIa0=:Qe1X1WkGQy4eQ4IIFdqvqv
 3o3heaocm/YLZezg/VSqR1LjILRa7+rSqhU7c2AI2kaTix/f0mOZS8TcP34tZZ8ii8BFcGKAN
 mO2AfyoKSFxzWcqsL0Bc5mAu6ocHCjNCGye3Uz8TUSc0d7ys/ipthJaiwmJQayg249U+xsgE9
 ZqmVXLTaxJvyakaJqJg0lpfgh8iq1m8tfCnLH5iBesc5R7GCU9MdchclslWhXfozb+RpTgGbB
 OL/H/ISRWU8goU+SyVCcrsK706AR+lQYC+/QTaIYHImuowgbMAILUTLUtXsNIivn6qFQjG8NU
 FYDxvj+fR0CT0k1gBUhJxfv6mTgQBAzCeRd6N6KKNYQXgtLFf0GwmsQx12nbkz/xDGbiiu93q
 3inNOFJ2vDb7rrO0urauGik0tyO8TGQf/R3/K+0OCjm3ccKX4AKSxjhMexFut30aYAlubTjPN
 UiPKmpLT/Fr9+R52m7s80B+sksoiP/WWeDOmCshvm/c5WmdpyMcv5z3wDVlKf36ZlsHLYgHCL
 wlZi1daZm0M6twHWuFA7b1kDPEVCvirt4/xOipPnB+WEhBLMGbBu9hrApTcVK12gKBWVKsRlZ
 zZtCZPi77pcYwjsd/riYvWhYH3QRwNgSyanJYqlEQm+piggu3M3rJP9a5qdBbGPpxqxceZBHr
 /dexWFwjKnjat8qDX8txLp1J5iPdw+fNX71GoODAqFivd83VyJxYBfM+X9T2quEV+Z4TEfrMO
 gdnVRY4Kqm4Pv5tevxDaiov/uEOWsIX8nwb3ZHRWPa5L4hHIgJJ1/svs0eC54u25gULpb7otV
 KQU5BqMKYSYHtsfvLWgusfAYTAtq5NXUxblI215GgwL8xBLUungpL1rUfIzLQC9nKNxw/+Yp+
 tKrWnIjlahE+cnAe0a7uPlWvL+NXtE1IQn90/v1haDC/v15Nh3Bx3U0AQPgTJBJrQbPhZYW/N
 aRb9HWjQl7uJegEi4qeIeLUjTGD+ovpeeQWAyg+x3vvUuuDRFtKeH25ZWDDSY/qj/1sW+U+HZ
 ZU/UD6Za0u0hKoAtUP7LgjxNeu0Nc6eZc4xgcI9Ov4BESyUUjDpozNiN5Z692t31a/tYU8Gss
 iQu1cbrfK9GzUw=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Fp9xlaeq;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 30.09.21 09:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> With Linux Kernel 5.15
> commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use handle_percpu_devid_irq()"),
> the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleared
> until interrupt handler finish.
>
> Without Jailhouse hypervisor enabled, everything is ok, but when
> enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
> is actually accessing ICV_DIR_EL1 when eoi_irq after enter_hypervisor
> return. It not able to deactive the interrupt that is actually a
> phyiscal irq which in active state.
>
> To ARM64, the IPI_CALL_FUNC is using SGI 1 which is same value as
> jailhouse SGI_EVENT.
>
> Then the following `jailhouse cell create` will hang the system, because
> the previous 'SGI_EVENT' is in active state and not deactivated, so
> the current SGI_EVENT issued not able to interrupt the target cpu core.
>
> To resolve this issue, let's clear the active bit of SGI_EVENT and
> SGI_INJECT before back to Linux.
>
> Tested on NXP i.MX8MP-EVK
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  hypervisor/arch/arm-common/gic-v3.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
> index 03cface0..8327a95a 100644
> --- a/hypervisor/arch/arm-common/gic-v3.c
> +++ b/hypervisor/arch/arm-common/gic-v3.c
> @@ -200,7 +200,7 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
>  	unsigned long redist_addr = system_config->platform_info.arm.gicr_base;
>  	unsigned long redist_size = GIC_V3_REDIST_SIZE;
>  	void *redist_base = gicr_base;
> -	unsigned long gicr_ispendr;
> +	unsigned long gicr_ispendr, gicr_isacter;
>  	unsigned int n;
>  	void *gicr;
>  	u64 typer, mpidr;
> @@ -291,6 +291,10 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
>  	/* After this, the cells access the virtual interface of the GIC. */
>  	arm_write_sysreg(ICH_HCR_EL2, ICH_HCR_EN);
>
> +	/* Clear SGI active flag */
> +	gicr_isacter = mmio_read32(gicr + GICR_ISACTIVER);
> +	mmio_write32(gicr + GICR_ICACTIVER, gicr_isacter & 0xffff);
> +

Do we also have to migrate this state into the virtual GIC?

Jan

>  	/* Forward any pending physical SGIs to the virtual queue. */
>  	gicr_ispendr = mmio_read32(gicr + GICR_ISPENDR);
>  	for (n = 0; n < 16; n++) {
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0251aa19-a5bf-e19b-344a-92189307f46b%40web.de.
