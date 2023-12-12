Return-Path: <jailhouse-dev+bncBCJZVRG45MBRBINA4CVQMGQEKNYPA4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id D571680E510
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Dec 2023 08:47:46 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id ffacd0b85a97d-3334b1055fbsf4455824f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Dec 2023 23:47:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702367266; cv=pass;
        d=google.com; s=arc-20160816;
        b=BdojUMrhD3OkwNf0a0SwC4Y4C+n6rr6En5JomqmndUwhr6La85ZzebcjQaIvymOgLL
         lpV2FlOuPpLOwfwXmm96e+NTlvBh4Zs+nU7evOm2x8cz3N6XfCJr8X5ZiFjjMIT5f7YX
         8tHgpj9BHr5SJAhgZiRiuJnH++9d/0AeYfpI3l5l8t5azCfsWSuzQ0rfZsrw/Eev72zy
         rvC7RlL21MnOHCi9FxYNFUek0G1qHhTMIL4BnY5v76XSLQye3HjbxMjD7C9DpEPqwDb4
         wKFKyI8vOAQ+t2/6WnLrCv7hA5QIXb26155THYlx/NzEsKtkjYfidGY06PpwBqpCeQBS
         SBQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:autocrypt:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:dkim-signature;
        bh=nYaaSX0afobzX17w0wCrPgBGjvSz1mJmJr7lVkG2oXc=;
        fh=eWhekAss/tV9whNhPMf4oo/SViGOEhgWyzNVhUXhQqw=;
        b=c0mLDPa8NVhZ2mxWrzmFche4hKkDxSAJl7evxrPRQlsySLqj5lBMgNBN/lu+20D1/B
         MFxWCHKGGfB2crGrc6z2o5Ra8Ad7neGaEmOtUfCMCGGFAefMzf643xKUAHSivvb6jVpj
         8hNE1VB44HF9zYcETqG6EcWtw3acYoh7VQuNensz+Qd42Ew9mqmP+OtZseRJ4LXhcwit
         3Xzotz0AFv7xmAERqRoPzvBdoANLPD6lSTkzD4oRz3JBfZI4tiU33XMhc8jej4uTlwXb
         bXpvrh5o3UZn0jRD4i0orsCX5llr4Xi28nFSjvNme2CPNLuAvXhwryeeycevJf3Gcrao
         vrXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b=ijkTghch;
       spf=pass (google.com: domain of alex.zuepke@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=alex.zuepke@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1702367266; x=1702972066; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nYaaSX0afobzX17w0wCrPgBGjvSz1mJmJr7lVkG2oXc=;
        b=O4B32L2BqpTiek1cnDehCVIlekPJRKQYscz6LP6DCxwinSwJFSUvbsgd52k6/9uthw
         Y54kcJxreb3LexKP/DAve33Oh9DdnkoCqbOUSpuiT7o4RcGAY45rkF9X6fhU19j/U5SP
         kkIfm56lIBuVyCEGwAh+8Cm5SUgM3aU8U+OAvAmeIOtg5Bd98PTvy4ovWt9RA03CvL76
         Y16ECpmtqPmd6QlzbBcrtOECLQBYZVtRKc2IZ7BN9G+5k8RxhlQuykUc1vjGpcpcLpCj
         HO7BQqR2696aoxH+e/PR+RlWdhKImztmu1HeULS9WmSVxIdQc3f7cZf+7l8pCjVj9DfC
         CMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367266; x=1702972066;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :autocrypt:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-beenthere:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nYaaSX0afobzX17w0wCrPgBGjvSz1mJmJr7lVkG2oXc=;
        b=uB1zXHhHerWZsSe+nuUF0hUp+OD9A3abX6i6NZ7DHlSIUe31L52YT0wqINBcSzKT/s
         ydRkP3aVD846X2AYGdZdmGnDSo9/pskTa5f2BgdL+4OcS76ciHTVNbCgzIjn8tjTGyzq
         utXauoAfIvVRJFIcsMKPyNxJzWjJ3b0Nsm5j8d0LFReCg+9ercxZ7EglYcy7tOVtkkr2
         CYM8oO0KOes6bfHULujaDkc9fznjun6R5kavR+XkEn9xVA39qizkQDtrhSGUbzV/6slS
         ZlxIjc8HFzUtq8WbdAmirfhfjMk79d14Xnnb6PFpc04j+N7KAoIrzfkEx22/dUL+z6Wr
         nOlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwUBbrMatdLcHRHAcAKAZ6zi7KkfloVRy7+4Y9MLgATYMpH2xZm
	unXOyjUc6LYmXGdflCO2Y5g=
X-Google-Smtp-Source: AGHT+IFSerx79CAqwAf0xugPVqp7l6IOldTdyW1uVSY7tUNIxp7l9kXlgs3430JfTbiFrRWDfIQV/Q==
X-Received: by 2002:a7b:ce85:0:b0:40c:2db3:49ad with SMTP id q5-20020a7bce85000000b0040c2db349admr2084424wmj.270.1702367266048;
        Mon, 11 Dec 2023 23:47:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:19c6:b0:40c:3f87:4b21 with SMTP id
 u6-20020a05600c19c600b0040c3f874b21ls373171wmq.2.-pod-prod-02-eu; Mon, 11 Dec
 2023 23:47:43 -0800 (PST)
X-Received: by 2002:a1c:7c08:0:b0:40b:5e1e:fba3 with SMTP id x8-20020a1c7c08000000b0040b5e1efba3mr2001936wmc.88.1702367263310;
        Mon, 11 Dec 2023 23:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702367263; cv=none;
        d=google.com; s=arc-20160816;
        b=VCeUvQFYTCHYrLHrqTET9adCak9V384JeyzhZYtkPdjEwwHuIvcaMOP5MsahSoNctR
         eWe3f2DS/NYj/0jYG81kZimvsu/NexYRonbyAuD2WeQ1B75Q/wD3pZvoRCsXbS3nmXte
         pZWpBLT/uRZsKblsiWwA0vXRc56ygwyWLDKYa/kLAiT0FmbAWiS0zhFNrv78vKg7NUux
         i2WeC7BXw6heqBkQkkX7yrIwilo/CrokfVu971VaC5pWXOMGq7+gEv07/+oTR5EoINev
         x4EuSAqzTcK6zpgh3HcxiSqA2nwLvKify6nhE2kWeWomoasEzHF4BZbpluUtCVDM2K31
         5dKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hyPAeDQ6jl0um2hsPGeNiMagMFt3l+QdPnzVOiIsRvA=;
        fh=eWhekAss/tV9whNhPMf4oo/SViGOEhgWyzNVhUXhQqw=;
        b=lWiznWywhtlvKHvSOxi6tqABgGm7srq9OcMUKnMP+vkEi5x855/eSs2+K0rPYGaSEU
         UhjQ6tDxEO+wZTmFnL9+3JeN+R05dEFWOBt2fC8gzJ+KIPd7JFLolw9LOqyF/8m8arTl
         PoSBsRGxTXO7eGOuK98w927MZDvwOHJm3ixyo+ZeqkeVWZqxsMqV88txLTeuaVVauhg6
         wUHxFH+dIYauT2ZQ2/t/ceYkuyZ9r4Mw4ayOyg5HdPRnuKX+Z9cKDiL9DtX+luHWAMn4
         BF+awGXIuzsu2EN59nHVO6vufx/qojOxXhWkyvvr0fzZsOZ6D2mW8jhtKiX4g8a/ZxZL
         iMxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b=ijkTghch;
       spf=pass (google.com: domain of alex.zuepke@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=alex.zuepke@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id dt10-20020a170907728a00b00a1b84033db7si397964ejc.1.2023.12.11.23.47.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:47:43 -0800 (PST)
Received-SPF: pass (google.com: domain of alex.zuepke@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Sq9gy6G0zzyVJ;
	Tue, 12 Dec 2023 08:47:42 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.88
X-Spam-Level: 
X-Spam-Status: No, score=-2.88 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001, LRZ_HAS_IN_REPLY_TO=0.001,
	LRZ_HAS_MIME_VERSION=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001,
	LRZ_SUBJ_FW_RE=0.001, LRZ_UA_MOZ=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id h6oZl6ao2fBj; Tue, 12 Dec 2023 08:47:42 +0100 (CET)
Received: from [IPV6:2001:a61:3a5e:df01:4e6d:9571:246d:a84] (unknown [IPv6:2001:a61:3a5e:df01:4e6d:9571:246d:a84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Sq9gM0wqkzyV2;
	Tue, 12 Dec 2023 08:47:11 +0100 (CET)
Message-ID: <22a09591-024f-4a02-a18f-793094d81d45@tum.de>
Date: Tue, 12 Dec 2023 08:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
References: <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Alex Zuepke <alex.zuepke@tum.de>
Autocrypt: addr=alex.zuepke@tum.de; keydata=
 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
In-Reply-To: <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: alex.zuepke@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=tu-postout21 header.b=ijkTghch;       spf=pass
 (google.com: domain of alex.zuepke@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=alex.zuepke@tum.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=tum.de
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

Hi Peng,

Am 12.12.23 um 03:42 schrieb Peng Fan:
> Hi All,
> 
> 
> I am running jailhouse on i.MX9 Cortex-A55, and meet an issue.
> " str     wzr, [x1, #16]! " this instruction in EL0 triggers unhanlded
> Data abort in EL2, with ISS is data abort, ISV is 0.
> 
> I am not sure why this instruction trigger DC with ISV 0.
> Any ideas are appreciated.
> 
> Thanks,
> Peng.

The Arm architecture cannot provide all information in ISS for instructions that
also update the base register.

You need to change the code sequence to:
  str     wzr, [x1, #16]
  add     x1, x1, #16


Best regards
Alex

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/22a09591-024f-4a02-a18f-793094d81d45%40tum.de.
