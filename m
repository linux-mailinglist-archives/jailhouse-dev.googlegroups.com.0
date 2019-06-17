Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKWQTXUAKGQEEVGVUQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269047F6A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 12:15:06 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id n25sf1614556wmc.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 03:15:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560766506; cv=pass;
        d=google.com; s=arc-20160816;
        b=emGjycP5xUVBcDZjIGV4d5OvGYusgcVsXT4uXHa3yqKTjrYqtkPCuE0O/wvLLypNFt
         nGrBFacjwlG/cn14J3legjKipk6YuABwGo32zqJHCgGJqrnLSVoxlV+thzW628Dg4Q3A
         qrQq97Pg1RvTzaG0Jl6nTEQwgfeovcaVEu1JBIq+jlIydq6qepfog3kaxLPBZkq1fV1D
         iBANb6qnzCmU+J9d3urpSCTBueP3Q497YbbQfJcISQAUnDMSH1FmfpfXKxF8w5n8AC5S
         dZG1jVfLwtHu7QEwet97DgSViYug/J3FvgJ5iIOIPmZRGRFiGdbPWU2QrW8+fKaA/LTJ
         QSdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ywPCOWl8O5O4ll41RcGNUOR/Vha0rwEKPBorLxhyxCo=;
        b=eidcOmmK2O4ixtu1NhCEHslTzfDMOoxYxBjTDXXs9J0pOE4w347MyU0yeZ/fe5RTtv
         b3oYsKdHrZlecAwz1CB8tB4x5f6+sy10H9JpKXb2MFLLUTfsinW/iqAYvGdpwapmPJKk
         J4SSsRgNiIQuA1J8NBkZLYn1TdOwrT7eVg278lTukXSf2suGfaWVvW0ogiE+N9vhoE8f
         mH0iTE8K+Ifw86rCSmtezfKR1L/1r8j4BzpnNbuhvyB5gE44F01+u1ePkoQJ+dGiYZLX
         A3x1v/J8SGmjgN+E5D06JNYrgN88WwkJokZ+wuvsT4v4niruUXUfgYWUGl3I9xykWVZ4
         nUEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ywPCOWl8O5O4ll41RcGNUOR/Vha0rwEKPBorLxhyxCo=;
        b=osYJQq7ZRzHHpgQKeyH7Afczfajy+y/OnYhoM813mQj3gl/rbMypz5HOmBLeNBdJPN
         xL4xwNdwGl91K5yngb7RfvZ+C37wRCBlD2S5gaevnDXQbp5XS+tx/r+uQJq26f9CucAy
         hJBqGsj4H2buRTN0GuQCdwU8xYhFU54lNMpBM9+eKpZE8Uu6GXIxYA5+sq7U6XNl/iUS
         R9MzHz4/TsRUyf5buINhUY+TeUOW5UfewB7MAXsLibpHFkoxQ3o/fWUEmvuVyA17QKbW
         jqoClb9MNWOh/iT0Auha5MCIpPOmL1ycqcT01RxPQkc+yUvzP+7Dzurzbh4PUEMnjSUU
         R+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ywPCOWl8O5O4ll41RcGNUOR/Vha0rwEKPBorLxhyxCo=;
        b=np4QhEQbvIi/Fgo+J423LFfztm4I/OTgsCTPbAcH1ddC22g/WtjhHB1+F6Sa3bHgoH
         lKr4pNCDv/0VQ1rvC3ivFKwdZ//mcVDNNNVLEAB2wTope4vzMU7SgY4UWTLhKjL4Ogd4
         DLUab25W3K3kW4aPuMIllLHhm3N3McyI2KSB+p45O6j9omoCYYlUwlaPKL3E8pOnBUbb
         jJFJlh5Sup2/gqFp5HMG7wlnnK7X6ZuRZOQ6cqUHL3izY/yOPe6C4cEh4TwKhoRzSs2Y
         Ki6A62Nn+e3cvMB37WuNGxeVPKS+iG0Hg0dUAgeN3C8MwUt3/gns5ZvrjmXEa9y8hf27
         mcVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX12x4utlgcHIxLnLpw6XSObDoxqSjB1rfdDku6X9KemBYShDFu
	hy9hQfwTsdgtMeRQTGa3TgA=
