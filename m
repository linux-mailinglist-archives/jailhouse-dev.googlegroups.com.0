Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXWPQ6KAMGQEOLJD5PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C48527D42
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 May 2022 07:57:52 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id z20-20020a50f154000000b0042815e3008csf9065358edl.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 15 May 2022 22:57:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652680671; cv=pass;
        d=google.com; s=arc-20160816;
        b=N8Yq9NVx9GtSr6UOXc32CCGIljZxLmY8bhxV6MoNP3OCfazXz8KoIjf5D75peFnIPv
         Z+M0ODOR5WkJS10KlRKzm5DYybJKbrRKQWhyqOIDhIB16HTojlrMZchhS6/2py3MwY6n
         xEM1f7Iz7dJsc1URcE5U15KgbNAXeuyJeDVv2OZO+zar+wqdiX6ZwOhgIHDt99dz67W2
         5CgS2Dv99V4oF/pO2Sq7kX4sh1MfvWE95IWyr1MfGiQjqHPunPA/9ja8jnFTs/IIAduA
         LTsiBN9f2+IVE1BfXEHOMfqyCLw0HK+GR2dQxCiS9OOiVSfHAcHxE/lKIcDD5O1ndFJz
         pGlg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=GQgI+dGHuDenGwP421i1NkhgnJfhjS+kZsJFFHo9sI0=;
        b=0g7avizHJwLJdCkYHPc+SXq5tnUc8pl2jm5zj+Kv3aNa+MYpSoNAZAUgXR+wsB5MOF
         FvK/uocdNjNtV5sfsi3O9t9Fbm0ylyH2w/WO+Yuc7nstN8EqEbPWGCAlZtJzol4+b01z
         pqk4TUqRmapMmC5N0SDDEmJ49Ru/DOZIfG35Ch5d4whZZfkEUWU0JtVslabcq3LwaUFl
         vctTqlyOg0PM8gO6J0Y3cgUjBAJv3t28+E8zP0ePwjaNCmB6uaI5DDPxsW7HHfz9MPiJ
         +mOv6Iuod6O2gvGahHYriulb/s1iEt9pe5gtVos/4hfwG853gIKwbAnLw3srOABBT5Tt
         t4Tw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="T4A1yF/T";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::610 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GQgI+dGHuDenGwP421i1NkhgnJfhjS+kZsJFFHo9sI0=;
        b=tDkN/6BLbrw1GGybzgGhRw8Q/4gU6YwH6ANlE4I/EKQ1xn+xtnChkDx9Fi9Dgu4+g9
         WnrmkESXv7trNcMqeKdAJYSFof4+uEDplSnqK2HKmywDjmsQ0CN8u13O5dHXFZLdWnJw
         rCyZnh7WwnAWxpgjg/iu7yfannO9feG9a4Qv+1A0AQmblhV7l8tlRYzpy4ispjaO/+a8
         PZXf3pOlcxR5O6Ge6bUl1qt1Umn62Yzwpx6GtB4wiF3RBu+lnx8kW6bN7hP5hKghqzv3
         3Z7I9AKK4e55ibuZEQo6BHf1lUt6eD/of/dP1TXDGSl6I0LTM6DtgqhVF7cHKzxomQNP
         j5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GQgI+dGHuDenGwP421i1NkhgnJfhjS+kZsJFFHo9sI0=;
        b=nLBtLPjC7v3ajSku4L1XS1PAD79qigc/vu3O83/hNmBQce7K1nGk0TgkeePmY5/MPS
         z5nk3xFYudBU0bg1B84EuuMEOC56IbEk4yib5rByQWMHvZqaN1O437zz//NtpEuvgXXc
         hvn/kyXvnA2FFi6FGOAFpUk63DIZWWvz+JzBFCGM8PB37jAC1+68kBdnFAbnQjCBTa6i
         VK2/VZPNBCgXN3B+/K7e/oPmGOb/OAEPlCSwoh/9fy55p6JROyisUp2sR0BkJUX5492J
         Y7iJ0Zw51AKFCYnwxw9lmNenwrrTFWybsjSLy9zIfu1eWLEhwdbPxE7DTKH/L+WZOpxe
         +ygg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530w5ImLAIVRML16q3bE8RLLdMe3Do02Xl0M9+PJhgHupk3M+A86
	WWzMVKgZm6n5laOEX8TTf+U=
