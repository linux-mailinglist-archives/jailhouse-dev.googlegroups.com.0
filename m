Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5FGXPYQKGQERFAPXJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7114A388
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 13:11:33 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id c6sf5927924wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 04:11:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580127092; cv=pass;
        d=google.com; s=arc-20160816;
        b=PDROgm8xp4j/dgansUM5l4b27l03dExkS4U3R/HRDZ2WIU9wWTBX241OGC4xQUBm6z
         3HfQBSa3XPXTb1n7TvUv4HtEfWb2e92TFxDKrGBrfaGmRL+aYgtQQE2VbmYjwKYOuVOV
         HebsY7jHO/hqt+zlHRqjgADgIpwujoZcmL98PwPkx/Ek6MBf5M8I+R/4PUL8QzX4g0OB
         gk8lvRYbtwoS0JZvoTImkfx9k7f3pt5cb2xW2qOlCNGST2t5aZ4RMTmuc0Qt7HUnueNo
         ftniQ7f/yn0WWEeQEEVgfPnxuc3lTYLlUm/i6HezJnMi+Xs2yoGN7sFhJ9MiOYgIlDp9
         i+cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ZjdDr9iMylqyVXj52JiR5+Xt3l1+HW95Gcgdk4KkyAw=;
        b=shkKinvSk0MGAiU4kTuOqJ4/p+ZVtw5kHEtO6JkW95PAbAg8NdE9GB+QmFj/bDGwEb
         WlAet4avZqPy7oRsu2ryTfLzx099E/VAw+lB2agjhvhxci4ZjCZKvJYiLQ5l4Jo/nJ3O
         xYtcnW9Z8ebpIBoOufVaKxl2WWWwRYaDljlLz/n0kd9KNR354FmcCxwowUFLedeSiBIa
         IioNWR9FhZfD0d+AEeBnKfIuAlbGqfs9pdsShGcZVujHyWk4xmp2oI4BKRcMsiBvIQht
         YJtPlB8oJkNZP9UHjcTvwSfv8PmdqMddDXaRc2To9P20WHfH55qk/rkXoWqR4p+JT/wn
         9jjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fUX7Pos4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZjdDr9iMylqyVXj52JiR5+Xt3l1+HW95Gcgdk4KkyAw=;
        b=SeHkOfFINM5/dW59qsxAGtaACkC6tJru9lePmapU4pQNt1+cBPxslF2QdblQ1DQIi1
         fcAkIII/j9HY6smcJTHKTdwlwDZdlkle/tgZLVERnNQEcROIMnCB/plasrTl0QdsUIdg
         ii4zncKtkznqxldC83dFY8feiQx9t0j/NGZFvawp6gMn8FXwCx9G6OxP2yWRKlz2DfUc
         j9lhsM/aCWc8vODUguarJKfXe+l1o+yRXiNFnwQKd7XHyhCByuTby8WnKGNJsfzxPNI0
         IU29wxYUUDBhkGZf3xYnfRdJUlQRweDGNaFhLyGoHb9hx8aELRyw9s9tNfj/1v0shThh
         VigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZjdDr9iMylqyVXj52JiR5+Xt3l1+HW95Gcgdk4KkyAw=;
        b=Wphff1rPFLLRE2/UuEkW/75qUKwWCmD+gmleTxvHnjpyt5ieY3czI8RAPZUFGX+XAi
         xjRJXLSOzChO6WABFB6Z/9tNS5HJeizl4Vwoab3JiUvN0TGPHWTUeVFvS+b1qX0BTdZc
         Gw956NjgRzLxv3a5u39/7N02vw0iQRw14zLSiRugHcoAfZ0VyC9Epcr9UCKuv50EJTOf
         0Yuqd3P/sIZBa4TEebcVf6sC7IjNG5dOvI+y28CurEqSlSizM8AL74fSFuVYRxfqiCdn
         lP9posq2oJSUIUq/e3NNN9f7Z3CDggk/2mPYw4sh9nEbpvyTQ4feo6GxX77LG63XtoIl
         dNyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWvZLr6+rwjjkKc8VFgdq6vgFafNv14fB3SMLCcTn8/rn8SpqJv
	fdX0sKnXrj79p3jika10308=
