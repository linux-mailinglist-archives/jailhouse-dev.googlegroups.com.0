Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOG47GBQMGQEWLPCR3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E8365201
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 08:01:29 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id l7-20020aa7c3070000b029038502ffe9f2sf6744634edq.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:01:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618898488; cv=pass;
        d=google.com; s=arc-20160816;
        b=IKZqbBwlWy5e1VZ0u/r90rsgsgaeOm+tWx79ADTCWJ2jeijb0aENqoe/fZztdu0VwN
         R2gvpU+RAE58sWavm1EHufke2/pCf/P40fKlGY8JTkMdf3PO6WrU/iEYU8nDytCBS0Td
         n5p6RD9F9JVgRdUe7IoNoS9Zq5Kv9F1WTKP6p+LYGQGxDSLKGsV0mNhAWgLkWusEzsXS
         SNcfCrBAqEoDzHmpiMMx6GwQYB9UYRjN9qM9AfGrTnVeB3T4dminxu5LNv1nBQzE8rNE
         boUh+hwI7QolEu9xO4N99JTYlkEP1MFz8DMApQVcE87GpWyAGjvJT0q/PdYRLgnEGdtV
         viOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ItjFrO5PgYbL1565CsBUoa/KAt3xdfTj3y1eMFDzTvM=;
        b=r2K/RW3AurEdGwWO/pdoq6zznS9E2YnAxEfiB+B/qdYDBeLS5hTy5ZG6NGu/K56QMB
         b85Dp0x8ctE3KRtXupqFUyOqEV4/YMEojBOPXJQGzuNcHbijEsTHOwc0HJRj3BfaiuzP
         Y2SzOhEYUgJ0gOMQhr5w1MFUAZ2T0afQ+A7+qpuYyjcWgzowhhg9Egve+c3/LG/tsliu
         XhMTtnMpfaQ9ejV11fijCq1M7gB/WLAUFJubykNusAkhlA9xTIbLEBvxNOWSKbino3GQ
         E4WxW8tq47Cpm9/03k5QiM/JdiWt3OxFDeizpJRTufnswT+pcgsd6PQkIGbxs1GbVBUs
         hEfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ItjFrO5PgYbL1565CsBUoa/KAt3xdfTj3y1eMFDzTvM=;
        b=fKqAKD528UGDYi12sppe/ZP219ApV5PRBCSjXojEnsIxagCfMUqODNtedagJvL2pkQ
         4zuSow/dncrduJaTx/sk52A/TDfAtLAcfHIchGAYn55g+/NZXm67bGEnwbwpn7gbklnj
         pduzKszwkssnrc4QAzIJjJ42WG0vxf/lhenweGqXhGiRQT9X4MKwHLqswqTv4XXJhWMP
         rzaZPz2JsgtFy5c17r6sqpEYBMaA8iAxSMr50IHQpfYLYy5npzGnukwmEvQmd/p7ohmn
         jqA11zyg7Nv+ef6+1763+yz99SuULKeiODv6CpBrQp5J5B9BwciwfJn4p6s1L9cPhFJx
         V/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ItjFrO5PgYbL1565CsBUoa/KAt3xdfTj3y1eMFDzTvM=;
        b=dxKUwQi2fxBIAsef5s+BTp+pdB7hxVSkB2Mis/KT/uZFepJUSZhSgunx+d4Q9e1vJI
         hQZjVqFy8GUUzze83NZoKwDakMiroMTpbar+hW2/bKMKquwNROjm9/QkZPCMx8dgRlbx
         KqXWS5yALQdUYf37GYX68VglLHqgCSjajXPcnE1CnoYusJMD1V8+WgUT1rVBQAu3MN+W
         RXzJ5+shzb+zAo9eD/Xo5bs6Ah/aoPL4J8hOYfPhb3x+dNdLMNZRFRRMJFcHeTP7zFp3
         gd/jTbm7VThQhnJBdNdsTlmThCdQFYpC0XhetdQRurBfYRhqnoNDEcuyQgzVckdW0Scy
         xocg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nhBF80xLlhoemM//o1o4ILWi8slnaDBZJFBQ2iyUymvvyTV09
	ql7Xb4ECGro2APg1LZBt4DY=
