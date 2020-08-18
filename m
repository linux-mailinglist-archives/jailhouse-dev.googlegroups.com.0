Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPXP5X4QKGQEWUIOHBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id C8659247E8C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 08:39:58 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id e12sf7859799wra.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 23:39:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597732798; cv=pass;
        d=google.com; s=arc-20160816;
        b=ngz/Sx7IR4eGxDXg6nDcy60e539Lsx/J33MdWTxNqX0cQOnireM1a2KZHFWbLcHuem
         lxhS0KNshmj8sTQQZGQcVWwS/OKsJI141bI5T33iE4UPLKtdB88mDKxIXnq1NWXXHf31
         2JeltfxmRsCtgh49sRsaaLLRYN0Z0ScRyCgHz/6wiAadAsfM6Q3FuEIG/08PiJcJzFsz
         DVJ1/PFHQKhrD3pH5Gc8MlYXBXJHBvRrSJI3eB3WipUAOisl1i2EevaLeilRxvVBTewz
         hmhz9FB+uzEPEEh+zq2fZJH5+JX/KYKO36LsT+OvRhdH0S6mHku06QTDbx9pAkUC0mym
         ejbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=gJYBzDvhF2nfauFjYkOVCclwIC8fiQUSwJhVoMcK6u4=;
        b=CDn42xTG/W8xh+5ogFXQy4gj7jNeUeiepLR80R7a/Nd7VKRSzNeK5m/5cHclgfseaA
         ro7d7wQECyofWWGNubHUU7pEKX4k/EHKcJWVMR0HxbZdRlkaHuq01+gtM3djO+IO2Auj
         U2/JViJbm1LVQQ9UpMgGm+SkkSCGlTkEnl95m90INsRr3bHZXnA4AK4fVCozvZDil5dj
         vURXe/DWFi4zekyvMnJ4fYtn9Zp1RLlAV+TmsVmsUmjG+15jUjZeKiJg2D9xeaFAv2Lm
         5ZV5r6pTLiUzppgeYW7IkHchF7Pn1pcnEhyCFMwMQk0E5YUo2WOXfJanHHPlGkuRktSM
         mx2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gJYBzDvhF2nfauFjYkOVCclwIC8fiQUSwJhVoMcK6u4=;
        b=KT/2+plaGyAVi0g9fKqjkRAjb1ldrLtV6Op/NqjkU+ShcRZGeilpJ1gDHDuJsOWvR9
         5AFq6ENLzoI1kNg84VRpZKCWhiQQpUGKqbYcftsFggAxkXazxf044tKkprcC1ZjTeJJe
         q5mC+tH/5qZ2KunCi8oH/7+rpXxHqydVRIO65VQt0bs+tQIG/uix4kmUyr+cE35dAPD1
         tzXL7afSqhMPEipUp6DsNNOhTaZ2jjJL+du9+3MJIAV+epoEnEBXqVmnD1STeMxU5IQP
         vSv33dLsrmKzDYPpyyE2TtzVO+t7Nqo9U025i6O4kHMbxsEem7rQGQG1Du7TSxisShhr
         l0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gJYBzDvhF2nfauFjYkOVCclwIC8fiQUSwJhVoMcK6u4=;
        b=Cn6vJBYThB+dwuWkUOhlcg+vqsVI4n/Kl7d7PWLzoiqtYnEwXp0m2X9UxG4kUZ6ZKp
         L91zRPSyE9Sxmp1vSdaS/r3O9WiJCpswb4BpNQRZavnsW6fBXSG5QcOfZa9i2ocrbEGg
         Y9KQfp9EtbkxPFQkvpNtufaU0gmkw7Yl+aloeFg7vXdkiQ5HJdcrBQBf9vNPXB17lh71
         wUBldOjjOeF6upP0F4s8Z+5sBYKZQoJR426l9yDTuGjqnW73ufp2uh1lQz/fCOFkEDHd
         5siw/SBbQjtRMRWIAtXtUMwv7b6sNpMe96tKtsj1pS5aSi9m71ja9UQ/38HVqxHaLh/A
         MuQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DGPS5U1pp/dW1CFxXAep+DTM25vaHPzHUGU+qKZrbitGQhu39
	YgCjNOCl62Wx5tzPrpjmIW4=
