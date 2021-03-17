Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMURY6BAMGQEU5YQFUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3933EC84
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 10:15:30 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id m17sf3652828wml.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 02:15:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1615972530; cv=pass;
        d=google.com; s=arc-20160816;
        b=dX/UBns2mbhRKqaU6myf0zda38WRXgMOdkTYdt+87N/QBVR4XxAenV0Tr7Q5yd/Jr6
         oPrQA5pJ0NOu99lT+fSndKQMRxH/3Vyr5LSF+0Fs7R9LMWfjmJvbHOd8T9djAUArnHvJ
         La2bW3WywVrHpcg490kJzXtYSDHX7dvH18dD9ZvIgNUqM8tVL/yELyfINalvRz6IrJhG
         I/uJP3F0x3hcs1NRPc7nMK5XRKBrlX0TLUNxkdu+NKmkAI0zP3WLheD/8mo/UNSRV95Y
         LGMwNKNV7ZpPpotTr1tXz4XM+FTONE53hQ2n/wh6ze5iLAhFerU6XqaWqeroPqhNonK8
         Z4Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=dIXToZMA2D5c6rUoW4LrnUpb4tUbKlqMw+0tXy98DLA=;
        b=Rc7wO57l47Demx55u93dyf6EeY4oKZ+qszhFj/tfTph6wzkUpYS1cpE1L3apfWMSGu
         Tbh0xOHAAmt6hO4JuSlohPDNqvDuG7HCvIgMIZ0yYJhY9PEN7hruqxhfvrQdg3lC4dmh
         cXJCreFR75XMcabcblVESIYwz6f3GTEsle8plSxtyNvTri7jFpJVn/6n3kF15Qpbco9k
         i7bfWsQmLDynqHzOzX2sd/Fhi8ozFxnGfUBk6kZmpb3LdNARrV7qcGIdNomeIfKyU7JM
         zY1CL3sNAusq6EGIRpshx7JU+vmAEpSTBs0vTTShrGGrDiQEOiCbG7f0CKw0P8yOaqzS
         PAOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dIXToZMA2D5c6rUoW4LrnUpb4tUbKlqMw+0tXy98DLA=;
        b=cGG6VtqQeDVvchA0dACxajLPFRpzqAeu31agCuhzupf3IVZXDc611uYiCfC4yiUPLr
         yMB1IY0FnBWJmm3lgAUZtYDU0xk72AT1P6NQ1cKzk69swK8h3guVGVz6n0ofIVKcvnos
         aA9arYGfAh6nXw7opBKBxIngZVetQtRQEPH0Wvh4sKkqCgsVvG1MIAsIue4cN5umSSN3
         iDyQhKC6iGGOTUnmb5TxMtVTo60cUIHSd7ZaO5PivUtZt/ijEEEmexuErtvEiHJZzsEh
         1IjheMlAuqmzoXPFgQzynnHScP5lTaCA3pjnOp2w9dtETLe6zwdGWWFMIXdskcP1wM5n
         09og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dIXToZMA2D5c6rUoW4LrnUpb4tUbKlqMw+0tXy98DLA=;
        b=HDjTwXM7LbwrmIeLMcB54MaYKISm2zTdll8A7zH0mNmSLstDgCtYPtP0wqCLQJWbhQ
         AcylAvach31Lcqb5sIsB3rH3EZhiQ7Eg0erA97Vao4I33sr7eHMpmQ5SbumbKWxAmkKG
         rpmRfwLtG53fEYURMroPKmBwzgGGPPXcImoMHqShKfj3Abc6ih2GSeaUQNCZNeRzXIlZ
         nTHNEUrA5tToeTkA+LlUYK+UQ0Vt2qrYTCIz9x6pyfllyFg5cLh4pvP31OR/ejwRGzDl
         +EAi0lsBkghVMxiweYEL4I+M20MuiN1yferV1lS3dmv25azRrlfqcBn1IxmqzYHUNOzh
         RZ/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MpRVBwP1AzFe5yzn1XmnTMAdsxgdJ0IWfS64DoxHypOz+oP+r
	Bx0U5vNcb2G7NWxyRE+GTho=
X-Google-Smtp-Source: ABdhPJwE1PrmPzwmCrT9T9tnMGayCnTKxLwt41J2NiacO+wYtHWpPzJleto47h1cuKDpzZhDKjnAiw==
X-Received: by 2002:adf:c752:: with SMTP id b18mr3269442wrh.233.1615972530714;
        Wed, 17 Mar 2021 02:15:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c763:: with SMTP id x3ls964772wmk.1.canary-gmail; Wed,
 17 Mar 2021 02:15:29 -0700 (PDT)
