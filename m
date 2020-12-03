Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWEOUL7AKGQE4L2FTOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id C10AD2CCF8D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Dec 2020 07:36:08 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id u10sf381818ejy.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Dec 2020 22:36:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606977368; cv=pass;
        d=google.com; s=arc-20160816;
        b=GaaD9De4pt6TkjCjVu+HPmSaVfmREyB5AtyimflJQ4M6i+pna99BN/vqDJc2ByD1Y2
         KKBBlI0nQRLVwjDRZUOtDACVnAbmSHaBGjpPG5ADqFuAtQHXpy853rP9l3D5JDPeNoca
         Ui9PN3/BTeHeS+dk3lHs4wERWWiKJAFkZmT5c/IlBMsgKZa9QOBnDHa4zozcqSyxVo6V
         y8GJoF0NMv0CM7Ya73sWkFl6a/QE3I6DVNqQBrwFoLW+En0Ve6PRrY168Q9MNdq5LWFb
         7HgW6iY5OxVUf5+OyYh0KbyoOTdNEWHU5/L4HncgMBvwbX7ogsiqN60ESUVT+gNBkOFX
         b3Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=4xeAhG/1TyI32b0UTevLTLhuOrqdMq5QOArJdtsxy7Q=;
        b=0dCBVKucOlj7RKBj0pa6ssPKOUDBVE9MhqrUZzekzjCKUaHbz1P5SknsB+rZg0mG+P
         iXkMGBo25CSIYPO9whRJkyvLjGFu6Z0OZCY44tM+I3z64oekWdW0vQtieMofLSJ5pb0z
         XHi+LYSGYWYc6byV7Er0gJ7QJUuMDusR/uiZwckojSCG6RCdmOp2ySo+g39KZpFpwYeD
         LQt5Lw+nMTRkcjatBXDYcs6Je99VIku2X+vMEZ8Tico6xvOl0iYEtewzyGY9UKxJUI/h
         9feOZUCIi4/z7Qzq/a46nPZUyGLKSYciv8DReyMWB/hfLd8sb6U0Qla6meFeAc8tAOZ/
         NNNw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4xeAhG/1TyI32b0UTevLTLhuOrqdMq5QOArJdtsxy7Q=;
        b=pEwscZv0pGuDWlazxrJJcRDVEL7KXxJLNlFK1MtFxeXIs9yxQj0RwHTFwAPJ9xpQde
         pdrAp38Hn7gzhXczDslh0wd7txUTPYIDrfVodFFsbYS10BD4hdS9pkXh3ooMq7G0A9CG
         HaDK8JL6lRodnZBfHaqb+Wh4uAUgNhA7za8vQBmdXcLkEBR5+gnpXQ8PQZ1yy6vthDeq
         jVnvHyixjTDpEpMY3+q6Sme55XtPepowLo7RsbQ4A+HpNwIfJv8aHy86cyH6D7BaamDL
         W6Gx4RJhkBb2jAorUu4uA7l15uS1n+u1XtnQ5r8ULfzh//v8zlz5TDEMuPwixp8NUnKD
         JVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4xeAhG/1TyI32b0UTevLTLhuOrqdMq5QOArJdtsxy7Q=;
        b=AVBC+uau+0s+NNefsQjA3Dwf34VvpnY3NYYTWzaN4jG1+xF+ocrrRaQTYhxtoI6AvO
         8sYnRVC+Z1V3jni+A61HiPn/kMk/iqjBluVMrHF23jAvzXOgk1JY7iPOlNSUyaBANM5t
         BVYYf3pmcmWlNbWSSbR8vVvBe3xq9cM7U032tf16OL2yfEVfrdT4A75t6KYD1XgFrk0p
         EkmSzTrmMDJWO2un+W/K1Srhm1O2JVOqEjKIyn7OIxM8VpWwvopzynr1jNbwFxNB55WA
         yFo6BJkq0kjqav/hoq3RU2FcafkmoYnJAvXSmEaGS4h4FlsnnBaPbJrjJ2EZyQ+ORug9
         d82Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533JNfZYVOocW69c1RmqaH2ulK1smQLvbvRYvhh83I/J563lp+8p
	q+2ulcZjiCmhLBu3ug7Khtc=
X-Google-Smtp-Source: ABdhPJwfwr1US+TjPbAZqqy9GHkE2GaYsxZ6NwSyULpvkNlaUhVamulsoMHOgSuWTvXOg4gaYZGzYA==
X-Received: by 2002:a17:906:c45:: with SMTP id t5mr1190979ejf.370.1606977368489;
        Wed, 02 Dec 2020 22:36:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cec7:: with SMTP id si7ls1863859ejb.2.gmail; Wed, 02
 Dec 2020 22:36:07 -0800 (PST)
