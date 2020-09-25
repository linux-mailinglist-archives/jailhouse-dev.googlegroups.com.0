Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMP2W35QKGQEBYL373A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DC27845A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 11:49:38 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id l26sf632828wmg.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 02:49:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601027378; cv=pass;
        d=google.com; s=arc-20160816;
        b=BTA7rmu7T0RkrN+vSjnAvvh2uSW1m7nx7BrsFjcXtGB39mliWJloJUnhxMmLoHT7bM
         HHwaZLoEP9ChLKOAd62sDkX3BWCpZNT+VSoEQsFogqRF/t5QMmDmwj0GRLx/Ea4R8X1t
         q5Ej/mEjAHCzDJYmOm9BcXjMWIyQCa7YXEZ4HJHsRnXNzZDrcaMJ8qb6jE4VWKvkJGr0
         I2aRnjIkwD/Q3AqyQsP0tsxIsXO0NbxsV9vgfPI4sw/ViIVYbMvwJ30+qlsPQEfuRBfU
         NUjJ1/i1+CPzt1h09r9BeMaXZ4fxeAQ/kBraMGokn4U2czOTkUBGoQcbiothZg/u/Oml
         D7fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=kBqaPKM6O6txt1MRG1UN/CouwRLQlqzIkOXGYxNTu2U=;
        b=XbfuQjK+W2ZMNVhNs3Geb2iCH4bDhiM+U9B1wW+A+YWcZfBV0SGKaDFUgxIBhcHni0
         xNErjLrDIeoirmr0tDSBGdoR5arpyiO7yymB/qR3QZepNkUJQHokWXn5Ffzy1aWG8fuz
         fGRIOcxLhv3NTofAZmHu0h3ho2uNTV4/UZgNAvvwcmqcQFZ5KNYP8BOkXJjM3dKBYqBq
         himcrrl4PSogjKubQOJ+ryB86K6BfAD19CTGt64mksWPoNA2xMkdUhK23fgMY+WZ+f/3
         Xee3bFHWp6T1l8ws/n5J0I/h0lxXVOp7A0jniSoAmEMrS8DRDWq+ghdKewx5sZPAqX37
         9sAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kBqaPKM6O6txt1MRG1UN/CouwRLQlqzIkOXGYxNTu2U=;
        b=HAPTAGD0+M/pP1YeH8xBxxzbiHhg6Ki3Ua0wcEI8oVdj+Sn0EI7C8I43iDxjoeHFSI
         8SPwcX9Flgb+uO+NqGXAD0oF6FCOcOYWBHckOM+5hmB0ca7ljbrEJjy2VPeTAn2nFps6
         jAi0mcn5jZ2MRc9If7XrzdtSRGr1dt8trTQjjuR7S4dS+NmIdAc/1K4X9W9Nox1t6AI+
         bKoRZi5691KLE0yQoUABu0AJhIaBPbDHTK5ZqjEU7BI6jNKOuMWPPptWc+ciAuyUtxvy
         BvfqA8iyOxIQBSX+cuuMElLfPa8aZOGPk8/dC19Fkrm2zT9wapHb7hBXMFQDq4mtBryM
         xLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kBqaPKM6O6txt1MRG1UN/CouwRLQlqzIkOXGYxNTu2U=;
        b=aUbz+xG2HcPDfGZKKq3LyPqdiATa1MKhS2wSJGpE8JTP3/3NFjPZc2SPPPRLjubKWR
         BHQYhxWbSXDZGG3zCZ+9yocQYRaaLmQqqvmvX2vrhRu3mfpA91gBxgSEzO+fSnOnTYJV
         9oeEli0t5RYSe2Vll6BnMU/4xuQi8VVuJrwxQHO003+367vc7UoPbEEqIcOJIE32Cd54
         VJI+l/N6nENR1FfvUOZnHKqw4+C0/pDv5DBG3TGRwMt0CkAfQG2OVyQJxvUVVPRt6JHi
         iyo7xk52gLfQPGKaAljDdgzOwJVFnP6lG/8ucw/KYErSFd39WwKXIWSDI9k2y9ehhA21
         BbMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OQRmN2idrsT6cZ8naPx14noKMjO66YlM/QheD+YGrjwzZaCAN
	SRFzguwEMxpPFQj+paGSLmQ=