X-Google-Smtp-Source: ABdhPJyS9gR4FaEQa6ScftkT/rHpG16ctHnxoEzFijuUNorl3bIlIZLlEDxGSXB9VUe7BVpv11+vvQ==
X-Received: by 2002:aa7:d596:: with SMTP id r22mr3292567edq.344.1618898488756;
        Mon, 19 Apr 2021 23:01:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:b07:: with SMTP id h7ls8378201ejl.7.gmail; Mon, 19
 Apr 2021 23:01:27 -0700 (PDT)
X-Received: by 2002:a17:906:524f:: with SMTP id y15mr25484778ejm.65.1618898487536;
        Mon, 19 Apr 2021 23:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618898487; cv=none;
        d=google.com; s=arc-20160816;
        b=dqWoTGjxjCVqRMDjT+ufCsIK/8IJpIe2qKwWkWCc14Ty7E00ZT9mTElQzf5qycEcbE
         kZSM6JcB60AH0kxy+wcyidHaaw6RtVcFQY7uS9HeBa2SL4fUaWGHvt1qUM+5iF4W4LEJ
         09Ibj+EUOyE+EzgkmUIUM18MBQIXaTfTGbZ6+KueNqa97cXGGuno8WCGRIXn9nkgJkZQ
         gfLlUplog1QDRGfH6PB4WxAIKgnj36XkUK2MBA0YW7vFlhyL/e9Pfko+eioPvTPmNgfg
         TmAJ4spkSkTmYr97QxNqi+SOvkH6RD8By9gZB9jNXQXT++/fbkSfTch8RrY2BMMNVKRG
         V8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jiWQtCgIm3q1eViMIcdet2yQjVvPzW0kX+jJPn8VhGA=;
        b=FlAcl/ahll+P9yWBb2uNJdCWadan5O0mnMaC14hU5JGWytBOtkwGlrOhOuDj/chhq4
         CEEdmXwkek4KLYCGElClkebmf82YWf8dIrpj8qHNFn9m0VTb6MMN5YvdyWbmMr3IJnmY
         6RYOFoqNKFsOvV6ozX26op9sS5x54ST3wqe1nOLBX8NIp6H7mgjNiCX1ltfgUut2F/Gf
         x03Vq5TOEPmvm7Jd/J1XvYTHSaVk1oGyVVaLPCXWNxzif9su+WND1mzoLPTZZwD2Uy36
         ncGmCZTNddFAgznOd0WVZboACU75UvAjezFzasAhs18r+94dz3FYHjI4x8MK4ULq0kn5
         H7dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id co24si903290edb.4.2021.04.19.23.01.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 23:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13K61QtU016076
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Apr 2021 08:01:26 +0200
Received: from [167.87.240.116] ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13K5vm8L028319;
	Tue, 20 Apr 2021 07:57:49 +0200
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Marco Solieri <marco.solieri@unimore.it>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <DB6PR0402MB2760F544F58FFF3AB688F19688499@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <9234b1f8-0275-b438-a1f9-9c274dd74c04@siemens.com>
 <DB6PR0402MB2760A15B9F7D6B9864B8D67E88489@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b7e6ad49-db2c-bc78-b2c8-ecd182297cab@siemens.com>
Date: Tue, 20 Apr 2021 07:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760A15B9F7D6B9864B8D67E88489@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 20.04.21 02:56, Peng Fan wrote:
>> Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
>>
>> On 19.04.21 15:28, Peng Fan wrote:
>>>> Subject: Arm zero exits and zynqmp ATF SDEI-enabling patch
>>>> upstreaming
>>>
>>> Not sure whether you are aware.
>>> FYI: SDEI not work with OP-TEE for now.
>>>
>>
>> Thanks for the info. None of the targets I played with - so far - had OP-TEE
>> included. AT-F bug or a conceptual conflict?
> 
> The design of SDEI not take TEE into consideration. SDEI requires secure interrupts
> taken into EL3, but op-tee requires non-secure FIQ taken into secure EL1.
> 

Do you mean the implementation in TF-A? Or even the specification of the
service??

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b7e6ad49-db2c-bc78-b2c8-ecd182297cab%40siemens.com.
