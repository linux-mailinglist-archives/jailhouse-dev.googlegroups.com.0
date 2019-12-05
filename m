Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2OYULXQKGQEQPUYTEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C7113C19
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 08:06:18 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id l20sf1107861wrc.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Dec 2019 23:06:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575529577; cv=pass;
        d=google.com; s=arc-20160816;
        b=bLZWeJYQ/XEz+pmtRYMFazHD/z/mSpTZ6SBHXKtxYqDXMo/SwD1Le21Mp1shjE61sy
         lT8R4Mri1HRILTZ0NSgF6OWTrq+0RYSGj5l3ovknY2iWYhBqq6Dw/KsZJxWbWkC1yZ4w
         hV6nl0xbyycz9qyziyuSgL3Tl9hi+fAxFWmlFJFSoPTOgk/x6F/01IB/xlg3PETgAzLP
         Htnx8wl3xjGkkmhX/2G4eFqiGshNka/jHq0Pi/tnE/5OUKtMms1ke24Az4gIXGylnshz
         HDX+U46R0D9S93T7XTUPk1bX06lz/yZEDMWc07Qqhp3nMYre1A9Njr80O2jHY6mYNgYe
         ZdGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ag34uSsnw+sSZaoC6YSxCc1YfeCILj7H3LKEN5rDms0=;
        b=U+Zd3W5HBpZtwwj8Z5fuK97YTalfPU7YaW22jmmAUdcj/1ZrcXU7pmRnY7B1q7LwX/
         lSHVwtYagHlf3VnCUcRYvCD9xpseXhxtFO8wPpwmZcw/G86cgE6eZkbEnQN8PPM80U4w
         4+cG3ki9Qc0dErpD6LOSCcNa+RUHeKphiKwfLRlro2tdQRZEA0hRjN8T0iTWD3zJgEkV
         mZzuaG7MNhujaJt7HgBpNNc+oK/pWdYUjkJh+B5Jk7v/TBtzkJCsT5jhty27A5dRtKRx
         /2KMC70XKu+rGzi/3mxbPoqnlvmQxzX/z+WdoxkGvdbwEqVXmPFcI2TpSJVA94acHUHw
         qTng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ag34uSsnw+sSZaoC6YSxCc1YfeCILj7H3LKEN5rDms0=;
        b=S5mhTPXKe8sRBTW93WcEGXH79ygc1Yj/Jf9KyWjC5UCvWIPRBFzX85E1ArGyaWIIDS
         ei721dzQt3OxIqwkIMUrhU8u4PuNq4XR6y8UN9iE0hOaggRAEJezxf3ZbCtmGRP0OO1K
         y1glEIuXEISbvpqKPGjGsF6jbZzx/2flGN4Ai/O4cHdUrDRLL/i3WOcmo3HuIPCd6rAE
         oEatTo73fdjzrTtu2CfTU5ZdyyRbR+xDiLkJqQiLs91ffqLNK6DIoiQ//2Ml/NHe2ltN
         l8IkHL0M374LotRwCfgC0ktu8Nf5fs0HJc75zMk7SiXZ4YNo9bGs5kHO87GKszbn4Z+P
         bxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ag34uSsnw+sSZaoC6YSxCc1YfeCILj7H3LKEN5rDms0=;
        b=CFe1TVvKFoVv1G94FzOxQeVVUIXqiYRKAuiNHTwIDoMlyRPc7ct1K5X/h/bf+ftDQT
         kZ0Q4y9oT7ziZXsZ6GWhDHzT64na5Krwsvc/KG3Ty4508RKVTSHAV+9BgWAAkoJNALUF
         R0m/Bw2UVXm5YoEcwouM2pPIT1Tz+Pe1VgHhsES6UFJzDO4lwqNq3U6zoWLryO99783U
         Brg/cnuTaNpVZ2KAFFsG9W2P25UPL0ELxK0yj/qmo4N4+q7m8vAeDg17a7qYWWzLfzlj
         9nP0C/v46V7TzA3Cdz6AuRs52kKrY2S2QrEmM/oEYsEkUz68Jme4nUBwy7TWf0TMDF0I
         oEsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWewhsVDhzK0bND6qb/zot1A0cgsQ9H2xJCxWGJcT3x0diGV07h
	8q/BqNAsHtm9Kqa9trsSV3w=
