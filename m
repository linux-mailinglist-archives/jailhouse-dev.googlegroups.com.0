Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSUDUPZQKGQEYD4AHCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 81100181613
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 11:47:39 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id s15sf295262ljp.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 03:47:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583923659; cv=pass;
        d=google.com; s=arc-20160816;
        b=UdroBJkorU2SgOLRXEWQaiem7ocwPagVQpHTdaqo6v69sqeL3p9MB+iTib293eaqx7
         Wp/VWGiAeNXfbKenTuixl3INSepBZUEBpn8XluvNOscub41loAzsal27J2OwoSySAvvR
         WbA5KWhd4A4S+dqIGkF9wz6PIU0aOHxOJjAohMfwB0lPFEmgOXzkw9wdWSlFAmKYvJPf
         DloLoMaQYMZZrvl99uPLhfehZbkG6PMz7AxhKyr8vcyALH7zDcmYa59zjD0TyyHasuUB
         qU3y0WsMo8a7AeL6lZbv0kdsVeOllDfh74QB4jf/ZcfOATFI1FtvBYaCucqmawyccSeH
         Wzbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=HMpx6aHsFhsOygI4sr6Fek/si7HWJIHKXtOSMPewcHg=;
        b=PLchJ702qbJG00hLJAwPLR8n9iNaLtN341rVAhzqm5hcGXMqw9IY1z+M3vsf/SalCg
         3e4x2G3/PWU2OzPcj2zHhz2oBnjLacsNxZlZkuuOcATQzSiCFrpFb8La/NsY/3mSPIGi
         viyzUzCMEZrzL4ONJhIouBAO/Y1NnWc/xcdkv+WzZqVzVhD7Sgv8lOXFRf0dnhWIVA/Z
         R3GtoOM+Svp4dHqTbnwOBkPq0HjcSTDDqK1JrKg5SocADGRgZFb7Opvri6f1es27lBX6
         800n9NX5C7FuIYEGey00O4TJ73k0ImTVrmTriZT/1sTupk8C0qJfTWEsmKc02bLD14rQ
         iKYw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HMpx6aHsFhsOygI4sr6Fek/si7HWJIHKXtOSMPewcHg=;
        b=DZtFOa87C+m6vsLKu4teUjLRRMwe53Ntbuod3TMQMR6jtoePDuFLxVBU/Thl2Mxw/a
         V/YvttGWcPBlxp9l1e/eZV1qnj2yvE6qLxz0TtxbT6X2Mvsz+XgQDxoaLah7/bYrkkwL
         XTdgtNw1LoxcMcIDY5cV27likwwKGe/Y1vyaFWg6KnQ6mVdELP58xcjYpUmFwz5/X2ir
         8H7MsuAOHxt4NtpUAUbeCaFIo3p4We3nKfp9x09RzU1B/YQJZDXmxZc0DDor814pHSyf
         xcJNrkRLGJz4FDKbJiRCCyltcRJqVFSoPI41W3qWzqbyzSe2ELr8ieM2rXOGcuAD0+y/
         kzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HMpx6aHsFhsOygI4sr6Fek/si7HWJIHKXtOSMPewcHg=;
        b=eKqnhbbewXQ9jO2rTZZUMfKQH48BDSVOfbFKLfqu+i2vW7Sn2K0AdmVzBjlLylA3Lk
         VgnlQ0OyYdYXq5ZkC+f8PLWpzjLOQ/Rn7G8oDpwr3t1FCW1BR3mNHtVsM2FDWZ8JXWLI
         EfLCvBoshiTRyNM0GuzWnCxTw2+HVymfkqz8j3JMxrorUOCZZcmwOc0HmZjOHxr61pMi
         1B73HD3TavJWydT8ngBoqM4atjQJ8N7tOLTSAf+xYurZWUyVFo/U40bYV62CA6d3p5pO
         HV4eEKfqjn5BCFDC46MADbnx6g6NBXTrixSGFFQv7Z/XKMozPUVuk/EUv0ys5OblPwk3
         a2aQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0pOPjuBA/DTLaH7ZcSZZX1faflpRiNykmAL4CFlON7RlMGcYOu
	RPDpFVCzheDvEPpBWaW37PQ=
X-Google-Smtp-Source: ADFU+vte3M0yTBfYFJMpaDKnZHT/ymP+un9AUclRltIeSkHvOOjoty3yR2RTcUWGvnyuLObBn+uVSQ==
X-Received: by 2002:a19:c70d:: with SMTP id x13mr1795790lff.204.1583923658984;
        Wed, 11 Mar 2020 03:47:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ae10:: with SMTP id f16ls242892lfc.10.gmail; Wed, 11 Mar
 2020 03:47:38 -0700 (PDT)
