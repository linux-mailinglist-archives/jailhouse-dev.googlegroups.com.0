Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDO637TAKGQEXRM3WHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7D1AB8F
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 12:01:49 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id z128sf5536427wmb.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 03:01:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557655309; cv=pass;
        d=google.com; s=arc-20160816;
        b=H+WjySHwbmc2m8V8uTI94FdicavLB2+EGk0+iaIE0K/eZNEqGBq8EC09fxBzxoEvAt
         WNCrVIHrRwjabvpQmOLXwkTllyeWhBvmHR0QmUNJ90DdoMLd8/+1okXwOjaaV2MNdg/M
         gEv+Rc/lUCA/izc4TYxqUGQqFLEg+KDIX7bv/eF8J0JQ5+dip3vzIsO2aW2ioL4usioi
         t7t+b8804861OgpFubpOrQqoE2sVoPk4bxPW9WL0RttTFJasUyDvJDCtYG/wn1rcAqgA
         f+UuGh57Y/FMA4BhLEtUjqO8stTqOAvEpZId3OhCU4c/5KokHPeEhngyYlQPdfpNm07t
         3FNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kzJY6lVvxqMfk4nQVyzbbXpLneJ+GVu835NGsS8pw/w=;
        b=06nZaYKM+buFo6BVqiw+KTqcqBkQUd8j8pv45xrwBlBSLLCP+dShcDxTtPru5wvf2e
         yp81WqZP5kHSe9cKyMBwZOU7ooc5CEr5rA86lUbHwPV9bczlHXUAdlQFmbScdsQCLLmu
         ioTK7sYU6XJxK+yHigtjo1llSkxboD8Y2s2HLJBv37lvK8it7qlhasukUcxUvVoXmCYc
         djlCXbrYSAb9eD19YLFKaee9IpqgENIGn2HxSalo5YCZM1bKcFvh62u6DkBmk6lRL2EM
         HFYwcCdswDxKH9APXnm0h8dy8UPan5hGZGqqz7aI1dI0RIcoWP/uvD8brUELU/Mgjukt
         QLnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Mz/hqIXk";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kzJY6lVvxqMfk4nQVyzbbXpLneJ+GVu835NGsS8pw/w=;
        b=E/pXlUoKUv7nNboTuYjYwPjGJKL6Mxhhpr8eFkNhKg82W7naCWLaH4Ksticpck/3ZM
         cWGWozPX5VNR6dxPfxvN+JuatMEU49NEQR4zW92LXjSU8pRSenhg4OIEeFmNalmx3QFg
         I+Y3hSROF3fKixRgETQgv2wu+OSV1VBZhfLb2ZiF3LzW1dV67iOu8fd0PEqKx+2Te56N
         ZBy80PurOtt0IfM0FMccCtq8ElvlnIItjv/cgxn9WB7x3T9U26pmnuXZ/68fR4ds/JG+
         bqGimzOWy5ieHqBYvruQjzzIXbi0E6mSLeSbFPakfxdXDwJbvr4oEcloBY54/wlr0vsL
         FQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kzJY6lVvxqMfk4nQVyzbbXpLneJ+GVu835NGsS8pw/w=;
        b=nG1rYD36/EiOpQQgz/CtBulDRkYxG37DdRoSddLr3aYOzkhn/fCQx9901ZMoV5hqsD
         nCVHWsqBHdFQeSd1DXtUX5NtGhvHYeJ6bQo+gGIky2ojHBXPwxev5huAEwzKrQz9UE8g
         2AVcKqbVf2y35a/nUQJZ+sxxoe58qjfSjnVEq24EMOV0RMoAdUzx3TdSsSjlf4nxSDWy
         QttSAbkVkYNj9RyQh6WirmvXPtonRGA1CR/xklFUtzS0VGdZTzDSECfQrBq5jcM3eGJM
         eTypYUKiaArGUwJQZRpJY9Q7UZJqSsY9blOOPmxIxyrvHCzGyYCrJ6OhPhW4nrkJ66ve
         abtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPcfUNo1I2NBUXzesCBkP2H1xyYu83UZX8NRLX11LHfsOk4hJj
	dqox1Xb8f3Y2aSd8g8iUknA=
X-Google-Smtp-Source: APXvYqyQNWISZLAXI3jgPKq63ffrZthT7uMDpWm1764ZOyAV9HwK0s8P/4Q/d3fnRqudGOe5iLLAoA==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr5082078wrn.222.1557655309386;
        Sun, 12 May 2019 03:01:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f507:: with SMTP id t7ls2790253wmh.4.gmail; Sun, 12 May
 2019 03:01:48 -0700 (PDT)
