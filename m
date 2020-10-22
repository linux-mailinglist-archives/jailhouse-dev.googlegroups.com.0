Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBB5UYT6AKGQEFBKC4YY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBC2957F6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 07:35:03 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id c204sf189384wmd.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 22:35:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603344903; cv=pass;
        d=google.com; s=arc-20160816;
        b=LpaMA5xpGn2ppQk/ED/ncw8K0QzI96Jl3+954B6sLdpnYD31qqDUdxc8np/genoIr5
         CTVJCpa3F/eJPOsaU2fRQhwzrKC/M188TmBCutsysrDfYrKNsVMgb5B1CCWHOeXtXTr+
         JCar6VKtj9dT8z65ZsdhBSk7XtfSBezTrP0K+aMeXaOCqBl6YYgj/nzbxifHp/Y83AxS
         Wb5rx6tWdq9ZvEOsbhnh3EW6spWXYf04ltCEJTcmNByCMM0+zIdIc5kZyGJzRrpCqcHE
         JWPttuV8enT3PmegstPpz5WrY41CufjUjTqGe8d/9Q9XRQsew3mUg2NOU4JzdxwUwkHl
         X7IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=eIMrxVPMcONtb6n8tykrqbxFcfTuv1/ezmqSHj5n54w=;
        b=UOUOiExrui+MUac/g2HFJ1MF4QmWThesvc+NlwsoVRdTBJapXxI0YtfrH9ZlOdQTF7
         56O9O8SLb2F/OHwak6GanWhLcMAOE6KB2EsbRK+Uv1uwknUPx014lRB/G1MS5K5zKyBk
         WBjxR5c2u80IkbOL4EmN6CfXvW/rUd/5kuiS0uNBzePYKaqovgxpnHQNIEJye9fsVpQn
         pvMc/OaWZMcQDxAlGAQCly4xgjoeL2lzzH/mea49EzZpT9TSwy1GN/vKlgTFZ+ZUW4fQ
         KlsbbDpQYZA0gYlEV/V9B6R42S/iLqIeBdtY8M6ms5vzFruP5+i0jj8D+hD73UnnGV4Y
         g03Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eIMrxVPMcONtb6n8tykrqbxFcfTuv1/ezmqSHj5n54w=;
        b=EU4rO5D64JQXzK2A7C95s0rVh7FcL3skXlqfeOdN0ImTjJlkH9w5344gRt9v5IEbsZ
         ysBk0YIkVhmy2w+VHJQxv73yDCeEIoS6d0Csu0Xq3Cl+5LKlm35WsElxLbQmDKQPLvSB
         83/iS4T+39kVCyYv9z45efuWuLoDt2YHOgWFRQAeph+TOlYhMB7t0wWjuuDddGRemMpa
         gB/BtLUlhcNY1HqLbicVlgYXJp1oZ3gkzQGwLixQXKj2CfpgIV3ZRqopKu7cEmpBu0K2
         veAJUPF1M0m7fIeP84IZmeUnBpqox7h+J6yzKWZSCfFxmi2xrXg5bbZgbPx1RT6CD5DG
         p/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eIMrxVPMcONtb6n8tykrqbxFcfTuv1/ezmqSHj5n54w=;
        b=mDdXMJgTx7/zlIcRYz/OJ5ZgE0hjXZr9GqCJPKCZEyug5HkpLLOHF8iklFMtpoosWv
         XfjYLdOThH+haJhEG67AXjPR8z/EGjKdWxAQX9FFejZFEfPORMSZeSXdPnjP7LNGKiTQ
         GwrPbVBUgP80nAaFAZSiOBiqFCVFbeJOc0Zld5ZGRLB2WRjalNT8j5tUsY0WXrjxBe9M
         3bXGwIhRr7oYCfsyqIiocXwjl1t8L44bDLgRtOTePQNOEIQgjH2ZwunWU1Bfcdg1s/qB
         rHN4M3LIk884GFtymITq2Wj7jJbx5kWn+4fD17LxzTVtsysprBaYylMHaegDdAc6WD85
         IJ7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Lt2QpRUS8K7p+aTv57rVkrIfy0hrN3+ytqiSF4ZFR48WCmY5z
	bLXJkSQPOiSJnawQpzgpFp8=
