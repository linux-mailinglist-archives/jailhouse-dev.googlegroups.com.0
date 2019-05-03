Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBZVAWHTAKGQEWXFUFDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E713039
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 May 2019 16:29:59 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id u14sf5020788wrr.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 May 2019 07:29:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556893798; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y5mOOUPU2WRQkxETB1GrFshW1yTrdMS8mc6rKdXa854E/HXxuTbGS1t0i5cyO6hW2w
         DoK7r/MbkUsMyFSkd3Fi+B+GAdzEW75qIWq7z5HK1qSSyxVuOxnr+txMZ+UwD2zRVmJL
         2Tt4ZVx+lur0Sw9x2Q5DdN43pD6Jg/cmhRedpKZJHbvgd2LETIky586/QGl3coLh7bSJ
         3FWdqWmEST7AdBOx4OJwvRfwiKg16SXko2dvFt31yTV35ZtczcOksiETaXKb+Qq9tmUT
         eQ6vlHFDc5cwdTV7YN+4n/jSdXwGg5Mp4BaQwuh5SnFKhG5iHtEzKXx9wt1YlHAhBv1U
         IfOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:cc:openpgp:from:references
         :to:subject:sender:dkim-signature;
        bh=6bz5oO2raRj9V3k69x3o7Qqs1vTM3Dz6C1oYeUppfow=;
        b=P0fNfK0oqSQMNpr8V3w9RB/hVqqd240TT0yhAo78HA0woIXYIDrYON7SEMfccipwGJ
         GjhDAVI7kBgvyakRLaG7+06IyjpsCh4/6za6XM/ZK8DOv7+tcwAFu9nfNNIcLxQ37nQl
         UFaaJvFunae8DIjI7SEG7eft+OyuQf0RZaCBRCIc+Gjjhp7yEkD7kkfljRYNzX72nzk2
         ua0eGC4/TyIE4OVFGOte7hRh7GBbFFMHBIsmuRWHFGUo1Ghjen6TnPacyp8/5PdBGI71
         dD71nTuxX3VErVvR7Is9NdXh91uBYK8IQ/fb0bbtsPDncHPwHa4KaNbS7IYH61X/+fp7
         hz2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vvw9vOY0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6bz5oO2raRj9V3k69x3o7Qqs1vTM3Dz6C1oYeUppfow=;
        b=GaQHuaCDHeusvHo0LzNjjU576Hzfr0GrmSOWR1JQzPdTG5ebCplxUVMIykEgeUlzjw
         RKKL8rwk5ncpuyZKMG5Zcv61yCPQb5bxfE/3t4Hqn8Wh7evkizfi2I7sz/D5bWrAeXr5
         tGxlTaE+/ebYCmp3BPBdR1VeaVO7R4Vc1fdVy2U3xRPk6eHSUplzSGPJSu6BbdZ+dkjm
         foRmISlyOkmJtQa1Np6z/5jCuxZhczjQR7IHHFpxoRKEaoKN3TipMjSdekARk8srEINk
         f6eaWRhihofIwN6wpVMMd/Mjjr20jDRikjiXEhwW4MG2HyhwJpFcFZfrS4aJTXnOnB2w
         47mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp:cc
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6bz5oO2raRj9V3k69x3o7Qqs1vTM3Dz6C1oYeUppfow=;
        b=cXDtRpAcyN6gwJTORHQS8eYL+BZEEUp+I+mB4zDn0TSKhZKsNIXURH/sYIVscP65hz
         wgRfTBjHZLwDDoDiHdj4afmtgI51TDxIYrQiJgz9+8HvbHsazFGPxxJYsJFm3+zeiLj9
         Oz9umN/b/O8sGJmnaUPHuHVAxqwYYxYIDDMRyfnuXk8wTqkAHBEylD94IyNpCUfBEM/o
         LAkKaODXEeZh5XXXidJf0qxe3qBFYRJvbweTGxdTqwTUnTqRdn+TZ6BP7yJtZraDi4+i
         q4TaDgi156joxZz/BCZqIkT9TCTpeojRU718BxYPA55YznS23oHswURJzgDg3MZdJW4g
         S1gg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPQZNBxJxE/NN3bGI+zavo/URBYn0Ob/mEa6g8M+XqEgUkpzei
	7DfreG9U41/UhNp4TDn+08M=