X-Google-Smtp-Source: APXvYqyYcxNh4VZyo8HJu6Q4B+225TrTBFZnLwFJ36ySUXMhcIi9FZOKFvpl2NF9nMWpJJUOq8bLMQ==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr22382658wrl.117.1580127092831;
        Mon, 27 Jan 2020 04:11:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c452:: with SMTP id l18ls4443229wmi.1.canary-gmail; Mon,
 27 Jan 2020 04:11:32 -0800 (PST)
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr5890031wme.56.1580127092135;
        Mon, 27 Jan 2020 04:11:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580127092; cv=none;
        d=google.com; s=arc-20160816;
        b=n+PGiU8gEt/+nvkcet14BOoadM4mPXIgOSAI0Li19M70ecd7PqqniKAjEIawWHCuY3
         dDc9jccWCImSRCykEcSVLPU6RIGP7Oz6rL6q7Bcha6RleWVZZMrx+gwTUlxfO4FujI/n
         QLymWrYYraVSUjQGk7MND3bDOm96XAQSRwgUksLRiAa4BwMcZiZFo9Owfz1m85KbHCA4
         J/xD1fS6alhYyfmuVl3jh9baP+pVXmw9UdkyBiN9JWj4TLUf3zUf6BrwfAntpdnHzuC3
         gtQza3gwyjhxJ1uW/BkjX/9tvDkuNEZqSzjgq5Z3LiPMQ6/HofkdECjm4Bbza8QYgZHQ
         KFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=bCAGqGMooSApgbpo+meRXWQY3ITL+N+14oRRA298iSk=;
        b=PIwP0THnf0mMNUAbo8nm1n1Miny0xC3eLwanwvtsvstnnhI1qHpPYldHGI/8bMsgfZ
         /B3Nq1m4E0KKWLhIlSp7u6Z+gdabMkRo15QL1RNe1WWWVTcaLltTNtRePSAhTo1EbkOg
         eAhcY5lyy3lNWDJrnYiEB0giMBSm/9vcR4p5zK3G1TiQXeCQSVU0gfrUh5aN+HjAUCvw
         s+wb2OcBS1YKqeYmDHUVyugBIrulpcpqYRbOTuES0y7wf9Hk7x4V/7duD6utJaNq324C
         7g8HUf2tv6jXEm5JBItrA3WE1okfmkyyITdBGP2enBK0UM8QHEUe1bJjZjxS8TNTXUb8
         otSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=fUX7Pos4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id p16si566576wre.4.2020.01.27.04.11.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 04:11:32 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LvSLn-1jdbAO2dQB-010bd4; Mon, 27
 Jan 2020 13:11:31 +0100
Subject: Re: [PATCH 1/3] core: Tune comm region's flags field definition and
 documentation
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <cover.1580107046.git.jan.kiszka@web.de>
 <c1d059a56b20261f75a268fe7bbf94f3e796d99c.1580107046.git.jan.kiszka@web.de>
 <e0409d00-5289-9714-bd6d-4fe5aeb8a9f4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c950de03-02f6-2ed8-109b-627ce9bda84b@web.de>
