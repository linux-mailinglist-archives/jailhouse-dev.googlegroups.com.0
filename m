Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3ND67YAKGQEVJ6QISQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id C165813AC64
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:36:29 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id c6sf6507256wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:36:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579012589; cv=pass;
        d=google.com; s=arc-20160816;
        b=DrmWYRmdRsY62drxeljyugk6lBS1+7HQhpbFDugFIb+L6xbVbbawF+f1+a6MIkLXsS
         84pFZhC4UPcaTIp6doLGyuYimP47RqKVzGJIQW59Vr+QLjD/bY207iRUuY3ylL2YJ0iP
         dbyYVv8a3add7whBrQqNJogzhW6MQ09svGtid0p9W/aWE0P53u5iYTc1tCn0QCG/cC+3
         O1SJ2qhCAXvqpUGc7F3gylCqTyKBdxqfJQSXT2D+e1qRtNFLQcRWw9EUZk3K4z6I6Oq3
         IMj/H7NX6e+I2dmd6PM94ckwGIUkk/gG5flXEMVHk9nbN0AmcNCZRjcVQ5/CtHOXEGjL
         dr5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=UTu95mgXyBOzHQDfcZ9IjObcSg1VEhTA1pfQxGvc6Lo=;
        b=fIAXBv+IlLiqyaRr0lbXit6cuZMQXljkyuxWvOhnGXPz4+/3q/k0z1MNt/37iqKXM3
         otLAkij729MEyFpt4J4aMLb8ycZ+CYCSKnuRsDokZ1qCXSkudZoStXsbbl/nc2haokyc
         edIH8J3Maqg8a6kbKzsELGaW/503UuTkVI8zddKv4Qu6lUlro2x2MkkGFqoGAW/t2ics
         2OZ15+qUFrEFKaOe9Zfud1VsCNzrlopTFYnhNvjMUQY5DCMju4f9n6usYCbr7rhVsPQC
         S5Xe8BcfQjZI2iwB4/vWPmx8+zIn/N6tQzw5TXvbFRQIKVW1/WFwe4gNeJ3L9vVZJYDY
         KVKw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UTu95mgXyBOzHQDfcZ9IjObcSg1VEhTA1pfQxGvc6Lo=;
        b=QGykjvNjN0VMGtxf0W40Od1T2wGL+MbNBzaGaoMo0sKPprvJFyLGZulQgWL/Q2wKmf
         mR2qPgCjsouuPB8/vI3RtGP1B55HJaCMZDuXLTErIhm+bpLZ9AErLzV5lgmE6HhkF7go
         YRHMcWuPbzEawq5gNUvFoBzNBK7x5ZQp2L8C5MVmF5ssWMieQI3EJlFu3Ac1AOeFBcky
         mQgVjuEPyVNZqMYYggMX0oJeFmfE9TIzrA2zpAw1WQqPEvh19GeWQluu+1MPhyROpa1J
         ALtPm1VpwzkTHZUEWbHNzLhOw+0J2FvFVq4qeJuff/+QiiRXhHM35V0Bt3DHA9aaH7o6
         BFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UTu95mgXyBOzHQDfcZ9IjObcSg1VEhTA1pfQxGvc6Lo=;
        b=L6rp0q5kM6fy4h//pzSHYsdkhs0CExbx/FxQlvxAvovKpkewEMRp8QaDjb21Y9vUnC
         rsKsbQTYsO+t+jf3VKrVNmGvTNV4B+CcYCQ8W73mT129Sk/mfkJipxx0Xr43GIy57B9v
         LDpMbWMbbGcph8zCheNLrE8a+KtP/9GEYUDEYYDsA3a8KCVXAThuwuQA/+4oH/JDEuy8
         3N/SHy/a36vHHFzvxFYPtfAtjKi/4DlEHgRTtVDK+mBEgtI9ZlHUvqchylQGTv6vTrVk
         QOjpmfnk0cKjU06dW04hrjxpJL8H6qD4cZn5CahGSsFy8cSQqeZuW0+bWLwnjkcZfKGE
         c7Jg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVXzXcvLSyU7MGPleU7HiIyFsIwAygTJtjbLsXGWAgPgz42yeVu
	Y0rXvFJ4UfbBtiq/VdJyqQw=
