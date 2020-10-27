Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBZG44H6AKGQEGCVGQ6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86E29C7FC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 20:00:53 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id t4sf1084583edv.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Oct 2020 12:00:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603825253; cv=pass;
        d=google.com; s=arc-20160816;
        b=izx5jaLQYCm89jO2HXlzRHwD2HG2uf8RBf+A5OAS9/btkpA4fwoDFnoxr6DcL8xVgd
         UIF8LNamFl3y7K3jxrC+mpXi1taE1kKaYORWGN+1r9xetj0AomR2tElHqCTaq0L8UZTB
         5f1db2wdnSHOI42zKxt8UlP+OJ5nmzNXH2CG4QltWsjvoUQO65IEV8XxZq+p9TVvI0VT
         O2ihwkQsevasOortM9oLW++DdVnlvWSzCqYid70tTpJPzT6kQB18QekxgAZCl7Sl8awv
         MxYJBKcvEXraXPDxAt/mI5yqaUxTTEtTPpW+/rk3zBXs1x1+KcifCFj8KwuM27H5j8fM
         K1eA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=3hZPnuocJG7Ruyrrlqt/ydVLrgzoaSgPqA16GSI0e98=;
        b=fxkdrp3ClFluC/PBJKbtZ7XtnhfB8s22KpPecTZxzszP1eMWXX8nUJ/ggTUad5/8I9
         SGAAvfc+ojjGP0mxxUghyVTa0P+c0p+/DnvUxBR0LaGa88H9n/VHKisFeM3E3G4ZWxtW
         YNdftN2ChhSti7W6mhe0oONBTvg68U1N42LiUvqrR4q/ZtDmATzYgxKxPrN4RmXzxQOq
         wSsdcY/5M8cr/ZgUYQzxzwU4Sb4Akh61g+ZSLlQ2hOG+Na4KmtEqCX3tXwWnONCmvb7i
         IhpmNricKEyNkfORIArWjWB6Bw+DTBzprASjAwX6Q+Mq3xJCaU3bf0oEhivzQDgwDRqn
         LuWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=DzcF2jOK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3hZPnuocJG7Ruyrrlqt/ydVLrgzoaSgPqA16GSI0e98=;
        b=hpmnCwt02dhbuMmVwK8hYsrDhuMySt4BKc8d42Eio4syBLfehYovlUnWi8qDsl137j
         O+hjx1Jacv6Z7Dc27xqjBAHjI4ylPAq7aD978YT+ARztnbrMtHUTvEjWUE/l6+hROT19
         jpYqFG0VHppbnP2in8aKxNr7ZZBc24Z4OdGN44lpxwwLImAoxKeUwX3jxS1+OXlNRUgj
         r5AIakUgv/m6vkL608Q5dxPaZmNY8jd7HzOimjwH1oEMz4YDrbVEm39iDq/2p95G2fwW
         DRIdvhDUcRnEdTFjwpBZoZJvxO5PUQiY+LTRfIPq2P4R0000sMd/2mNBbftlXx7ZWkN2
         gvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3hZPnuocJG7Ruyrrlqt/ydVLrgzoaSgPqA16GSI0e98=;
        b=F79NswznOOtEV9UM2Qy0Tz4LorXO7fhXC5GKKgZkGqe3jLDWh3gYhEfeBQdoznGfqo
         FjC4jZUTY0ZMuDSVTvJM1YI7ookto/x689e0WvVyR6szYUam0mTNTqMiBnr7lXyXjTHr
         11TM0ySTikLLSnNnv7ubpLN3SJ24/MtbMlaZDVOxuFJ2PTVg7u45lOUvkeHsHfMIL108
         mtn0F1+20r36OG4NbMyrMvXRx9C46zpmSN4S+576+b0V0uoVLw67x7aYlYbhniZT7fsp
         FZkFWpAxPNNdL6n0SYflALD6xYCK3YvKKpfm9oDNerHIIwwW9hJZFDaOxwBUiHda4kaM
         DAhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rweCVs0ENiqERxOS2siZ2Ey+XM2laCvWQmTlirRsXtmjkuJXs
	dHX98faOgAciaXT8nxrCdz4=
X-Google-Smtp-Source: ABdhPJztRuNaWoUatL9V7/o5fUeHPvmT06h8338SpCsRMhOD7J+XO6IyClpIkB/kBQhHOh3hWrY1eg==
X-Received: by 2002:a17:906:39ce:: with SMTP id i14mr4029713eje.170.1603825253289;
        Tue, 27 Oct 2020 12:00:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4692:: with SMTP id a18ls1289732ejr.0.gmail; Tue, 27
 Oct 2020 12:00:52 -0700 (PDT)
