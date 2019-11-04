Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJE6QDXAKGQEKNVN7EA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 066EDEDDD5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Nov 2019 12:44:37 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id o21sf3150691ljj.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Nov 2019 03:44:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1572867876; cv=pass;
        d=google.com; s=arc-20160816;
        b=oF2oH5nOC039Ls94n+ZLTubMEFI5Jurd77ktxwzDxYlyJMkE95p98F5ZdBt0CqpEfz
         uxVl38IwXFNEss79xyOmN4nzzrzziYCUNNtyArqY8M00F77S1mnsRMmvvqerM5JBRGZ3
         Tu8kNI9gPG0fvtbF0VaxDCfUzkgiEg4hRd2Ekppa0LjDcc0yyZk5092kyToHgeV0NaII
         bB1Q9VjbgzPF3FCVvxbPWOpK5IxcIyC0PELntLIHnZIvwklxlQaZc8/Iw4rE7kXjdRRO
         BB8yEhgcnNIHt74rF1rfHubnnmcl8ia1ZGnidRrIr7RVCzKK3puJ6lLemNAMqW4NI+/B
         UPIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=AIZc+xJ2n/l/ows1sC3mepjTce8D+foHfjDBNPc9yoA=;
        b=ONOTVuCKo8y/JRInGL3pJ4Z1mjna31pMjS4ArsOu8IDXBFK/3AHI7d217xvnUYdic0
         ev+d4n8u3Stf0VXNSjNnGA4/cqDx5V+NMvR5aSzZzmT13AxgbthHGLfhDNBBBVZhHWiZ
         eLSdP/rIS2uh9bYf7994SggSiEBv3YO4A0bac6HwtdTvBgtz1hQQySqN4GJCUm0NxcmB
         LCa9JamZFQifLFFRt0/2KYPezKXzREw0YKYH4/NmB76f9cQZft1Jk1nuyW7GgvW6B+Gj
         a3W6/IxzOXfzskzccqn7mLiSnK+RigJSna4DDgpZ+RkFyazKTvhqM/9qIFtVvZ7f/p+v
         CKRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mq4QInUL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AIZc+xJ2n/l/ows1sC3mepjTce8D+foHfjDBNPc9yoA=;
        b=NHpMugvM5A5YUixxBcdg23WLSHbOl7hhOorm7dg31wHsvZBEFnhJAXY04lZTBegvNG
         IPKKCzQsNxlsVMsaZAgOQE5dv9g2PcGnjVDNGTgAsoLX8wSvM4gYQvAFtjG96ISGv+av
         IuWPeZUwI5A7twLnm++0Q/TQWI/EdmbMcopiKjxC6CwuOeTllnh6xDd8h9kxGIyt3q/h
         m+fIPqAZBOzG5BxSWZbf+7LqpUek9tB4HUzQaPVnwSq7v6AcvgMZKWHX/k/s0bvDdy0k
         1QfFB4Gr3YH9ZCI7ldqwFhPiwuTWm/SpyD7Ywd5PnA7z9BlOp6NFyDfzC8Muspk162oj
         IjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AIZc+xJ2n/l/ows1sC3mepjTce8D+foHfjDBNPc9yoA=;
        b=H5yZy6vKNw70UWJpGkng7k4J4OnJv4Tau1UJUfNfkX/6HJOgj3ZKOjQ6PjHivUddQe
         PWaD1wkz5jcgrRH+DgQchQfI9IRklyTorRHRIfjmDe1ml1jpbGhVh8DqtiyAiFmUk5x8
         qVuxph90u/Utcy9Ik86CsZXv3oQ9ZhkTF8poC25VoTSvp2gN1rnLf3q6TTpTAkDvNWuG
         749NzYCfkgtzLsZX2kTSrNr3ihhTlZyVMA8BKr1I9NVFIhmC/nlEI5/MIJ2wSFwxlT6V
         hUsmVnrPCD/bKRTEwSAQ/wNtCPoowfm0QSHHpRb5/xP8kPAh5p/FfB5NG3RWhycQaRa9
         K5RA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKZad8aPXNyx/n594KJB5HzdOYGlnjpkAUb4zRw9Gs0Gnf9rha
	6dLFI+6Qql8XBAtNX2HzXO8=
