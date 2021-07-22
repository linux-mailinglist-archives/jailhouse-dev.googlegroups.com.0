Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ634SDQMGQEZIXXSUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1DC3D1FE5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 10:35:51 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id u12-20020a17090617ccb029051ab3a0d553sf1575752eje.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 01:35:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626942951; cv=pass;
        d=google.com; s=arc-20160816;
        b=jA/Vfcs+uQamBVaTCL9LuYxHCCBhuCeuBnyHfwEq7RNr8eG6iatJXCtM+gq2l2gSEY
         LCSfjUU2t0OG5NuHtU5mr2WyABy7ClLF/f6XkadtMaMh6koF5KXpVxHNiYWWXv9diHQa
         9j/RKTSOGvmZpWzrSstyfibXyG2PbOMfIX6rbvPNoWbARNMYxpbiwJoZBjcaUN1EbjYj
         fWcdoCYE6ssQ3bhzI9giSOyWo4zQ/oWWKVZhUO//aNjDwWxOp3kzTkF/QLgklhMJU7Ov
         DquYsunNTKFSu5QCdbSQvUPWnaHGRyToPTsGX7NxUvHo/KsPundS/q71fG1GY8ybQeKa
         J4Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ug8feyhscRuohcPIm7zQQZOwG/tOq1n4RkfdWGEN0oo=;
        b=KHmnCHeSauRyOgr27RC5EAnR6aWykqiYqrr+DW1de4NvvNvOoA6C8xvMIN2T7CuUG5
         2GSMm74IHSNPRzvnPA+6E2rA0wUNMa4ig8g8TwhWqO/lBPIAltF6EUd3+ra5dqsRtP8t
         uqcdV+HMfbjZalSWx1xxLzeHdmVxcxBB+s6JLrYO0SnVPSR9oGhbRkD1KxAj15jKNDnK
         q/OoEufoS0+VmIEG8cTmbCGgnZCF4a11AlcDJfcy5xHvRt+oS0JDalguSPCYjk2tFbIh
         uqwxkDAIEeeR3/NLf+Srz1JPT++ZUcu+6kB5p0fpU6o2xrE+e/E4GSrymggHGl4sSuBd
         zIuQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ug8feyhscRuohcPIm7zQQZOwG/tOq1n4RkfdWGEN0oo=;
        b=YVlvJaErjboHAGcyBvZCGEjvcOJuBDsYmmmsk9XEn380dSZ10Ox1TUo+1poBLweFv/
         f9bTxiRMpbckopqvArMFF04tjXSEcPTBnmXLbI+Ff+7IBbE1t/rYg80A2JIEVqoSEYdH
         uKH9u+pKPfuGF4TAVcwyDvkyo3mJuq8Ln0Y2LxZXagKX4Rd51BSyEGsif+Nm0bELbp0B
         xsPubOxup1G8NZ+PjZbCV4UtgqXfIMd/ZCVgxlsBTN1ko2ecNCii9SdTJx0dGA9i99Kb
         hvHIsY1COQwekPYRmCyUpxePnPOd9BldxxG1ssEZ5Uc6MgP2Zzj0k5K/i5NPXhQ7BHHy
         KVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ug8feyhscRuohcPIm7zQQZOwG/tOq1n4RkfdWGEN0oo=;
        b=SznLMlCOCev+vHFIVjlx7fHPosmwR2zJQW+36Hlk1i3VOLVamn+ZJFtPiEcd6iOU8X
         gDhOHyDqELMzag2uHIUAOzInA6EwjCKhLW8yAKQNay+WvEnJhmPysrySXb0W2TK8Cq+o
         Ewc2DT1RMRn5yMg8bzrxPSliHATa1WgoiSB1WjWCA/pS1AGN+je9nwlf0kplK3vGdF3O
         jDoa+dd1I0+yDfGKc4fGbGqhPqYUqZquaPx+0+212KNGLq4tpw05UaDRWij+ZZgf9cU6
         GCkp7OHnmpvftqDdCCahxQwB1mkdkzD4YGBzzhLBCTEiUwWILeo9+jljHTyBAu57XKm7
         LmHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321ZEW88kIgZfvYO/LES00rkSgdnjyR25WNaE80JF4TMAh8tF02
	/8tYeOV2q5vkjSf0p7pR7eg=
