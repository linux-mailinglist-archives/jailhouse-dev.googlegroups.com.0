Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXFSYPUAKGQE3MYMQGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50650D45
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 16:08:29 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id b67sf23315wmd.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 07:08:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561385308; cv=pass;
        d=google.com; s=arc-20160816;
        b=tvPDxAeKnte4dNps7uzAa7+DLMwR28tEs7vYpyLFyJWSFeEkCFcvPa9NQ1KJAr8OtD
         AGDrt/NE3+37wx8diCK3UC1DvmaG7TKqQ+RBLzZI3q69e9/8Aui8/XazuoZrHUH96U7g
         n4p81HjI4OQr+WGKEg1/jLTJmhfG9RD6ymi76I9iiub68/j8eUOZZGKclpup/Ze5d0Gq
         6n+S+62dQjAWWbf88VKVOJ9v7xtFmYO49PQ2+yYlwgmu83Q2Mdp1MKsGxJGsnDtLJEGY
         6vwxYE55+TcOzEQxCGBhgGRxWlRjlFjltNpVVclg10ePBqZgLbI2v2mOTWnW570ak+Hd
         1+AA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=chTnUQw3/wocv3k2tygXKqp9ul3jpeEwNlufrpEVrEY=;
        b=QXF2wT4ZFkKaFiHvaWI2NpL4iSfxsaTeStlKURfXa/RzH0oP73NoXTeWkiGnpjyZ/a
         PACvq4fTQePi0DAv1tt+kcyYYjMaem5Prw6Bkauz5GXgt0w2d3HtiY5zWINrCReKCRNg
         pXzy6Vx7SIs/CndkEL/DGHRoUfOAXLC0/EPalppu8a2yFp5ozF3AP9gfcx/P9no/2WnH
         GIgUCUWRI29BMnkkdv/ko3250Ez9vLnJAkf0COJ37KbQEBo8lg7ygy4x9K7kkMJuSup7
         S7PhVDOde3WwHqgWyT1hAQZ7ej9LZNS9IJgUcklbt6c9E3/Gmgodt6YPPNxu1nCkJSF2
         sspg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=chTnUQw3/wocv3k2tygXKqp9ul3jpeEwNlufrpEVrEY=;
        b=LQ+6C/7kB1/MstwUVHqH/bo/uPvRevYzKia2V9F0J3pjBmJaIiBdrVmn7TZqf0NebO
         RjqzRuC3CIY4ZtFp83BM7Gla0qG/RIMyWYapdpvwJxbzXgAMaz77T+K5e8UW8oCkkm5b
         M2WcOXrB26aZ8bT/MlpdPLg80SZhuRrmV+UV6o7FtS4ud4fgOdi6rys3pFuT/xoepeep
         MmZPCnxrTzzxR5tDdnjX9o8VZx+m0CCCrz17m4q8y3J6j1YPWMe6SALjQCTtoC9Lxag0
         YEDQmBcFN7em9hzKbyb2KlxxOSFlwVbzGMBvHzbPB8XfIjL0lEyJm++Yf8nhGwmeKpWC
         a1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=chTnUQw3/wocv3k2tygXKqp9ul3jpeEwNlufrpEVrEY=;
        b=QyVqOqdhdpdX4hR8UKkBkKdrVcj2TI/uXO2BMYiqAUsKorX2wcLgpjEWbrW/8Pzf2+
         K1sj34DJkhanLLBjeICVwUOKdc7gQCBJ3FkRjLPvgLwMpjfT6od9aL9kjOzDL4vr0/aU
         xPSsxwe7OKnAgLsyEEnc1Z8WvinOPrwWBR9kJTXUNOwrHTV6mtcFBKpT3LKwe6g6bidq
         TSTHARj+KnbKEBkeVap1QcbNzOSGiD+Y5xjwFgomRRxzW/VhCBk2debty+7TyaLWhtoc
         DCTaRYDswpE1E0jZ/a9z0L/aRw5w6un4aPwzJsKibmnLVcYFbwqHmTD2c2g2ubChuxx4
         7Hvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWB5uW5hvEhrWSUG7XoNvipDoLMa8VT8hAnfNf3jysaL5A4InJR
	xHTjkBH6XOLP6I6tUXy7bH8=
