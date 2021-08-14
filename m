Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB3VK36EAMGQEUKMN2PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 300833EC359
	for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 16:38:39 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id b39-20020a05651c0b27b02901b47664ce3esf3998642ljr.21
        for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Aug 2021 07:38:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628951918; cv=pass;
        d=google.com; s=arc-20160816;
        b=nKjOYivdKRuhTkYoaMx7gGouMB6vnn/yVqMMnDnJhNZiy2H+hJMvR91No/zN1c9/D7
         Xq8FHfwzq9JCO3dX9zGViAUNmwB+WVWmPv+IbMw4KZocwxZQfmEK7M+w+CoVjATBf8IC
         bTuEBMxKX1+f477DbulyUXynPFRmX7qPXr68ZAvLuAvsUae7GN9eFw3C+qX7x21SWf7K
         mke52v6L40iWCvi2inovpg777ur4UXg+53C+4AG0quI4Ibm/wcqdn1S4u1lo/hAxF3x8
         t36ee8pTOwAxUMzLWeb5Vy+6b8y68TJ+hxmiGflF1tvOXF2RjXQoe8JDftLlhCqMqosL
         5F5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=fY3PaVtjXQE79TTdx/ihkz10Vnk+s+bCRVZZQFyLJSs=;
        b=kJkWJJckG6o3+h7ZcOWmFHx11zQCMyS8Nw795JtNfOIYBPq5KduCRf5jx6Zus7ojzB
         k5H7FWmiUgNDPgr3HvRsVkQKj1OLYKPRRdfkfk908MkDacIT1XjM1grMeZQ4sBjZKBuG
         MYXd3T2r5jzUwCoewxOcFAPvQjbTGtm3aWEwoewQT3IYKTRnuEegguEGS7+nbLhz8suC
         EjLF4Ps6k2Hnakb/kOGMUsMO6XWUbUBZVTA0bgzA78rARbzfev/4crjDMx44fKoVYAWQ
         JGxLiBL/9cD9vWhFtK30Vn793iYRaYG/hZaMrFC4ftelVvQSjYxpLHAVlHagqjJ8vOgE
         ZKEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GzAU140C;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fY3PaVtjXQE79TTdx/ihkz10Vnk+s+bCRVZZQFyLJSs=;
        b=Y0W1+HdMe1EQbcCM7/gQs6QiV6MzD+yjggpboDXPSTkNHY79z3ohpSULHZB6L60Dk+
         4HNgdw51yfcohlWjcSlh6HwV4inG6S8u2vgMQUA3G06Pltsyp5IGcpcdfhIYXJNQVPTJ
         6w/19VFvXHADIF8/Lcfh1Axv030VobKBDRd3d8vnzKxzLt7bGjAdOGt6W/ZJDWvYJa4J
         ZKjkw+/kJavr6T+AxRRaOZEo3W+/VRKLWy4Ih6p0JIINYd5Bl9sybYAUdaH7UVBZT+5Z
         A2IThzCUvafdf/USScjzVAJsakD0GBXpaS2oHAl5KE9LwRSHK73nkkC83THjVwu/w0d3
         cXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fY3PaVtjXQE79TTdx/ihkz10Vnk+s+bCRVZZQFyLJSs=;
        b=Pr0/mDSlYU33GcfV9CC36bmXOZsBYBTvFDRTefkAy/HNiftH/dv+YY6zZosnz/ujgA
         5YTBKhKJincplkHg/inG4A91TdVaPDS7PL+UWUKE4ZWqzP2CHgGcwc3bUel916X3dzup
         NonfWnYE4IFGlNX4FZ4rghf1fOLZLjO6xW+JhGia3KU9uT7PtNHT6g9I3f1fORpFfdfc
         pEqLq6ZL0vGbPSLCAwSpXjhfTfut2inbkLYiBcbCGiEhWh4irD/1Lz7BK8jr6Gf+1Bmb
         2kkfxhJ9JuipQYNtZee0VmuITmg0GmG38MDwKda9Jr+dsji7HPAg+JSg0XLQDo+utad1
         O8jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339UD10xUWF3uSr8io2WFDInPtwOlKZTGgTWNcFT3iYvdQThaHQ
	5UEEtkGyQ6RzkKTDEZRlZV8=
X-Google-Smtp-Source: ABdhPJwBt1lxp2pffV86els/7qCs0DQUQtgEb7/izKRx2y58EQn10MmeTeyL7NyKFp/uY7JH+de43Q==
X-Received: by 2002:a05:6512:3391:: with SMTP id h17mr5112590lfg.173.1628951918733;
        Sat, 14 Aug 2021 07:38:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1783:: with SMTP id bn3ls710653ljb.10.gmail; Sat,
 14 Aug 2021 07:38:37 -0700 (PDT)