X-Received: by 2002:a17:906:ce23:: with SMTP id sd3mr1220301ejb.69.1606977367363;
        Wed, 02 Dec 2020 22:36:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606977367; cv=none;
        d=google.com; s=arc-20160816;
        b=pvMHptTQ7ynNhTOFsMQqDJ2RtJ9DMPrUMs1kXZovGuwi6DF7whVUmxyf2/iAdgcbU1
         xgOfIrhLjqIyDln9087RVKU9e77DfOKsHj5jNDOm/blQDXw3A6dXV/Xi+RjB40j/nQnR
         upevk5hVW4Xq8vorhuFi1C8/BKyedIIvXAmirQJC4y7leXOt2UKE9vqqAToeGMJ+b+pQ
         w6uFGcKv8CEluG9qUK9GzphowOqRsEfdCIxl7WmMSmJ9g8zmB2C0QTl9pNJPlZLgAgrT
         RUh/M7yZql3yn1iS1JDi+4aLCq/3G5niUCo/OIaXg011LEpHwQ/7QIwKMQMrV9+f/9on
         4dNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=mejrIOBWK1mClq+S1QvPypSfSPJ6Vonz4ndol/fryFU=;
        b=JlytlIawkn60Oo30WCjXzyWcd/Ml/7XH+A7LiFQFxMyeUqBlK6mPJI7gNubtf3ZFgl
         SPgD5O6VtMMQJrJTu6iaQCrQ0ZT1Iis5zeFNFB7hTllbVm2S3P5M5OSiTxZ+v654KgFE
         WJ/RQsWuuF43gKRDrPYRHGpowY06ZUx7DqCFh+k9vuDGVHIfikmj65BnZdZIZ1+xGbgq
         ptTAxr6Ob55LjJixqCAZIlCJOqnSgbuqbfO0NS5KMy0/e/uSSM+Cs36fwCWA0b78JgaC
         Pdwl6YnVql11XcKd7m9kfuWW2vmGsIUHG8geYo35d66LLRU+h4NmiMMHY8KxqMwl+zh0
         EAVw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v7si32535edj.5.2020.12.02.22.36.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 22:36:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B36a3G3024496
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Dec 2020 07:36:03 +0100
Received: from [167.87.33.175] ([167.87.33.175])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B36a2WW016553;
	Thu, 3 Dec 2020 07:36:02 +0100
Subject: Re: [PATCH 01/14] arm-common: bitops: add most-significant-bit
 operation
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <20201123204613.252563-2-andrea.bastoni@tum.de>
 <8f2b8fa9-a695-a845-b02f-98e22180b4ae@siemens.com>
 <bc91d85f-321e-596d-feeb-bbac5549fa18@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <be564959-e20a-65c8-0d9e-e9481380559d@siemens.com>
Date: Thu, 3 Dec 2020 07:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <bc91d85f-321e-596d-feeb-bbac5549fa18@tum.de>
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

On 25.11.20 09:48, Andrea Bastoni wrote:
> On 25/11/2020 07:07, Jan Kiszka wrote:
>> On 23.11.20 21:46, Andrea Bastoni wrote:
>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>> ---
>>>  hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
>>> index 808c9a0f..a726862f 100644
>>> --- a/hypervisor/arch/arm-common/include/asm/bitops.h
>>> +++ b/hypervisor/arch/arm-common/include/asm/bitops.h
>>> @@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
>>>  /* Returns the position of the least significant 1, MSB=31, LSB=0*/
>>>  static inline unsigned long ffsl(unsigned long word)
>>>  {
>>> +	// FIXME: the ffsl on x86 isn't robust.
>>
>> Can you elaborate?
> 
> There's an imbalance between the ffsl on arm and the ffsl on x86. The one on x86
> doesn't check whether word is 0, this one does.
> 
> I haven't yet had time to check the callers and make sure that they will never
> use 0.
> 
> I put the FIXME there before I implemented the assert(). Actually it could be
> now possibile to do
> 
> unsigned long ffsl(unsigned long word)
> {
>     assert(word != 0);
>     ...
> }
> 
> And remove the check on arm.

Indeed, that check on arm looks dangerous.

> 
> Furthermore it is maybe possible to get rid of the __bultin_ffsl() and use
> jailhouse own ffsl() implementation.

I do not recall anymore - and our beloved git history isn't helpful on
this either - why we migrated in 2014 from __builtin_ff* to the assembly
versions. Maybe compiler issues? We still have __builtin_ffs[l] in
hypervisor/include/jailhouse/mmio.h, which makes more sense for
constants. So there is room for a cleanup.

All unrelated to this patch, though.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be564959-e20a-65c8-0d9e-e9481380559d%40siemens.com.