X-Google-Smtp-Source: ABdhPJwKnItB6fhG1O+SGIDstJNBEO8QcKPfjewBEAYhIeUDLgzh9bO7QugLEjqGBuWliX1ZbnWoPg==
X-Received: by 2002:a05:6402:42c4:b0:426:a7a8:348f with SMTP id i4-20020a05640242c400b00426a7a8348fmr11582103edc.341.1652680671664;
        Sun, 15 May 2022 22:57:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7f1a:b0:6f4:7118:d7c7 with SMTP id
 qf26-20020a1709077f1a00b006f47118d7c7ls6638950ejc.1.gmail; Sun, 15 May 2022
 22:57:50 -0700 (PDT)
X-Received: by 2002:a17:906:4fc6:b0:6f4:da16:4a09 with SMTP id i6-20020a1709064fc600b006f4da164a09mr13802558ejw.599.1652680669952;
        Sun, 15 May 2022 22:57:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652680669; cv=pass;
        d=google.com; s=arc-20160816;
        b=Acb7C/ZvEQsDndivaVC9pC+UepWLY6R1mtd0hDy2hC4Kxhybl22Txm0PFsgABfg2Gd
         0vpJgWtUzcIL0az8AwwHWfcNvi07NtNJfx7ig6Nzv4GIBJYxci0aFmEU5fgAyxRSwrE3
         2RWRtQC+UqcTt+PuSa80Y9iuaKJW6eIhwXdUPOIqVztnBnZfH+Ad+75FMeXDsnLDtDYe
         55Tm0P5P8wbcPksh0ZVAkYT2vc9G2L7SFkzqE24SV/S+SQtW3Q3Ta1G4td4aBOonpoYZ
         O+Hl/R+hRUVOArtPi2bZJj0p3aqsQzsP7SZ/zAtDM2OpJo75z+3Xj13l4tMvveOvmQAq
         aOtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xWCk93D4bi6Hc5dShTRTK95sTrLbcCv73TdOxjcwihU=;
        b=Qlwm9xIPgVUjXoEMAJUoX/kTSiuW0rDHVl95tHZPfLxJrrnEAWPopcDWxkz+4K2ZqH
         yn77EZPDcgSEgfCnvVxpTSHkFCpk7D+2u2j88T2JpHCRKMrS8by9R45STVTlApTOqTz+
         Lh7396oyzw0MsJkBIriULH82Iatpq0TgxPhPlBOTYQVEyRM6opimYMMfbvOivn9UKX5O
         OuE13r3/c6FhnVJmo9bl487rukQ1inT6PRvo4POeH6T8S2d0m6gIn8wyOY0G2Bh18My5
         F4gxM2I2OwPb2VTaxw8yjXOrdgmYcX0HeSfs1B6oInEo4swqhc2wLk7rYhPu7MYp+bxv
         qkFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="T4A1yF/T";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::610 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20610.outbound.protection.outlook.com. [2a01:111:f400:7e1b::610])
        by gmr-mx.google.com with ESMTPS id a28-20020a509b5c000000b00425ac5c09aesi399826edj.1.2022.05.15.22.57.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 May 2022 22:57:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::610 as permitted sender) client-ip=2a01:111:f400:7e1b::610;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0sJ9MSmkAGVpUBkpTurzfhN8dT99LhW95hz+bwA0rglpNP8ZXz/4YIkUGQ3U9+CV5I1wp33+PTYxC16Ow3oNJaK899skxiXu6RUCoGJ0sd4DSBKsApL7Mu4lLPvNn2+uHeGOKCfoLqpn84EjsRL6y0ZEx3nT+ziBC2V3toTyErg0d5UhnOgbRAQoCI/pad98Or3oRvjstCXvmEav4l0Mf67SW9DgPLkHBOE+F/7cRuUn1Y7rZ+tQlFBjmxI22TWC4MqII4xy10f4CfVdLUul20drHnzGIbtsXTujOvmxATnbbYaUU0H4oFJHUTvwv/7NxODjwhkNeAdY0pOumsTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWCk93D4bi6Hc5dShTRTK95sTrLbcCv73TdOxjcwihU=;
 b=PElynE8cBgTYOFw0Qb9dcnc2QSk2LuR6QGqMeMOh87yeja22xyF0FRXOz0fK+n2cbiQUap1gpHVu9c+tQO3dTv6gN8okBJ6TbJr28BHstUDU14J7dfEkU09XSfu38afOL7MfmdGUoSPik32yugXj3MkN0a6cU/tf53ro89gHiWjVTQAieluwBXfg9R8QnZM7LoP8D4A8en6aViWeh3NEGrS3JMicihgJmxLT/eoz7X0PB8Z+D/zRoRzu1r42keKthKVCcrQYsd4mhRqesK201fDvudwUOp2BvJAPHq35q/CQLblq56bZuuED+jzPuLCZazcd81G0ONvmNc30P2SbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:10:232::14)
 by AM0PR10MB3682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 05:57:49 +0000
