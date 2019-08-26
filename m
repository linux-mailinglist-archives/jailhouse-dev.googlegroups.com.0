Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNFHSDVQKGQEE5S7JQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 551639D4CA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 19:15:33 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id r9sf48651wme.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 10:15:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566839733; cv=pass;
        d=google.com; s=arc-20160816;
        b=onye9sRHzdTzv0G7LM3WYcfd+Q29Wn7FwA1ColZKpbvNTmf2mewLJ2an8mfxKN9KVK
         YtfJdLj6zoKgqPmN1P9ZR8J98TFKT1G65h77Zg36+5jq4RDKNKcTPED88rw1DKBN1r0u
         1TqSvb3G6gq/o9mJ+Sy5+Ch0vVDzaRrrPlex2HsY6GiSO1ZRV31m0u1oGBnh4tcNiyO6
         WEatPhBYp/ORnQzcU3RKHwyeD5bjKqkgxB426BhAIeBS0AV5TZMrwsCJubbZxnQmHkDA
         I7Bw9h15C4eqPJNp0yVeWjbJa7gUIB1074ee4taCn6qPTgUUL1x/JLMjD78XC/VIsdiA
         N6ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=IFSRlLTuQNqCGzy1WqoXUBNZAuPa/EppTbTQrBE0oqA=;
        b=nRaWNFdJeq18NErTFgCoxKcMQjn2dtAnof/wBgBXnUVjOtmd8Mstqoe4WPprpcdltH
         x6oL38MTbnFqAL5NkOI7JjqMD39gIV1ZYWdXAJGM6s6F+12Pgmz+0AaNcihxMGHGB64H
         wwc5y+2IcM076pbmh+injHGRCZTOCI8J+JIyjIQz2R1cw/AW6bBp5cBHbT/H4JGypBC6
         7uEpfzLVxhKAKs+0SJEUM6SQRPhuhuD1kQ94CThWaltvqQk6QgRjhVbm5n3DlGa7cLDv
         ZPD8VP3pTt/U5zTRDcRj7dg3DfnGkQLVZRS1C3AtMgHhu3KMVGD2/F6kV9FygSKfcZxt
         LtWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IFSRlLTuQNqCGzy1WqoXUBNZAuPa/EppTbTQrBE0oqA=;
        b=TfCysngwYDlQQNcpeqLiLFweu0a8bx1jJUEkA9opTwMypnloEkUcTGPl+FnyNk3i+W
         DcY/s3IznGB0tjeiV/HBYC5BlUlxygFnlWQy2xgPx3qn1Gb/ZL25acQJ75P0JnkRl7Fv
         iYTeWQJA4+6PYAcZsKXoGzRrzdGZyxafjgZH+m3bYVjA2ujcihvzlOdFelXn4BbdGOJX
         OHddsO9MeWRHrgERGnAjCnnCRKFyL3rhlfjzLNjt1au+IgdneECX3Wq7nTAMe1fw6Aiu
         BkM7tHGTBDXKpdOmgnqc16ausymisMNP51cFlSdx5+pCnZiTPlZ1ZmEdPvmK85RqSVfU
         zmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IFSRlLTuQNqCGzy1WqoXUBNZAuPa/EppTbTQrBE0oqA=;
        b=f/j57HljGU+YlXKMrSvGuOD74bBF4WiTZYVfsN/P9o/TCx0PcVYz4nf0CgAechiMp+
         v5mPOrBO/N9X2XQe5ap2UZD7mnLMuF/0L5hIPoEtdiVCpYRRxXbHPRUOesqwLmBKLwc5
         0u+fRFNRrzuJ9AWJ3m7BEfW+nGMX6DXU2T41vSJyVYVP7jZhilrgLfdNexu/WCdpdTuI
         903mg26ex2tW6WXcln9PHcVJEJTsQpqGF5iKLX4iekcReL51opNAlRhIoMLS5NC3Pp7H
         nTZBHkuIdM9EWCGbpErMZ3dP9PXIFrj70qrlcRMtHMnxC8HzzGR546MTUcp+L/qHK/Tz
         y+RQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVaaRxfbsmfKtYAcNoe853SxmGHlWzDn4CC1L1zi3CtXOGg6bRF
	2LcRrGp1pEUeEztrHUtoRaE=
