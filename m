Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLWSUXXAKGQEYRZPVBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9239AF75C7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 14:59:10 +0100 (CET)
Received: by mail-ed1-x53f.google.com with SMTP id c27sf10281706edc.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 05:59:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573480750; cv=pass;
        d=google.com; s=arc-20160816;
        b=wgqGQVh6UFDZeZJjwCufvNUFl3VrH8cx76ilRfa3ZMHY+PnJL36B55M35c9Ixq2jBP
         KEZc81UXJUjpIgS424pGDeDhTAFSC0JItYBGSXo2ir2xBU4pw8ciUrn80J+AEBuHAg6u
         050BJ3MhVLPHTrHH/uFkF8zOQCwydf9ulEmRW22uTjK5i+pxZT3SU+C5A+o4vumlGi19
         X/fHTMb/IFwZVDDIoVqCOQFP07XJC5GNJiwbwwi0SZFhUXjUARk90kQl14qQPNCtqAAm
         If8AUNmg4NwitfwSj+szvGoab/0CTpRU8IeC50raMuSdpLHXlS4Q4FcSGzNGABLzNC7j
         WvPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=L8sitOhHJRn5zlXcXMo4ZwqwsVYMS30sl9BRRSDYzRo=;
        b=anAdqb4e67ZtF1DvenQeUI7JxBhrtG21A8F5RW3aWYReEGXH4sH7kiGdiCDxJPyJHN
         Gg9mVX99ggKg4EtKKLoCXJvTVgkDX2/ovqnugW2Kom09L2v5epG843bGLceCwzRBv22k
         yhdKmh3Rg62TOhe3vA6XhNXuvi1/CQeCwh3IeGXcP82ZxevH/vaRrZ3NCLivqrTWcwT2
         X6zXjUZse/kGRjT3O61Wcqu2I5lUDz/VtqOWXt6Wbdt6fy/ttPtEdG1Mkg1jJXl0+59X
         wv0ngCUq/U6Zc7QyZzEois98jXenJEhzuI5E6hF+imLRpfu5N3g6mGfAGKt6QWzt8EJT
         qpmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L8sitOhHJRn5zlXcXMo4ZwqwsVYMS30sl9BRRSDYzRo=;
        b=dmcxG9+nzgOzzQsQ2QiNrRS4xR718r9DvA7VbGX5H3WYseOPTaDNBs9cVjvdTNm28t
         NJ1uxst579/937WlasExZIql6ZvbqPXmrfApiGDcMbw2vXNZG2711ozWFJFaD+BwJeRX
         a+n6f4OafiVbTPBsBSHQgdcHLc1C4iCGYpBL3DtWBsC6j781SIylbGSpaKdGr+cCYLkp
         L8uA+CLC1hYF/Fl2vxln3M1bA7f1k+tkarnihq70zmODHnHfQBl+rGYHXz34xaOuMeiB
         vltpFYaw75J7v+wTg2fk4sUqxA64Tdig/q9rMvbg+ESIbkIjBmiq2F4UJaEcVhEP4NNI
         yExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=L8sitOhHJRn5zlXcXMo4ZwqwsVYMS30sl9BRRSDYzRo=;
        b=fYL2KRspxZLOaypOoYy2X2STSrMgFv8qFZdUSRevd66gBJJxHR9MLKX7lcTyBJkNZ4
         xeo4/QSuu1KXfOPfNPxBObsElf+jBjBihzSP2fAIjYdMZ9jzZhTWi1N1giez+BybMhuB
         Q1D630cysWegLUafcHf/DFvzHG5CKCzFeHJgRrjCPbaCv5HKNqtn1ylWkLmAzzULv1mP
         xu2zhELqiZXxk/n4yNU1vN1WZpVeVH2w9VgRt5Fb+gOiN1bXUPnbJhLTzGNghMGwYEqm
         CPpc93iWgb5o9ojx8pLaHknJDd08FzHsObNSgOlJp7hz720gBn7prMZ0mdU7aQAon4YN
         AdAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7pRaQ49SmphZXUtqcL5YXj04W4t6bLwlU5yO1q8xVPTdoe2Ki
	16l7RFVpuUm7WH9+FExvhLo=
X-Google-Smtp-Source: APXvYqzceVyF3UHdQX9mZyVdj1TFG/tur9OGGhQrHXDORvpAocsa19/JxVNnfCWP8nwRFMX7RuMUkA==
X-Received: by 2002:a05:6402:110c:: with SMTP id u12mr26616563edv.127.1573480750321;
        Mon, 11 Nov 2019 05:59:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c790:: with SMTP id n16ls2233088eds.5.gmail; Mon, 11 Nov
 2019 05:59:09 -0800 (PST)
X-Received: by 2002:a05:6402:1157:: with SMTP id g23mr27131933edw.260.1573480749649;
        Mon, 11 Nov 2019 05:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573480749; cv=none;
        d=google.com; s=arc-20160816;
        b=O1FyPjgj7z8yCMtr9jKxcXD20B+Wy4/AAh9T+nDuffER5TxE2wQtdo6+gK/2SOoWRe
         nQrImJHeIm5R9R8pXi5MNRB4QEBbe40gAF+Mfn7yHXkmK8RCle4b+tjPHmIJ3QZwcM1I
         iSDYsv5NO8zmdbWZb6sQnkvzQfo93aIXgrKo0234SpPQR4TqW6Q2UmpQlldH0wRivGXD
         h0oWnB7gdHvn4Rmt/lhSxQ6B9122NU/HAmenVrguf9RLLvgz2O6nkWSiBl2X8+y8dWcc
         Y4fa03MXY74ylzC1SvtYcD+G4COrm4CJL3AMobX04t3usduw/4eUDmGjeNuXXmIxueJ2
         0czQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=32YzB1JCariyAcr55pQfUAmNrbAh36uUhTc/pOGLA6s=;
        b=PoiNLHJ4lAv4YdKzEzlvecgW8+q7E2zz95VQyK7NmaDfxO1jn5Ult5DRPwlYsXpn6z
         wRq8cWp9L4cQ8o6QCpU4/Y+vwwInJXVqNwT/kExi0b+Bcdae+EBn2jaS8fKUZ7W1XxeC
         kRDAGFsKCuneYJxXCgkI6fvsFV40yxd9/8Cc/YItFcYLKyHSy8LqarrrWX6wRCB8M4MU
         s9jv6ZTsjvtsZe8x7sGvO8pdA0V4EY86mKfsgbJbffhN5iKeeDQtIL2b0pc5Sfnc0z33
         7V8IHS4hm6RyELQszLcKJfAZbIiWT6gDpxjVLLeK7W4pabxYKXzVunpyV0d5lywuJl3Y
         C8Sg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l37si1378970edc.2.2019.11.11.05.59.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 05:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xABDx8gP030114
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 14:59:08 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xABDx7rA006753;
	Mon, 11 Nov 2019 14:59:07 +0100
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster
 <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
Date: Mon, 11 Nov 2019 14:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111084327-mutt-send-email-mst@kernel.org>
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

On 11.11.19 14:45, Michael S. Tsirkin wrote:
> On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
>> +| Offset | Register               | Content                                              |
>> +|-------:|:-----------------------|:-----------------------------------------------------|
>> +|    00h | Vendor ID              | 1AF4h                                                |
>> +|    02h | Device ID              | 1110h                                                |
> 
> Given it's a virtio vendor ID, please reserve a device ID
> with the virtio TC.

Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this 
finally official.

Jan


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0b0475c1-2564-f433-46d8-ff1a06c13569%40siemens.com.