X-Google-Smtp-Source: APXvYqxBdJWa5MZ6HI78EWWpDZ2066qgCh8uVNAFGNzDVPyOAWuaQbVPfPo7kZPR7NUNZ8Ktc6tW7g==
X-Received: by 2002:a7b:c74c:: with SMTP id w12mr27478922wmk.1.1579012589445;
        Tue, 14 Jan 2020 06:36:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6303:: with SMTP id i3ls5687119wru.13.gmail; Tue, 14 Jan
 2020 06:36:28 -0800 (PST)
X-Received: by 2002:a5d:5267:: with SMTP id l7mr26835494wrc.84.1579012588535;
        Tue, 14 Jan 2020 06:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579012588; cv=none;
        d=google.com; s=arc-20160816;
        b=xhhrLcrPqI7lWPOQfksYXxAjgpxhf1A+oWXk2JdJTCqsrOMVtzMjcs0PlfdLYJZyth
         1xIU8r/0/vseZfkLAjaOYoLK8Qnj43mPy7i+GjEd0F9mas4QSjdNy6QnZko8GkJWgCQD
         NGvrmDjh/weYkMySkBePUD0faEpxNhYnAENHlmSdVKT3Ye4y5hmQCXRym3czu/Xxx0Ps
         TBnOsqyEV02jA9M14uSngCuuw4HzDI9vM3x7x8SbLK9ab0WTgCEOZIG+bBwxYNiK/hAW
         HQgCNoHmmXafjBw2LCNBz9K835qOgIV6rTs/B9AfVkEF9dqI9U/b+2QBYyuyq7pECAQE
         6Hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qAjXrmuMqckH8IKz7GU1KeQ0HIFg21XdsxYakrMf7ow=;
        b=iUXw6yYXByV4l+/zi3QmNmGOdLQkOxcAC60+xKmjr+5YWigbkgrLdAopSt/zSN4o9X
         f4oQC+ySRx8shvE9zW9nhxm52HmpikQlJ0apI79YytkMRxbZKf6bCHKROv6iGYHrKbnt
         dsOkA6ShMQ7lClWOu8/JNVxJ1zxODHdWdZ3Srqw219GinAFWI2hbRkCpI+D9j3LnMMiF
         +aT/ZjSTvQrA4UCqlwFVzTLSL84tbVzC07Mw5f2DoFsbPgALW2O00PLs3g+NDQt0/a0c
         kzREX5EuwxYXl9TXdJmso59RZICdLUKokotvc0jeIJizL67WZzNNWYz2BUz03hNrAPB2
         akyQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s82si685226wme.0.2020.01.14.06.36.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00EEaREM016619
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2020 15:36:28 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00EEaRlM017666;
	Tue, 14 Jan 2020 15:36:27 +0100
Subject: Re: [PATCH 24/38] configs: Move ivshmem memory regions at array start
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <c7c9cc901548895d2ecb25387a4e3ebb764160af.1578313099.git.jan.kiszka@siemens.com>
 <4cbf0eed-5e02-37ee-a8f9-073ec22d05e7@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c521ced7-48ce-4516-0bcd-50ed5b4ee031@siemens.com>
Date: Tue, 14 Jan 2020 15:36:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <4cbf0eed-5e02-37ee-a8f9-073ec22d05e7@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 14.01.20 15:27, Ralf Ramsauer wrote:
> 
> 
> On 1/6/20 1:18 PM, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Simplifies index calculation and reduces risk of errors. The only
>> downside is that regions are no longer ordered according to their
>> physical addresses.
> 
> We have 64 bit for flags. Instead of moving those memory regions to the
> top, we could also use .flags as unique tags. We wouldn't have to care
> any longer about there exact place inside the config.
> 
> I think of something like
> 
> /* IVSHMEM shared memory region */
> JAILHOUSE_SHMEM_NET_REGIONS(0xc0fe, 0x7bf00000, 0),
> 
> [...]
> 
> .shmem_tag = 0xc0fe,
> 
> [...]
> 
> What do you think?

Would imply searching for the regions in the hypervisor - doable but 
IMHO not worth the benefit. I would eventuelly rather like to see some 
offline tool generating all that magic.

Keep in mind that we use index-based addressing for PCI caps as well.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c521ced7-48ce-4516-0bcd-50ed5b4ee031%40siemens.com.