X-Received: by 2002:a1c:c8:: with SMTP id 191mr4671046wma.6.1557655308903;
        Sun, 12 May 2019 03:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557655308; cv=none;
        d=google.com; s=arc-20160816;
        b=fgfvQQg2V+gP0GvyP69hBWP21QqP6E+Pb6kKb/O+cU0lkzQ6v5GTGA7Trn58kaFC1y
         1egYy8ApQg4qClFw4SdfY+/EgAR4m7UHQA0gC+ommg40kHotb0A1o6CMLplo8l3QLdNO
         iFPz37yokOwrudqvlwI0v4x+2dYT26R5f4IqSj4QRwUql7fnR12iRVgiqMrrtPis+pqM
         DlYhgkAV5yjNQzYyxxtBIP3Et98vZVryhEm4LOXdCK7zIl8hvadx+b/rlLQSFlB8/jBx
         USbVOz0RfIp/rIptfUtNSdVOzNdVIjkTKEx0rLuGbAdmdIIjK2kbRIoq1hWDUFSc7X/T
         o8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=WoetJCehWpA0D4icmG64BkxuQkhyic6aNJkCGfpVElc=;
        b=l91BRFkx5mhCLM/DzaYiDXiTwIXF9ZaJKxuSsJeU+6u21P9h2pXYkgNv0d1G7C6cOh
         RIjdqVv3F9Ij6fjHgEGQhxcLOAV7rbCQDwNP06i7aHlzVlO2CQUdsGUUiW935Qq2oMgq
         tbV09k8PawgmQ20RwhbciVodHEZOA3yqGeDv3vo3nup7Y12xm1rjU3MRtdBdwgOKIIGY
         cSfUceQp+Uu0qp99T/WgRbwC3Pq1xm+UkE95q6wcju+gjYuBpIqGqFIASxRXBVpGJT6W
         +lWLdt2kg6g7BV5SvJzEzGoHJgXLVKt8jWLcrdtnz83ooFeeamhtNfrqsnFmL5rnZh7L
         /cuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="Mz/hqIXk";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id h5si2411162wrc.1.2019.05.12.03.01.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 03:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lud96-1ghWcG1bxA-00zrQ8; Sun, 12
 May 2019 12:01:48 +0200
Subject: Re: [RFC PATCH 4/4] inmates: x86: activate SSE
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <9e20c6a4-6e91-a547-8040-1e9fbd9614cd@web.de>
Date: Sun, 12 May 2019 12:01:47 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:JhFOFo7sLv0y9h0oybubX603TSAvLbicx2e0W2JWuGpwb7eZUSc
 dm+cwBRTqyVbj3RRTvimXwRBt4HRWkYvCd/hYOyChvGS3D43mHVbL2DkKCcc79v0XmV/Vqw
 kaCkXy7RBKo9/g5s29BM2KVaT94lgBxpi9cP30YC2Pl0gk2vmCGXXgzsYZ2ix2DgYEZegQ+
 JicUav5I10pxMHaT4RrPA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n6GfZAorVp0=:ApNnIX/3Z6x9j1F11PyO9h
 FX0Z2yow8Bh1ARkhh00CWjEbB4NCkkAWB4EUXUdDfdVI1akn6gihUDnuuOZgZ8bhxyoU9bLdW
 kPRtagT1NPk2sunNozLPWMqvNZSaS+hebv76Sp1rINfv3M7NhvQW0XWR6aBbL6eXFntOcQG65
 mOh0otZOPAYGvBJwmzqjZRdiYxxlvL/00Dh/LsxRW5tUStXS/QfXBUw1KGcmOIDEZMsF/RAl3
 GHv9MLlhQVXGlat//9rlXdR3A6XAjo8pfe29CgDlQFEbz7O/LSpgNeIUBmt3GKbqq/4/3dQmY
 EkV7VMARl9Ao1PgcJqpdB7TVsnmY0y9VBvM/WEhMgyuVagHN/cGYHZgracRus6GNmlOx/EI0U
 9XtmKwp5Bb2L9baOnHTttE0zh8qymtKqPE1MakFqsS4tQ0sLYWkDTekXZYyVI7pQkyRlq+S8l
 s19SaguNW94QnLkgxIQ0/FrkrH/N9n+v78r+4iPo50FwGMUvhxlgflAq8C23W+8coGf8gG1bO
 lzC/22nFhUWHBGj6p+ghllZPsYVOUMmqgRKVXSNBjtur4S1vR6MImuMlUEB9F2CnExGiRRkrz
 wtNtCTCj/63yjbDVebxVTk36ZuKxCUSIXFEUq1P5rHClm0rMaWTwzTdyYD5tDKhAxnRgyjpcl
 wFJOvJiEqb4V0m5yxvPbxyWMACkvYcH8OVIyzZ53a4zE6KMpuQzR2AhHi9dO0NGlNMuobLe7x
 j/uDJMCJjbtF89CXhLo/bU9iA0D9PrS2RgZPJX/D9rxB/IUgFIq2I2vga4l5N8ES4nQN1tZ/x
 pymwR+zqhPluuH1wFoszQS4Q++i/CekVN3027RI538g9URTOp1RUJAeVEYD7ErAmJCGa5TjQL
 7lDOntmUnZRP/iY7kfncBJ1v3AI395Wb7Ep3GSYj/O+/DbkEB6ksQcvKjIg6MfbzDem2lEvtP
 W9p8Gx9s9tA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="Mz/hqIXk";       spf=pass
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

