Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM7OYLVQKGQEAK7SAXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3FA9B98
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Sep 2019 09:20:19 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id n2sf577560wru.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Sep 2019 00:20:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567668019; cv=pass;
        d=google.com; s=arc-20160816;
        b=U1o+cOoXZ9szmgu0hhIyCX7y/2fpMJGlsKYnX85kUKusdlpmMINl4nb7VsmomWMVy9
         O9eJeW+jtLrKRQUEZLD1e09iejcYMz8Yz5iKhgCfw22sf7IGqYrabBX360G5f460GyBB
         792F6ONc+s0LxdatN3Ge+8QtIThDyzXEB3rIleVUlCqwYePYYrmVHG61125lUTvBjJiW
         mVJl49VI1d6za8x98u48fo1j10FQN1f/p7XjKKjlwmy43MNJQuuONSKsIXNokEDId8Fj
         eD6+ffdsCnJvkCDOJH42TqDRhxSt+ik2xsIHDRAj3AyN5dh3T5urP47P8B/W+J2L40oH
         qf3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=HPt24VifCcA0jwU/0wU+Qs/O1QQLyjDu8Md3iI35lrU=;
        b=KM5V856a00ZTJBBSCgjU4O3dAdz0shKxaUXj9u3r4HcUNQnywL88vFgXmrTe2Go2xm
         LhZNuf2b6jWEM/+wNTpU3GGOrgi3n24IGARn+XggSINy6nXUgqGfbgwkRvmt3nO9TCv6
         FvmMc6+dE0Lp01ngNnM2SVTpzk2aDEvR+Cm++WwB3AW6GOjiyhhKBnR9SXG9YLbtXlaH
         vcMLaUb23ASEJzfYC8pRZwwuoYN+t7d4+PR0uwVQOT1JCfG3V66p1fVD8ebpiKd/4MN7
         GUUUzAET9Px7CQUa/dlVxdRPLw62CUngO9O3gVJxiSfL9oqO2t9K+ZsbEiaApApRhNXS
         gz0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HPt24VifCcA0jwU/0wU+Qs/O1QQLyjDu8Md3iI35lrU=;
        b=ndvZy8pkqlUVcHazc5asYbMkhl0/woXxACBr/Bv7sgXraxt2Gp/V8hczMg/WqV8XZ+
         6S3P4v12h6TQL0D7Vgt+cQzJm5wxaiIjf+weUc/lPKrdxyAIQ+O2yGrt4d50+Q0Iy8Oa
         x3EYS9P/Ayz0u1kGpqwnf+Fyg0cDFRzZ9ihv5rwAWv9Po+zjLGZ8iEyp6EzAcqgdwT/r
         doEudHwxuUkhRwgZ8/71HD8/QZkdxx/35puFLjRo8fwKShptl/G/y8wtNGEMqsd9ESFM
         O8cI0PwCLLFzdbpnbPN5iusK3dMPNok1stsP/es2cPKa2TgNkteKB2Q7ScLte+U7lrIa
         JG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HPt24VifCcA0jwU/0wU+Qs/O1QQLyjDu8Md3iI35lrU=;
        b=tSqIvmg5jlIpunvZnCGMYc5c9FRFjXKvr64OORK1vwxfAHFqWbiE0PFI4kpOZLCGzH
         hukm+HzNjrxpWzeqjEgJMCgx1jVQ9F0mrXeK4f0TSWiw6C4y6kght8Wh5fEkmflMxl5D
         3bc2qxRsuuM/+UXfqF+zWQvLMpTEnvuGBOD8XL4RnTBNxrrIm2BdPqmsjVnmi/cIclaw
         lFJKStHEBi5uz6ebm8Y1l9vYZd3UsHnZjPklxuZhQACGLp0Rq9VZUtYYVYU4SoUgAn6P
         iZPBmbPglPGDY5oakMnQSvuMAh/xW1xGWbprSMmwPqOhFYS6iAr5K05QMnDMS1Mm2p+Q
         8NgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfaKNp897hcFyNLXiBJBZEsmHL0CM4Jbil5zDte11fZYyiZBl6
	2raWelhjjahcWAezOODxbGY=
