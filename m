Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVVI4D6AKGQEIYFNJOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49F29AC33
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 13:36:39 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id a20sf697810ljn.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 05:36:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603802198; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qk5f0t63iF2uWmJEfH5lLclG8wIWolEIFmdSXtzZu8/1LmGsXIzr2FgTgmnid7O1UW
         PEXlYFfTlVAyX/GyTdGYtlHKAmF+yA0wiF7WKgGmdGavhesvOQyHtqIBnxc9lwt1OBon
         ob4FgnPx2BGZ+actxGGbclUKmt37f/7M7ViI6HZSJBgfkrZDRTj4l49YVx2VJ4Kd1gTG
         M9Ci8ziupICAlWWoCr2tuWDc0s1zMGaybXpNxwODcz5KqEFcMn68XGKqeaGTi+UT2xvI
         ivBDoeQqPa0yJn9GB6I79acNVERN7VrDA7IgXM0yZJKnlokYB+l+inMYyARIPrziZyjK
         z8hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ozrnmjegWonlsBN0Q/uSZ0p9h0rEDXY6BfJyXBw5O/U=;
        b=CiC2o4qoZ/Sg8C9FcC7fMCjuCv/ILvKNhYNdqBEwewTK+FJYIJgBZtSm9pwdHGeUkI
         zwgFoKsNHOGN0zpoVxf75Bp77Fn2Q8AvxQlVzWm/N5igTj8S2ElivZ3npF+Ad4OaxsIy
         +Plk89vDShTArXNCkKbKA6ZAeZjLaAY63DjuQJCZFU3L5SKHs9KEJll6nnZd14111I/h
         DxPnxPMz8T37sCZ4szjmgehbSCugiSAVE/D8IJlyLnMa02DeK3iX12Ppl9+ixjpPOJpH
         mTB3dENQDT0S0upECMdn/3kIExVdSLUQWbUyQcwqjUBbBUVLhKIqjAgQlzEhl+UjAPaN
         Jp6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ozrnmjegWonlsBN0Q/uSZ0p9h0rEDXY6BfJyXBw5O/U=;
        b=pOENEkxBnMEFvFXejei/+2XznLbUU4C9r0tdYD8WBO2V6IqaaYSV252YsEQdabHiO2
         jIYYN5AX6oUbK5z16XGOtkR0n+8r+sSP3s++5QS53+davic15uN6RQ4o9AVJe9Tf4NrP
         vXRauAk2zlxlDxdco0BboWwbvvHYzCOyubK3CatZcL4V8JW3VMRCRtO3iup5ka0spGsb
         KEBhSpzKLUcKPcycnCPhOfB1alMWrqSFRx+hWkQTt2DhFi9f5RTa5Kfh4geOCst+4P3Z
         n7ZTofV7+L/5lE4bGd8zkPtLqAWivtWqd89mpZvw3XQwaRoC3gGnABizfOS1XoE1iBEQ
         bzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ozrnmjegWonlsBN0Q/uSZ0p9h0rEDXY6BfJyXBw5O/U=;
        b=cwNI7g3/4g+Zpw0+BCJoQF8BO63EWpHd7d6E1f+V1N14dJ239N2Wcx6T/LH2OOtCrQ
         4eMnUqHspAvE1R6SNtM121clg848+QrzpEGt6PPTq+aQRzOFOQjeWDIh7YQ0u5B2PTOO
         o2nQl3MtJCtJBBozxxzcmmUejIOXZmmInjxC3S4K7rrle6Plv/ydmB0tgZtyFnnT1cwE
         8jowJlXTqAiz2QSl/6Io525lfWqPYozYtvPA9OXsU/5j5HJ6cDPwv8ilMkFEWj/r12Kh
         GEiRtr0UhG3ioMJq2yEPp1qoOIYt13JHRdtK6H3wb9Ge8KIGmDJFx8I0VxnswO6cPsp3
         fYzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531450PefbbM3I8Ui+iVrztzVAxQcujurOGVvsj8X/96XJBFv1O7
	9RI5haCKDNUTi6Qxk40Bk30=
X-Google-Smtp-Source: ABdhPJwrcRRpdXa65S+DdSyqSdaUQUYJ37DLrYoi9KXkuVZ2Y9HRpElU0yCMrWV3kmOND0h1/mBstw==
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr922228ljc.351.1603802198572;
        Tue, 27 Oct 2020 05:36:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8e89:: with SMTP id z9ls262551ljk.11.gmail; Tue, 27 Oct
 2020 05:36:36 -0700 (PDT)
