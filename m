Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQMBYL6AKGQE5FKQYLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6309C29525E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 20:41:06 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id 47sf3029965wrc.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 11:41:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603305666; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jub+ORkZz74dQRA46yYEV4ozAJFp8vYjde4C5AaddWF8YJmCWu2EynIkIqt6BNGvKJ
         G69b35yMNyJyOZisrEePYmS5/snur0XmSkCoN6cwJqrEg2aGcT4XQ0UvZOiezdGetiRh
         w0Ifh3sWHAKw0+hnLtOCPhI390pvt5d/w3QkdhIVywvnnwdvyrW68nhdWHxgAOzV6mY6
         z9a3J7rwu8ngb1fMoTaQCzG7tT0i8NsCB9T6NPFU+XbzGGvGB9GNYtlpZd+T/wSD1PJ7
         wXYFBh4dureWODV4qRpKI/bQk2FGREC0oZrBbUyQWwA610bal0q/Kbnf3dyPHEw7v3EH
         7ybg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=diXNRUg5Aro0LYTvCMn4OJ5kRm0ZNeJEoCSGNJLpRFY=;
        b=Zz0EJmWuBmOJLEirkYpDQakhMbz6qD/Qf6buqMGfbCOT89dkiIW3kjsdN4KPrgu6Z2
         vf3PTx6fV/9yu0kL89/mIab8KuQGRZjKIAhfMckhJz1ZQjRKlSGBTgjkG++OR9wnilgD
         ZsdEThj1Z/vNnOiqNsJD+ypOYczeSGc/mrhaQ6QkibMQlrEe+MtxvBCkwQSoTtFzoIwE
         BOnGGQNbT9tmHe7NTbYwv7OnLbxWNKpEcBEldyxmA7HvRJ3ylb0yejrPZUXGp9oDpElr
         J5ofvn2qs/Evyg19wauXFtRJiR+2VeUFPqkZsaiUKAToVAiqi7k0TDfcUqB5hr4tlKss
         COzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=diXNRUg5Aro0LYTvCMn4OJ5kRm0ZNeJEoCSGNJLpRFY=;
        b=hebxGgYA5bj0lcI8zzlB3LdvccYegwPsRYZMj6KaSO+5sk42rVJKDQNF/DRk7IrnXq
         KMKmz4PaPrfyQR6fiBGV9b81SBQzu4HmknjWfDMR7D9hxvGCd2EvVXIZ3SwbSHGC72h3
         2MpRAFhz+3ooNys0DFivTFx0gAhxoSA8xEMvh9caPc4YUIUztGsEY2vj2GPrtheG7OoT
         3Nq9Nhw+nVdA4gA4lZ7TqtH0neq2MRDIy3Fktql/9r36pPls2F9OXtmXW9cmpXJgGAhw
         nvkROUeHOr9FdC6/kQHjWEobH8kpdDbWNRe6879l/Qqjju2vQOFxE73zhU5J9dKfXzFR
         sLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=diXNRUg5Aro0LYTvCMn4OJ5kRm0ZNeJEoCSGNJLpRFY=;
        b=XrBxbGSkJEFkyU0Fwu5Xb1/McxILAEyfgaRd3Yb3tzhidZD84tJ6FvbAqEhPEeoDEz
         a474prxRN/RBBBjaGKQiCN8ayY52gMp06EGOmrqXGN7VVpLmXSKhm6nj67X8lyL5ZKYA
         9gWte9ZBaWP188VqDs61GGfLujBzALFKXImsSrA7kEAGr9yOpaxLUalqYE2VEPd+48DS
         Cges8wZYWSGIKQ4GByZOJtyBOTBeMTgv9vIjf8objy9oTCLo3mvq9dG+oBobgvJvOdNd
         Bi9zoQ1XPUJQiJ/DLTqGYPM92fiWTf6ph8FAh7h0r2pBAvoVFRr8w+kxrfAD9cvGFNot
         Dnnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NrCU3X+MLcKh/32LDoh12yk5Li05KK9tCvfrNuDlwwo5EIF1X
	jVQzUHDINfwQzamm4+QP6pQ=
X-Google-Smtp-Source: ABdhPJwPHSSmNXsOXOlRaFQ80KR+bjp3FFwkDiY1AkduXDojlrIRB+j/rPtREYSTegSl5BXSzQARoA==
X-Received: by 2002:a5d:4d0c:: with SMTP id z12mr6730742wrt.60.1603305666047;
        Wed, 21 Oct 2020 11:41:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls855681wrj.0.gmail; Wed, 21 Oct
 2020 11:41:04 -0700 (PDT)