X-Google-Smtp-Source: ABdhPJzii3HMnhxEx1sZ+DsPq3TScS6B9lqBgDjTAUluLB44NqYQLaoe9AV/HpGk0Z98j+HHN6qsCg==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr18487168wmh.4.1597732798521;
        Mon, 17 Aug 2020 23:39:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c304:: with SMTP id k4ls608296wmj.1.gmail; Mon, 17 Aug
 2020 23:39:57 -0700 (PDT)
X-Received: by 2002:a1c:b487:: with SMTP id d129mr18952151wmf.185.1597732797616;
        Mon, 17 Aug 2020 23:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597732797; cv=none;
        d=google.com; s=arc-20160816;
        b=rZOHp83ogXb5Xz0sGu1ntUBnA6cV9DSf7L1thTNP3tFC6/AgdG8sk3u/vZ1drC0/+5
         oPmrmTf3CrlTQmfM4/Rmje7Eu1LQ0wK/2wnIBCApC9ZMDldC80o1DAD++oWf/QGng9H1
         SSiP0P8U1BZLctbHYj081gvqpS/AZwc7upJYSItHUz4oZm4+0c4uBFr49mR6AX7R05Xd
         WXbf/2qKuE3vsuKLHH2ta9ie5+jko13LUC9zSvTCi0gThpJdu0+s3Zj3NDbqpDoM17QE
         do5+oTuthlSA6rm3E75+qTzdNU85dE1heiIs8d88k/RE+Lu67KDOLC3Q8lWVf8TnHM1j
         cc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=juZ4Voso5znnFzgJesMy7OlfLMsw9wqhOE3OWMTTK4Q=;
        b=RWfYCG+WIdCFDT0+j47ixQwVF/8l0z2BQ9RR4EzowECuEt3vurqcIYaKJw+JqFDPLr
         jAjhj3q0g3xhY6krq+7lHfOjoleQYGlwft/uTOafAAt3vGcKiShwAc5WCyqxrSdLVeyx
         2gRJvg5iikd/PbxniyJA09VFjlysZjLVu9s4Hv+XIAShC/Y0x/4xdBqiDbzom1gBiOP4
         LkeFyv9RRqpSPX7hMGTr6GLDfEoYLBM8Qligs3Zq4dshq2J7JTx9KqGcXQYAFdVGhnZy
         oU0oR3UjZwnRZ0cLw5vdlM8gWcwwdA7VAP7mfZA5rB432mpDrWCAXYcZPlH5KabogVi3
         lqlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s7si707540wme.1.2020.08.17.23.39.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 23:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07I6duuc000734
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 08:39:57 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07I6du5q002820;
	Tue, 18 Aug 2020 08:39:56 +0200
Subject: Re: [PATCH 06/10] Add libbaremetal
To: Peng Fan <peng.fan@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <DB6PR0402MB2760128F2AF78973F466B6B3885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <4bfa6a8a-e4a8-9b4b-eb10-820242fab80a@siemens.com>
 <DB6PR0402MB276074B8DEA27776C106C72D885C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <977b8ea8-ba1a-c7be-e892-dba198d2f561@siemens.com>
Date: Tue, 18 Aug 2020 08:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB276074B8DEA27776C106C72D885C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 18.08.20 08:22, Peng Fan wrote:
>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>
>> On 17.08.20 11:41, Peng Fan wrote:
>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
>>>
>>> Since we come to discuss in a bigger picture, how do you suggest to
>>> proceed about the bootloader part?
>>>
>>
>> The key is to understand to use cases. What are your primary drivers to push
>> the loader out of Linux? 
> 
> We have product using aarch64 jailhouse with aarch32 root cell Linux.
> With Linux as the loader, we have to add lots of hacks.
> 
> Alought we are trying to upstream aarch64 jailhouse with aarch32 inmate cell,
> we consider to make root cell in aarch32 mode finally.
> 

Interesting. aarch32 with pae? What kind of hacks would be needed? To
jump from aarch32, likely EL2 via the hyp stub, to aarch64?

> Is it "just" boot speed, ie. do you need a full-featured
>> Jailhouse later on? 
> 
> Need a full-featured jailhouse.

But then how does the early partitioning help? You still need to make
every runtime feature work from aarch32 root cell against some aarch64
Jailhouse. Loading, specifically.

> 
> Or how close would a static boot-time partitioning come to
>> your use cases?
> 
> Not evaluated this. But if it could support communication
> between cells, it should be fine to use it.
> 

Sure, ivshmem will remain a must. We would not support cell destruction
and creation, possibly cell re-loading if there is a good use case.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/977b8ea8-ba1a-c7be-e892-dba198d2f561%40siemens.com.
