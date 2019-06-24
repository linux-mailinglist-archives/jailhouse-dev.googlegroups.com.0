Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBMVNYPUAKGQERH3SYUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA1E50CE1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 15:57:07 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id i71sf769426wmg.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 06:57:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561384627; cv=pass;
        d=google.com; s=arc-20160816;
        b=s5LD+9IYgxb+qCz4vQG3seVeuPB0TVgp4T8A8um42Slja/8VJQBKNa17kQD8PSbtCY
         Rr3xaTb6mE6l9b0GQcEcy41Ag9gBkhAOwH/yFMt6a/Oze+ZCySp8uJJ+KdbJBt0rLlvK
         KKv2JZzk90VDsyAQ9ElpVZkyI6mk2IhY+ETq6rFLoM55iN5VjXsmenH8qji9WVtmC1lx
         5DR6pC4i0HfKio45deC0HZR3Vw8rtmr4eyD3tAGfcoqYCKOY+RaZ2lb69Q90xmMnviW7
         YfKS9z6xNoG6i+VZa5tBf4Nawp6AL1UJ2k1Vznho5A2KvatrQ4Su2KNoge7/maUmzz2I
         95oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from:cc
         :references:to:subject:sender:dkim-signature;
        bh=gUOiEWivTbCqOagolViiuIGu6IB+zMafvMfxtpEsg38=;
        b=LeOeocKpFXbINWmgJlz05ZmW6karUPBHMYYGRx0Bd7jNDJPbLsZGaLREzUwnrHlZWD
         LtjLtiQXSjbqrScPPmue2r5KL2olvVMUbEZ0Sg2Pzx1CNxc7n8vw0Zr/kOuLgKv3p/MA
         MuOOvWjM7bWaRiScWmxgrQinAIoGI6PFhh2LDZ3D8r75Admc7LZFXGU5XL4q0YssAPQn
         gZL+OwN6ovj/M1Wpt5iJTS+aIhTB3Fa9Li817Ey1xJt6ZZ075aNbJSZ34Z2YoAoxvhGo
         /EFuJnmvdaTriElN47bsIHEY6fetf8RjO3gFVchrAIX9BIj7Qmb3NzXtQ5pBNN2e6H1g
         iVqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=jH97ignk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gUOiEWivTbCqOagolViiuIGu6IB+zMafvMfxtpEsg38=;
        b=TnMXkuOpz+ljXscoh880IrJZEN64QJYiFp4fc5CC6PDyYjIODqQ1LTKOfJARDj3unb
         b3J9K0qo/KbIp2owwce1WItemXoZQGRz6CCgfgxDXce4pw7abZFShYXIhwBgoP/w+kXR
         QuZbUEjlwuQXRRtv9XlqFMv6wrzLA1IgDXTYZ6MMGFVyaxo7xLjf32l188W2+jx3NSU8
         dLkd/uTE/0uR4PxYpCI2CcZlBozFF9gq40o6++5ueifCMFSsA/ad1NYVdpHv0F9OFI/T
         b3HWHfGy42dFuTG0FrhzPuTcWIGsVDpOKPXFQpuX061KRumVneBW+0Rw3oTeycTkdepe
         C5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gUOiEWivTbCqOagolViiuIGu6IB+zMafvMfxtpEsg38=;
        b=KnsfqPYx2BvJcLBY7QJd1xV8e1GVUewAgZk+M9YPZfbluOQiOHKPFGw9Lp6BPDASSa
         UHArzCPW0u9ME79gIWMJh0LMX4w8VMCGvEueR4id0FjYd7ZL6ppq56GfAS6UkAl/ZiGC
         jwrjyGTtDF4rV2vs7lbJ2zA3b0hozM3NXPNeKvJEwC6+mpuoXtL7QPeXajiKlBv2rG3n
         9dzyH4iVmammJhG0dKQsxW0ZWAtDQNzC7ZH1YW2wl39ImiDPMRHZs1UKpRSsnV1YsGP9
         cAxxEuHSBN/CG+WsejG7sQ3RbY2E/cvqGw6ClV4vyF/e85vg0GH0gUTAC7ZabWc9ySR4
         wfRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJyCxr+H+756ubfP55SA/7l8Dbg8n6K9hvzf1PooYKbHgtynHB
	Y9L5qb9odSY/iyfxa9BRVWE=
