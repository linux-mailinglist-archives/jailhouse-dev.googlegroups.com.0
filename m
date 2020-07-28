Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQH7734AKGQEE6GUWCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 60595230240
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 08:03:45 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id m7sf4868154wrb.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 23:03:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595916225; cv=pass;
        d=google.com; s=arc-20160816;
        b=QmlrVafGcLGQcRIff156AJT6DpJxB+LUloiWGl5UG5mMvawcdQ4tjmjr4IIizESmjj
         5QuRuWiPbYHmlkU/PoUmGFwG6RFzYcBoRA0EXBsWjzQq9xpkg2xpGviM7zSNRd4ke4YN
         o1m5dYhlgdXU8f1+xqsW/5DfQBbOS9ejVHzdVCTJ1zMcHtmGpKSgiGWZluFbDgyIPCXA
         K62ke+RZLaDjY8PkL5rOwcG2QOrAorHrQUoNH8zg7k9lzcM9Z1ESAgUPZn9QPW1JDRzj
         YYJrA+tOz4j3ZSj6QTDdnOQ0oIB7Cuet+6qnH7piLgTAc17lRVRzJZSrG7YuoT76gEa2
         NRUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=JazpuUHXnmCdxO0GArrpFj50L8YlxZ+6u/sc6yIxjgk=;
        b=exyBghxeie06JUniEquxZ1C37ktbe47QlAr3pFuCYi1/uXwGQ/MaaOoAZkmOXax7t9
         kPjnxt+Y9SoBNiI/lJjFu56UkTbtQZ4paepYb4ElTx5dnOqHRxQ/BSlyk0V4qquB6v8f
         Gkjrbwa91nzv3SV2kydSIi4RKxrH2QtkTOk705Kxl3+74PKcywPDVLVlOyVva6jm+Gwp
         89mEVd3tq9TmPTm4u8BTTS6jFLhY7PzqtuZQE1u3N/6y7G6xZEkMBglW6+LBlYLP1BIE
         qX4keRDvZguYujxN8d22hrXCC4lpMmDo9Drm3A+M7CbYnsRye+Y8FO8GK9J+xITGM6iq
         i//w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JazpuUHXnmCdxO0GArrpFj50L8YlxZ+6u/sc6yIxjgk=;
        b=Y/zyPeRd1yB1mBwjypUbQaZfiZWtIwsppblz/fv/hc0MjkXHz6F+fIvlU2Bys82N6Y
         pVSoyohAXGP8P08PvW2lmBmCtobHNa2W8viCNA4dSvqds1kPozUmQwNF/Wqjokm0jmBm
         UoqtepCgIMfU9ZbHWnZjizBfZTVD9ixKZ0Hnars3dYKeXTqZVj7dFuzPaG3ANn3Kex0Q
         w7quYsD8IxfOfzZgOEuUwVoT9U4PQPa9obzdBgxazYNGwxAHlba0mmUF2etgt2LSmBqs
         e/fY+fF5aHwLZsuUESvDy4sNnwn+nxjeXfMxRQksHIJYVBJOHCPGh1QuncupMVY++i0A
         UNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JazpuUHXnmCdxO0GArrpFj50L8YlxZ+6u/sc6yIxjgk=;
        b=GfTYlOFNRJF3yyB7EbrzMV5elvxwFQaAuJCY+quuAW3H/ZvUUbZ7CZO3cdpp0eBwGK
         sac4PyAxJO+LRS9VGgi7lIdozdgWCOEJkSDRUtcdoyA77YNfvmScqxD6Yc3s2Fvt5Ak+
         72iW1kFK2i4CKnHxgGlkukwlZhRE6uD7ADmy2Zc10bPQVlgPtN26GUrS4mFpzjtkz64V
         9HSl9h00mmZ0vcWZehMhFx8NXhPPvRrp5qIzyTlhjKr4flmt0JLLjLfNCLNE+NYdjJ9n
         cbWI58svdBwqwYj2kTiB0b0zfLG2i/RuQSoEEhjzkmLaFDhbO4+FpZwkVm4hwz0hfV1r
         J7HQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532tehey49NwocpDhbkCYn6IOsz2aFyE0SZ35MjmnGe8urF6DUAl
	g9DJWdpAotqkIhwri2zZ/no=