X-Google-Smtp-Source: APXvYqyq5NvQgmDlgiYRprY520a2q8uagv3qm5RLvUMS076HDywzaRHMQ2xD3VnDpkDBKgkbEnbatQ==
X-Received: by 2002:a2e:975a:: with SMTP id f26mr19032953ljj.74.1572867876646;
        Mon, 04 Nov 2019 03:44:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9159:: with SMTP id q25ls264126ljg.0.gmail; Mon, 04 Nov
 2019 03:44:35 -0800 (PST)
X-Received: by 2002:a05:651c:1136:: with SMTP id e22mr13071044ljo.182.1572867875827;
        Mon, 04 Nov 2019 03:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572867875; cv=none;
        d=google.com; s=arc-20160816;
        b=N1qS99CV/FpLErHAtjIUQc53inqgFRJdVC5IRqwxm6ocWisA5on1EIOB9IPF1yWjNx
         hB9fQ3+QbUdWIAbXfsWyzdobGNHq32BQn1M4jtrZ6QeHgHQK7CH5ktDcfspeNttnHYnI
         MHO2H3E+rnpQ8dsGMZ1/cqQttRz7sQAIlbEbtCwZKSsEZLpJy6DlQKxgy3eQluJcg0EY
         Af9OeW/zM2MwgibExT5VvtxHqO5/v3szIIDZKEfX+GPzEsjED3Q/qTfqZVR73H6p2GXD
         Ms08pRDp0DbmNe0v1hTDfugt4SXsm2vKcgRk0fu+FFmSR4ZXXVsnCiF/D1iuQLsoCDeg
         ytjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=61tiz4AJjdh+B3MoHPIdx0+P/GEgOoP56OGTY4tjBeY=;
        b=VJ3gCnzF7d/Gav+oE6F2EyoCil7H0TXuKm4+Jpgmq7gWYR77+CCrXXbsznwPMLNjOZ
         iwQCMJeMketXhCY4VJ45SxGkRrWL0+wQginQhLru2LHnwyrer65ZAGGhqMKWED5cbqll
         SeedfQfexKNTUChknjQ1cQvmz5RM0XvyotDNElUh5S34ooFI0ChutciiXpW59krLSrVm
         47JKmAFCDaeZKwQbkYCCB15//Xg5NH/FoiCwwHll38npeYvatS+l06yT3+WAvHA8TnIc
         al5XuYXZ31tmcuxr/Lc3c8+v4NeH3/EnFd5Kt3SYA/xGIpJLIAbMxdNT37f3xDTFO/ge
         /JDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mq4QInUL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id h21si259520lja.5.2019.11.04.03.44.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 03:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4769v65Y98zy8b;
	Mon,  4 Nov 2019 12:44:34 +0100 (CET)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 4 Nov 2019
 12:44:34 +0100
Subject: Re: Backport of patches to jailhouse-enabling
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <343b0acd-45a4-0ca6-f6dd-84bee630169b@oth-regensburg.de>
 <e01e63da-43ac-b915-c8af-828491621c88@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <994ee21f-038b-d19c-d267-cc25485cd0ba@oth-regensburg.de>
Date: Mon, 4 Nov 2019 12:44:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <e01e63da-43ac-b915-c8af-828491621c88@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=mq4QInUL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 10/30/19 6:56 PM, Jan Kiszka wrote:
> On 30.10.19 14:30, Ralf Ramsauer wrote:
>> Hi Jan,
>>
>> could you consider to backport the following Linux patches to the
>> jailhouse-enabling trees?
>>
>> 8428413b1d14f ("serial: 8250_pci: Implement MSI(-X) support")
>> on linus/master, and
>>
>> 0935e5f7527cc ("x86/jailhouse: Improve setup data version comparison")
>> 7a56b81c47461 ("x86/jailhouse: Only enable platform UARTs if available")
>> queued in tip/x86/platform.
>>
>> Those patches have been accepted upstream, and it would be helpful to
>> find them in the jailhouse-enabling tree.
>>
> 
> Yep, will have a look soon, along with a stable update.

Ah, you already did the backport. Perfect, thanks!

  Ralf

> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/994ee21f-038b-d19c-d267-cc25485cd0ba%40oth-regensburg.de.