X-Received: by 2002:ac2:5de7:: with SMTP id z7mr1741669lfq.107.1583923658099;
        Wed, 11 Mar 2020 03:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583923658; cv=none;
        d=google.com; s=arc-20160816;
        b=jYu9mw9kVW/0LeME9wvDyK+T7T45VY3FXpR9HlrSoMiVcDj2+SMZFjukVwfVdPMcJh
         jPxPvK5lEJZmxrh/YxbpT3LUTPHam+OUw9Xmw3Lvypob5wIwDnpOgQOD+WeD9QnEC2Lp
         u1Tnkarmu824AoNlIBQ3EilEod5vHcDeywLbRWysek73cBUcOhZHSjsphPvuoUPQJL1f
         V14OatMIYAPBWL+ZCM2WMthp1LLx4u1xeOGLpJy+YPQw3Vohme2gAdQkV7MJhyQfAacg
         LTtcZOXaKBZ/anNf4aw13NgZ1hYOA9p8DpslnuaBfuU/4WD1W4loJjMJwBrIymATZWhi
         WPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=QpBXcNNIOvocEd568gjqTc5rikjIPX6viXeQEMjQEeQ=;
        b=jY7bhZF5ElIq2YRknDvtBOdjxU4fcXz7PmsZGmBu+wblCOp9i5tdgzSJzFd7os+hle
         Y8NNW5aBn8gHZOc77gVU+Uf4Kxy6ovSqcBP3wkxrMwFjt/0LJxfLttYWFcLZVlJEu/cE
         f16ugjuBnfe9L+SwN8YK1yiyDX0f5rUGAPXBFrO+aOG5Sy+mP+RByI4elfoRbqqCT4FS
         CUR8F8NTsS0l6c6GetKKugA8d5AxUxNLlBybne7mfMNrNdgnwIyQ1JgQyAbjMX6RC1rn
         B8ovZUztpyPA0HcIv2A5s889fvitvMuHfxfUVZ+3fdAdn5ojQNKv2SDRXxn500kef/bV
         X9dA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o24si96673lji.4.2020.03.11.03.47.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 03:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02BAlbIZ016526
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2020 11:47:37 +0100
Received: from [167.87.85.172] ([167.87.85.172])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 02BAlaiw009004;
	Wed, 11 Mar 2020 11:47:36 +0100
Subject: Re: Jailhouse TX2 and GPU?
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Patrick Uven <patrick.uven@offis.de>, jailhouse-dev@googlegroups.com
References: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
 <6a16a1eb-a0d7-da01-848c-107b56c6f114@siemens.com>
 <96ecb1bd-8761-dce4-e20a-d008e4b9dab0@offis.de>
 <9477704c-3573-bdfd-5421-3fa11028f460@siemens.com>
Message-ID: <84b7007d-0071-4877-cf94-b084e13288f8@siemens.com>
Date: Wed, 11 Mar 2020 11:47:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9477704c-3573-bdfd-5421-3fa11028f460@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 10.03.20 15:57, Jan Kiszka wrote:
> On 10.03.20 14:11, Patrick Uven wrote:
>> Hi,
>>
>> I would like to continue this conversation, as Alvaro is most likely
>> working for the same project I am.
>>
>> On 2020-02-28 19:58, Jan Kiszka wrote:
>>> On 28.02.20 15:43, Alvaro Jover Alvarez wrote:
>>>> I found very interesting your work in the jailhouse software. I'm
>>>> =C2=A0=C2=A0=C2=A0replicating every single step for its integration on=
 the Tegra TX2
>>>> and so far I got jailhouse running bare metal.
>>>>
>>>> Now, I was wondering - what is the status of the project?. Did you
>>>> ever manage to run anything inside jailhouse inmate using the GPU?
>>>
>>> If you completely assign the resources of the GPU to a cell, this shoul=
d
>>> work. But I don't have a TX2 to try that out. Adding some folks who hav=
e
>>> some in their labs and maybe tried that already.
>>
>> I was able to create a few scenarios which all did not work out as hoped=
:
>>
>> 0) Using the evidence port[0] of Jailhouse 0.9 for an old version of
>> L4T. While this works, it is obviously a quite old version of Jailhouse
>> as well as Linux (4.4). Is this the version you were using Alvaro?
>>
>> 1) Using the newest version of L4T and the provided kernel I was unable
>> to build the newest version of Jailhouse. As you already mentioned in
>> another message regarding this topic, Jailhouse tries to restrict
>> support to mainline kernel wherever possible, so I tried that next.
>>
>> 2) At last I was using different mainline kernels on the TX2 without
>> much success. Trying versions 4.14, 5.4 and 5.6-rc5 I wasn't able to get
>> much more than a booting Linux which a console via UART. No HDMI, no
>> network (not expecting an answer here for those problems, just
>> interested if this should even work). Using the LTS kernels Jailhouse
>> would fail to initialize (when using jailhouse enable some CPUs fail),
>> using the latest RC I was able to enable jailhouse, but ran into memory
>> errors when creating an inmate.
>=20
> You may see different resource layouts with mainline due to different=20
> device trees etc. So, it's essential to keep an eye on /proc/iomem and=20
> make sure the config is in sync when it changes.
>=20
> Furthermore, when you can errors, please use CONFIG_TRACE_ERROR and=20
> report the boot logs of Jailhouse.

Regarding the CPU failures during boot-up: I'm just editing the configs=20
(because of a new format), and I noticed that the TX2 only supports the=20
A57 cores under Jailhouse. I don't recall what the reason for excluding=20
the two Denver corers was, but I suspect you ran into that. Try=20
offlining core 0 and 1 prior to starting Jailhouse.

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
jailhouse-dev/84b7007d-0071-4877-cf94-b084e13288f8%40siemens.com.