X-Google-Smtp-Source: APXvYqw7ajhTr6FFmR7BF43DWhRVK5F9KzyhcwMUlwD73fCjwsbdP90qr/PJ5mtTDUIp8ZKI7u1BGQ==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr3513215wmi.0.1575529577577;
        Wed, 04 Dec 2019 23:06:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7ec9:: with SMTP id z192ls991919wmc.5.gmail; Wed, 04 Dec
 2019 23:06:16 -0800 (PST)
X-Received: by 2002:a1c:1b8d:: with SMTP id b135mr3603782wmb.55.1575529576798;
        Wed, 04 Dec 2019 23:06:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575529576; cv=none;
        d=google.com; s=arc-20160816;
        b=XIkck0onlhBNW4ulqPCDrPhQWOxsM2lIWQSmzMZrjFGreydcD8mx9zk/lRwoynJIt5
         jNS+dPIu7KdGWM4dSupZm/toT23xCEkhAlLD2XslANV/sGQ3AevZY68z4+eiwDg3zQpD
         o5LOf9TjgLzQ4NHhCeSCS2TUB9hHnYThKXNoKQdXxl7L+jIOHg0L6lyEHLW1c+Sfd+lB
         Lvt5kQ4FKLaaRFrhhdewtfCWmdvD4v2BWW9xxAs1pYFOMe4SoQVfGO9TQNZ5qBqonhut
         rSKuzzpBdtu6sKdb70rRQywUyXaKEOFOk1JhWxGXy4S684yXfYk1u69CtrgTuJRhJ647
         w5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=TOsq+z3WrCpjW/UX85a7BfEMRUyVZ2kMWY2MU7/bE9Y=;
        b=q+9k3babo6QdEjN8ZJ4DYUbDYQf8AaWF+huGK0PrS/PQooIDuLLQ3D8yZ8ryra5AtF
         kFuG71QOdNVmKm+JMicHCSbsemc07vMyq0ntxga9hrj0XicL8SyFNWKxCJcQ50kbtkvI
         ZIVsJHMDNo4fWpx3SJa4k6o1RGgcmhYNvZraQbDsCZELMEkx1ozVCueReFZUdL+l7+YH
         MnFswaaVrdEJUf9iPQUw0jT8u9vIdARYy7ZnXewTNgmN6ZAt7GlsMah7IhAO5gx9pkpo
         jUMgu9LVwZGNzgXzVhTpwvdn48k1pSBPRbKZFQE/RDdWo6o77a92Nt13VwV7+oQpsrWw
         lbQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j65si666928wmj.2.2019.12.04.23.06.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 23:06:16 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xB576Gxt025588
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2019 08:06:16 +0100
Received: from [167.87.42.11] ([167.87.42.11])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB576FRW013893;
	Thu, 5 Dec 2019 08:06:15 +0100
Subject: Re: Zephyr as a Jailhouse inmate
To: Manivannan Sadhasivam <manivannanece23@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
Date: Thu, 5 Dec 2019 08:06:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
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

On 02.12.19 19:43, Manivannan Sadhasivam wrote:
> Hello,
> 
> I can see that the Zephyr RTOS has been mentioned in the FAQ as
> one of the ported OS for non-root cells.
> 
> Is there any reference code I can look into?

There is x86 support for Zephyr as Jailhouse "inmate". Check out
zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you run into trouble,
report to the communities.

We could probably also easily support ARM, but the last time this
question came up, there was still not A-core support in Zephyr which is
a precondition.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ae19eed5-afc4-ddf2-1855-4bd474790065%40siemens.com.
