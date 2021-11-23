Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXOJ6OGAMGQEAX2VSJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19845A359
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Nov 2021 13:55:58 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id y11-20020a2e978b000000b00218df7f76fesf1134445lji.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Nov 2021 04:55:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637672158; cv=pass;
        d=google.com; s=arc-20160816;
        b=irtWCBtwbrixX4NXtt+vNZBt4RCLuMKVTwWU8VporWUxCdhjNQuka4xo07Ry38RvKr
         Skth8KWE59S342WPfv8NpU7W2sb+l/0h5DJP0gHtnzsOVITKvrh0jy913PCVmk9r74eU
         IjTwnD+kPyejvVsOIqcoLMHy0PMpszje3GVzyR3OoO2RLhd5Eq47RlyiQhIFe5phaYiY
         dy+4SULuvaAQ14GvXTNwTkUH8oFaIzeOkIesIIFeYMlns0Fhk/59syaA/ulqft2oetre
         7dVHIeEMNUX1QH3VmjfHi9iC3gGspWW7odgjO9GLYo0o+gKXrIEj1//pndOzE4aj3XY2
         0/Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=tXwl7uNmqhGSWEMyf+RDiuNt22FGpdXsAQ0y/51iR7Q=;
        b=vt5I1Ofcm4aH9TufOi2m/cE2+A4V6mCEFEeYutS74aDWCRCd9olit/nis4la+gGWwK
         3CmbcJ2HRe8ElgdqW4GSfg4Bc6KHlelZKWI08IwSR9kciCMr/daE9aiF310sMN+ZpdVB
         b7ATvEPTipFqx90JkSjll9E7JA4m5Uq99xlAkXUIYldEyD3Czp3fPOT7k7K4V9J7gQSR
         H0eH6jqAJVChgYK5OjgqWBBggM0FAXuwlqplE3T1TPiXFb6cZgHUjR3JdscedKeGdO7w
         Dgyl/YEKKy9AWW29bzucz0+sFxnyd88p3JIm8d+pF+1mq4g5PBOaPL+j4G0F+skjlLQD
         r4oQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tXwl7uNmqhGSWEMyf+RDiuNt22FGpdXsAQ0y/51iR7Q=;
        b=lcr1EMM3PTIDdBN6J9hHO7+u4TCT732rGBCFPZxWQOPfgi1fxyRnAMVO2a5HnzEhWi
         78tuZen6AvT2HeTxdrtJBmw47CeugIyeSf2Pkut2VGYGDUeq0rkVJHsxnxS0BCsxtnQX
         C4NSlit72McI2183G9CVj67yiXfxp+CBDLuOeSUugZU3SEqWfda8HLeX+uZqMbuGENao
         8zooZhzUA4zxeA/b6dy7NxgXf7eiiL4k1aDzfgoRdQVbLVzMqLAJbDuGnDQ+M8ot0Q4t
         nV8C4sdm9h8uzeV2Pebq62Er/KldXjtsOezVtj5uZcBNLgTHR6lUS+KTYzhj43dPYpKA
         mRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tXwl7uNmqhGSWEMyf+RDiuNt22FGpdXsAQ0y/51iR7Q=;
        b=655Gj4F7L4gaRykToR9hmTZJ8C0+7E7iKXPamUWYTcbYSxFXC4VzBguUWRf85JL74l
         roLUshJecwPtksHN5NIHqO3Ng9WcW7Bzut37wHwwOAI0XYhGokx0KYPY9HPWmduNNrgJ
         4UVwR5hrshidGs3lXCBZIjOOnepWmmMmAegF576JYUKWQ0kbHvv17eowOSJ3XLUSF9tW
         +kVh3IDtrjoBPl9C40LgJeD+RttQmOLL96YvrfJXX0421K3AzgMrMlwD+tR8WGmGTMG0
         ODochWEd9AscNkSg2hCQlzAXe49YsXDt4B5kveUvp3aYllEAgQfPWknZbg7LJrci6mfV
         R1Bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530uLxibysVmK9jLmqceprYQrtiNhAXKkeSqCOIL3qVNB81y03RE
	mf817IVNkonvexojSpeVxL4=