X-Google-Smtp-Source: ABdhPJxaK/Y6fCZCX0XmMX47/TI8KwKFQSPbiZS8OSaOfVS9VJFGRvZJPMG4bu6O6wSi+rRW9mzW5Q==
X-Received: by 2002:a05:600c:2317:: with SMTP id 23mr2276051wmo.183.1601027378108;
        Fri, 25 Sep 2020 02:49:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:230d:: with SMTP id 13ls944123wmo.0.canary-gmail;
 Fri, 25 Sep 2020 02:49:37 -0700 (PDT)
X-Received: by 2002:a1c:9d43:: with SMTP id g64mr2416146wme.16.1601027376988;
        Fri, 25 Sep 2020 02:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601027376; cv=none;
        d=google.com; s=arc-20160816;
        b=ch/S3cIb17cDp9QEbqa811RC84GtWEHda4KYcbz71cJJ0aZADUZJhqOb8eyOI+2HPf
         jTAyi5aM3qJ288fTrYKg4JhuLfJ7R1cE8OwdiLMq/rHtZfXV3sZddR2VL0LaHaUFz0t0
         PTyn+jvBcMzxOlqeZh/+dpY5wg9Yca9dzu4WWihUTjvfT/TvPh8Iu3sqZeTiaonWmpEM
         uFrhqmkFbdeJzsNLWyby3w4qPyqzfLyJNP3Rzbga8ZQvgtb54rLt8gb4rGYjG56zIeiK
         4QEmYHoyM3SwhefGHN+TH2xeb5pLz4+0xahHruIpEcGsUdunx2hGyBXXXdR5p5XDPbsb
         lRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jz2RH2Lrm2QKDl0IKhucPUiiWeJKYNC2xgfOGFdTVk0=;
        b=Eslhf/gmcOkLn/VSyBtRdX/Gbvkao5Tcf6GhEVX/rzOSq3BKL8Z28Gu5mbcxXHPedx
         0mPEIW9TjPLYzimjFsPAnja/nNmsAXQuwh5bMdcZwOcntA+7srCWj97fOc2cXkCkNDOo
         rDimDdzioy2CYVVEtLrFqti4nxNZAzHK7MsXkuJ7biqZz2yw+BtsonQKdaBonBkDMKFp
         yb5PKSmnh/Edu9oh/tKdbSe7cLUdqFh9ocM4QwKSeBdmbGQI7v9xT7Uec02uRGJeMXiH
         e05+ipsHHUezQzrCQKKWcTY0p87R87IrNnYXsvu+pLwU/q3Wp+1LWfGyhiHJbcyamg24
         zO2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id d19si46641wmd.0.2020.09.25.02.49.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 02:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P9naIG007370
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 11:49:36 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P9nZYw026103;
	Fri, 25 Sep 2020 11:49:35 +0200
Subject: Re: [PATCH] inmates: lib: include ALWAYS_COMPAT_MK
To: peng.fan@nxp.com
Cc: jailhouse-dev@googlegroups.com, alice.guo@nxp.com
References: <20200925101006.15965-1-peng.fan@nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1fb736b5-9ab5-cd69-26e4-c760860dfc60@siemens.com>
Date: Fri, 25 Sep 2020 11:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925101006.15965-1-peng.fan@nxp.com>
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

On 25.09.20 12:10, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Need to include ALWAYS_COMPAT_MK to build out inmates demo with
> 5.4 kernel.
> 
> Fixes: 7b2876158c416("kbuild: Avoid deprecated 'always'")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   inmates/lib/arm/Makefile.lib   | 1 +
>   inmates/lib/arm64/Makefile.lib | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
> index 723ff6aa..aaa33fcf 100644
> --- a/inmates/lib/arm/Makefile.lib
> +++ b/inmates/lib/arm/Makefile.lib
> @@ -39,6 +39,7 @@
>   #
>   
>   -include $(GEN_CONFIG_MK)
> +-include $(ALWAYS_COMPAT_MK)
>   
>   LINUXINCLUDE += -I$(INMATES_LIB)/include
>   LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
> diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
> index 723ff6aa..aaa33fcf 100644
> --- a/inmates/lib/arm64/Makefile.lib
> +++ b/inmates/lib/arm64/Makefile.lib
> @@ -39,6 +39,7 @@
>   #
>   
>   -include $(GEN_CONFIG_MK)
> +-include $(ALWAYS_COMPAT_MK)
>   
>   LINUXINCLUDE += -I$(INMATES_LIB)/include
>   LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
> 

That's already in, see 7b2876158c416ecd40e53bcc6b4c9080dc51931a. I think 
you were patching a meanwhile force-updated next revision.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1fb736b5-9ab5-cd69-26e4-c760860dfc60%40siemens.com.