X-Google-Smtp-Source: APXvYqyT1UkVPcyGahdKnuy2y4IRqkcSVvEGSb9XYMvA9yc8x/HbjfYB+I7j84ZuGTtCtGfBFNtVTg==
X-Received: by 2002:a7b:c758:: with SMTP id w24mr23580919wmk.143.1566839732980;
        Mon, 26 Aug 2019 10:15:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c411:: with SMTP id k17ls6546111wmi.1.gmail; Mon, 26 Aug
 2019 10:15:32 -0700 (PDT)
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr23408229wmj.58.1566839732314;
        Mon, 26 Aug 2019 10:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566839732; cv=none;
        d=google.com; s=arc-20160816;
        b=z/yn0gdpTK+O4nmrUO0jiKUzfa9LokoGlm+srpA9JBZrYYmZ4CZNVfRNG7vbDaPbn1
         7FuHo/8qcWm3jZaeS3HIu1WG84R32SICbduTFSJFD55RiaXc2ocooNFfwQvKCey5EWQl
         KhsC8P4sS/jD0pjOXwNymwhlvr+lsdPCNZICIl/IF+11BTxw+tXdLFAOvJKhO2fOPv8r
         39ARusYMrFHgnjPCREIH3MmbC7aOmsyjnEO2Nb/u59fa6+DUcdt/hfaeqN0NY/XTBSrA
         I1/hCfhCoSpxtAyB7HmhZ8ryh3AR3fPYESUXtOGiCn3psEncfbDY+5u6n6z9vqNZrTXB
         P1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ZEoiY8ZkQ9iH965ZhFI21jyUUe3pGeJ/6kf1qYbTLv4=;
        b=DNUnwkRGjW+G3tkWW4Ehgj5Q4+Nspz/iutvGgm9G1MQskOjNknAAq2XAoIG3qUTPHN
         NEzpEg/Rp8QO9hq293zJmBO56BMuN3P2trNKDPFZg5wngYI2BqpLt+bpkp0vIBrF52HE
         P1vcN1ZjtyjlIIKNX0Xn9JqmXo5yqNFoTb8GQXE+FNT8/wkEmMuLpLGPzWT0b5UXbGiC
         fQepGo3NWVG6FdYQKoxeZpj5HFYCefFFWFw53ywQ/cLhAIMBpXZzWW3OPcZnSAt7pJjS
         ndNsjx4RG3Bphnymq2AVGWZVztEjC8NHKiQpD+g1rR8FzFh9RGpoioKoV5CSuCFF9hwU
         Or0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id p67si25019wme.2.2019.08.26.10.15.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 10:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x7QHFVTw011773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2019 19:15:31 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7QHFV7k016001;
	Mon, 26 Aug 2019 19:15:31 +0200
Subject: Re: [PATCH] Extend page table size for arm64
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>, jailhouse-dev@googlegroups.com
References: <3701F3FF-FF75-4950-B527-B0E6241B2E19@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6914f10a-549e-095b-797a-3c9efa89abbe@siemens.com>
Date: Mon, 26 Aug 2019 19:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3701F3FF-FF75-4950-B527-B0E6241B2E19@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 26.08.19 10:05, Oliver Schwartz wrote:
> On arm32, the index to the page table is 2 bits (bits [31:30] of the
> virtual address). On arm64, the index is 9 bits (bits [38:30] of the
> virtual address). The page table must be extended accordingly.
> 
> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
> ---
>   inmates/lib/arm-common/mem.c            | 3 ++-
>   inmates/lib/arm/include/arch/inmate.h   | 6 ++++++
>   inmates/lib/arm64/include/arch/inmate.h | 6 ++++++
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/inmates/lib/arm-common/mem.c b/inmates/lib/arm-common/mem.c
> index 8090f7b..e03e23c 100644
> --- a/inmates/lib/arm-common/mem.c
> +++ b/inmates/lib/arm-common/mem.c
> @@ -39,7 +39,8 @@
>   #include <inmate.h>
>   #include <asm/sysregs.h>
>   
> -static u64 __attribute__((aligned(4096))) page_directory[4];
> +static u64 __attribute__((aligned(4096)))
> +	page_directory[JAILHOUSE_INMATE_MEM_PAGE_DIR_LEN];
>   
>   void map_range(void *start, unsigned long size, enum map_type map_type)
>   {
> diff --git a/inmates/lib/arm/include/arch/inmate.h b/inmates/lib/arm/include/arch/inmate.h
> index 0df386c..0c4cbfe 100644
> --- a/inmates/lib/arm/include/arch/inmate.h
> +++ b/inmates/lib/arm/include/arch/inmate.h
> @@ -36,6 +36,12 @@
>    * THE POSSIBILITY OF SUCH DAMAGE.
>    */
>   
> +/*
> + * 4 L1 translation table entries for arm 32 bit architecture
> + * indexed from bits [31:30] of virtual address.
> + */
> +#define JAILHOUSE_INMATE_MEM_PAGE_DIR_LEN (4)
> +
>   void __attribute__((interrupt("IRQ"), used)) vector_irq(void);
>   
>   static inline void arch_disable_irqs(void)
> diff --git a/inmates/lib/arm64/include/arch/inmate.h b/inmates/lib/arm64/include/arch/inmate.h
> index dd1cc33..3526793 100644
> --- a/inmates/lib/arm64/include/arch/inmate.h
> +++ b/inmates/lib/arm64/include/arch/inmate.h
> @@ -36,6 +36,12 @@
>    * THE POSSIBILITY OF SUCH DAMAGE.
>    */
>   
> +/*
> + * 512 L1 translation table entries for arm64 bit architecture
> + * indexed from bits [38:30] of virtual address.
> + */
> +#define JAILHOUSE_INMATE_MEM_PAGE_DIR_LEN (512)
> +
>   void __attribute__((used)) vector_irq(void);
>   
>   static inline void arch_disable_irqs(void)
> 

Thanks, applied to next. I only dropped the brackets in the defines - no 
expressions that need them.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6914f10a-549e-095b-797a-3c9efa89abbe%40siemens.com.
