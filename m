Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBGPU72QQMGQEZHK5OLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B46E76CB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Apr 2023 11:53:30 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 5b1f17b1804b1-3f1793d6363sf4602465e9.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Apr 2023 02:53:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1681898010; cv=pass;
        d=google.com; s=arc-20160816;
        b=sS86TCKhU6uBpxi9mYQvHkZy/Tj1jS1QQdUx6nhRmArRGLvV07sH/JKefVs53/CUQm
         p0FE/OrsMBI70yYL6vGCSHFG18u7j5G0pXt7yflTEoXHBPWQfhNCW92mfVMl/cDMVroB
         6gvTVcweBZR1xDmmFzBCHWIb+1/tQ61JaM3/yseopnpA96EtMELBpAi8dakZG/aucS7g
         caWumvZ3Z1RA1lCADa/5vkR3ORBV0dEA9Rwiw+mlun/wSUH8IoVNM6ZrUfaypUCLnlhU
         i5eJbUIBjstDhnw+etGxyu38/nrZCiGrEXgqSfaCoX2hplkn1O0aUheVTF0CF8r+n7GB
         70rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=SNwTlxPg8YuijIlNg2LYpXX30Q5oWJUjwoRtS3aY3t4=;
        b=l25yj1C/jo0jzZ/98Xavhp+eumiE7vbrv4gWCVLulGW1z6t4UBDI5/IbP1t26XqiU8
         bTTI5hxN7c1/xAq0EYgyoxOX1+jNKVwCIYHKWcxsh/gumnxHvvQ0MQ6fTF+JQnq9293z
         9BM8VQ0TisGIsutKznRRKiGB22s/Y/tRdyCnSBUWe1aJ1yaZdC0sciNFoXtacHCXehPh
         1e8FYxv9Lx4S2Gu64JZWIKXDvF0jnEmn8hNmeLWUKVYmYljwPoravFqjUr4KsAPcjwWY
         HLkrtq0oge82riGPSrCcN20JEEO8ID2UnE04IU2FvweFoL8Mf/DHZxsov7VMOQsSmrtU
         KKBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Qz5cOAvv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1681898010; x=1684490010;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SNwTlxPg8YuijIlNg2LYpXX30Q5oWJUjwoRtS3aY3t4=;
        b=WVKeXMFEz46x2WaYJ7ahffBOjkRemx0+9J/FkVbYecYIABY5oZkckHGb/lM8b7bn6m
         QR5ZU3bzWheEVu3h8pk7q7smdpA8Jh2kdw/G/G8+mo/xzk7bVLclr1nM1SoxYFyUSLm0
         El4lx0oBSBRffnBiPvUf33bnERQoZ4QHKxYGPOQIOcH89iIuXgkVvXILXdcuZcEakOx3
         +fIF3OjY7PHtBAv4WRL2jWKu0D1ARrzAr7Y5DnBAioFEzU0VTlIqLm7KoIth3KO7qYyF
         cGaHIy8dAGaP0TUcrwZeOmJ2E+MySUL/S86uFgp4czayICtvi0rItjEUOelXny8Yhfsj
         b3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681898010; x=1684490010;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNwTlxPg8YuijIlNg2LYpXX30Q5oWJUjwoRtS3aY3t4=;
        b=Mef3oKQTG7nMnrdDzcHGIW3h6Nq2p+Ki1Bgv7PwJnpDVOvh9eO4vcckat3iP8dwTp8
         /A8Bm0piQn68GWvzhZ0Dm4wVCC2DhQGV7uEC2KJiDeDv299UcnZuDSqHQPniEIOTFMG5
         FJe00fk0lhyDrN4VDuvF75dSvOq6rbpXDsx0esNxbbouMBBFR8RsDwqWAnt7vNVgVTHv
         vR6zJ2x0h4p/f17eqqqEabO+EJIA2m6UBM7JkC6Lk6BTxXdMJHRkkAA73LDHGjxCSbQw
         lIyhOhVLnl6TPQIWLw9c37gh3sb8wLKicDnMZtwNZ/PTgrzruJeFKVAvE4caxm4AFaq9
         7JvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9cPYZ7YBjuQJ91e+dQte3gLiktaePKDNGFpmVKKMRVnOPHHbgxx
	+kyZ+pbegUwDZ8gu3dgLvIc=