X-Received: by 2002:a2e:1614:: with SMTP id w20mr1012853ljd.103.1603802196841;
        Tue, 27 Oct 2020 05:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603802196; cv=none;
        d=google.com; s=arc-20160816;
        b=jJHCK9OzEs4yc49tO9bOzRx0/QX//Pr3bB5ELYGrmlF1xhOIOAHnxLwM4KqJF46Hit
         OULjVEMIX07c1lS4JTEKE6sJY7Wp8vMA1kZjjdtaU/crNBSppXr6ju3+Dlb2NkR4ovBx
         w1w20J/dXH11+pW5zhbPV9bNyhw4Z8vLQBfpxKvOxdzLgCHCIJLTLD+VB5O6ruyoW3V/
         VPv9lOvxSA7m/GLGdZ3pbHGGVi4Mena6Kh3fX1Tz5SQTt1kkVVldx6Kq2vXQr6Kc1NTQ
         fSD/kjoa/7tqk694wJE4IaGvG5Ib8Tn8TeQwsoz1bMpcNiUeJ3I05FM3QwSHd2V0nNOJ
         bGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cjFVyRNeVGBOzbJtJxhwPsPUYMPlrRItjO2vANDLIs4=;
        b=esVWFVTTVkq/qziMCtM7Y/0SE8gvXLKBIhpBaPKVh+4bNisUkxeU7xa8hsQ8B5PaFc
         aL0FeFmjdz6h+2mCAS+UMO/93ujbCjDkDroEIwmqOrCX7s8sk+9AtEOj172aPPGObZpP
         WYbJnt9jq98byNGYXExPWDZvaXGcVLFS2Sh0cVtYWA1yWdwdndMOIVb17gHBMqxhC4io
         /7PfrSPkgGW/1qBaW8SQigA0CcivpJUbUMneO3+Q6N/pZxjqQQ9VMEJ9YSA17GLAkP4M
         zmaVt2O5OhJ0Zc8XjFzkCtc/KJk4LTyVUlhZ2+NpLdl43TrFN1bgYGUwWqQ8Qp+l/Ro7
         Jaog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r7si28141ljc.7.2020.10.27.05.36.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 05:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09RCaZhM010785
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 13:36:35 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09RCaZ2n020913;
	Tue, 27 Oct 2020 13:36:35 +0100
Subject: Re: [PATCH v2 11/33] hypervisor: introduce uptr_t (depending on the
 wordsize) and define size_t accordingly
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-12-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b8849626-071b-f074-8e8b-b6cada812fae@siemens.com>
Date: Tue, 27 Oct 2020 13:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-12-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 22.10.20 19:58, Andrea Bastoni wrote:
> This solves warnings due to -Wbuiltin-declaration-mismatch
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  hypervisor/include/jailhouse/string.h | 5 +++--
>  hypervisor/include/jailhouse/types.h  | 8 ++++++++
>  hypervisor/lib.c                      | 6 +++---
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/hypervisor/include/jailhouse/string.h b/hypervisor/include/jailhouse/string.h
> index 24f0b0b4..7dc3de3b 100644
> --- a/hypervisor/include/jailhouse/string.h
> +++ b/hypervisor/include/jailhouse/string.h
> @@ -12,9 +12,10 @@
>   * This work is licensed under the terms of the GNU GPL, version 2.  See
>   * the COPYING file in the top-level directory.
>   */
> +#include <jailhouse/types.h>
>  
> -void *memcpy(void *d, const void *s, unsigned long n);
> -void *memset(void *s, int c, unsigned long n);
> +void *memcpy(void *d, const void *s, size_t n);
> +void *memset(void *s, int c, size_t n);
>  
>  int strcmp(const char *s1, const char *s2);
>  
> diff --git a/hypervisor/include/jailhouse/types.h b/hypervisor/include/jailhouse/types.h
> index 828e40f7..f97dc252 100644
> --- a/hypervisor/include/jailhouse/types.h
> +++ b/hypervisor/include/jailhouse/types.h
> @@ -55,6 +55,14 @@ typedef u32 __u32;
>  typedef s64 __s64;
>  typedef u64 __u64;
>  
> +#if BITS_PER_LONG == 64
> +typedef unsigned long uptr_t;
> +#else
> +typedef unsigned int uptr_t;
> +#endif
> +
> +typedef uptr_t size_t;

What's the benefit of the indirection via uptr_t?

> +
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* !_JAILHOUSE_JAILHOUSE_TYPES_H */
> diff --git a/hypervisor/lib.c b/hypervisor/lib.c
> index fc9af7aa..e8a9733d 100644
> --- a/hypervisor/lib.c
> +++ b/hypervisor/lib.c
> @@ -10,10 +10,10 @@
>   * the COPYING file in the top-level directory.
>   */
>  
> -#include <jailhouse/string.h>
>  #include <jailhouse/types.h>
> +#include <jailhouse/string.h>

If string.h needs types.h, it must include it itself - which you do
above. So you can drop types.h from here.

>  
> -void *memset(void *s, int c, unsigned long n)
> +void *memset(void *s, int c, size_t n)
>  {
>  	u8 *p = s;
>  
> @@ -33,7 +33,7 @@ int strcmp(const char *s1, const char *s2)
>  	return *(unsigned char *)s1 - *(unsigned char *)s2;
>  }
>  
> -void *memcpy(void *dest, const void *src, unsigned long n)
> +void *memcpy(void *dest, const void *src, size_t n)
>  {
>  	const u8 *s = src;
>  	u8 *d = dest;
> 

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b8849626-071b-f074-8e8b-b6cada812fae%40siemens.com.
