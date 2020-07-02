Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH4R673QKGQESXUIDVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 6671721227F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 13:44:32 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id y4sf15424700edv.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 04:44:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593690272; cv=pass;
        d=google.com; s=arc-20160816;
        b=CrpC3cfCDRGU/4e8AJZ4xBjBLHAMFc8WTYxu7ACDyC0hFZDkeo+VDTeMcSV68bKsQQ
         Y9J9D4x9TkKxr4piqs4FJfs26f1y06LJ146GIC7FKdDvEao6VdlnzYWExJxuw5igCiQn
         lhuLZl1XFnlycMlOua1qk5OAzDyN5aoAfK7SuyFbOrXD5nBq0mZ7b8RwSoymxN4JCMru
         hiCgmTGOCzcViRePy24jSoX3M+dnm+JlP2l1gTpz7XY7Pfm6bVjVXlDG+4JqfgU9Ucuc
         8XGGmTp9U4hRCF9RfTIlMml6X1H19bOMEdoSjBxXGF2DwUsVZjip0CHY/ZAF7aqnhfjR
         QUEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=hKcsqcWI7z6WK0x7dN1Xgm2q2TZRHnVlF+bKCEPNEhY=;
        b=VVUlLxHXcqdmn4NKJgDCQ3yjV1TJ3uKOWWfxrqjy4ttwXbuLIK+re2GKbPGvkOLavA
         iHBe8+jkeKBp0fPjymcVr0/2CXZ2H8XemPc+cw59AdFj2PKDO7ohVC9Vyk6zVHDRANC/
         Gb07ngbe9Rgb+CkfXmZLdk8cD+4pMCVT5puc2CZvdxPUUNXXSjH3TbtQAe5wdNlU8ZqO
         6wJHjleky3Ov2ofN+XMdl6rBDe04hZie+g94LHHZhvrESRoSOo9300JmxgNX3gZSM5Wk
         u15xgekGqNG9N1KQctV3V4OZhKfnfy6MeH2AsAfbEihlVnCdPWchqIWQrJDyOW5RsPp+
         5Ykg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hKcsqcWI7z6WK0x7dN1Xgm2q2TZRHnVlF+bKCEPNEhY=;
        b=BKka58mtJ91FgtHqUyaMHBJn/2uuJ/B/3ACY6YzWDA2SVrG/xg8D872i9qxaOARrjP
         Fd3ISkMmFv9WrXL2WYfUcnOwA9CumJNORDumdKftum9H5DL/RgeCmJ259DCq6gHoDzub
         TI0Tc9CT1+fV6KO+dS+07YOImaRIaFT73IHZMQyMvs6C24prTaSnEWQqZuN9jja8WhMJ
         noAedLwK/xvaLUEGfv2a+BcCQYzx+YOi5SL43jXSlZaCENTAoNCPA8/FYiruudY3em38
         cgOhITf8AIfp68S1ZcwVKToSJx8xTWA6zAaDNikGhmATwxCIyUqFTc6eWYG3KX6OpM/9
         agxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hKcsqcWI7z6WK0x7dN1Xgm2q2TZRHnVlF+bKCEPNEhY=;
        b=nB3d195cguh1XjoG6OAisor309xOHVg+0ZJ1lECNyZ62GQHaxi+iFxZUWds7OObGXZ
         jYKFpA0j/TDbTwIr5qXbjg7IPEXKZRCIYG2RpCyZZKbf0Zm/zOy/w20fwOePgFX7+gzf
         Efi3oOJWSbTACcVlR9G39TbJdtpGF1hyMQma78pLtLvhK3QOZ9kL5w0yvS6lXxQGKazY
         ut5BkbzG3npM+LNmNepYmUKVX0ihQRN6HVOJ3WG8GBlKk2Fm2pgN0t+8mqJimJcIUWZR
         BLiirbEtH81MFs81yUYQaYETrncSl7QjAbBwqY87NkDH/avorAuv9v0sUYpdSO5PMf/W
         Nytg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531H+d8ocTGcFTz3T3yvzaawD1aynxvnAdKZDbXLi0cnl9ru4/kW
	75V1EPmKtOiXjTGFg/W5ow4=
X-Google-Smtp-Source: ABdhPJzDA7pl0iM3JfHXarEjNP3VsmsySWCrAFNzMayffoTrkliS23TMP1Cdo2ZcdXAZ/sdHf0mLjg==
X-Received: by 2002:aa7:c314:: with SMTP id l20mr35573952edq.150.1593690272027;
        Thu, 02 Jul 2020 04:44:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6d58:: with SMTP id a24ls2619081ejt.1.gmail; Thu, 02
 Jul 2020 04:44:31 -0700 (PDT)