X-Received: by 2002:a17:906:11d6:: with SMTP id o22mr3972226eja.171.1603825252217;
        Tue, 27 Oct 2020 12:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603825252; cv=none;
        d=google.com; s=arc-20160816;
        b=u99zqZxtbMVop7FyI+T8EfwaLB/Hlss90iTOUiXuqZIiV5UBLkGXHeNO87lvvMVw6h
         Rul/agJ4BRLUiusPPOe7NtJCKijXl/wTzfPdBwbLSn4xheyRDZ+GU/SQwaH0DD/r1Qvb
         p3qmU+k39KiT2FSr9P7vG5CHafCjL8coJPTUcF/8moAWi4zlXhjftbCt0Rh9FhHffz+y
         lSTU+0jlnaiZbKMeDxwxzpF7DxwZbvlf34N3FnED1TAi5JCtO31QTaceCUPpq3j5h4dy
         yxLEfni5GMHzIq8v+aZBQLYGaa3Gpd/PzOkB+o6wC8UHeYsSfLtMKVnkNw3UX79wxJiR
         syXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=hMjcNNPBMJ/EVka2OC1XGwoUK3CD5ulSs6SgbO/epeY=;
        b=Ipw3m+YlbIQkMD6s4sqskPxYdCKmzNzXcEL04CDaKlwQre211vZLG9NIqBEC6vq2OX
         MXvrTsNn8PROMTyKBe0Rf3jYFxqa4TgmAhOJTaEzla3FRGZKuArJg/IFK0qgOCJfZSq8
         fSf5LNhdS9GlN5UsJu7ZIunH/4z8ng64EySY+MTesOtx5dTRmlm4G6jcbEcnKIX2nt/X
         2p0LiVtgjxdxpVI3tUje9r14XrPf/Fqg0ueTUHdWOKXlRWa/Gfh7idsDzBGw/w+tX00h
         Gog1JiFWn+TFOkeqky1TrMgdfd5oYdioOubD82BgJKzeoDt9tjMjyuIHIWJ0WAF7BbTW
         gFWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=DzcF2jOK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id ba3si66425edb.2.2020.10.27.12.00.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Oct 2020 12:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CLLdH6CTLzySy;
	Tue, 27 Oct 2020 20:00:51 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -5.04
X-Spam-Level: 
X-Spam-Status: No, score=-5.04 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-2.167] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id Pg-xvkJHpBko; Tue, 27 Oct 2020 20:00:51 +0100 (CET)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CLLdH1GFjzyRr;
	Tue, 27 Oct 2020 20:00:51 +0100 (CET)
Subject: Re: [PATCH v2 27/33] x86: control, vcpu: force cast to prevent
 Wsign-compare
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-28-andrea.bastoni@tum.de>
 <d526bdc0-27cb-20e8-bce5-9390bec47dfb@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <a55ec69c-fcc0-00e8-b427-ce19292a4946@tum.de>
Date: Tue, 27 Oct 2020 20:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d526bdc0-27cb-20e8-bce5-9390bec47dfb@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=DzcF2jOK;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 27/10/2020 14:29, Jan Kiszka wrote:
> On 22.10.20 19:58, Andrea Bastoni wrote:
>> The cast is just to prevent fallouts due to the Werror. The error and
>> rax are really unsigned values, but int to unsigned promotion is mixed
>> too many times to be easily fixed.
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/arch/x86/control.c | 2 +-
>>  hypervisor/arch/x86/vcpu.c    | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
>> index 2aea807a..98659f4a 100644
>> --- a/hypervisor/arch/x86/control.c
>> +++ b/hypervisor/arch/x86/control.c
>> @@ -238,7 +238,7 @@ x86_exception_handler(struct exception_frame *frame)
>>  {
>>  	panic_printk("FATAL: Jailhouse triggered exception #%lld\n",
>>  		     frame->vector);
>> -	if (frame->error != -1)
>> +	if ((int)frame->error != -1)
> 
> Why not define and use some EXCEPTION_NO_ERROR as ~(0) here as well?

I didn't want to introduce extra includes in arch/x86/entry.S (or have different
values in control.c compared to entry.S). But yes, EXCEPTION_NO_ERROR can be added.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a55ec69c-fcc0-00e8-b427-ce19292a4946%40tum.de.