X-Google-Smtp-Source: AKy350bKZ/L/dFQYIbwLuEva/HmTeewD0V0tHKVLQnW++d0MhdFRkyoLBj4ILgf0yaqFF9PuvNHqJw==
X-Received: by 2002:a5d:4492:0:b0:2c7:17b8:5759 with SMTP id j18-20020a5d4492000000b002c717b85759mr799085wrq.3.1681898009997;
        Wed, 19 Apr 2023 02:53:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:805:b0:2f4:1b04:ed8f with SMTP id
 bt5-20020a056000080500b002f41b04ed8fls1006508wrb.1.-pod-prod-gmail; Wed, 19
 Apr 2023 02:53:28 -0700 (PDT)
X-Received: by 2002:a5d:6408:0:b0:2ef:b977:ee3a with SMTP id z8-20020a5d6408000000b002efb977ee3amr4093186wru.34.1681898008179;
        Wed, 19 Apr 2023 02:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681898008; cv=none;
        d=google.com; s=arc-20160816;
        b=N84epsZwd4PBvGDjoZkgLGCqepYSdn82m7DnUCt49T7rITOxrlUar5nhhDiVghjrIw
         DVnX7WNqfxB7q1LBt84zLFM84djasnS6BUPXE42ozUgBkKiTI6+6ZoasaOJj5Y6g18Bb
         DGIievz8MkRmdiptptStLzD9pCNZr23WS//uh0jTs7w9dFuwOZfwObvDMbAVPm0qc8vh
         KPHToEQ5WK22+U6HZqo3XKNa9xaF8NCKHZPwSO2nk7C4S7pCoTNvnnxTSZxFn+f+yTzU
         ghyXJ03o3/z6AswtkkaEMh7A1UIjnhO01TSXNaj1miLOloKC8hCmwGVXB7rZNVXYKQEk
         GfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R5Feg2juyvPuJCb5Xa6uJNrShmoUYpaCYsM+F1mICYs=;
        b=ljScUaaSEKQvJlk471gtsgEb73zK3QBo4dl4Un9XLd0xN/Fekw9IupEwdV0/h34QQz
         gtTYjYJn/bw7xZadZGS/0yisRPtqWYaZIEZrjxqq3kJCdBpNGR5CSGeCky7R9Q8U+c+M
         4jUCMDHhzGUI5QSpD7puExdwRI8qMv49mDAcif5rnuWxp/1cS4U8vo1W0OWlPW4nOe3R
         iMSmGZIasdQhXE/y5Vn5jPD8V/US2Z48byZ7L0OUgX4OcLwPuimS/Y0u8WnX/xbXSM5V
         S0+zI2rQ8l3euH5rFZgtDyPopqpnn+5H1Jp94LrL6VriC3J9G0mKHTFF+GrmSXFjVNmv
         bJdw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Qz5cOAvv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id ck9-20020a5d5e89000000b002c6ec127706si878639wrb.0.2023.04.19.02.53.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 02:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Q1bhR4GCDzy39;
	Wed, 19 Apr 2023 11:53:27 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Apr
 2023 11:53:27 +0200
Message-ID: <1e8884c5-d4f4-a96a-8973-8cab81532f75@oth-regensburg.de>
Date: Wed, 19 Apr 2023 11:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Kernel panic while enabling jailhouse using 6.1 kernel
Content-Language: en-US
To: Paresh Bhagat <pareshbhagat29@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <a89ac0da-35eb-420a-bb5a-0d4edd0ce2ebn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <a89ac0da-35eb-420a-bb5a-0d4edd0ce2ebn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Qz5cOAvv;
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

Hi,

On 19/04/2023 11:50, Paresh Bhagat wrote:
> I am getting kernel panic when trying to enable jailhouse on TI AM62x=20
> with 6.1 kernel. Jailhouse was working fine on 5.10 kernel using the=20
> same jailhouse config files.
>=20
> [=C2=A0 136.823346] Unable to handle kernel execute from non-executable=
=20
> memory at virtual address ffff80000b404000
>=20
> [=C2=A0 136.823346] Unable to handle kernel execute from non-executable=
=20
> memory at virtual address ffff80000b404000
>=20
> [=C2=A0 136.823347] Unable to handle kernel execute from non-executable=
=20
> memory at virtual address ffff80000b404000
>=20
> [=C2=A0 136.823346] Unable to handle kernel execute from non-executable=
=20
> memory at virtual address ffff80000b404000

I hit the same issue just a few days ago. You miss that patch in your=20
kernel:

https://git.kiszka.org/?p=3Dlinux.git;a=3Dcommit;h=3Df28966e7ac343ebf279eb5=
a18bf27cd67484c2ad

ioremapped regions are not executable since a recent upstream change.

   Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1e8884c5-d4f4-a96a-8973-8cab81532f75%40oth-regensburg.de.
