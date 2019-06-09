Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBF4X6TTQKGQE6MI6S7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BF3A5EE
	for <lists+jailhouse-dev@lfdr.de>; Sun,  9 Jun 2019 15:37:28 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id f24sf1352660lfj.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jun 2019 06:37:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560087448; cv=pass;
        d=google.com; s=arc-20160816;
        b=FaxVPNBQtXIJPKKP0edRa0i5v++bN//lAJnZ0tKyrA/rF4vmvCohhFV1Wnt101dKKs
         PrcOvIPo1YOhI9vbVpQLmiaoZjNzawxMG7a1G00zYZoN+hLn/KvSE7L96TlM/2pNHSOW
         QYrBMmNCuJ0klY+PavGXvNSsI50CcwrjhctiGkmNvIAK6rTWBl6uKJvGfx5Wrm0VeYIk
         C6dCgS2O3WxsThkRNfNsrASJiE6+cHw+GLCt0RACWqAaZUx1DLZvLSiDVpaFUeHJh4u5
         G5mXB6TaG3f6NNobtShAA7qmI/nNxryMxNSDyqdXOk8QbR4RXVYgS7HqlbTlXhvadB99
         1snQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=bmB+FYv6b1SylriCeaeJiWaD9Bh80bkAkhsIBJ6HlGk=;
        b=PPjCP3XpFX0Vcy2FWhanR0tTsE1ogCRgkDwmaRKpYGT4vS7TF+nOwdBln3DSaN0vS9
         AxcCoflwLOgAvXknrCxbSKnF3zqWC6SjaH4DBPMveNy6IoKfYepCscpV97X5XTcOcZSq
         5cbaior14jzWb19FFFGI7ZnlDpP8T3rdfQm5SORSuxB134ICX78gzCohOFWWXU+gIlIz
         uTRXHuYcMptbBvwwx4XLZ6flsaHy04GL9lmMqCnTzlCMlr9eD891KKkqrTrBbMckM8me
         vEcKfBeVUahODpZoACx92EGCEfC/9NmGvcctYcyvyQkb/eMsdqlxcU64MRWisJf6W52Y
         90rQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HFyD8Ud1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bmB+FYv6b1SylriCeaeJiWaD9Bh80bkAkhsIBJ6HlGk=;
        b=DOaMfRlZz/sUW20HeiFu1F/XmeEf93xx4YKqJ2EAtsVnu4OLCNFBNpSFKCH7TbBR8g
         E47sJ2SjxiSRcAnvC/rio8TgYaEsavQdN6UdfcpRHpAe3Zxs0/bSG2JThnrFfBmfZ0aX
         N/pKtDS093F55zN4KiUtW8jIFrB8qe3M1zmtQGUq5XLFcfUOR+fWbvGZ9a8Rtsyro9Sh
         Y16kXo/y5mFrA1WyvWHC0tIxIE63jwZ+gDmivNe0j1NcswDz2W4D0/v6EaOOfSwAzU1+
         YiWdaC6EM32RBXE9+v+QpHL1LjVakFUnzMdezlk4zdsAHVpCPaO6de0P3u9rdIbKKO/E
         FFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bmB+FYv6b1SylriCeaeJiWaD9Bh80bkAkhsIBJ6HlGk=;
        b=tfSIts4lilFyC3VCWy++8+9BTYrCh0jc5ywsx0pSXOwbYP59qwREbjyWj5+RME9U5G
         2dBI9sF8+fkvGmZUteqN8IbiMzQCIn/2a7bYRC6rhEXr8wviD5u4XvBUn0u5Xg7C8oYC
         M2BFjgEAzGyJFznGkmmJuoc7rnv5gdIdx/wC75h9HR030oMzmnRNrRAzqFfRLiUq0YVF
         YixsgLXW6zbNFIjU9/Pouo4qBCxCt4PmmPc03W8xbAdj6V1ANGVKm2Vb+tl81IaRnq6y
         Ftj35C96dhrJ7CjjtrO3oXyQVKWpXdFgu0XYpIVmEb0wQcuTqIXypZcLKlLGfspY4W+Z
         sb1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSZWRWvOkG5oSeiiw5djxXHnoiD2XEf/wvVMrz+/03wKkaNJkd
	4BwAyUp1eEh6aYAWQhitn7E=