X-Google-Smtp-Source: APXvYqwlSUaMfXZB1W3kcXPFx1cpdQZlvSo1UHN7Pb7urf1s+l1B9dAwzaemwB4TrP1FRTKncrM1Pg==
X-Received: by 2002:a5d:4489:: with SMTP id j9mr67148004wrq.15.1561384626952;
        Mon, 24 Jun 2019 06:57:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7fd1:: with SMTP id a200ls4740892wmd.2.gmail; Mon, 24
 Jun 2019 06:57:06 -0700 (PDT)
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr1720896wmh.141.1561384626408;
        Mon, 24 Jun 2019 06:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561384626; cv=none;
        d=google.com; s=arc-20160816;
        b=KNcBnbGrE/bCuf0htwtU4OQZ/8wOquTZJlD3uHBBE0NoqBi/6Jjfxo/pHNXXZRu9sj
         qWGiPcu+OJ+yRQi784Ox3/U70Tt+aGs2pKCFC+wtv7nU1urzkahK+9zPXwccOToqQejF
         ZjsxHfJBMzLShVogPkjd3mM8qUn34/+Lhf3lgfb8xvVvWyRRgTUqtmSh9nR2508RE/gN
         Qmxex5qgTnVKxB2/OPtsnhynuAbgrogSOA1hSgQTmkyOrXm+av4xtXL5JSE2IvG8meoV
         fgE8dG2E1ttOhCqsxMXHLT7NlzRWlgoycrxXd/rJ1/oiZUo2V4RyRL0qX0ioPdq7w9ct
         W1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:cc:references:to
         :subject:dkim-signature;
        bh=1sXaJuPKDa91PoCX281yWKw9OvSfm/WTUscxxSSwqZI=;
        b=jT1Uci03UZJUelq5HiD5z+IdofVSz48ak5tmbKk/bqFR8fXMFeg5AUvVZg17nPMMte
         EdgEhlxJ9jmqTsQXsIVGetrAMXbpIzw/CzBMhCPtuqSpltJ8D9s1dXuIeqz82SZXf1la
         ht/OGMjPeReIESurePBjBt1TNteS3KGdVk0Q7+3+pcBw8LSRGqizFm0QM5uCuaCHFcip
         dOQlSEuPsyjS9pBQmmQcWtX5elZbDJSrWAh3DD5vjql6Fd2ucPkvmkLdtOWt2s5NzsYn
         MMMCDRqF050rJoFURC0JCNj1pW1nrM0b9ZB6iHO3wQa+plSFrOy89tpVvGMpiOAI/zfn
         fJxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=jH97ignk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id j4si1676wme.3.2019.06.24.06.57.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 06:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45XW7Q0RkCzxpl;
	Mon, 24 Jun 2019 15:57:06 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 24 Jun
 2019 15:57:05 +0200
Subject: Re: [PATCH 0/3] x86: Fix stalled IRQs after handover
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <1c8de33e-8ec3-9e4f-5a4e-d70ad133362a@oth-regensburg.de>
Date: Mon, 24 Jun 2019 15:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <cover.1561357723.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=jH97ignk;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Jan,

On 6/24/19 8:28 AM, Jan Kiszka wrote:
> This series comes out of pre-release testing: With new kernel versions,
> we spuriously injected masked MSI vectors that are not acked by Linux,
> thus caused interrupt stalling.
> 
> Jan
> 
> Jan Kiszka (3):
>   core, tools: Add msi_maskable flag to jailhouse_pci_device
>   x86: pci: Do not inject masked MSI vectors on handover
>   core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi

FYI: tested this on our AMD machine. Sometimes, we still loose the
ethernet device on jailhouse enable; especially, when jailhouse is
enabled over ethernet via ssh. It's a rtl8169, supports MSI-X.

From my gut feeling I would say that this series, together with
9c633193fd583e lowers the chance of loosing the device when enabling,
still, the symptoms didn't fully disappear.

  Ralf

> 
>  hypervisor/arch/arm-common/pci.c   |  6 +++---
>  hypervisor/arch/x86/pci.c          | 15 ++++++++++-----
>  hypervisor/include/jailhouse/pci.h |  8 ++++----
>  hypervisor/pci.c                   |  6 +++---
>  include/jailhouse/cell-config.h    |  3 ++-
>  pyjailhouse/sysfs_parser.py        |  2 ++
>  tools/root-cell-config.c.tmpl      |  1 +
>  7 files changed, 25 insertions(+), 16 deletions(-)
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c8de33e-8ec3-9e4f-5a4e-d70ad133362a%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
