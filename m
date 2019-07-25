Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB24C4XUQKGQEH6ZF2LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB387457A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 07:43:07 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id z20sf31493438edr.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 22:43:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564033387; cv=pass;
        d=google.com; s=arc-20160816;
        b=WAazOnSq16km2nJI+73Pd/zAY/WrJNSxSV73PcllNZA07/BPE6PNHJg4W0nbc4J9ai
         LuQzkU1D487/HZ6upKC+ZIlONXPAFk5vQR3VG53LddXY69UooVYabPEvgbWd2jkbmBxO
         Nq540xj0P2fWIzsb3ygP6UJSyPRSn1vYxdLoD/BblTJQFbI66Gd7EPEHkvXRG8jlldU9
         hQkcF+w7OyoHdSWxdzAl7Kfic2wTZSemyZarna7gSXvdJl9I22YhlvUx5VnTk+cJd69s
         RU6Av9GOLyO3nKlUsUCOSnnbE+54ow6kcq3bAGH72heYcJIvXqUanSnpLX9KDypET3BX
         i56g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=EK4L1IcZuyTtj0bLOopJcbShRYjQ8Gfk/7++txlc1KM=;
        b=ax1dZB9O+lkrKJIyeILmdSQPDeA+1Nx5ReL73kac3QViNruuzaBpYKx332CpKn2Kjb
         Ujp/85DwuFr0T5GUe5UNqKoF7VM3+/aGVd8MLAXdbiK8NYF9ig7ukg4GmG8CmuS1pMf+
         g6V4t+krMio2CfOFkR/2Ir66qKsKedC9HtCBEDngeUk6s8hbu95OnTHk5fWw1S1uPK8J
         0znhQlzneCIP4Q9Eb/A0azhCfWZRZIvUcZhopKTTJTgMgGmzCQpd8/FDSx9hLEOH1Y4M
         zLW5Abgj2im9RNPVAv79ic2ZCbfQDJUBJd8O6Qak7CaDJv4nz2OWLVYGb1Zwdi46JM3m
         BYRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EK4L1IcZuyTtj0bLOopJcbShRYjQ8Gfk/7++txlc1KM=;
        b=orTBXPzWRMZFxLFaFkjfbMkntEO8uTueSxoukGmiBg56qgaTvRXMQsg5AtcbSq2sZ+
         6oLAzyX0sLYaxWDHijYRE8m0hRAm3ufYJGzC/MEq7UZ/NOL8VbjFM1/Rw6403L5viw4Z
         fQn0n/725bX5SCINtMhysTIPW8VW/0N53GXppGuNxnqQRvqMVMGEYWxCVFI5JY9yOgPX
         7fq6Ya4k1GAy0gVJIvHnGiX0GQOtR5ksZLLKM+tu7KGJy1CnWo3G1wz640GXLAR6kDGs
         QKt7pJ/KNIHQdd8X3HIHaBrM0SWAJ7Zyt8lN1EI1nD8YhrUpggbFgmfm3j9KEXldeF6w
         AP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EK4L1IcZuyTtj0bLOopJcbShRYjQ8Gfk/7++txlc1KM=;
        b=Ey/gtCKq7/qY6XAAqYgO/iT7h2s2nOgZi0iJOhT/0LefwgPVml0jSi058JjM75F/Wz
         vSQBLnJwCtO6PyESNvQNn46wmziFKDcAa9UMj/OU7oBvRl+GDFuqmSWFrQWjz929dwwq
         BDdh3pl10bxOaDlt5+4NBJJCPXIjquvnLow9D3SaqsHqJzlvHYP8Fl7RhHqAJEmB57+Z
         JlQKS3wZABFmhM8M+EljICCghwuEfzyE/IrJBpr8qY2mmQ8QffHqRX7gdR8t9qavD54B
         LFHi84yKBOiWJqo8VUcz6Ws4JC+mA23oB3tXk3aVmNEw+xgszopytkhkg6FdrhU7gMko
         dOrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW3o1Z7aX03+2WV9/k/t4OTuQ3pMFFWk0jHORHm5iJ1ocNS6nvG
	lc++B+koj1L0nMSYNZCP1Lk=