X-Google-Smtp-Source: ABdhPJzUq/3l2YbFXfhAG0IiSFJZTHHIkwNRhKegx2gdx62zDdezxeU83mf+GdQrH5WpjiZFrYCOuA==
X-Received: by 2002:a5d:664a:: with SMTP id f10mr786844wrw.64.1603344903710;
        Wed, 21 Oct 2020 22:35:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:208a:: with SMTP id g132ls284114wmg.1.gmail; Wed, 21 Oct
 2020 22:35:02 -0700 (PDT)
X-Received: by 2002:a1c:ba85:: with SMTP id k127mr784109wmf.25.1603344902635;
        Wed, 21 Oct 2020 22:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603344902; cv=none;
        d=google.com; s=arc-20160816;
        b=w1q/G3IS7S9oZl5pSeqiRs5fguuJenxs8oUTpF5YWGGLd5Z+eTR8KvP4pUwR4Vb5Vo
         Zn9vuMt9qFY9ffXiKtYwKMT7PCdTQnj4IcIAILMv7cifsiGc9OJ1pNuw54a+aiLKH4zL
         ysdf0KIBVE4jr9LgXDctTTk/kRd/VlPbPQK6E3EEL+z1MOD0S87Rtn+F31WKTkkG0WkQ
         Ypza9pGodU6lDbPDIAHaLjGgsapa0HS7LAnVxnEraf6OMUY3jY3eHSxraKTKoVQ1y2Iw
         GMjM2Y1MjUKXATNf/bX+EHF8mB0j+eLKfvSHTn0QFuxjXh0TOSlwDy0BJCCCAX6UvAF8
         D2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OrM8ocSPH4q5GPiZ2zuhqDLrDN22me/yp/t7GeG59RU=;
        b=yoaarr7geQgyRnUfjH32oaXZocdRMFz6z/U7ECN/b+HzOprKydY+XyChs24qDuDRJR
         4JLyipfCYrL1nbnX13q3dLoVy1jECi2I8fGkT6v2kWGShiPHCid4/V6BT0xmo54lQ9JY
         73baSpojAfdkPEJbqJNZhZ+8w0X1bPcgE5ZnE3sFmf+soHPlJBYS4XKWRrnSt+V97tcv
         4O5WMGTQZ1s8EVtVcmRSiwqKMSFQBTEQ7I2ZGN1xv2Jx3xZ+xfMYLSJ5LyZKxuGIK88N
         x8K66PbJYoPPnmv73XAYbdItbEBNXicWH+8ZTGI9AuIcWrbK+ZICQwSl5TLoaDm+31GD
         1qzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id e5si22495wrj.3.2020.10.21.22.35.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 22:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09M5Z2Lm004718
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 07:35:02 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09M5Z1MO006716;
	Thu, 22 Oct 2020 07:35:01 +0200
Subject: Re: [PATCH 24/26] x86: bitops: only x86_64 is supported, avoid
 picking the wrong default suffix
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <20201021145404.100463-25-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d83938f7-d23b-8f65-47ea-6340747420d6@siemens.com>
Date: Thu, 22 Oct 2020 07:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201021145404.100463-25-andrea.bastoni@tum.de>
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

On 21.10.20 16:54, Andrea Bastoni wrote:
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>   hypervisor/arch/x86/include/asm/bitops.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
> index 6d265bca..140aad3a 100644
> --- a/hypervisor/arch/x86/include/asm/bitops.h
> +++ b/hypervisor/arch/x86/include/asm/bitops.h
> @@ -51,7 +51,7 @@ static inline int atomic_test_and_set_bit(int nr, volatile unsigned long *addr)
>   {
>   	int oldbit;
>   
> -	asm volatile("lock bts %2,%1\n\t"
> +	asm volatile("lock btsq %2,%1\n\t"
>   		     "sbb %0,%0" : "=r" (oldbit), BITOP_ADDR(addr)
>   		     : "Ir" (nr) : "memory");
>   
> 

Applied to next, also explaining why this was harmless so far.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d83938f7-d23b-8f65-47ea-6340747420d6%40siemens.com.
