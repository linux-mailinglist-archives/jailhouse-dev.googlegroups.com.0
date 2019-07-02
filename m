Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR6R5XUAKGQERWZDZAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA25D19A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:23:03 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id a17sf3588020wrq.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:23:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562077383; cv=pass;
        d=google.com; s=arc-20160816;
        b=o+fsetgH6sjRMUZMVDGQAWBZYPplKdgHXvEQmjnd86hcUdhi9wOoS6sBOAmcFY3pc/
         diBFRltaGw7ZD1oiV/cYvC/7OEBnAfHUWY6z019ls7ThIThBjKgCv3qcOr0tMIA2Gl8C
         EhPXXpSJAScReWDxjqcMcBR6hv5kr8VNJ9wX/VCbss6B9faFDDguuL84loGRfYK/s8QK
         ZKJzukB0yKN5gGfQ0quOGpRLx1oBRGqM4fKxB8H5dg1uX61Oyn7lsKnJBnIEzJoeUZYV
         UE/YVlgnWZyUW7IJM9HjNAvZE9XWu9D9hm0xB5nqzOJ0lk8LWefYiIDptFmH8YMvHZj7
         gsZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=J7zrmPoS8FWld2lefalikk575BjGls8C6QCGiWulBG0=;
        b=syKT6pCaODWUb1MhJcC90IOJEaGc2xxTavewidbficLJj1Ywz9Zr9fEmthpYpQulsH
         PIkKdmGo7rnGtbdZ3QrtfYUj+lTyhNAAxxlzI8TdceNxAt0OnPnlUB+6jv3BcX4/Iazt
         tYksvSm8XZAuMtPHjZjcF09HzLEqaVA7gjHB53aEYDtci7fxy4ZC9gqMnev+w89zMpnp
         E0tjYTSgHw4jayvJ1Ax0+M7Jfyxd+3cxA8p/lzxrJg1hIKOayVTMG2m6NiB2pkgXmckF
         T2DHhzsrw17ANtU7zgc0ISmshxTvdLbOqAxhj8S8q2fCFszuEwgswkDZhqaHslBUh2eg
         VGGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=J7zrmPoS8FWld2lefalikk575BjGls8C6QCGiWulBG0=;
        b=SQLDarMBrVpx9pHB2HxfUClTgdX9ebivUuAlxh1iOPTHHJ8cOsZLPAA3nwQBe8FTYv
         fwmfLz3v2ZcBQvMIoVIfNx/ijU6k2ea5nLS8VLGLC4nQjLV8y/i2OLUPJ9BZOJdFe+6N
         Nmrohj+ah0ippl3ih1mDjwySuEwa8RXp7hJsDSX9NaQYt9kZh8o/kptJiG1VLRUidrJL
         DABmI46/5URDZODKvAp6t0bNvas3kx/bG5mhBk/aipKn/R99adgnVpfPwTgIemcHuchx
         i+CQCaeJyqW+4HlRQSEQJW6B1cyQggR/wfkW1c4Agssw/Vp1LguyPXSIa/XPy4fF/app
         UoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=J7zrmPoS8FWld2lefalikk575BjGls8C6QCGiWulBG0=;
        b=KmSIM7qT6NLML8KzPNuSduQS+U8NRc48/kBu2RN5yWgqBqhmb5a6ZwXsKr09ojj8S+
         tZiGW0bHbADaXJ69sszYuvGDwAC+/C26WAxFLe4KjNpXRAl+kUeviqJuljXUXoQvdPTS
         PMmjc3f2eXbGkzOO9imk9cO3gJyYzXqzSLCzsJbqvY4SPRM2S8WPIPwPaAqXe3ApXKQE
         gbvVDFRUBoNn2Lnmrj9ks29UJaq33aO1q5KkRvUpsGWnArcvhbSPZQrNmkXh0mkJMGr3
         4lsrqgnjIzk+QFEiRVJEyvLAlMjlDmkcX70H2eW6bHNWUrj4GfPdzq29fCrutO+ZL0eJ
         Vbqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU85bPSs6EeN8Eg/mRab7n4u1YCVCiOrUh3Q/ijaUah57s5iUXv
	7cUpYa7d6Q69ENd2aFou9fA=