Received: from DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::a1) by DU2PR04CA0069.outlook.office365.com
 (2603:10a6:10:232::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Mon, 16 May 2022 05:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT043.mail.protection.outlook.com (10.152.5.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Mon, 16 May 2022 05:57:49 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 07:57:33 +0200
Received: from [167.87.72.34] (167.87.72.34) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Mon, 16 May
 2022 07:57:32 +0200
Message-ID: <8e895901-cd60-9696-935a-293245586a77@siemens.com>
Date: Mon, 16 May 2022 07:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
 <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
 <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
 <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.34]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--16.037100-8.000000
X-TMASE-MatchedRID: AnkS0S6+UFo5QaOxwNGfvo9bHfxDWoib5GpNAiPonKiCCtrY06jaLY1j
	+mrGi/PFV4i674aSi3ybAPxtNvAfmGMJRJ1WGnFogoYjLp9hKaAxs7ulGdJ/volSWYvdSPSYOZU
	kkswTRZg8sS0dkmSGjEGzU7CKX1sdGIfsX2xHdgvQdf1OKvQxXXnYsjCinlm9MB2m5K0KuImW31
	x27U9QYjhYqvU+Y921QPUnSIMN7VvcLUMnDfuntNUW7fqDXv0BlE0VgxbvH2zi3aa5wOREEdhQO
	8CvZj/XCXjDiV/HPZztOa5rI8bsUFm9RBQ+WJcuNQCs8d6D0K04vNIE6T3UznzmmMD/HXF+baH3
	VbOE/TkvfU/riSJXkXPWWDY7hSSVK+fbv4M7+TC1M6vEQZCbhkkjllSXrjtQOX/V8P8ail1ZDL1
	gLmoa/PoA9r2LThYYKrauXd3MZDXwMUUgHNDhDfb/jTTlUnX/4PR9UwBvuCfazUTTYDbdIN8BhB
	kdJ7bGjWufEarVvD6tzGyK8LYptQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.037100-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: C52E20E20CB821469031C7189E976C9CD896E71B3F1CAB2859B161FCC68220FD2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67c7bfb5-74fc-4111-a473-08da370101e2
X-MS-TrafficTypeDiagnostic: AM0PR10MB3682:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB3682A398BD9394AD7AA71DE895CF9@AM0PR10MB3682.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Df8egMlvRM629HLnZgDw28Ps4Psbudkibx1zdi8NRe1JYIhdZ3l5eqmNGD6k6oUl+5q4AWO7TJQXp7+dkWbp51d/VjgkRiBMUw4r9STY6YtwqCryoaztcTveNtvWsWAQpbsM7stRqiE1f1UR55Cbh5/+/buZYhJCkk1ygL9E39108gEB0awSS902pFHojwFaob167PTJ8+zE8rU4CFsTlf87lGw2yqvXkhIpHo9j4t3ykDdrX9QQbbmvcSdWRDrA9AWxMwb7eS9qEaZxN4Gz/3t5XINkfwjN+C1ruzVWVKmqL7/x7TUw7B84lQ3in5OmtSIHdShoeV59W9g/jxNgh+b9mHcjEcwDXWD8rvKNocvZKWy4gQFCSPj2SBVv+jToD4qH3WNHuECM2rPqRv21XxU8YH+SiyYuf0EJXCByR2TYxqTUpDE4m5W7bvWxX5qd6rgEpyWL2OAJNQY1bB3gNjKBMNXNRHN34OCTbxxmzKjgdVKItUZFrlDEWVidPX7D1sslWq+/3mXQNNAcB05Urr0CfuBMtEKWBgof/hZrND05GTNZdjJg/e499zsB7nzai4QuwFflQoJ906IUawZ0abDBmFMzqM5jUYg3QGkY4Aujf65ywQFCzyDeglKFI/jdWWGMgfcxqdVUirVMoVQgyQkxnGnsbS0EAG1gip+fn2yD2IqP8N9OBCMbjjgq9H5Jpdc27mrEYJneoqsCiXptum6IYajzPkZI3L5S3fIUSPLqaXYlZ10eSGWJ/SnmsLKESQMOmnonuqI3qrDhg2WFrQ==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(82960400001)(26005)(508600001)(53546011)(5660300002)(81166007)(70586007)(316002)(6916009)(16576012)(8676002)(6706004)(4326008)(70206006)(40460700003)(16526019)(8936002)(956004)(2616005)(2906002)(86362001)(44832011)(36860700001)(186003)(336012)(82310400005)(31696002)(356005)(47076005)(83380400001)(31686004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 05:57:49.1763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c7bfb5-74fc-4111-a473-08da370101e2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3682
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="T4A1yF/T";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1b::610 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 13.05.22 18:28, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Fri, May 13, 2022 at 4:33 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 13.05.22 17:20, Lad, Prabhakar wrote:
>>> On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 13.05.22 13:32, Lad, Prabhakar wrote:
>>>>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
>>>>>> actually crashing on hvc in arch_entry, and that because of Linux not
>>>>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
>>>>>>
>>>>>> Could you share the boot log of the kernel?
>>>>>>
>>>>> Attached is the complete log.
>>>>>
>>>>
>>>> "CPU: All CPU(s) started at EL1"
>>>>
>>>> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
>>>>
>>> Argh my bad, I've now enabled it to start in EL2 mode (attached are
>>> the complete logs). Now I see the below panic,
>>>
>>> [   33.920507] jailhouse: loading out-of-tree module taints kernel.
>>> Reading configuration set:
>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>> Overlapping memory regions inside cell: None
>>> Overlapping memory regions with hypervisor: None
>>> Missing resource interceptions for architecture arm64: None
>>> [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
>>> code 0x5a000000 -- HVC (AArch64)

"HVC instruction execution in AArch64 state, when HVC is not disabled",
origin: EL2 (hypervisor mode).

Is KVM off again when you start Jailhouse here? Does the CPU support VHE
(Virtualization Host Extension)? Is CONFIG_ARM64_VHE enabled? Try to
turn that off.

If that is the reason, we need to improve documentation, also along the
different kernel version because the config vanished later on - not sure
if things still work then after 5.13 on such hardware.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e895901-cd60-9696-935a-293245586a77%40siemens.com.