X-Google-Smtp-Source: ABdhPJyVkfM26w6mucFyBAUbiyO/EH9swqMCbySyBsWbQ2cQcEmI78hr1F0jMNmKSK105EATB8Vl9g==
X-Received: by 2002:a05:6512:33bc:: with SMTP id i28mr4574759lfg.33.1637672158121;
        Tue, 23 Nov 2021 04:55:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3499:: with SMTP id v25ls43553lfr.0.gmail; Tue, 23
 Nov 2021 04:55:57 -0800 (PST)
X-Received: by 2002:a05:6512:3456:: with SMTP id j22mr4636765lfr.89.1637672157078;
        Tue, 23 Nov 2021 04:55:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637672157; cv=none;
        d=google.com; s=arc-20160816;
        b=OrHt9evXJSLqlza16VI398+CR0GKau+g8hXGua45Vv0dREmHHmrbOySxBQ8rmy0uxp
         ultQXTowiebAqGRLkh5B2TOEV+tqSA3GnsM0LDi+cPDzwmY2r6GlRe769SVhqX2u5ROh
         pyk5pqxqe2i/bymA/sIiTxIpmUsg5sZykEz5Ur/PflL9NzqcOmOVRQ3YwPTFq++RtAIH
         evF7ubAncrGcqg50OW0Xe2zg5kFvPYH7MV/rTvyFUam5tYUJ90jQXvLh3vaEhGzKnumw
         XJk+vkfaXO/+MhQq7jkppntUOa95nzhMLVxp+Zt9Y7fU6nNx02YyUzwAkZZlBLE9WJ14
         nnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=D3M3NLbOncunBQCh6Hm+Gofsyd+Z7RShLqkl7SDzfNo=;
        b=Jw0FnAb2Rws28X2NokbDSgtbwy+5X8KEi/g24HKBZlr8xJ2OepXYFMVwtx5doHq9jR
         n85JMclm9hDUpFAVoGuKFfg231Stf17lC6MD3T+qZzkoGe66r53LttdOEo20OmAOzWLF
         4TA8LNH3pE6d+eXCOvJfUtnWeN7OyB/IcIvI6osf3jgW1ditXQlxwHKUwlqNIEAO8Cp/
         ojWfL5fn/Gy8LOeSyMy6VRCCNI+bJf7stj8G1dvYCo8247SISIaYj1tTr6Slv9WgOoZc
         0Lr6SNKb8uLl8VmgGEp+WCCsY0IloEk2dydVqe4KbNQREvq7B5hDpThL1M48Y2VKIvgq
         FRgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id t12si1004228ljh.0.2021.11.23.04.55.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:55:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 1ANCtuZf017206
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Nov 2021 13:55:56 +0100
Received: from [167.87.0.79] ([167.87.0.79])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1ANCttW7021478;
	Tue, 23 Nov 2021 13:55:55 +0100
Subject: Re: Jailhouse cell linux
To: Moustafa Nofal <mustafa13e09940@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
 <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
 <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
 <c092ca0e-76b0-4004-a5b1-9e205a5fbee0n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <83e82fe2-6a32-339c-01bf-46a7a51d8e22@siemens.com>
Date: Tue, 23 Nov 2021 13:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c092ca0e-76b0-4004-a5b1-9e205a5fbee0n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 23.11.21 13:40, Moustafa Nofal wrote:
> Hello Jan,
> I edited the device tree over Kernel 5.4 pcie@7d500000
> I added, from jailhouse.dts:
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 target-path =3D =
"/scb/pcie@7d500000";
> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 linux,pci-domain=
 =3D <0x00000000>;=20
> The error of invalid domain is gone, two devices were added.
> 0001:00:00.0 Unassigned class [ff00]: Siemens AG Device 4106
> =C2=A0=C2=A0 =C2=A0Subsystem: Siemens AG Device 4106
> 0001:00:01.0 Unassigned class [ff00]: Siemens AG Device 4106
> =C2=A0=C2=A0 =C2=A0Subsystem: Siemens AG Device 4106
> However, kernel driver is missing, do you have any ideas?
>=20

Do you have the related 5.4 patches from
https://github.com/siemens/linux/commits/jailhouse-enabling/5.4?

> One last question about 5.10, is it possible to patch 5.10 kernel with
> jailhouse patches? if yes, I checked this website, but I did not get a
> clear idea, which patches are used for 5.10
> https://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary

https://github.com/siemens/linux/commits/jailhouse-enabling/5.10

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
jailhouse-dev/83e82fe2-6a32-339c-01bf-46a7a51d8e22%40siemens.com.