X-Received: by 2002:a2e:7401:: with SMTP id p1mr5719083ljc.242.1628951917574;
        Sat, 14 Aug 2021 07:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628951917; cv=none;
        d=google.com; s=arc-20160816;
        b=iKtipe+rTaoOCCojv0SIGd1VHcIsMjfIbY3K8Fiu/I8rqQq3ZWjH0lANSWie9SwuQG
         /qsS9yvuVwVXReHKDsjmhhjjG2N05Ub9HwfemMuiO0Q4c8o7q5FFCHT6b1aRdgpp+hGL
         A7W+nW/E1FU1UzYHsC+WRJWlk53lL9YJzlWmGBGEm81ZQ6cGSbmHkH0QR3mGLIqSaV6Q
         /AbMCaYQ99MTQW/Kl8NrD4FtaqiBZRwwwDN+KjyJpzIzlHUwRdFh+Yk1vhaxtf134TMy
         MfnRNKi1pv4khZndVyg52LUrpUHiHa/gjNGQFW3WHKWjWvAUQ7Bk80vhkW4tD14luBFY
         fcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=x7wKGflY44OEBE+jN9IIUwcJUt8jq3l4cmhNO6IpQzs=;
        b=bhistjxH9lJHzjQasHb3KTjabkDS6Hz1DZXngBuHhx41Uz16jcQZD/eKrbX+LHEs5F
         2FT/Inx7gNDkfBlyMlUa5WSmqMVyWTzPx4rSVO8v1we8RaurNlZEmKySwFGko+3NgoVB
         cFLLDK1yzwV82c341nhyGqoMSNCsM40vzKnFZ6dHAlsrHcn7o4nhfKuf+VoiMFddiFdg
         WmIlmE4Ho7sdhD74vzLqY/Mc2fszJxk6SUCngYzNpUJD5DaXYPjPrIhuj4XR7pguFIXn
         iz2BMeuIYu4jIx60uqd/19/Yfjf7HeVDtm1qoQ0Nf6IvRRFwaaWRDbFefoVYyESJzWLB
         o9rQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=GzAU140C;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id f16si172528ljj.3.2021.08.14.07.38.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 07:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.227]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Mh7qL-1mRkhJ1LGb-00MJJe; Sat, 14
 Aug 2021 16:38:36 +0200
Subject: Re: [PATCH v2] ARM64: Only init bootstrap page table in master CPU
To: Dongjiu Geng <gengdongjiu1@gmail.com>, jailhouse-dev@googlegroups.com
References: <20210814135557.13135-1-gengdongjiu1@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <5e9b29de-b93c-0604-40ff-dd29bc47cf09@web.de>
Date: Sat, 14 Aug 2021 16:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210814135557.13135-1-gengdongjiu1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:WdShsp4XAEbrl+5ja48T2z8I6Rb78U1XHJSPlRkbWnBvgN81LQw
 akcoPMv0Y1LaMxBrIYkZzJWP8ErDUNbX2LI5juUa7C7uNwrT9KGfz2P7EWBM5QXMIwWUk8q
 KDWj386gpNwXlxNN+vC5SV5X5UP7krFAUQLgQPtcriFVBsdTVEcbAU0SLs0o7uoPl42Qawn
 C+q2MmCV3nyqERRdcSeKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W+FFDJ62z8s=:m8cRJOlKcgrt4Qu2LpfZXT
 YUiPe8m7ja4kfAAg7aezxL8ZIpju/gVUReY28arNolBU3XVcUCaOCHiDoCwLWfdaNClm4SQm8
 usnCd06oRsCZAxAuB/7uUVqwmfR9IP2M/8tXnjt4XVCtbOLbDMLNTvnVOrjT+bKaRPEGTxto3
 0OKtoh4iFHZ543RTobgGDAgvvnhEUEnQha89ZhlNgGTjxLrCJtpcYbvtQQPuFkZMIOebqshq7
 sQN+XqH5n96ItD37zZbFoGt4V7zP+44tP7ejo/CYTdHaLhcU2ZSIQoXvZA8tA2+/pA5k2zM9f
 odl9//beDc/fMoWpPF4A53LwvejfeSFq28xG1YZF+HTcnIpyisKEXPuQSkjTq9/g0uRCFDD8S
 +qEMI+X9ZtAYYvKtealV2wGWdJEqvp4K8c2zhSD6Wl83GnjJpFWMJxnbxfjwF1K5WPTc9ukAp
 quG1xozKTxQhHmLNvFZGk7Olr4RLoGH9wl7JIVfgbNj9nlCLD1IjMcwKQJo6hg0qchv8OFeuV
 t6Y+PvZqP/O5Np4mh8PgtTo2J5l1gsIgajyadMUeo2BxdlvFtpM1dLkdBuxePtoLPZSJfFr8c
 pNErWqGVlS8F/LIws4xaB2ZDWbnLWlrmR3fptBRWAxJI0jwbLNqM69wGjQGnei5R+DyMAExL1
 PtddAfk7zuXN4N1Bl3tSfm0RQ06A/7BXOGtvPXOGVsJLys8ZKCQy9XVONAw1NgVYE6GEhMWC+
 Yc2FZxU7JvWh5c18YFuio2hnXEAnlBzTsCL/CO38hkZDfiiu6PNLrlq9cqcxdu5ddTTc+SR4d
 4SlPGh5zdPeGf0IG0SU0nOZB1uQGiDxV6fXqrntsX3jLDdQtAR2fh6S4hslBDRkz/08EgzpMy
 dpFYEHBwyR9dpM5FTkHkFHJFYWon3YjbRMFwdzP0QF8cDvg6Kp0E+rU+ID7C2ywQbXP0eVyMt
 DH4GJ5JunNXL7h0zCRLIC1XDw/WDPD6exsrj7wKM0iRhm/AaZZCv2gQCca7oin4f+aTMQDjFM
 C99+Y+nNOazvroaS4Ga1V/9+gj+kMCQDp79uMCo9YbeGBpTJXc5KpqY//9veeDXW9bGJ/2g3e
 ZzW5FfdbSNjsH25+RPDleWfZX4OZJHE0ukQxbaqAVTk4Exe4fQEEN/EGQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=GzAU140C;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 14.08.21 15:55, Dongjiu Geng wrote:
> There is not need to init bootstrap page table in all CPUs,
> bootstrap page table is only for boot, when jump to C language
> environment it will use the formal page table instead of
> bootstrap page table.
>
> Init bootstrap page table in all CPUs will impact hypervisor
> startup time.

Did you measure this?

>
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
>  hypervisor/arch/arm64/entry.S | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index a9cabf7f..69af05f9 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -22,6 +22,9 @@
>  #define LINUX_HVC_SET_VECTORS_LEGACY	1
>  #define LINUX_HVC_SET_VECTORS		0
>
> +#define INITIALIZED_BOOTSTRAP_PT	1
> +#define UNINITIALIZED_BOOTSTRAP_PT	0
> +
>  	.data
>  vmexits_total:
>  	.quad CPU_STAT_VMEXITS_TOTAL
> @@ -29,6 +32,9 @@ vmexits_total:
>  vmexits_smccc:
>  	.quad CPU_STAT_VMEXITS_SMCCC
>
> +bootstrap_pt_status:

Let's make this a boolean, bootstrap_pt_initialized, then it is clear by
itself that 0 means uninitialized.

> +	.byte UNINITIALIZED_BOOTSTRAP_PT
> +
>  /* x11 must contain the virt-to-phys offset */
>  .macro virt2phys, register
>  	add	\register, \register, x11
> @@ -120,15 +126,24 @@ el2_entry:
>  	cmp	x1, #0x16
>  	b.ne	.		/* not hvc */
>
> +	adr	x0, bootstrap_pt_status
> +	ldaxr	w1, [x0]
> +	mov	w2, #INITIALIZED_BOOTSTRAP_PT
> +	/* Check whether bootstrap page table is created */
> +	cmp	w1, w2
> +	b.eq	1f
> +
> +	/* Set inited status */
> +	stlxr	w1, w2, [x0]

This create a nasty race: You declare the pt initialized before you
actually called init_bootstrap_pt. You need to reorder those to make it
correct.

You didn't notice the impact of this race because you also didn't check
w1 being 0, thus w2 actually having been stored. If w1 is returned
non-zero, you need to go back and re-read the memory until you had
exclusive access and know the true value of bootstrap_pt_status/initialized.

>  	/* init bootstrap page tables */
>  	bl	init_bootstrap_pt
> -
> +1:
>  	/* enable temporary mmu mapings for early initialization */
>  	adr	x0, bootstrap_pt_l0
> -	adr	x30, 1f		/* set lr manually to ensure... */
> +	adr	x30, 2f		/* set lr manually to ensure... */
>  	phys2virt x30		/* ...that we return to a virtual address */
>  	b	enable_mmu_el2
> -1:
> +2:
>  	/* install the final vectors */
>  	adr	x1, hyp_vectors
>  	msr	vbar_el2, x1
>

The general idea is not wrong, but the implementation is so far.

However, I'm not yet sure how much this will actually buy us because the
secondary CPUs will now spin (if done correctly) until the first CPU has
initialized the bootstrap pt - rather than re-doing that themselves. You
may only gain time if the CPUs are initialized a little bit time-shifted
or if those concurrent writes + dcache flushes are actually slower than
doing it only once. Please measure with at least 4 cores!

Thanks,
Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5e9b29de-b93c-0604-40ff-dd29bc47cf09%40web.de.
