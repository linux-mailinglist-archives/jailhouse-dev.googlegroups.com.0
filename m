Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB55QWXZAKGQEV3YA44A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id CD077164913
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Feb 2020 16:47:03 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id r1sf253318wrc.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Feb 2020 07:47:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582127223; cv=pass;
        d=google.com; s=arc-20160816;
        b=caWe6iodPqpIkPGsbAr+pL8nZtbdYl1gFuQyxIx+72jgLtaz2GExT+Bf+Hyr+RA4UH
         9m6uH8j/qOjpbQQlX1/69ksEgfGHPm5ZN+gJFd/gUEk0heKek/MQqJDE/MhbsKLLYcM+
         F2gILI5Cz46LJk6NKNXlUdi038bP64aPUTRU4/OdAzDeGQhXuglKLCE6jj4RDRYQLnZf
         nxkvso/GeUyFmdMowJNvSnH75JYc3Gjh7O9bl6RFNzgkJm42rHO2mOly+3WUqCkrlvJB
         wbLZ4ymXU4aPl/MiuqyFXzAVK28F+HvkjtTy7BSy0jLz/HZdHspX/aFJnD9HKP/ILEYX
         zV1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=5gJ1HOUHUSxwqtMZyeuo4e1xQyrMuk4GlpCH6bam4rU=;
        b=aeIKIWjGnVZNtL3VTcyiGrgwHvWPoawOtegoA74uX5PNrRvSUnSLu1+li7/f6ll945
         ed22PYVBgS86s04s7StpLx6ZYeGdnJsuBuPSxQi5HY0uWUv68KK5eESXBScKwfTf39Ew
         O8NbyNzMCyK2e6+k06hXTydsgpkJ0RLQvI3FnU1qnUNaRhU/LkbWjOgV3N0kNbOVyXKI
         5UjDgBgGmOophpurukwpyPCY7MPWw4KtXCTn1y9YXeZYWLm61PObHNLUBl2A/Kt4Xh7J
         Jf3fvuzrLHm9sx+QwAWVf9DnGzNMRBPouChZo0SJFeODrkKV3+f7Uh8NDZDQJInO9W+D
         6izQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5gJ1HOUHUSxwqtMZyeuo4e1xQyrMuk4GlpCH6bam4rU=;
        b=OKX+FE7x/jYLywf1R7BN5d9By74+cRcT2af24xBaLDDDw8irIRCJfCcmdptNXDpD7u
         NCx9XoKkjmpnMEvv2s05nHKw6m+WPM0it5Jt4nTovYoeCMz1Wn9gUQzQkwY53kdXyRan
         /A7rg0sUMtdfg1M9Coehf6H9hoXE5dcNh+L21Hi6AbEJng32kwRrExHf/6x5KLtyGZ7g
         5oJz8/WdKogIpXm/aFdvDWmDmi2MwaJUa1ZIiisXiet6/v1qRRLTIqfkc5/IsjSgq9wo
         hT4R4F9ypJhsQoZWWmPs8y3gZcKlP1KQy1kbjoZWsXkZGTwMwbFoA1zja8NgjoIT98e+
         h1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5gJ1HOUHUSxwqtMZyeuo4e1xQyrMuk4GlpCH6bam4rU=;
        b=toaSMYF2NeBYnMZh3J4uBTlre1wXmz2le5hPrulMFp3PwyGGaq8MqkQ303gTSar/FI
         JOyndGWIXxxoAUmDaHJn+GbTaZp1NAPERcmNTuMeBOaO1e6ohddXWKJuCfXY9YUxNfec
         N8SZpp8Mv3Lo+WJU96Ju0jEVPcqsDpGYzI98MTnBfqfHX+YDUzP6xZJg+ezvAg+/BovX
         5quV2aVm5aTYKAxk/ivOC45sc4KO6Sna3yTkTIz3dw38enHVO4m39hBxg5Jevg+D5Esm
         legQQGY9B54WD8Nrlh79r6PBVpJcQRDrNWhboGGdFPHWj3S6zXPP7yBpTm/pLYUcM5fk
         r0jA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXCf9FgTPYegdNx+YMqwX5JXMmFrilp/aBkoylBgxF9N3NmWNLR
	Ymez2YrhvuEnutErODdRVyE=
X-Google-Smtp-Source: APXvYqy2797gl9Dy/QpfZSBC/L9M8+xzuRs3R4YMie7Ksmm4WbeDxscXHMokEsFBP4T14E0Bu295Qw==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr37058304wrr.83.1582127223511;
        Wed, 19 Feb 2020 07:47:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls9856731wrr.5.gmail; Wed, 19 Feb
 2020 07:47:02 -0800 (PST)