Date: Mon, 27 Jan 2020 13:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e0409d00-5289-9714-bd6d-4fe5aeb8a9f4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:qLYQuFbrrp8zXlvhHv0FxjD6Lj4JyAOzbHN+Yl5MDQDZq572SnL
 RxTDabYmHcVFaWNGg9AontTiG7lwEEFVYdbd00f7XJGJ9VI4AFN/644k8+x4hZ0oPQnpbnF
 hHDH2UPbpNN68c/7EPu+SWT7y9qRNwASRKqyQUiBfc51gqXQ6v7jd188mvEg9v+wWmBUqGp
 48iBicsdjd7PmNNQcm+kw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UTSc1oYHj2c=:YGpbN0DdAv/79nfS4bz2X9
 cVgObXX72hoiSS9pwz7WKHkt3hmJI2YXxlJECYouAICvKHcujGs1qRo8+wYbOLIrX6EVxto2k
 2/XCVI2VerBiE8iEdFP9v8xY5byrgOmKg6BRkblBEIAZPLwWXDU5O1bNMtCkBOZm8NTpQoDIw
 NhIrh3mmxX8tr5+RzV8MJilQojxTwZe2+Ff3d5pmWrzMeay85bJuf5p6OrtxJHQHkqQ9bCynI
 L5S553sCs0u821Z9rA/zECz46RQxGILMB+Q3r/eQXi7goAEjbAeuYmXvjPBv601NRwVw93D88
 uysyJW/2yHUrOohDwNtvyIN5+7Rz7caP4n+ZVeAUUrkIUsDXvBscGJYZyydyy3tZqUOLjMn8X
 IFU9gL0MtXhOKGG4eGzupkyGDcMELBKv0MRdziuFd06L9WoJRlnoLkIMdKs9+ytBkD/mGsGbY
 8tE68SX5yzxW2G+KXdjbM6VIlB5p7ICpJKN73pofQ7Z+UZGiP7gQAwy9HyRetHVH1bKXaqvuC
 846IscUrqNbNA2CQYW1tHok5lmUPeBdNLc034akMBo5ZcznDWQeePogyvjDIrUOrr3v3jvksL
 bMw4j3qyiz6SGustvj5jZEX8VrZs/yXfSakZhJ8m2JcV/tVH/P9yTqHSznM3P/cAdt6KL+eFZ
 44cm4Pm2yrr8JMH10lOvSXUHQHJoarPxqTYCiZVlacvmNfAgYURdB9OMV8onlOBdYQfwbdmwN
 hd6F+m2bAGuAwoEkW9nd6pKRWvwEP05fZcT8ptCsB/b0LuDaiFZJCi3YoNJcqAArPnNjoln2m
 44XaGpuuO3uJCDI54mgs9Gx+/4MBX3rKNyqFIj9MagjT/5nOXpyg3plgXVYRD27KHqAy6bk4Z
 9v/dpQK5wKvmDwLaAglVSMhs6fQ9eUt1aRBvhukAfiU07ZwMFZwwETTAAmhZgao0OEZQ+QMiP
 2fXncDAlrko5xCsSOJkD+DfaqHZW5D9AKdZ1P5HBDY2QRRnitjaLtihxwVJ4YplF0KR8G/pBj
 +rua2PTF3QDo27/rX8fDPMHoZspgWY4SinSi4wsJ/dqjTTJmOtW8f1RF8DUjdlVfpVklCgrHH
 1N6DZELVuo1HmzQ5PULHSXTVUqtuSoaCm1ynsecrxrdT5oiGnBXvXV22hObcXYt/ZU6jLMOt8
 QzS+CQSkFsoP+uGSFzEqK03eTKrZ8M9lxYwfpbRiY0fJLg65Lk9iML+XuZcktGAuAw/B+R13r
 b79LPmjd+m1IU/JiQ
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=fUX7Pos4;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 27.01.20 12:40, Ralf Ramsauer wrote:
>
>
> On 27/01/2020 07:37, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> This field is static, thus volatile is not appropriate. Rephrase the
>> field and flags documentation for a clearer wording.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   include/jailhouse/hypercall.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
>> index 20eea801..07574d3d 100644
>> --- a/include/jailhouse/hypercall.h
>> +++ b/include/jailhouse/hypercall.h
>> @@ -92,9 +92,9 @@
>>   #define JAILHOUSE_CELL_FAILED			3 /* terminal state */
>>   #define JAILHOUSE_CELL_FAILED_COMM_REV		4 /* terminal state */
>>
>> -/* indicates if the inmate may use the dbg putc hypercall */
>> +/* indicates if inmate may use the Debug Console putc hypercall */
>>   #define JAILHOUSE_COMM_FLAG_DBG_PUTC_PERMITTED	0x0001
>> -/* indicates if the dbg putc is automatically used as output channel */
>> +/* indicates if inmate shall use Debug Console putc as output channel */
>>   #define JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE	0x0002
>>
>>   #define JAILHOUSE_COMM_HAS_DBG_PUTC_PERMITTED(flags) \
>> @@ -116,8 +116,8 @@
>>   	volatile __u32 msg_to_cell;					\
>>   	/** Reply code sent from cell to hypervisor. */			\
>>   	volatile __u32 reply_from_cell;					\
>
> Why do we actually need volatile here? Shouldn't we rather use mmio
> accessors?

This is shared memory, not device memory.

Jan

>
>    Ralf
>
>> -	/** Holds information special flags */				\
>> -	volatile __u32 flags;						\
>> +	/** Holds static flags, see JAILHOUSE_COMM_FLAG_*. */		\
>> +	__u32 flags;							\
>>   	/** Debug console that may be accessed by the inmate. */	\
>>   	struct jailhouse_console console;				\
>>   	/** Base address of PCI memory mapped config. */		\
>> --
>> 2.16.4
>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c950de03-02f6-2ed8-109b-627ce9bda84b%40web.de.