X-Google-Smtp-Source: APXvYqwNKUpNOkjqD/YWPEdHqf2xMt/Z5swKkjbmsyj4w2X0wTOVyZU+4Z7+QwNiKUVZpctg7JMAJg==
X-Received: by 2002:a19:ccc6:: with SMTP id c189mr530446lfg.160.1560087448412;
        Sun, 09 Jun 2019 06:37:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:998e:: with SMTP id w14ls56506lji.0.gmail; Sun, 09 Jun
 2019 06:37:27 -0700 (PDT)
X-Received: by 2002:a2e:98d5:: with SMTP id s21mr15224071ljj.142.1560087447504;
        Sun, 09 Jun 2019 06:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560087447; cv=none;
        d=google.com; s=arc-20160816;
        b=BXB+DuxfSOaMrqjZs9xxPWc54Vio1y+C6VHS5kdDJ2lLQRfFmVOHy14tyfiDtmyRLt
         Y+4uNtRR7IMO5sQeuZTS5W0ydAebGwRifT2zYgmA0XJtMYqIuAl2He5CcaSCbz1sXhBV
         5uHi16mj3/pZWfL4F1DJz93WO2lpXoQgQuX0/hGssTgDf0bSfxC3BxFWn5We8VKinZ4Z
         tbrTwcwrZLpWQcv7BoBy3LZnN21GSTmWjHlYbF/SrgrSNBCIKmyz2XUN9bE4lxqj+DgT
         HrtTfjejoDMi5qsnmf+TAyMyiaWcu5KioLEDj2BU6izQjwHAJEXL62kAsFCNq/paR3PM
         5UqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=8dIGR+EuY1IXmTSHF/0j2qVC/K7SO5RmG5i4J0zdDaM=;
        b=FpWF575a4n+hdXDCtlGNwTXr/bCaK4+jESxmvEaOkVCPa207OCI6zlqh0zkxZoQ3Tt
         SBIabstyVhtRke2c8bQ6yqiq6skO/1so6K9tQtNgpSMjrLGM759jejBaGNzAkRVv4Q3H
         dP67sKsvw84qqczX5ANv3RfoaS+KEz/KdGlRsAQPbW8JWxaA16Fu1Kgp6z0D4EFMoqoU
         Z/zqW9M5FzJlue/YDAjacBSRNgF5W5+wHdvea8F8nKh8neQGewevhvg79//9FMRuUyeo
         zEZUSqb4s/Y0z3MH4xU47ZcFDRTwLJTsZjqRx7RPis7eJlvfQqyycJJKbWJWN3rGsQQq
         wVaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HFyD8Ud1;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id o20si326706lji.2.2019.06.09.06.37.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 06:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [10.112.120.183] ([193.96.224.60]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUEsc-1hADhM2imY-00R1HT; Sun, 09
 Jun 2019 15:37:26 +0200
Subject: Re: [PATCH v3 08/13] arm64: Initialise SMCCC backend
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190103180651.8171-1-ralf.ramsauer@oth-regensburg.de>
 <20190103180651.8171-9-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158@web.de>
Date: Sun, 9 Jun 2019 15:37:25 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190103180651.8171-9-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:TBxAVMsw0BEYV+hAyxpVrbiCHTg516Ur2G5LbdLx4IQQqaQFuph
 yH4MZID1xHhEr1fdEPkhcvDbJU8Tvl0EwcbMsIfNST+/y9Necess8N3hfFlhdFHeQiH1C47
 0FgNcml8hE9zB4XaSShJbSBQ7jh5lA9BM6c5ZxGhaFtaG/wMOtzGxsS3EGqIyAZ8IxKb9q8
 A/Y1GfLKHconAkQCz844w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BMgbdpzj19U=:CgCIbk+ShAlwbZMP2ZBhkk
 h56e7VfcRF8ORVW8lCyG3hgiNpIFaegbpvNgbqRUcA6oHDY7/Lvtz1Q5JQPauSCE/nXfuUaP5
 04UVxKi+CaT+1NkIQHlI5n9ZdYgwe0yw892hWrJyqRY4iRo23oYH5AyStYkGTvIINuik+f+Pk
 zCZ57WdAp7Una8ptGLJ/OmgD4jlClnScw9VFXr6hWPb+qFfTmcJ/5kGH93JXkygs82Mu/1INJ
 bof7AbwTIBMFNxsgLxSo2/hKTBI0V55sCLqNVqtjnOqYVtYFGckctuBHI+d6oyPHFBHbOkBl3
 8Bhvi+Yqg7bOtl1L7PJDlM/BLUtk/wvXkT1aJPBRRowNEUMaWWa9exnucKWmv3kDqWTsszoY9
 T2hVGAJVQOxSLDy19q35G6MBukau69E2pakt1C/erjGG6Ug8PSQSUcrfgApVGhL+2CbOuIxY6
 KbMC+wcHJgptwfj+fwqAFEuOkQsE4AV761NmBftZAYDIZsYeTdUJeu0s05GDtoXcu8IkkH9/j
 bSQPaGmzsk35gXdzM1qeRLaYKcrWBLU3imxzR8Yo3oSpJBOAIT9VlqE7hAaf+qt8A0/M28Rqx
 w9nYZi0D/fcC3RD352U8+bC7XG0ryqEgCgdezPlBtodylIqaM48CSrw71dwJVUIN6pWxR16Ce
 +xxwGYUl/e+lEMJP7UQJWsz+MuG0Osm+4uYU2BAe8xOcmF9cbNaKXV8uNswNeadlAXDbTsD1L
 Bx7uXiCvXigYrjXJ/vhMK1xMN9oz0pQCY2U7bh5juFVcnWmanXCAXbonKeZG9MIIQPGBYQbU7
 3UrvaoqWL78Fpjn0DUJKMaqBoiK121NMlSODS7REtJN+y0CQqTZQ/97BM1nGSNH60jDZN5xcM
 aAQSAfasK0gMILH2ROMmchnvk6BQEHrLuoVu3/9QaSOJcMBgbj1jnwgAiPAZzOZ2NfHlvxTWb
 gcH19bOgiVvZXZxUMxLcGGWisNKc5Gip3oMRcuk/pdN5RTzI3Id0w
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=HFyD8Ud1;       spf=pass
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

On 03.01.19 19:06, Ralf Ramsauer wrote:
> by discovering its features.
>
> The first step is to check the PSCI version. Don't even try to do any
> SMCCC calls without having checked the proper PSCI version (current QEMU
> horribly crashes).
>
> Probe if SMCCC_ARCH_FEATURES is available. If so, probe for
> SMCCC_ARCH_WORKAROUND_1 and expose its availability by setting a flag
> inside the percpu structure.
>
> The availability is stored per-cpu, as we might have big.LITTLE systems,
> where only a subset of cores need mitigations.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   .../arch/arm-common/include/asm/percpu.h      |  3 ++
>   .../arch/arm-common/include/asm/smccc.h       |  5 +++
>   hypervisor/arch/arm-common/setup.c            |  3 ++
>   hypervisor/arch/arm-common/smccc.c            | 32 +++++++++++++++++++
>   .../arch/arm/include/asm/percpu_fields.h      |  1 +
>   .../arch/arm64/include/asm/percpu_fields.h    |  1 +
>   6 files changed, 45 insertions(+)
>
> diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h b/hypervisor/arch/arm-common/include/asm/percpu.h
> index b9278117..4b37e1be 100644
> --- a/hypervisor/arch/arm-common/include/asm/percpu.h
> +++ b/hypervisor/arch/arm-common/include/asm/percpu.h
> @@ -15,6 +15,9 @@
>
>   #define STACK_SIZE			PAGE_SIZE
>
> +#define ARM_PERCPU_FIELDS						\
> +	bool smccc_has_workaround_1;
> +
>   #define ARCH_PUBLIC_PERCPU_FIELDS					\
>   	unsigned long mpidr;						\
>   									\
> diff --git a/hypervisor/arch/arm-common/include/asm/smccc.h b/hypervisor/arch/arm-common/include/asm/smccc.h
> index 563ab9ef..6c490fad 100644
> --- a/hypervisor/arch/arm-common/include/asm/smccc.h
> +++ b/hypervisor/arch/arm-common/include/asm/smccc.h
> @@ -12,6 +12,8 @@
>
>   #define SMCCC_VERSION			0x80000000
>   #define SMCCC_ARCH_FEATURES		0x80000001
> +#define SMCCC_ARCH_WORKAROUND_1		0x80008000
> +#define SMCCC_ARCH_WORKAROUND_2		0x80007fff
>
>   #define ARM_SMCCC_OWNER_MASK		BIT_MASK(29, 24)
>   #define ARM_SMCCC_OWNER_SHIFT		24
> @@ -33,4 +35,7 @@
>
>   #define SMCCC_IS_CONV_64(function_id)	!!(function_id & (1 << 30))
>
> +struct trap_context;
> +
> +void smccc_discover(void);
>   enum trap_return handle_smc(struct trap_context *ctx);
> diff --git a/hypervisor/arch/arm-common/setup.c b/hypervisor/arch/arm-common/setup.c
> index 4cc045ec..2a04cdb7 100644
> --- a/hypervisor/arch/arm-common/setup.c
> +++ b/hypervisor/arch/arm-common/setup.c
> @@ -14,6 +14,7 @@
>   #include <jailhouse/paging.h>
>   #include <jailhouse/processor.h>
>   #include <asm/setup.h>
> +#include <asm/smccc.h>
>
>   static u32 __attribute__((aligned(PAGE_SIZE))) parking_code[PAGE_SIZE / 4] = {
>   	ARM_PARKING_CODE
> @@ -42,5 +43,7 @@ int arm_cpu_init(struct per_cpu *cpu_data)
>
>   	arm_paging_vcpu_init(&root_cell.arch.mm);
>
> +	smccc_discover();
> +
>   	return irqchip_cpu_init(cpu_data);
>   }
> diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
> index 211d6cd7..37c05b42 100644
> --- a/hypervisor/arch/arm-common/smccc.c
> +++ b/hypervisor/arch/arm-common/smccc.c
> @@ -11,10 +11,42 @@
>    */
>
>   #include <jailhouse/control.h>
> +#include <jailhouse/printk.h>
>   #include <asm/psci.h>
>   #include <asm/traps.h>
> +#include <asm/smc.h>
>   #include <asm/smccc.h>
>
> +void smccc_discover(void)
> +{
> +	int ret;
> +
> +	ret = smc(PSCI_0_2_FN_VERSION);
> + > +	/* We need >=PSCIv1.0 for SMCCC */
> +	if (PSCI_VERSION_MAJOR(ret) < 1)
> +		return;
> +

This breaks on ARMv7, at least on sunxi (Orange Pi Zero). I first thought it was
because U-Boot returning -1, instead "0.2". But then it turns out that the smc
itself does not return. I'm starting to believe we do not get the call through
the hyp stub of the kernel, which is still active during smccc_discover on ARMv7
(in contrast to ARMv8, where we take over first).

Do we support fixing on ARMv7 at all? Otherwise, the invocation of this should
be moved to ARMv8 only.

Jan

PS: This change was untested on the Orange Pi until today and my attempt to
demonstrate jailhouse next during a live demo at MiniDebConf...

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/da6e4ea8-5b0f-c3c9-d2fb-3dfed845f158%40web.de.
For more options, visit https://groups.google.com/d/optout.