X-Google-Smtp-Source: APXvYqx6Mmmb99/M/f1sTWHbNad3Byu7FTdWk1vr/rm6qsFQr8JozXabUZN9dGbHySKiS9TeN2ZOSA==
X-Received: by 2002:a05:6000:1c9:: with SMTP id t9mr11990565wrx.187.1562077383372;
        Tue, 02 Jul 2019 07:23:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d89:: with SMTP id b9ls3220673wru.0.gmail; Tue, 02 Jul
 2019 07:23:02 -0700 (PDT)
X-Received: by 2002:a5d:4090:: with SMTP id o16mr5017687wrp.292.1562077382649;
        Tue, 02 Jul 2019 07:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562077382; cv=none;
        d=google.com; s=arc-20160816;
        b=bHGc+6PSIQ4hjauEe7JWbNimK2CyeybZsvlwWBNsog79loF+mn8S9RFbe3LFhAaPQx
         NG7fPeuh/g6Ha/+PjByTk4fMvjHwYCjfansZSbHLxYg7MgLb87eNSwZOt7/9TIxDnlSe
         ce+BTT4OnV8Kw6hYaPtlw7VlRfZy0vzPNV7kRzzcfaomj5UrSJKDh/snrOnz7O3TRrfR
         +7+c2lCCVqtW6A+xtY/eSmWAHEovnLBY1C8yVctbtEsk0TubdOPbWxLnGdUUpfzSsLeI
         Ta8sjYNA7fp7a4zAnPvYyZzs7XnaGx/X6mrPDtJf2aWSP9Jv9QX1EUv8UWEayihoiOpK
         cchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=w9hFhh1shQhiwgN91V5QZ8bxHoo6E+zeilMpOyjonVA=;
        b=P9iH+XYkMKPDmCWTe1wzQl/u8n+nFvIysLEup2IlIrYNCY/v+x3NOXxS+U8l7SCkY1
         IcsTdeNbGB6ksXN+IA5ijIWK1ZbzSW6LoyxxwyUcdn8GBZU1RQqOl9kvBHvGClyP8iLP
         VGooJn+sxHlCVbPVVvtORd8COCELxf7V0a3NMjhUe4jaOo2UNAbyBZJDtiJUgI9G/X5J
         2IIjNkDn2zAP/bCDsU43Ccmd3xFKVOMs2bBMKrRs18DeHyeH44+HcmvF/8HiqOkgvvHK
         vCwNYdT6K3EI3gOzXfbCdGvX2rGFQF4Lvxv3g4dHA3hqADMoqHbWtlV1XFCpa6sl9Poh
         vcTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id j4si158565wme.3.2019.07.02.07.23.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x62EN1Yf029835
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 16:23:01 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62EN1T5022483;
	Tue, 2 Jul 2019 16:23:01 +0200
Subject: Re: Making stage 2 page table entries read-only
To: Jan Hoogerbrugge <jan.hoogerbrugge@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <CAD9j0toG2Cq3T58xEzDOzHbSpa3fqddcGsLevN54=ZHH7aWkug@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d0fa5684-2c3a-9b6d-0629-dd919716bec1@siemens.com>
Date: Tue, 2 Jul 2019 16:23:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CAD9j0toG2Cq3T58xEzDOzHbSpa3fqddcGsLevN54=ZHH7aWkug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 02.07.19 13:59, Jan Hoogerbrugge wrote:
> Hi,
> 
> For kernel protection purposes I want to make kernel read-only memory
> pages also read-only in stage 2 so that if malicious code in the kernel tries
> to modify read-only memory by first making it writable in stage 1 that then
> a read-only stage 2 page table entry will catch this.
> 
> I want to do this for arm64.
> 
> How to do this? Where is the 2nd stage table constructed? What kind of exception
> can I expect when the kernel writes to data via a stage 1 access where writes
> are allowed followed by a stage 2 where writes are not allowed?

Jailhouse is statically configured. Therefore, you define the 2nd-stage table 
via the .cell configuration, and this is applied during cell creation (or, for 
the root cell, when enabling jailhouse). Translating 1st-stage permissions to 
the second stage sound like you will need a lot of dynamics.

In addition, the Jailhouse paging subsystem is not prepared for runtime page 
table changes, except for those affecting only the per-cpu part of the table. 
That simplifies the code and even allows for static validation of the majority 
of page table entries.

Regarding exception trapping: We do not intercept regular guest exceptions 
because there is no need to (and it would be extremely slow). It is 
architecturally doable, though (like in old shadow MMU times).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d0fa5684-2c3a-9b6d-0629-dd919716bec1%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
