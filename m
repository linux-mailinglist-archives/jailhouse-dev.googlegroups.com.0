Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2M33X5AKGQEBA5RKHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C1260E9B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 11:24:58 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id s24sf3271359wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 02:24:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599557098; cv=pass;
        d=google.com; s=arc-20160816;
        b=jf1hlNyRclwvC6cDYkCyPH9Tfxj5As1RdkZhkHmzcAnmFJclSvJd8IjTNbCuZQTdBZ
         JdQPAoIaK75PvwOL8N0mH7mH9Mh+zyn0EPOOvxHjzZSQb6eyBXc884eB7QxxFycCFwDh
         hntdWQt1xz9W52or28Imr34Yk0o5XNaAKMmsGtAkwZrU7P/YFGQ/JiAbFuOG4HPW0aqr
         jW5wBpEuKGH5QQPsTuiKsvgqp/sXbR95owZJ87pDQzYzg6ReZ4jdP08CHumF3t5zUS5f
         Ogca/xmZ9N4eXNMq08tWZMJtb8lPjbdlvlJztMv8vEnEDZf7aDLWdEfjxdqUryKgH1Jm
         0Maw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=fNJeRO3qlGK6k5HqJ3zvTyj1hHjNwgVnu8wMsY7Ohl0=;
        b=XpLNMue5Oz6DXDRxt70m1iAoxhb6+cimocZ1TGTIy1RvJoJb2hfWLMY0GkKa1mi+5q
         +8iSkxDpjkJrZtcHiiv724UDOQbVjkD0ru39y72N1+0lDsx+jknTIQZvpx55Ujv9l12v
         AhsAreJp+Qr9fIPAfCE6T92jgmk0+xtjN+n2JipL48GAf5LmSrLSEHxc8zMFnk1bV3EK
         TWTz7nnEbNCs+rF8DWLdq3kn2AYr9ZV4V3AVY4Gaf3kJpk+09KzSdLqiP8h+YUSaePcC
         YvPoBNSfewlp62ZZ/XjO/KyOg2vH1wRUHRKEEfoCq8lhILB4Xq2fbSm62+0T0i3f787o
         qrVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fNJeRO3qlGK6k5HqJ3zvTyj1hHjNwgVnu8wMsY7Ohl0=;
        b=c5l8RIBvYJ8F5mV6Nt2HKxESV9V7at5O14mNGDiseDe4xFfQQI4y6dw4fuKQt9d4du
         A0vwzcgb3sdi6T11Ax1xCkMrRyAjVBLFKKZbSMt4QL74DAiMbAh1s6xtVxRtkPXOOW+d
         Hf0fLD8ESFXeHZRLYIvcTsZlHm+LQs4KfPKU88FkK5X5vaXOYcePmmq9EZGxNeymPMZ3
         AvlkfiYhaLBSQ8ePVXPYU9wPLHk8hDtm2TPWlL3MFB1N1Q+AdfY3cJBr7ut2VVugbzzF
         sI92rdq+sVmiaG1g0FYu35rMKAFagjv59jFFFKWDysCP3o+p9/HFmmijhPskky0lIjiU
         c67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fNJeRO3qlGK6k5HqJ3zvTyj1hHjNwgVnu8wMsY7Ohl0=;
        b=caAc7NMv+xVpnsIXv0+USJncQgo7BFfato+F5sFvaTLHIao/1HeA/7V8qssUzjgd6N
         Tg7a1HjuEwxMECDScKUvBzfdULpckYWPm13ke5D0a+REiETg4nPIUFTS1J/eYrVyUqRH
         UwpUbfLva0J8Kix+5I6uQKTTR5yOFo1GmLIJ1zoGTrfa8TQ6zevonLZiNot4W89DSiou
         MbrXr1oMQyF988RyNtGHPMIMLaYnvhhbEpSEJwXHJZTP1IXCc7QmN7jqeedZN0E2m23O
         isTG55PL18ZsbjqyTcSs1quOeCPsj2iZo172bUM778HEkiAr89WcN7e5P7YDy9m1iV4O
         k8dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nb2wyOLYksXIN0JKv4+4STt/pysiYYyoja/8iaTVWc/8Zar5r
	R+JxNqLCL1XXlGzhaLMV4DI=