On 09.05.19 23:07, Ralf Ramsauer wrote:
> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
> hex2str or cmdline_parse routines). Inmates aren't able to execute those
> instructions as SSE is not enabled and will crash.

Actually, this not only fixes automatically injected SSE instructions, it also
enables their broader usage, specifically when doing floating point stuff. We
should add a test or demo case for that.

I addition, I would like to see AVX activated as well, where available. For that
we also need to enable the corresponding bits in XCR0.

Jan

>
> Enabling SSE is the same code for 32 and 64 bit x86 and straight
> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
> SSE is not available, stop the inmate.
>
> As we have a common 32/64 bit infrastructure in place, and we need to
> enable SSE on every CPU of a cell, simply place it there.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/header-32.S        |  2 +-
>   inmates/lib/x86/header-64.S        |  2 +-
>   inmates/lib/x86/header-common.S    | 12 ++++++++++++
>   inmates/lib/x86/include/asm/regs.h |  4 ++++
>   4 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
> index d789e5f5..f5fa258a 100644
> --- a/inmates/lib/x86/header-32.S
> +++ b/inmates/lib/x86/header-32.S
> @@ -74,7 +74,7 @@ x86_start:
>   	cmp $SMP_MAX_CPUS,%edi
>   	jae stop
>
> -	mov $0x01,%eax
> +	mov $X86_CPUID_FEATURES, %eax
>   	cpuid
>   	shr $24,%ebx
>   	mov %bl,smp_cpu_ids(%edi)
> diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
> index 2ccbd169..775cf6d6 100644
> --- a/inmates/lib/x86/header-64.S
> +++ b/inmates/lib/x86/header-64.S
> @@ -78,7 +78,7 @@ start64:
>   	cmp $SMP_MAX_CPUS,%edi
>   	jae stop
>
> -	mov $0x01,%eax
> +	mov $X86_CPUID_FEATURES, %eax
>   	cpuid
>   	shr $24,%ebx
>   	mov %bl,smp_cpu_ids(%edi)
> diff --git a/inmates/lib/x86/header-common.S b/inmates/lib/x86/header-common.S
> index ffede16c..afc01104 100644
> --- a/inmates/lib/x86/header-common.S
> +++ b/inmates/lib/x86/header-common.S
> @@ -54,6 +54,18 @@ __reset_entry:
>
>   	.code32
>   start32:
> +	mov $X86_CPUID_FEATURES, %eax
> +	cpuid
> +
> +	/* Check availability of SSE instructions */
> +	test $X86_FEATURE_FXSR, %edx
> +	jz stop
> +
> +	/* Activate SSE instructions */
> +	mov %cr4, %eax
> +	or $X86_CR4_OSFXSR, %eax
> +	mov %eax, %cr4
> +
>   	jmp x86_start
>
>   	.section ".boot", "ax"
> diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
> index a004fdd2..f6fb4d85 100644
> --- a/inmates/lib/x86/include/asm/regs.h
> +++ b/inmates/lib/x86/include/asm/regs.h
> @@ -42,9 +42,13 @@
>
>   #define X86_CR4_PAE		0x00000020
>   #define X86_CR4_PSE		0x00000010
> +#define X86_CR4_OSFXSR		0x00000200
>
>   #define MSR_EFER		0xc0000080
>   #define EFER_LME		0x00000100
>
> +#define X86_CPUID_FEATURES	0x00000001 /* Processor Info and Feature Bits */
> +#define X86_FEATURE_FXSR        (1 << 24) /* FXSAVE/FXRSTOR, CR4.OSFXSR */
> +
>   #define MSR_MTRR_DEF_TYPE	0x000002ff
>   #define MTRR_ENABLE		0x00000800
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9e20c6a4-6e91-a547-8040-1e9fbd9614cd%40web.de.
For more options, visit https://groups.google.com/d/optout.