X-Google-Smtp-Source: APXvYqyEos49iuVVesTPZVlJ+QnOW73PTR10uWKDsvPWh5TSoUh3C3kCTDYSyARnRueZ1KQPw041AQ==
X-Received: by 2002:a05:6000:128e:: with SMTP id f14mr783175wrx.28.1567668019465;
        Thu, 05 Sep 2019 00:20:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls411994wme.1.gmail; Thu, 05 Sep
 2019 00:20:18 -0700 (PDT)
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr1647771wmd.102.1567668018455;
        Thu, 05 Sep 2019 00:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567668018; cv=none;
        d=google.com; s=arc-20160816;
        b=n+VXcA5Zp+XMCPIub0OeacmE4SgYYzmQ53D38zwqEGJItFk+RBYdrOoxE1R56gdy2F
         6xJwnMZzjjMAkO6/IvGjmZGfbhDVdYeLu5a6yOiFbkCR8AL8nHGjDuewt2ad8AwpRJG4
         hgg7IjJAbYSGz3yOEx5TgAUMZaHO3JzU8Q9kDczKVZCwraRRnHXc07b3pU0bkcTho/4E
         7GEPAE037VHKD5LRnjKNw2yKEkkZKQJ+TsQryHF5t1HR0F9Suagvcr5NVY2mQFBVRuLJ
         OmEFpWogCZ1PJJevJ8YfQpAjWuAO4/9pJduM+TKHNcOtEJlJAwztehcZYEljE5MSGvFV
         U8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=cNCOXHFCoDN38S4Ey/WndYRBuWtr/C1u5BVTtWfpGaE=;
        b=irB6srLaZg+98Rqj1FUavyTomoufzRyyf2M+0D6ve25O0F5Hi0sj7hdsquIn8Pw3n9
         kNbtoc6BAANRCFpUYKnLNOTOfqCJ3MAGsSfbZbw8+iiCP03bJ+egloHxqnwkIa/dCpQ1
         LQGC009FYxUNyP+VC66HIi5va5bHj6M4UsIKQdVtpJcSYCPn0f3t5YVLyxMbTx1aYs0P
         qzXX0bEPwuhVL56id9qqns3+3PJGx+h8UzxvQIoUYHNWgnLaF/4J4zmxd0lnNo/4g7n8
         OWP69ogxlRA0b61+9058z+ayd23wJlgvJ5E48BEHYRDM/Tn6He4ZVONXxaDVA213SuSD
         CqMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j4si41751wro.5.2019.09.05.00.20.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 00:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x857KH6R002572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Sep 2019 09:20:17 +0200
Received: from [167.87.8.163] ([167.87.8.163])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x857KGf5015751;
	Thu, 5 Sep 2019 09:20:17 +0200
Subject: Re: Unable to find IVSHMEM pci-device on root cell (ARM64)
To: Jan Lipponen <jan.lipponen@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <500f983d-7afc-43b1-bc9a-13768226ad64@googlegroups.com>
 <0defc7ed-1e7a-5781-bcc6-9a0a5c45b4d4@siemens.com>
 <6b4bb950-5b1e-42e2-8d54-52beb009b025@googlegroups.com>
 <1dc9ffa7-64a6-6578-cb29-2573f680b6b3@siemens.com>
 <fd8da5de-70ad-4bf9-b892-3a21d7718ca1@googlegroups.com>
 <8e2da73f-ce4f-4999-a7bd-ce4116be8503@googlegroups.com>
 <2904512d-e876-4453-88a1-de08439dec14@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <155804c5-9cf8-d3f1-dd59-8a410fb21b85@siemens.com>
Date: Thu, 5 Sep 2019 09:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2904512d-e876-4453-88a1-de08439dec14@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 04.09.19 13:55, Jan Lipponen wrote:
> Hi,
>=20
> I'm using the *uio_ivshmem* driver from=20
> /https://github.com/henning-schild-work/ivshmem-guest-code/tree/jailhouse=
/=C2=A0and=20
> currently not in the need for virtualized networking capability. But who =
knows=20
> what comes next so thanks for the contribution :)
>=20
> I managed to get the ARM-ported version of the /ivshmem-demo/=C2=A0workin=
g (from=20
> https://github.com/evidence/linux-jailhouse-jetson/blob/master/inmates/de=
mos/arm/ivshmem-demo.c)=C2=A0with=20
> the help of a patch posted by=C2=A0Giovani Gracioli=20
> (/https://groups.google.com/d/msg/jailhouse-dev/L2sjyl1xFDg/w2DC3CV5CQAJ)=
. /The=20
> patch needed a couple small additions to get it working with my v0.11=20
> Jailhouse.=C2=A0I'm now able to send an interrupt from /ivshmem-demo/ to =
root cell=20
> and access the shared memory region from the /uio_ivshme/m interrupt hand=
ler.
>=20
> I'll attach the working configurations for ZCU104 board in case some is t=
rying=20
> to achieve the same. Not really sure they are 100% correct, but working a=
t=20
> least. I'll also add the updated patch.
>=20
> I noticed that there used to be a /wip/arm-ivshmem/ branch in the Jailhou=
se=20
> repository. Any idea when an ARM version of /ivshmem/ /demo /will be offi=
cially=20
> supported by Jailhouse?

Will be part of ivshmem2 rework=20
(https://groups.google.com/d/msgid/jailhouse-dev/8d0a6e80-d926-8783-949d-8f=
d036611492%40siemens.com).=20
That effort currently lacks an update to the ivshmem-demo inmate, but that =
one=20
will target all supported archs then.

Timeline depends a bit on the ivshmem community feedback (primarily found i=
n=20
QEMU context) about the rework in order to decide if we can merge the propo=
se=20
and fine-tune it in-tree or need another round first. I'd like to avoid bre=
aking=20
this interface more than once in a significant way. I hope we can clarify t=
his=20
next step in the upcoming weeks, but I still need to roll out the proposal =
first.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/155804c5-9cf8-d3f1-dd59-8a410fb21b85%40siemens.com.