X-Received: by 2002:adf:80c8:: with SMTP id 66mr6353443wrl.415.1603305664881;
        Wed, 21 Oct 2020 11:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603305664; cv=none;
        d=google.com; s=arc-20160816;
        b=X2K43I6mGwLU1vWXFBm+GEYgzI+pG8Xme1g9vZ1sW39sR38McyPg77yF0SZTOnc5LA
         VQF8jXuX5Omj3JnAnpQXPGvXVLpeAXxN2zXlBPSjHAqqgCSRTO32HJllz5JDYvR8DMI6
         Oc3nJjsXA8HnTIDAspJSyf2/tsRQMuOPcdCk6HADp1wXuqgodh6sDZeE7YlyNKzJiWbI
         KWLpqUTJCQrLSvEnMjnLKJde28iOCkudaOIoRgs429VUItaucHAGpnerH8XfPsVppeSW
         PBaERl8iDl4wonDVfslZbQ7coGe4IriGWrSyVBhDldYwlrtRi2wR/gIPpncJugw/GDYH
         008w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cT6z5Q5uX91MxBk9AddCWnZxLVthT4u2anx3X897hEM=;
        b=pId0BTDH2U4ltp0lOgNPYPoKS5QtdnSA5OF950tl3G012nDJZEXXnOYCajT4BwEc4V
         iOczpaakHbOjPC5oTJ9A69sugHzcOuHebhzH4AsfQ+2IyoKDxF4Le6bbeOvhUg5bM4aP
         uY2uwYaVW6H6H2TAMxFsuFnPPQPA/Rf6/i+g95a8G4pu4KRrpxQQ84Vgpc6PPvXs67FW
         sljIimYw6f7ffuqEMc7cXbKSZ1xq20yJ8ErS2gKmmoobZhhMVuyNeV5Qz1yBSUQs7Rxn
         QDFdpPnmPPBvv/V1Zbr+1yLGW56MnB7RBm+Df2gw7sUargzUj5tD5KKPrfUdpYFGFzRE
         wYLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o4si87215wrx.4.2020.10.21.11.41.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 11:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09LIf4PX004227
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Oct 2020 20:41:04 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09LIf3UG011048;
	Wed, 21 Oct 2020 20:41:03 +0200
Subject: Re: [PATCH 00/26] Extend hypervisor compile warning set (and fix
 warnings)
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7c3c49ea-93d7-2a15-d844-a2004231ebc5@siemens.com>
Date: Wed, 21 Oct 2020 20:41:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
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

On 21.10.20 16:53, Andrea Bastoni wrote:
> As part of a project I was experimenting with compiler warning options
> that partial covers coding standard rules from e.g., MISRA 2012. An
> example is Wconversion, and the narrower sign-conversion, sign-compare,
> pointer-arch, cast-qual. E.g., Wconversion covers MISRA 2012 10.3 (and
> parially 10.4, 10.1).
> 

Thanks a lot, this is valuable work! While standard compliance does not 
give you good code per se (*) and - if blindly followed - can even be 
counterproductive, some warnings are low-hanging fruits, some report 
missing cleanups, and there was at least one bug caught this way. I'll 
go through the patches carefully and provide further feedback later.

(*) I once heard the saying that most coding standards exist in order to 
reduce the damage unexperienced coders can cause to critical programs. 
The sad truth is that such weird combinations are not uncommon in 
commercial software projects...

> Before enabling those, I've enabled some other warnings to filter out
> definition/declaration "issues" that would clutter the compilation
> otherwise. Specifically (Patch 0001), I've added: -Wextra -Wundef
> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated
> 
> The warnings were not too many (most of them related to
> unused-parameters), but there were some interesting ones e.g.:
> 
> hypervisor: provide dedicated declaration for __page_pool and __text_start in globals.h

Actually, it's only __page_pool, and we should make that global via 
paging.h.

> hypervisor: introduce uptr_t (depending on the wordsize) and define size_t accordingly
> hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
> 
> 
> The patch series fixes the warnings generated by "-Wextra -Wundef
> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated", and two small
> bugs:
> 
> x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix

How did you come across that one? Luckily, we only ever set bit 0...

> arm64: smmu: fix double negative

Good catch. I will fold that into the original commit, providing credits.

> 
> Up to "0024 x86: bitops: only x86_64 is supported, avoid picking the
> wrong default suffix", the series is the same for both master and next.
> 
> These two
> 
> arm64: smmu: Wsign-compare: make iterator uint
> arm64: smmu: fix double negative
> 
> are only next related.
> 
> I've compile-checked x86, arm, arm64, and tested arm64 (ZCU102), but I don't
> have a suitable arm / x86 physical targets and I'm still figuring out
> a crash I have on qemu-x86 (can reproduce with plain jailhouse-image
> qemu image).

Obviously, I would be interested in learning about how that issue looks 
like and how you reproduce it.

> 
> I don't know if there's interest in extending the compiler flags with
> warnings about code structure, but since the code compiles cleanly with
> the patches, I thought about sharing them.

In general, anything that is providing a reasonable chance to reveal 
real issues early is welcome. But it's always a balance between 
excessive code restructuring to avoid false-positives or still 
oversensitive compilers and potentially valuable warnings.

> 
> Additional info:
> gcc (Debian 10.2.0-13) 10.2.0
> 
> JFTR:
> Wcast-qual generates 276 warnings on arm64 (but they looks ~ the same,
> it could be feasible fixing them) Wconversion + Wpointer-arith are a
> worse beast (~ 1400 occurrences), and the "int" return convention in
> Linux doesn't make it easy to cleanly fix them.
> 

Those fall under

"W=3 - more obscure warnings, can most likely be ignored"
(linux/scripts/Makefile.extrawarn)

and there are likely good reasons for that.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux
	

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c3c49ea-93d7-2a15-d844-a2004231ebc5%40siemens.com.