X-Google-Smtp-Source: APXvYqyjLLtMQqw7jQCtFeAn2iYZ0Mw2CS7DndTmGXa2yUvBfy2N9FmcF60bYRG/mT38+zjGS5f4VQ==
X-Received: by 2002:a17:906:f10d:: with SMTP id gv13mr64973790ejb.151.1564033387290;
        Wed, 24 Jul 2019 22:43:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls11462137edx.9.gmail; Wed, 24
 Jul 2019 22:43:06 -0700 (PDT)
X-Received: by 2002:a50:aeee:: with SMTP id f43mr75678879edd.221.1564033386581;
        Wed, 24 Jul 2019 22:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564033386; cv=none;
        d=google.com; s=arc-20160816;
        b=kqcObeVIomGlGfOCOr6R0ttJdzNmdfS6aFU72G9mAIGfWN3UzEVJx9QQkUzF2jhmTn
         YL/W6gjC4t+JzeE9EqhJcvM65j6E/02H7M4nc3zTZHZf8cyJVVVDGkAL5scJAHGL2OwY
         Z9jhucUh51OeacNDfmiWjWaUicOcRgGLkzVTH7mS3JKvV0LTc5CNWOtTrkMkDVOyNAHe
         oV0V087cebXYlmQFS5sdXHIJvjmr1KAHq8qJkpweuFVFxFwOGlX3Q1asoqrf1Ya4GUkh
         U7mtF4RVcVJjJVmTdEoMnn41AlHa6lWkcf82SLjCs4jhYErLI5Mijg8jw34ZLwinkXd6
         1cuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=UJhRHnq2VM8R/sKjPbsBV7yisINqdpAWueJOBFjibMY=;
        b=0na7cCbre63RT9Z6mI6wjm0xkpphWtIOtWWBfkjCOnpRVsr8UrOySmPdwbwU0H+VU1
         6COeNdJTeymZvL2ZgGj2wVeGjSDm7jFqF7Ni8Riyw+dNREP139yj4VZEpFDtgZkdsB6y
         r3SAcNsHpDA+H+o+exegygBfjz17xJ2O+sYN4M/bwO4/XG/7h2R2m5cnw5Nzg6KzLX+B
         uBpax1Z0dvCh6lQOWGmZwoSm234R0wjwQ0uFB+6fws9PvRhLb75rGfDvKSLU8ymGtt8W
         JdDGVXmtDV0WZy2KYTnPwsmK85i+NFjE8tSRz1246oDy92zi9T2zT+03xsCTVf1yOHWD
         qaDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t15si2291826ejq.1.2019.07.24.22.43.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 22:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6P5h6TE009693
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 07:43:06 +0200
Received: from [167.87.33.114] ([167.87.33.114])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6P5h5WJ016080;
	Thu, 25 Jul 2019 07:43:05 +0200
Subject: Re: [PATCH 00/11] x86: convert pio_bitmap to pio_whitelist
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bdb53925-7a11-01ba-bf41-08bb706cfd79@siemens.com>
Date: Thu, 25 Jul 2019 07:43:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
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

On 13.07.19 20:10, Ralf Ramsauer wrote:
> Hi,
> 
> this is a follow up of a recent discussion: Let's convert the pio_bitmap
> to a pio_whitelist.
> 
> It supports readability (no more bit fiddling), writeability (no more
> bit fiddling), reduces the size of cell configs (per-config reduction of
> almost 8kiB), and generally, it's more Jailhouse-like than the
> blacklist-like former pio_bitmap.
> 
> This series first cleans up and consolidates a few spots, and then
> switches to the whitelist. Logically the series is pretty straight
> forward, still, there's one little trade-off: vcpu_cell_exit. We have
> some more complexity there.
> 

Partially applied due to comments on patches 5 and 9/10. Means: patch 1..4 and
6..8 are already merged to next.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bdb53925-7a11-01ba-bf41-08bb706cfd79%40siemens.com.