X-Google-Smtp-Source: ABdhPJxzTUYe3vumdZ16NRprk8Zh0c7ECrorNS5wOyrnj8vQExLZKwYC3uuvqKY5ImkXT1Q67blExw==
X-Received: by 2002:a5d:4746:: with SMTP id o6mr25099081wrs.410.1595916225093;
        Mon, 27 Jul 2020 23:03:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls10789194wra.2.gmail; Mon, 27
 Jul 2020 23:03:44 -0700 (PDT)
X-Received: by 2002:adf:82f6:: with SMTP id 109mr25417514wrc.25.1595916224455;
        Mon, 27 Jul 2020 23:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595916224; cv=none;
        d=google.com; s=arc-20160816;
        b=GMbfFKJ/57cXUgCwSBCCjuPt/EYkW3k/6tNonw0w8F+Q6AXdT3gOBceLlMX1FlI/En
         CJFaQARxRnm/DMpU1YfTLfCyOimyucU9cHJL0uIr+tbUbhPpzRdZHoIzKgy4Mgk4iKHn
         3WkoSa0B02xQs4YXFYG4azB+R8AyEp1TAzJDsffTCMCeRkMDF4Zn4Th6LnXkS3Wyoxkw
         OmdpiibAwMlRgbFqFzsFBpomoSiC3f5qCp3+XuZldWIlRYFoAwuLc1fjJjlfEd0TOWol
         OAYSiJN9+sQ/HinT/qA8fvowkl3NcxkzMm7+RcysIoegZqVvxmeb1wbXZuh1siBURHPI
         4Yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=oSXqbs6eKsdSYcyaBDJmZntI/v99XDyRvSmVmTArK0o=;
        b=GQuXsE6oB+hEIwqUyHLmMzPWQUGXKbvTyq1lGPz5Oi6dksBbrlAXaXAuWhGUOI3PYL
         2ovA/wTcseLYC39dtKOsfIbuHTvdwGSZVJ/Slj+rI/6JUELZreuUMqy8uUKsMF+gSYYw
         qVDo6QHQiVmNw0GgIXJKzUirVnHZnQ2Hd7uHoUZcGQdm5HGZo2wZUEZ7/l9iagyGHehj
         orIrCPNbWNeA5s4Vu5fjOKG/2gXhlLL9CGMlCWXthgs19gmdt+NbV6O5Rq1PKyMt03z0
         rh7YX4Nck0M3S/FTPe7cRS7TV0IgXGfTDnthTokhEZfqroEoDRm94+QiqQzp1cV66hjX
         tyiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id o134si65387wme.0.2020.07.27.23.03.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 23:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06S63SS8028409
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 08:03:29 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06S63S2l032536;
	Tue, 28 Jul 2020 08:03:28 +0200
Subject: Re: Is Jailhouse already used on products? And if not what's the gap?
To: Rick Xu <cutfield@126.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
 <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
 <830ae788-2f93-4f55-a38b-640bd4acb560n@googlegroups.com>
 <9e0650df-e049-614b-0fbd-9f978b66b9e0@siemens.com>
 <2a2c06bb-71a7-40b2-abcb-91580ec3b3c0n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <25e2314e-ff29-c14e-2a07-b9ad04616f21@siemens.com>
Date: Tue, 28 Jul 2020 08:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a2c06bb-71a7-40b2-abcb-91580ec3b3c0n@googlegroups.com>
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

On 28.07.20 07:36, Rick Xu wrote:
> I encountered a problem. Our hardware does not support SMMU. How will 
> this affect the use of Jailhouse?
This won't prevent the usage of Jailhouse. If you scan configs/arm64, 
many boards to not have an SMMU configured, still they work.

But you won't achieve safe & secure isolation between cells without an 
SMMU. That's because cell can now misprogram assigned hardware to target 
memory outside of their range with DMA requests.

A degrade setup under such conditions would be promoting one cell as 
trusted, assigning all DMA-capable hardware to it so that it can drive 
it also on behalf of other cells that may only have virtual devices 
(bare ivshmem, virtio over ivshmem) or DMA-uncapable hardware. But that 
is rarely realizable.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/25e2314e-ff29-c14e-2a07-b9ad04616f21%40siemens.com.