X-Received: by 2002:a05:600c:3515:: with SMTP id h21mr2749815wmq.9.1615972529721;
        Wed, 17 Mar 2021 02:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615972529; cv=none;
        d=google.com; s=arc-20160816;
        b=sR4KF7ZyWDpKPmMAoX3Cu05vRclj253LRIjnNvA+/QbPK07yL2+N2dZf5hlvo6lAxd
         6zIujwGKkiX/8mjaIDsnaGSnMjkKWzFyhkPnAFv70iwGtprgLAVRETI0qxEVx4Dh5j0T
         UDD774zBe3HGJXN8J7mZPHd/T/usyCB6UKEP16WtbW8zqwBGFtI0oknVJq8ga6Rl1cNs
         Ezu86S1zHdz+2tjTK12IwEEcv5QIiR8qsjecn0Gr+4we11C2tqBXXILBs4EVLrb+XmPi
         rKyP1R2YSBAwVXNoCNpjh4lpoz/8+SqBV2vx7t3dMsNcBZ2+J8YUppzJVvzMwROJMsXZ
         cEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=8+VVFu/lQd/LwRPsxPmy3AP3gXKZH6k+S7oH1PQy278=;
        b=hXx1FHaY25n/AnPwhNe4dB4QVKEwovWbjxrBFtrjWLjPNCk2oZHVPKMBvkSBczF4QB
         fC4dGLzGXZsOULA4/JYfu24Ho3eJevFw4HlvmYQPrGLVdntiqyUOMvnssbpVoLIeRYS9
         +gd/06GmANvUEhgV3tZSBsoGWxSis6IrEd2s9HSqaEFkwJcLxUR2tsgy9HPkZjC+QISc
         ZyjjnBZNubS/nYRqAgkG+07ztx7RnRnqCJDN9Euz3fVvEMc96HWKpneO6/NUrHQ6QOr4
         COzRvF0gR6xLFPzHZa8P4cTKuNoLM2Xu0OIBEJIOBEFNFRo22lbuW4A3oxY5LHKePiSO
         zdkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i22si95803wml.2.2021.03.17.02.15.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 02:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12H9FSq7015356
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Mar 2021 10:15:28 +0100
Received: from [167.87.41.130] ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12H9FSqD026144;
	Wed, 17 Mar 2021 10:15:28 +0100
Subject: Re: where can I get configuration document ?
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>,
        Sainz Markel <Msainz@ikerlan.es>, Smith li <v6543210@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
 <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
 <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <AS8PR02MB6663D7B254E27AAD507D3C34B66A9@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2e6c7ee4-43e4-925f-831a-934687f9a0a3@siemens.com>
Date: Wed, 17 Mar 2021 10:15:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB6663D7B254E27AAD507D3C34B66A9@AS8PR02MB6663.eurprd02.prod.outlook.com>
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

On 17.03.21 09:24, Bram Hooimeijer wrote:
>>> On 15.03.21 07:47, Smith li wrote:
>>>> In
>>>> https://git
>>>> h
>>>>
>> ub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2F
>> config
>>>> u
>>>> ration-
>> format.md&amp;data=04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3
>>>> 4
>>>>
>> 43ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7
>> C637
>>>> 5
>>>>
>> 15645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
>> CJQIjoiV2
>>>> l
>>>>
>> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=wldQEArIJ%2
>> FcFxG
>>>> w
>>>> 4x6SskbaxOJyVdBLeDuM1vOMWO%2Bc%3D&amp;reserved=0
>>>> It only shows "To be written..." .
>>>>
>>>> I found how to write  right .c configuration is very important .
>>>> For example , I want  add a new inmate,   a new inmate to run linux,  I
>>>> don't know how to set the value in the document.
>>>>
>>>> The result is I can't   easily run a new  inmate.
>>>> I think it's not good.
>>>>
>>>> Will  the document be written ?
>>>> or
>>>> Where  can  I found some  good tips  about  how to write a  right  .c
>>>> configuration?
>>>> Thanks very much!
>>
>>> Eventually, this document needs to be written, at least to describe the
>> binary format (which is expected to stay). The way we generate it >right now
>> via C may change, though.
>>
>>> For the time being, have a look at existing configurations, in the main tree
>> as well as in jailhouse-images (depending on your target) and >also study the
>> tutorial I gave a long time ago [1][2]. Some aspects have changed since then
>> but not essential concepts.
>>
>>> When details are unclear, ask questions here.
>>
>>> Jan.
>>
>>> [1]
>> https://even
>> ts.linuxfoundation.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-
>> Jailhouse-
>> Tutorial.pdf&amp;%7Cf659d6914e00464a59b708d8e91ac167%7C612607c95af7
>> 4e7f8976faf1ae77be60%7C0%7C0%7C637515648567686059%7CUnknown%7C
>> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>> CJXVCI6Mn0%3D%7C3000&amp;sdata=fbtmKSRCItgbPj3rg6cFP2de64%2BFtY
>> ZR3oH5DPQKJJs%3D&amp;reserved=0
>>> [2]
>>> https://you
>> tu
>>> .be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-
>> pLrL6pRFP6SOywVJWdEHlmQE51q&amp;data=
>>> 04%7C01%%7Cf659d6914e00464
>>> a59b708d8e91ac167%7C612607c95af74e7f8976faf1ae77be60%7C0%7C0%7C
>> 63751564
>>> 8567686059%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
>> IjoiV2luMzIi
>>> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=USe2ZeUgtpxLon
>> lBl2yHA7e
>>> 8KwnnwM0ehIlLNtYzm50%3D&amp;reserved=0
>>
>> Hi Jan,
>>
>> First link is down. Can you check it?
> If I am guessing correctly, it is now found at https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf
> 

Yep, or
https://elinux.org/index.php?title=Special:Upload&wpDestFile=Bootstrapping_the_Partitioning_Hypervisor_Jailhouse.pdf.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2e6c7ee4-43e4-925f-831a-934687f9a0a3%40siemens.com.
