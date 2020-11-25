Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBMA7L6QKGQEJHL67XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6322C4498
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 17:02:15 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id j66sf1003493lfj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 08:02:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606320135; cv=pass;
        d=google.com; s=arc-20160816;
        b=aql+1vlJTpa1MsSBhUn51+IIUxmzJOoQBkhAzLwejMDsc92VKMi5epG7WuIwNbhJgt
         gqDiFPQKG9WIjneJVXnlEI/9cMxUfO/dNqILO0sKvlDDBTwyycKnSAXBlyWWrGxRjVwe
         05HkDqunXFkCtN+X3aPs/l0ENmr/3EMuh7HwXtaXOItjKyKYvL7fjLdmp023NPiozDui
         eytoLxh1a2GCuFMNUkb17KqLFgaoWtduwzaS/B8WtX4HJSbk04ZPhdslZl1sAf6kYyC0
         wnv2Lap6RMUS4HIGp+d4Jwn7z8EJclfpNvPXLEuueEl6JnvFv+ifr7YhIJ6586fvzr8k
         kW5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=0IJQ96yH+I470bONzhUlNJgnztTN9nYecD49zAc6tuo=;
        b=uhp1+9PdkmdttQ/oBOiPW2oomJGWtrLLuhM9V9HKeOr0oenkjMBrFmxNXRGEVMSGL/
         e7jLEkCpKSH2o4SMzrVK2Hh+RXOFRV8fDSPeCEnVgVTvL8X89ZrgREBeXeNBOSjGUigp
         KDQqevomlIz5ozjbWQToAlafjIZaF+lM1wgEdOvCOM+fz4HLaAa4cXenOLt3g3SnSNCt
         aUbHAgrvLyGILZzbKfePrShQgO6WxR8mrZo3G2LA/ChyZRnFpo2g7x4rkpeAOTFzZBu3
         pm4pFXHMDLbHgVvpnd7LBqp0aYnlTnO+mlDdcKZH9NyayKoA6ZCLNCHDaBW52tgX1g1z
         milg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0IJQ96yH+I470bONzhUlNJgnztTN9nYecD49zAc6tuo=;
        b=Nqw/FNWhpyNvIbToCqm9XrxF9KYjudOGacjKGe/y0B/P3WnCnkFO5P6cd6Mpb9mbjR
         +GgWx9VKHXOgrJ45DKg/JyQcdgtcapzUQsxbGsLczad9EDRou1J/o7Pc1pBa8aBcVko9
         ijgMFHmTIoLfq1450c91FL/GDleVOfLZuoBRjhr+2NnKVFiBfXKoNxocN2jAw5XJpP2p
         0rlvzbXlQLTutajRgpJHirUnITja8AXH5Q6Xdq4iABO1oVkd6UbSS0I2MU8CKp/aYg9X
         hIYf55Lzd7ylxm3cl/XnLkR1N71mNrAtqomAwV7r+xbGnsl41S6cGZqnXD3yyjwAdMCl
         RI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0IJQ96yH+I470bONzhUlNJgnztTN9nYecD49zAc6tuo=;
        b=Dda1WnjXtgZJmIACVx/sIeqL7j7U8jlc0NfHPd7Dvr4TkRZDmKOT2SY0bgUEYknO7h
         OKuVw2LqShlnG2IrQy72eDsJX1EuB1zyimZqoMbA6E98hJ2lhRt872KRfwY+gPakLxhW
         PmjwDjYS56a6zKttEB4VE8xOZTlY5hjoCtZQa4jPCsSY0NbRcMLkIzGieidv6Hcbb69E
         /p/fN8wD9vB27hozM9r69LZmXqBmT8yDU/g2pIwiB6zG7scC7iIZowoaEUhWabriRdRL
         8yucZKdG6jRxGU81pZVzn5MAhzGUExQe7ODLw4wIDmhGQwgNfu4EQ0qMLgM7+MlLcYeJ
         Y4Kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533V/hUbxsLRGrdOKpGqPorVuz1Nm84tsM/q255xaXOlSDcBPis1
	JDhVtJNLw+AmsKUWHxTAebw=