X-Google-Smtp-Source: APXvYqwqbOCsX3ky9GFFz/FDYT9qC70+2JybeWuPSbLyfKQlFc1GduX7sxd/RDFnh8i/xpT/94KcDg==
X-Received: by 2002:adf:ee8d:: with SMTP id b13mr3323320wro.219.1556893798824;
        Fri, 03 May 2019 07:29:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d84d:: with SMTP id k13ls1406135wrl.10.gmail; Fri, 03
 May 2019 07:29:58 -0700 (PDT)
X-Received: by 2002:adf:ef43:: with SMTP id c3mr7652741wrp.141.1556893798003;
        Fri, 03 May 2019 07:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556893797; cv=none;
        d=google.com; s=arc-20160816;
        b=EF8wOb6qiOA7vW6iyeinI0s7AYHkFIr5CM2GOTgWSChpyFcynEK7XG+BcBRHCbCyQ+
         NrsJfHpM6InXO6u2JU1OtcPyL4N8ckLA8m58EIwvBl4kv+oRBaH6+jM2wEvkV31/x9QX
         VfmwEyndWL2ZH0GgoqWAY4tL6FjD4FFrHNxmSrpIYkNM5FLIievo3RFYEmwdnE7QWUWo
         YkI0Uvdb1zWGQabvU39YZkyVoRhuFAblgYJDGQBJkWJ0E8yuktnnAhq3I3bE2M887SJB
         lpOf42MT5LXFJ7qztqd2LeS1IXlbqR4FiGKZ/ID4+YSZXUww6AaUcX9lIbXw7BbTfBFC
         wWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:openpgp:from:references:to:subject
         :dkim-signature;
        bh=/w6hkMlXeedd+tQ3KEkzv7XUJ570g4olwMiqTpnq2OQ=;
        b=QDNfeHclVB0eiAlIkKapks8Ng0FNtnRsbN7S/HYEo4nYE0TRGl17Dp0C5GkeHRgNcH
         TKg3A00VsbIfLYViLaw7mLNB8dmw2xLkP2SKBSr0Yzd38D1uBj98AWhksh1PXCh7Epiw
         bRPyewxGzO/FjHo6ja6T+R/LbSZ7Wyg/s1/gkcVpKrVMJve/PopFnvdr0plNcXi9tm33
         Fv69ZzautY90HC3EUV5ctVLQSGsdDjtNYTBWmejmKmjvpygIe1H8RkRhPQwHdFab2w0P
         DKkFzJBMtkD4xkbLyBLhsk6k/JxAqtLvKQXpzKxi0GkpaVy9OtUJc81igtifXxSv1Ulz
         U5rQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vvw9vOY0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id u2si132337wri.2.2019.05.03.07.29.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 07:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 44wZKK49qxzyFm;
	Fri,  3 May 2019 16:29:57 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 3 May 2019
 16:29:57 +0200
Subject: Re: [PATCH 16/16] x86: Remove misleading brackets from mmio
 instruction dump
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1524500320.git.jan.kiszka@siemens.com>
 <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
Date: Fri, 3 May 2019 16:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=vvw9vOY0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 4/23/18 6:18 PM, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The parser my bail out on opcode byte 0-2.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hypervisor/arch/x86/mmio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
> index c1b9f10e8..775ec4b7b 100644
> --- a/hypervisor/arch/x86/mmio.c
> +++ b/hypervisor/arch/x86/mmio.c
> @@ -219,7 +219,7 @@ error_noinst:
>  
>  error_unsupported:
>  	panic_printk("FATAL: unsupported instruction "
> -		     "(0x%02x [0x%02x] 0x%02x 0x%02x)\n",
> +		     "(0x%02x 0x%02x 0x%02x 0x%02x)\n",
>  		     op[0].raw, op[1].raw, op[2].raw, op[3].raw);

sorry for digging out this old patch, but I think we have a logical bug
here:

There are cases, where we jump to error_unsupported before all opcodes
are set. In this case, the Hypervisor reports the wrong instruction,
which really confused us for a while (Andrej found this).

We have such a case, if decoding of op[0] fails. Jailhouse will then
report sth. like:

FATAL: unsupported instruction (0x83 0x00 0x00 0x00)

Which is wrong, the code behind is:
ffffffff819705d6:       83 78 08 03             cmpl   $0x3,0x8(%rax)

Which brought us to the next issue: CMPL might be intercepted, when
accessing, e.g., PCI MMConfig space. In Linux' pcibios_add_device, we
have the upper code fragment that accesses MMConfig with CMPL.

  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