X-Google-Smtp-Source: ABdhPJwBIxiJVpqtyFfEPmBTcwUp82ynH4+o5mP6wfwLLNP6C2oYYBKqa4Wuv0s/uoFTbAeyGvrHUg==
X-Received: by 2002:adf:f903:: with SMTP id b3mr26629576wrr.142.1599557097979;
        Tue, 08 Sep 2020 02:24:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8288:: with SMTP id 8ls12886865wrc.0.gmail; Tue, 08 Sep
 2020 02:24:57 -0700 (PDT)
X-Received: by 2002:a5d:5146:: with SMTP id u6mr27174581wrt.255.1599557097153;
        Tue, 08 Sep 2020 02:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599557097; cv=none;
        d=google.com; s=arc-20160816;
        b=BivHjupWuxAc3ZLjCVkQ0UZeGdQiJr7Ma7DiY6k23Pi8Ri7zRfMbjip9yKX9BHHPH3
         EcK4LSDULnjTUutodTsYvBdscq74aNfjJGrJQYRjglIrOdJIAO9uQPob5Fa9N3iTnpZ7
         WvAIlpKnRpxXIAaXVlsUsVsqmxtEjhUUYxv0V65rL28Xlg1c3JEPcLmlSofkN00zmBmD
         26pLwQvkS6QuoY96oOnWqpleYKqbu9Y9Px+vVJiLB5cBh+dgUUQ2ZNDatK9xWaOtpLvJ
         mUenHSaU+nF8nXkTnWIiu8ZZTy6WptheqbchVyRJ4rMrCDKAE7pGY9Bp37gZ0+rVrNO+
         VZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=EMNB3zEEbmjFRGLN5mLYbsYYxxqmGkeGeWrckSYsZLU=;
        b=BaK/tiRiXYcCe2Km3hAfllKZ9XuB0QqCL3hX9RXs+/FxTWLNQkrwPZDxFrLhYYz0sn
         xm1DyspGafxfUQAYHXJRrchOCe2ueq4XCJuTJSW1bx1thEMwc/xOvc4PNH0XqvxXzJKA
         5BRUzwGS/JL8gl5mCZMHmVUdYSEM82eNMeNfiVaXkDJfU91LxNL5d7HRvjBDB9tQKoqo
         UwyC3tq/PXa6zyNq4yVFfSa8SVRnEn4loRV/8i2X3lZDt4PO9eXqqqAe11mxQC81Z5SB
         3r0yU2x8L4IAToJzCZwXjlDzNFijicYnz3HmRNbxczFvbErilFf8Ds5Us64v3Wd4LuXg
         QAHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s69si376814wme.2.2020.09.08.02.24.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 02:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0889Ouq1024691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Sep 2020 11:24:56 +0200
Received: from [167.87.35.249] ([167.87.35.249])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0889Ot51011474;
	Tue, 8 Sep 2020 11:24:56 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
Date: Tue, 8 Sep 2020 11:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 08.09.20 11:11, Jan-Marc Stranz wrote:
> Thanks for the hint!
> How do you know if you aren't the inventor of the hypervisor?
> So it is extremely difficult to use jailhouse!

We are happy to take patches to improve the documentation, possibly also
the tool to report the correlation of this error with intel_iommu=off.

> 
> Just for clarification:
> Is the Linux kernel for the root cell always started with "intel_iommu =
> on" and the kernel for the guest cells always with "intel_iommu = off"?
> Or is the linux kernel always started for both the root and the guest
> cells with "intel_iommu = off" and only for the creation of the
> configuration of the root cell exceptionally with "intel_iommu = on"?

The root cell needs iommu off, the non-root will not even find an iommu,
thus it doesn't matter there.

The root cell needs this disabling because we do need support for
associated interrupt remapping, not for DMAR (DMA remapping) though. You
achieve that by that command line switch or by persistent kernel
configuration.

Unfortunately, DMAR memory region discovery needs that feature to be on
during config create. IIRC, there is no or at least no simple way to
discover the resource when running the kernel with intel_iommu=off.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/199d40f2-9ca3-d618-101d-d7c33d450af9%40siemens.com.