X-Received: by 2002:a17:906:8392:: with SMTP id p18mr28854439ejx.24.1593690271273;
        Thu, 02 Jul 2020 04:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593690271; cv=none;
        d=google.com; s=arc-20160816;
        b=wn9F2RE9KTDatFGu+GwV5yqR0jjp9Pt3tTceVrV25h50h+kTLyNhY4rIzYUuvfVARe
         uYXzvVU/1pAvTNPRPc5kYEWT9tHQOfxLbDxsaDu8NrHu8CNnEdVDmkKJpRu6XEsO2Gi+
         kc4Il6KPWeu3SAe/yjxp5CRcdKd4L25vqrp231lfRu3LgygR0h+UM+ftYS2ocF82BGTd
         d/oX4J5B8kGQvg0UdydcsRQqUwauVRIMdgFBB/DkxO/l23kreaoPWKaxDUGWujTXnvAb
         8/FCjNDPsHHsMh46XA/4cjTPdlUb5QUaJs3BSn+n0TRr+ozLOt4xcwUxdruMgecvCgR+
         xg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nKYVRUgfrNdEm+bxf6JMv/0IG5e5QFvFkZw/mg/HH40=;
        b=0S5yFqiI2xjMAGn7+jgWHqMUcyBQTtsnwNxCyn2Zc094AklSrXEatjAl+KbG4B6FT7
         G0x5w2Ahkui+g89rldVEm6RLnbFkf/9sRjf6NdwFHAkqLD0EdmToMtajWQ2MVZeCzNEY
         CQDOlmRzenhGhc1UN4glPisqTml1XQcR3tLXSrsmSmHurnWmQ+HM5n2mFwbi6aC61YNM
         mSGDDMMErmq+rrOXAaA3HR2q6PO2n0WrjUIyv6l0BIe6L3dB3dsqnWJ8Zn3HDp7srghh
         IJVK5eJaaAJZ/qRsIR8Wy9VpBt1bc6KTv3QBM3nmFUJqUA2wwKZl+7x688Xmyh5Vmrgm
         7PgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a23si607808edn.0.2020.07.02.04.44.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 04:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 062BiUDF005179
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jul 2020 13:44:30 +0200
Received: from [167.87.6.55] ([167.87.6.55])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 062BiUN4003711;
	Thu, 2 Jul 2020 13:44:30 +0200
Subject: Re: jailhouse jitter?
To: Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
Date: Thu, 2 Jul 2020 13:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 02.07.20 12:03, Peng Fan wrote:
> Hi Jan
> 
> https://events19.linuxfoundation.org/wp-content/uploads/2018/07/Consolidate-Real-Time-and-HMI-with-ACRN-Hypervisor.pdf
> 
> Have you ever see this? Page 13, there is a compare between ACRN and jailhouse on X86.
> 
> So it show ACRN a bit better? But is there any big differences in design? I doubt this.
> 

You also need to read the paper where the stats came from: They 
implemented APIC (GIC equivalent) pass-through also in ACRN, a feature 
that Jailhouse introduced in 2013, and then tried to compare that two 
Jailhouse and also RT-KVM. Unfortunately, there were configuration 
mistakes in both of those other setup. The one in Jailhouse they found 
themselves, redid the measurements, unsurprisingly found both to be the 
same then (no hypervisor involved anymore), but they didn't update their 
graphs, even not in the paper. The graphs where simply copied into that 
presentation.

I attended that session and offered the presenter afterwards to review 
their results in the future if those are taken over a stack they are not 
familiar with. That would have also helped to avoid the architectural 
mistake in their RT-KVM measurement setup which gave them result of by 
one order of magnitude.

BTW, regarding direct interrupt delivery on ARM: In 
https://lwn.net/Articles/820830, it is reported that Bao has "found a 
way to map interrupts directly into guests". I didn't find the time yet 
to check if that is actually exit-free delivery, and that as a smart 
trick or rather a problematic hack. Or if that sentence is rather a 
misunderstanding. There is also the sentence: "Interrupts [...] have to 
be mediated through the hypervisor, which is unfortunate since that 
increases latency."

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/38ffb4dc-20d6-3404-cc61-ea08ea8066f1%40siemens.com.