X-Google-Smtp-Source: APXvYqxM0Gu1OsPn+IEUhygiIOUy6zMA4aXpHexiBZLRZBO/IbdWQFzt1DLnHhzWUHUQZR0SCc0aHQ==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr62836510wrv.118.1560766506307;
        Mon, 17 Jun 2019 03:15:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c34f:: with SMTP id l15ls4748532wmj.4.gmail; Mon, 17 Jun
 2019 03:15:05 -0700 (PDT)
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr18831879wmf.154.1560766505720;
        Mon, 17 Jun 2019 03:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560766505; cv=none;
        d=google.com; s=arc-20160816;
        b=GJ1k77no9ugxP9mGqsI4tsk2LM8f+iRlsuLvGHAnFPRTCGHWSYdDdbh+pzJZbCLRny
         i3QFzz7z+M3zoAZOCQPI8s5qyt4kIbpTPuezXazEepks1v0CYbz6hqhPUTFxufX1nZcw
         yKcGVgtPI/t2skqgAMeuQekG+QAt7vFZBrszn2JyX3Q/6WOXSw9rZzdvaPhc5/HSEH/D
         JzpuqTqZCsKELoIvf8Xp1KrD0eAKEtiP08rCvO8rgJq0xoG1iZvIY5IFJeWcLLzYvNzG
         w3YzDhJc8qCZ6nE++krBFuK/fQ8OfaZUzdf3bcnIgVybKQsF5VAQ0Q/ncGlncehY9/Qu
         1mPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OzNMs+1Sdj0XE5KAVsIgPFCCxENns4MvSL4bKOwwuAU=;
        b=Ov3EMwq9ad3H/te7oc02+TqXABRwUF3YGrR76NS/2qIxqhN1B+mMzICrQajDjviUws
         mPsLK1+T2u0P0gBEymcJ66mMfiqBuBsFNjILofkKeQasS4VzOzuVZ+e+iSkiYsjlZ8+3
         Ve1bNX5Abo4+9pRqcpwkFI//XwEmpeYKFo9UDdogY2AuaLhI09DuvOr2xOXy0SOr5Wru
         sumq6+gBbD7HXw0yBfP6IJcjDr20k/YkDwjiOvPaRb18r+ggZc7Jmxl63aYhCwykuoDw
         4n8ojJnHRNa+zvtoVsTy8osQy6oScyEO3KFWBsFEVp1YqU7BxOjYmdPdRz/+TExKApMw
         IJ1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q14si434087wmc.1.2019.06.17.03.15.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 03:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5HAF5dc003859
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 12:15:05 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HAF3N6016296;
	Mon, 17 Jun 2019 12:15:03 +0200
Subject: Re: Finalizing 0.11
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
 <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dd35885b-522f-3291-0c53-297e2d2d980d@siemens.com>
Date: Mon, 17 Jun 2019 12:15:02 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
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

On 17.06.19 12:11, Ralf Ramsauer wrote:
> Hi Jan,
> 
> On 6/17/19 9:49 AM, Jan Kiszka wrote:
>> Hi all,
>>
>> by the end of this week, I'd like to tag a new release. If you have
>> anything pending that should be included, make sure to post it soon. My
>> integration queue is empty, so also let me know if I missed something.
> 
> Andrej still has two patches in his queue, but they're not necessarily
> required for v0.11.
> 
> There's still the MSR bitmap issue on AMD64. Valentine didn't respond
> yet, I'll have a look at that soon, it's an open issue that should be fixed.

Let me look into that.

> 
> Other than that, I'm in the meanwhile pretty sure that there's something
> odd with VT-d, but I can't yet tell what it is exactly.

Do you need me to write an instrumentation patch?

Jan

> 
>    Ralf
> 
>>
>> After that release, a major rework of ivshmem device is scheduled. A
>> prototype that supports multiple peers and has other optimizations of
>> the previous "ivshmem2" approach is almost ready, just needs patch queue
>> refactoring.
>>
>> Jan
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dd35885b-522f-3291-0c53-297e2d2d980d%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