X-Google-Smtp-Source: ABdhPJwJ4wOU86LfzkUnI5J9Pq0k3zXWStPhHj30iDQqo7WD5r3neKAVHI40DwGZN5TERTfNXev2nw==
X-Received: by 2002:a17:906:4098:: with SMTP id u24mr42204508ejj.462.1626942951385;
        Thu, 22 Jul 2021 01:35:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d48d:: with SMTP id b13ls2405886edr.0.gmail; Thu, 22 Jul
 2021 01:35:50 -0700 (PDT)
X-Received: by 2002:a05:6402:3489:: with SMTP id v9mr38494601edc.124.1626942950420;
        Thu, 22 Jul 2021 01:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626942950; cv=none;
        d=google.com; s=arc-20160816;
        b=ACfkSNHUdwshui6HyevhtGkkr44nALWFviRtnAX5ECF4hL9GG7U4HBMRN++8vbssCl
         GFXyODu+bTWD22aLP/QbBcYKEy03XcituoRXZKbPaU0V+YYl6ug0QZi2CMngyB83FAWY
         fE7ynfC8LsmgiEwGk5GZYWbL+6whyIQryXRs3Co2z46XJOMiz9k4Ia7P363gCniVckVX
         k5rj+YwhFf+Zhq+dBo9kqMT83dDIm55OWzyjdhFAiMsHbky2FAK6rqpzKz+0xUWEaVNj
         MMwry3FvdqNofJAyGZeOv4MNwDWl+PR6Nat5C7NQSpBt0IPPkpSKd5RWf+KvM40Y0iHh
         7s+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=l8zDT3PEnWqvGCJulhRUr4aqPZFP/H5zEo6xumRvsB8=;
        b=CeFOrtkQY06gdO373gzF3m/bjjdFgz+9kjs2sGmqZmBX26y+UCKA2WbqvGhRMGP199
         gkbM7o5zvjOXv465j15fuxBWIX7J9BYuiiQ8ijcegUNpk6insM1BQ5B6rtSDsnVHQCGl
         DR5Q5wHdawEuMNRJazgmWeHnC+FTOBMZVK66srQVDWokMePgfHipkOdV8sukxiYuf7ii
         8M++0Kh2kBpF2VAeQCYBm9vPdqc2+U6BEwzSnbdFKQt7xnfZ08xqurslcyWXfo080hBe
         P6dyTzFZZsMHkk7ynro+f/GBArgizbI1bpWkbwbiBFpmlxtqDl8Gd5KSi67mzA2I7X3G
         7Avg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 24si1553476edv.0.2021.07.22.01.35.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jul 2021 01:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 16M8Zn1i031790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jul 2021 10:35:50 +0200
Received: from [167.87.241.235] ([167.87.241.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16M8ZnN8005313;
	Thu, 22 Jul 2021 10:35:49 +0200
Subject: Re: Any plan for a new release?
To: Peng Fan <peng.fan@nxp.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB276049CD76F399B5733B883D88E49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0b9018eb-118e-96e2-45e7-b39ad653f8e3@siemens.com>
Date: Thu, 22 Jul 2021 10:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB276049CD76F399B5733B883D88E49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 22.07.21 10:17, Peng Fan wrote:
> Hi Jan,
> 
> Any plan for a new release? 0.12 is released last year.
> Any plan regarding virtio ivshmem? I saw you hold for a while.

I had to suspend work in Jailhouse for a couple of weeks completely,
just trying to catch up again. Once I sorted local things, I will need
to rethink my former goals for a new release. It's definitely overdue.
Expect an update on that within the next week.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0b9018eb-118e-96e2-45e7-b39ad653f8e3%40siemens.com.