X-Google-Smtp-Source: APXvYqxhAliwESoIJHRZjuvpwud48c14pUgt0lXPC80/SdfmiGZlr8Y7kZgHdwSEyyFc+H7jS9gxdA==
X-Received: by 2002:a1c:a783:: with SMTP id q125mr17046418wme.94.1561385308860;
        Mon, 24 Jun 2019 07:08:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls4742607wmf.2.canary-gmail;
 Mon, 24 Jun 2019 07:08:28 -0700 (PDT)
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr17014283wmj.44.1561385308287;
        Mon, 24 Jun 2019 07:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561385308; cv=none;
        d=google.com; s=arc-20160816;
        b=Ai/XkkfXEgwAVP9hbF9oh6NgOe2w+J5gqWaOvyAnQPJP/R54wUe8e3UuGQgvejW9tK
         Sngt8Fdmcm6O08xXQScAC0p1K3pzND0oUP1gymaiS3tvgZet216e8s7P26dthYRVH+Zz
         p6/gAly8rTgrO0H49LwvmAQsQjQGXnUTnwEAy3Ii4EzQAJ4kZxt0gM719qd0igiwmD3b
         QG1R+aH2dGZgA7imuhE0M3HSmPOLDEemro4FhLXuWjgY65KLbya31LB+jMRjCNVeUDvM
         kWyX/d/efT7K2DZZMICfpN2O/mYprMwQwWi5MUZ48TO3M3A7CFvj/yOGgLRwesr1JGHk
         uMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=pkLa9IjgWhIrNj0F/azA6AHp5vfRTsKwgmK2z/Sm2hs=;
        b=xel5BR+El2f6BJfYBo69QxiDuJVCidre+EaO/x6cisJNl3D3zPMDIEN9b/Wh5LDMN/
         hqQBTTrc5J4zTFywIPt7gzQlaO6YbyZJCQlBo7+tB4fsN6fSIQQVGz/Ci89/r2LUZIoG
         bACl7tNDnK9SIdmTLj8uOnuZ/p0pJSywOESEkxkV3gu3e0y9uzhtJY7ozrB7UlqbT9po
         vYOt60HIKMQqud+AOMXfAA9i69R6TnBG1QzXiT5TOUywA+nrfsIdEcesr5zrmiSIc9Yl
         fDrXpnPKrvtuQXzfiCqkL7RdyLyARyrSOC60XKA/wGDSgviqk+8Uix3oWpXwUEH6jZgs
         xEjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a1si2451wmb.2.2019.06.24.07.08.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 07:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x5OE8Rxf015001
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2019 16:08:28 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5OE8RgG004778;
	Mon, 24 Jun 2019 16:08:27 +0200
Subject: Re: [PATCH 0/3] x86: Fix stalled IRQs after handover
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
 <1c8de33e-8ec3-9e4f-5a4e-d70ad133362a@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <49b44cac-9657-f4b1-745c-bda91a515b26@siemens.com>
Date: Mon, 24 Jun 2019 16:08:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1c8de33e-8ec3-9e4f-5a4e-d70ad133362a@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 24.06.19 15:57, Ralf Ramsauer wrote:
> Hi Jan,
> 
> On 6/24/19 8:28 AM, Jan Kiszka wrote:
>> This series comes out of pre-release testing: With new kernel versions,
>> we spuriously injected masked MSI vectors that are not acked by Linux,
>> thus caused interrupt stalling.
>>
>> Jan
>>
>> Jan Kiszka (3):
>>    core, tools: Add msi_maskable flag to jailhouse_pci_device
>>    x86: pci: Do not inject masked MSI vectors on handover
>>    core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi
> 
> FYI: tested this on our AMD machine. Sometimes, we still loose the
> ethernet device on jailhouse enable; especially, when jailhouse is
> enabled over ethernet via ssh. It's a rtl8169, supports MSI-X.
> 
>  From my gut feeling I would say that this series, together with
> 9c633193fd583e lowers the chance of loosing the device when enabling,
> still, the symptoms didn't fully disappear.

Recent changes in next may require regenerating the config in order to get the 
desired fix. Did you do this as well?

Jan

> 
>    Ralf
> 
>>
>>   hypervisor/arch/arm-common/pci.c   |  6 +++---
>>   hypervisor/arch/x86/pci.c          | 15 ++++++++++-----
>>   hypervisor/include/jailhouse/pci.h |  8 ++++----
>>   hypervisor/pci.c                   |  6 +++---
>>   include/jailhouse/cell-config.h    |  3 ++-
>>   pyjailhouse/sysfs_parser.py        |  2 ++
>>   tools/root-cell-config.c.tmpl      |  1 +
>>   7 files changed, 25 insertions(+), 16 deletions(-)
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/49b44cac-9657-f4b1-745c-bda91a515b26%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