X-Received: by 2002:adf:d4cc:: with SMTP id w12mr38890935wrk.249.1582127222453;
        Wed, 19 Feb 2020 07:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582127222; cv=none;
        d=google.com; s=arc-20160816;
        b=Ij9/Bp7okXWsiOotdxDxv5Ry96PfXv/CxpddBtmJkhFnZf0UdLtywZeQoNQ5U5N7br
         RJm7YxHV4lR27rKSO6/Tv3tskZS45Jl1ytz3T/a9wYtCl2j7YbpLkq7O/zlX27ZyLejC
         yxgCMYLcGtmn8G+0RQUO59ysdQO32qn6OUxOLORI7vbYJ+w8QM+79niVL2yavFj1Imaq
         kQfkxA+AIAK4JGmkhXuYEZq2uYlmJiXuX55mJtUA1JflJY5grGaOyMphaLM1gOZ0VWlq
         zMBAyjUDQhiSXsBRowf3DcguutYd3fLgu+nupEMkgBpXWFzS7Iq7FRmTzpxBGNYbhqNt
         q8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=X2/UQe0gbJNR/iLfiYKUb0ADok5SAaDcYFGvJ+Wf1k0=;
        b=gzHm39CTIgaZAtA8dGqQ1DVXmlKQsDC/08qhWfCVCAZ9p4e7mLgi+TKb5pBPspJmzz
         6o1lEUASkjCm/GxoXTlsaET5SwYPldIl6O6p8NczL4xc/ZKXZ3vCA2WfyrLtvPnGHUqF
         e8UXPoQIr7d8cKPpOfXHzsL1X9kWWhlNzEQvnL7GQQJaAtSwMGjlM03A8tZlaaUv5Aki
         7uIA6oMTXRx/bHr8HFGoWXA4dczXrv7iIYNvy6eR0TCJ023I565aLV5CsDKVfw3SVd9E
         wCwQ2LH6sYDV/jB8dkyEw2JzA4E1eb5IF+1Slp7TjhDjqISq2v9WIQK8+UtwzOjTXejP
         kAoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t131si258581wmb.1.2020.02.19.07.47.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 07:47:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01JFkkEi023113
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2020 16:46:46 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01JFkgTh026670;
	Wed, 19 Feb 2020 16:46:42 +0100
Subject: Re: [RFC PATCH 0/5] Removing support for 32bit KVM/arm host
To: Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kvmarm@lists.cs.columbia.edu, kvm list <kvm@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christoffer Dall <Christoffer.Dall@arm.com>,
        Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
        Russell King <linux@arm.linux.org.uk>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Anders Berg
 <anders.berg@lsi.com>, jailhouse-dev@googlegroups.com,
        jean-philippe.brucker@arm.com
References: <20200210141324.21090-1-maz@kernel.org>
 <CAK8P3a3V=ur4AgLfat2cSyw8GrkCS2t06eqkzC-gXcc0xBpEPw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ea7bc1d0-0a11-8ed6-da70-d603d8107bf6@siemens.com>
Date: Wed, 19 Feb 2020 16:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3V=ur4AgLfat2cSyw8GrkCS2t06eqkzC-gXcc0xBpEPw@mail.gmail.com>
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

On 19.02.20 16:09, Arnd Bergmann wrote:
> On Mon, Feb 10, 2020 at 3:13 PM Marc Zyngier <maz@kernel.org> wrote:
>>
>> KVM/arm was merged just over 7 years ago, and has lived a very quiet
>> life so far. It mostly works if you're prepared to deal with its
>> limitations, it has been a good prototype for the arm64 version,
>> but it suffers a few problems:
>>
>> - It is incomplete (no debug support, no PMU)
>> - It hasn't followed any of the architectural evolutions
>> - It has zero users (I don't count myself here)
>> - It is more and more getting in the way of new arm64 developments
>>
>> So here it is: unless someone screams and shows that they rely on
>> KVM/arm to be maintained upsteam, I'll remove 32bit host support
>> form the tree. One of the reasons that makes me confident nobody is
>> using it is that I never receive *any* bug report. Yes, it is perfect.
>> But if you depend on KVM/arm being available in mainline, please shout.
>>
>> To reiterate: 32bit guest support for arm64 stays, of course. Only
>> 32bit host goes. Once this is merged, I plan to move virt/kvm/arm to
>> arm64, and cleanup all the now unnecessary abstractions.
>>
>> The patches have been generated with the -D option to avoid spamming
>> everyone with huge diffs, and there is a kvm-arm/goodbye branch in
>> my kernel.org repository.
> 
> Just one more thought before it's gone: is there any shared code
> (header files?) that is used by the jailhouse hypervisor?
> 
> If there is, are there any plans to merge that into the mainline kernel
> for arm32 in the near future?
> 
> I'm guessing the answer to at least one of those questions is 'no', so
> we don't need to worry about it, but it seems better to ask.

Good that you mention it: There is one thing we share on ARM (and 
ARM64), and that is the hypervisor enabling stub, to install our own 
vectors. If that was to be removed as well, we would have to patch it 
back downstream. So far, we only carry few EXPORT_SYMBOL patches for 
essential enabling.

That said, I was also starting to think about how long we will continue 
to support Jailhouse on 32-bit ARM. We currently have no supported SoC 
there that comes with an SMMU, and I doubt to see one still showing up. 
So, Jailhouse on ARM is really just a testing/demo case, maybe useful 
(but I didn't get concrete feedback) for cleaner collaborative AMP for 
real-time purposes, without security concerns. I assume 32-bit ARM will 
never be part of what would be proposed of Jailhouse for upstream.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea7bc1d0-0a11-8ed6-da70-d603d8107bf6%40siemens.com.