X-Google-Smtp-Source: ABdhPJzcOivyJGl87rEncImMmls5uYtnlQQZdNyxI0wEJudpPdPmsWEbwaNkFnRk0pt+aG2FrYo7Lg==
X-Received: by 2002:a2e:6c07:: with SMTP id h7mr1612767ljc.464.1606320134846;
        Wed, 25 Nov 2020 08:02:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ccc2:: with SMTP id c185ls1865576lfg.3.gmail; Wed, 25
 Nov 2020 08:02:11 -0800 (PST)
X-Received: by 2002:ac2:4c96:: with SMTP id d22mr1562183lfl.288.1606320131376;
        Wed, 25 Nov 2020 08:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606320131; cv=none;
        d=google.com; s=arc-20160816;
        b=teiC4YZDwsOb/LvLqFq1CEtvzFmVdb50w/CKtA2Mog0eUp60LGT6x+D7wlTYhlVId2
         I7l4yuYfXwItkmIoTd1V4Kr3jDz+CsahgsXKeiDbg2wOPka5F5lqKGPxcctvr+O/x6KA
         QhoAooB4dBDqlObZqytb8JJLuk5/jRPa9xxBEpBB6KMsskeHfNATbj5X6JzMSoIXhm2h
         MBsQuwIDEKkZ4i6//tMNXyMfOP9kFlsZHkyFcaCzOBsagzOT4LA6ANh0t+Tn2Yu50+wV
         QPxBxHY8Ry87dTAX+AasyEG7oZGkAmq6Bs3zlr1v3I9ejwecK8EaoekfvSparCtLMxAS
         P2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=aoxV7AEeScC/YNZvss7g774rldJ8QHixN9/liXYIgNY=;
        b=FvzMxF90Qsg9fg2JvUrFJ3tmgdUEzJ5KynCW5CvOFZXZGw233OZt26lcNI8ucVGYI/
         x7XrIF2Bg8/QAsSeD1q4+YMg74iNaa0KwcQed9G+PHtOFhLoySm8jg+HeRm0hVQ5STtc
         95bovdAe55Eud7NGKXxXCHN9m1vbvFSeaLO9//61ap69m2MBvIE4jnUQqax/5gFvMdoK
         X5TTDnBszhawAMndOExk18O/eN7PXyuI2dVv2MHl9Y9H8VywppDRJsmipk4Wi+sckNKC
         RBhFH2L0f14zcIFseu0uZBiRMeucehIK9qgWwccme84W9qwD92BIOJ84G+TGEz+Z5/C9
         atXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f17si76002lfq.9.2020.11.25.08.02.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 08:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0APG2AvB004017
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2020 17:02:10 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0APG29x1027429;
	Wed, 25 Nov 2020 17:02:09 +0100
Subject: Re: Creating a sysconfig.c for a target
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <PA4PR03MB71846100DFE427B73A94F944B6FA0@PA4PR03MB7184.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d125e2fc-4427-41ee-b41b-807b203751e3@siemens.com>
Date: Wed, 25 Nov 2020 17:02:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71846100DFE427B73A94F944B6FA0@PA4PR03MB7184.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 25.11.20 11:20, Sainz Markel wrote:
> Hi all,
>=20
> I=E2=80=99m trying to integrate Jailhouse in a tiny Linux system running =
over
> Qemu (x86, uclibc). Compiles OK and drivers are loaded OK. In order to
> run =E2=80=9Cjailhouse enable /path/to/cell=E2=80=9D a sysconfig.c file n=
eeds to be
> created before compilation, as far as I understand. My tiny Linux does
> not have Python installed and I was wondering if that file can be
> created on the host=E2=80=A6
>=20

Yes, there is "jailhouse config collect" for that scenario. Should work
with minimal dependencies, also in busybox. Then unpack the generated
tarball on the host and run "jailhouse config create --root
/path/to/unpacked/archive".

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d125e2fc-4427-41ee-b41b-807b203751e3%40siemens.com.
