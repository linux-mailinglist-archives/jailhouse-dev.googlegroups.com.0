Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3NLS6KAMGQE2L4JCTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459252CB7B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 07:30:23 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id p36-20020a05651213a400b004779d806c13sf2126136lfa.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 May 2022 22:30:23 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652938222; cv=pass;
        d=google.com; s=arc-20160816;
        b=QYkQZTusG2IPpB8yOHNtKVOaKH/+YUcvBiD9HPCsWsXKp3Yx6GOIIqUM58gVSGpGGs
         3zAP2jm8sF7/i02WqORsoM77iaq90Qk+Y7jBlql8eDWc62dbbfjF75vPq4F1z8Dxaq5o
         JPcYenZPc2dX2wIo5YhezTK49Y5TiLuqOHEYERSYrbEtCYg3A8a9Ndc61HYIvtATzyE4
         3N+e8R6vONNocvCVbcrDPm6/d5U8D+K0QEORoB0Xjzui9FZ99EHt81BrWBMlXUoOrHUb
         D1/ESdgYj0vzkFiQ2/1iutEXTUt1ov4NjLdCG/WcZaXDdotlQWo6aR4t/J303oHimG5e
         8AfA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=249xh8OVdy7zO2eMGg7qSBLoPAcPrpmTA18PkxFJSiA=;
        b=FzRUu/IZRp/n0YxJuxcx4wqrDhHzp5m2mERR5jUogZS5MtvTzyRNHaev2/nawUq9yA
         JueAi7NINOZxlQhpCNuNiE2I3KgHGprQiLpdNxZX9yuh5I8zDPrF4uYfeXNHBm0CPUfe
         6YX+TEOgd8xFdDsr7XFuN3wvquo0JRqeF4O1NNyZKv/rEBwKcEdg7YzJBa/9sdHFiB6a
         QWQ6fBKqXIl73LUS0CQHRYvKhlnHFfz5nRsnXjrncYeCifTdp+0vigCdtCvR4qPoQT+D
         QzcWMvgqtMz3Jx1kRzWaV1rak9RLSd50FdQTkl83K345W9+5HcLV46gHAiykxFUoXLyj
         fQdQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="BXT/tva7";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::61e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=249xh8OVdy7zO2eMGg7qSBLoPAcPrpmTA18PkxFJSiA=;
        b=jE8hIpEJQnO82QPX93iWuoTkSDxBz12HqVxcP7+o79NV/I09VKxJkzXr2aovhvAl1q
         i0ftSfNCTaT8U5s9KjG46RKfPrGFKpstzntJu197ht5SPDzLHul759r+aaYXeQ56Mo+c
         ZlRUblPMG+H/RfH1jLcfOG3xc0QAfGMvLsn3GHe1Wb9b9GhS4nGFYmpwAEMu3mA3wHZy
         jw1Y2RdspYrTQ6GYBuUBMHZaOjapSrFKuhsxMfxvuxFl+ZJz3vj4eh1dPpVqjq6Keo/l
         d9IDDq0kF147ot+t6eMRXfnPtQ+U4STnIB/Vg7Nsy5n5QFbqLgt1y2fDvdWDR4RQCHVP
         Smgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=249xh8OVdy7zO2eMGg7qSBLoPAcPrpmTA18PkxFJSiA=;
        b=ii6LYgXl+fauBF2MJZMb4NldSi5xCdhiak1uqGP5yWkMBkpHY3up08AvkOM9imhliC
         RO9lS63ZJn2aqBhVMQeOE21xHlagfB36LsmTpx1BBNSLzYOt+HjXDTM7gHkc7wY5H5mL
         Q40h+n3b7XDC9gkHomnY5w1F8En50gBfMFdPnhv5TVdcmjg55pCJMgh7A0Xdj7BColsz
         6Wf2RJFJGNaqTDNSVCjuJHg/y9SBb766k0l4wcrZjm64o0hvftC3Hv7w6ZJW8MzuhktX
         eUDASgyNCuYux79ZttxBQtTuewEjJgr3z7pftSw9/yD7v3WP20Dvm8ofU/GfFkWxdj7t
         xbTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Bqxp9xwjEjB/42+K2AoMTTPebS0J0Jh9X3BBtqTudLyrql8iS
	zcCXFZS4WzIbXpPfSZLuxTY=
X-Google-Smtp-Source: ABdhPJw+hFwNM/cFx8WV6CXdPqeGTfmckqGo2NWxR/HBBXfTxQVmZCnjev7hybGHJZePvRxRdBEE4Q==
X-Received: by 2002:a05:6512:1502:b0:474:28db:7b37 with SMTP id bq2-20020a056512150200b0047428db7b37mr2115525lfb.250.1652938222575;
        Wed, 18 May 2022 22:30:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls1437908lfb.1.gmail; Wed, 18 May 2022
 22:30:20 -0700 (PDT)
X-Received: by 2002:ac2:5e32:0:b0:477:c733:9d91 with SMTP id o18-20020ac25e32000000b00477c7339d91mr1178621lfg.485.1652938220346;
        Wed, 18 May 2022 22:30:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652938220; cv=pass;
        d=google.com; s=arc-20160816;
        b=FOQ6DI6DnCBDO/xELIflb2ZzsPJTwJcfcNShmA/ocLAcHP2v89mF+DkcKXgc2gPTF0
         UeVeKYmJUwpuk/NZvSPM8sfM+yFewxMcVqTsUdwo2PKmMb/lC2sjKtOHq6U0ims3NCRd
         UQL84NZ4Okpf2t7aIVuAZvE+a85WnaBDmcVMU1rGpzLAPcCG5ro4hbsUluEcPsIkhOgo
         Rz5y79MY0NjbqqsgRHx2kFPLPgshOZ30vgORCZ4DJeuHtQQZ4Z5Qi3ymXbD8fdqxet+M
         R61fNQOV09IRjagdFWbtqorCiOYiqh5HiihGa6ck2reMkch4BLNHrFZNx64eCXeHu1NG
         7lSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7KRrLdiR+VIeBziFfdiKz5MoryIVugtJ4jefRaN6tpE=;
        b=PIwusLIObMkIuH8UoGeRFM3ZnJNpYA98FkELX58N8FeWbbU0J7LoSiOqFJ7z/N8XZ/
         5TOJNrQIHh1wXcjbBrb6OPj/do9v6YV409yELnPtMnfhu+mNVpmBsG5DTCNAdnHgJBBT
         k2aRR/O5FPYH8RCwIQocmhHw1zLHG2sDH1oktnZNEi4k04eZHnfB/QB+3w8c/fwSHGiU
         9+qReKLoh4rY6A62+8IBC3ntbbX1X9dcLfAkFqAuzo1tfI9HPJsQavWfu+T1eEjz96Rc
         Nm6rWAmg5JM16nW//y5ZQ9yGKI9xslbiqubVxs2yCqU6Jf+MyKN54U40vDPVVecHOPK9
         AaXg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="BXT/tva7";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::61e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on061e.outbound.protection.outlook.com. [2a01:111:f400:fe0c::61e])
        by gmr-mx.google.com with ESMTPS id m2-20020a0565120a8200b00473b906027fsi71517lfu.4.2022.05.18.22.30.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 May 2022 22:30:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::61e as permitted sender) client-ip=2a01:111:f400:fe0c::61e;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSg+BMFOV5CvtETJ0q+cXnaOxQS8QfqkUtL3lNOjtsPo3LMoveTE/607WUDsEbZ9NvO6lv1HceNg7pCJFQlxxgjUNWTcK9kyijJwXVayh5x+Z4BaG7Ruky4dONY4IV1AoWtu1h582ojmPxptJ6sHkmWM0vBG4Pqbr1NtqOaHHbn8oYWRZ5sJo3u/fBAJXCXtnvF62YxypjlMvrlb2WVLN+EphcZECNoAXA3xR0lMmgDSWWyaf/77xN5fqx3firmnxwKGtzaM9IrmVjwrmd8ksSiaYblRJkGva1bT0obkXiJHh+zYmyoF1DTxtctFFriPpSjQelHANw9/pibENpkWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KRrLdiR+VIeBziFfdiKz5MoryIVugtJ4jefRaN6tpE=;
 b=jMlW2qwvVB0MDkt+3hjtl2m395zhTZSH5ehzXuZ5q6UbrQvwm/aszx68wH2fcZgZge/dcyPi/EL1UhuasKSrlZo3OunSp/3pMRCy0e7rckZz+V4Jh2DtVVBLVwKijHsLrdhMiQp98vLMenq6oexG79vqxVZMjRsp8xuAZuWuiDsKUA4VGc5kN8iK+zHQ3YzCoEa+nyjYmYd390633SdqdwDBJKYJzmJaqEgwmShOppoKRs3+MwqhVr4P3d7P6yCOkBFUtHUiV+W1g4BuAWngCXcg2qv6waTcdrLDg9CKM5hqvfuqqLky2n8jtIsU40hVwV8VwzBAdKZgUVCV5CDjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS8P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::21)
 by DB7PR10MB2171.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 19 May
 2022 05:30:18 +0000
Received: from VE1EUR01FT047.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::e0) by AS8P251CA0004.outlook.office365.com
 (2603:10a6:20b:2f2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16 via Frontend
 Transport; Thu, 19 May 2022 05:30:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT047.mail.protection.outlook.com (10.152.3.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 05:30:18 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Thu, 19 May 2022 07:30:17 +0200
Received: from [139.22.139.96] (139.22.139.96) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.24; Thu, 19 May 2022 07:30:16 +0200
Message-ID: <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
Date: Thu, 19 May 2022 07:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
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
 <8e895901-cd60-9696-935a-293245586a77@siemens.com>
 <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com>
 <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.139.96]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--19.624600-8.000000
X-TMASE-MatchedRID: Ktq4DOUeYhU5QaOxwNGfvo9bHfxDWoibUlQrLabIzZN08zy97KsgJsRJ
	LE/FNr2DY4zJvUjGrxXioAGxQy4eNYLPV37BrMJjp1g3Gnmqog5mC5UkZj+/T/go8BKl9ae5AQ8
	mtiWx//qZHfpKN1YMZfVPDFRnPwE4ULd14sEtBkF6/Ws1m/D19VVecXIb1FSr0MohG+IQ2sfx6P
	TcDxSp5QWqvFWg3Xg6gm7WCykPm9R55ynAVG2b6A092JK4Ug5YcFR5Op/4/wRT2G3xw+NXjthQO
	8CvZj/XCXjDiV/HPZztOa5rI8bsUFm9RBQ+WJcuNQCs8d6D0K369udj0zppv5GzIhDiMWXrjlRp
	8uau9oaXbcZfsC7t1LMeapFjC2iRg+KYTANwVp0wflweu99/zHrSP9RtGZYomS4eyDF9QUdoqrV
	iHDnSO6Rea8wUAdQ6Hb9zBU4IqPHSe7fNpJWzjU+oHek5MFSPeKZAID3hHVYRBjzsfzCd+ZpHQF
	N7rLyrzVgwP7ZMYf8jw4ms98ZEXWT5A0MPjaOM8+9mrsbK9Dp6D40PEbZO2tbgzPjrV+wcS1zwN
	uiBtISU8ftiyKjZrU/mRGqrA8qmyV4cclS+BIyKz8Uhs7fHIYVoRXOdcwkq/sUSFaCjTLxGI9Mw
	xz8yaQ+XMlIFkG/VYG32ZLukpVN6ipWzVkuu8IbXzhjksitpTX7PJ/OU3vKDGx/OQ1GV8rHlqZY
	rZqdI+gtHj7OwNO0CpgETeT0ynA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.624600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: CFDF39F3F27F4271051069DB49E083B4FCE192121AE787489DAC2FECBA647C522000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8457551-0a68-4b26-2f04-08da3958a918
X-MS-TrafficTypeDiagnostic: DB7PR10MB2171:EE_
X-Microsoft-Antispam-PRVS: <DB7PR10MB2171E49B603BE20032D1AE0895D09@DB7PR10MB2171.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Q/KAqZcv30hpJUd6J5d4ysjA6mMAW4gUdZC0GpReJM4QJUaN92WlaIIHEwTBYLP+kn5CdVzTQYxx14YY08nPVFgt4a7eV74y526k7OxdAF5Hin5bTgRq2vFOACLWct2KNW3TuMFZd1yyrrd2EuMd/+pDS/CCR0q8yEV60ZTZyuE3MStT9Z1z2JPYmuhvur4hKCGBcUGcS5BYumG9K3gyP5DuK3l4sBsjlIhPMaTcQb9K8kH7CqwWO8OehiCnYKG2CRv8D4Vbo+o0ke/KHd1/MMYmCSY/97R5Wlc+qC3vBU5mZuYV+PI9c/9a4ED6LvKAVwqxQu+HIAvvyysMYnPiOJcUJu3kt1eZ0ypRRVs7gwtawRDYODMc680AOrbvs2Q/xyEeXkE1FtNGTUTbXDSXndFDenjl/i/bIHFsT1ZAtci2tdhkJkywaTlVwMNgWqsgEoaEFXRgBjRjygrMPLj48OdeLOiiQzS+ymwlF2QSDi8h6WSpGiSEqOgM5LmzJiC2jhNM29F2/iBbOWp/EhraRqpqH8W+CP8b5plph0gVVyAmyu40qz9U4BxuEoNVjpgqQLWNd61wszdnUK8cNyp+yPs77289qpgsTEL+27nhUfif35TgHF9EQ9sUxwJf307/qwQEJW8Z+cCcWx9jiykrFPEj6XC9hLeBTlfhf7jPbPJkJkpxBIWRFD4B0PGBqnIW00fnAoYlbKSQN1fCCYKCPVVTKTWBLV1OR/ro7mftQcu6/MVnvXgtuY4Sv30+tIRWP6YkhPG2MOCHGQvaCg0gw==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(336012)(8676002)(16526019)(26005)(86362001)(186003)(956004)(82310400005)(53546011)(4326008)(70206006)(6916009)(83380400001)(82960400001)(70586007)(508600001)(31696002)(356005)(6706004)(81166007)(2906002)(36756003)(316002)(31686004)(36860700001)(40460700003)(2616005)(16576012)(44832011)(8936002)(5660300002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 05:30:18.2717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8457551-0a68-4b26-2f04-08da3958a918
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT047.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2171
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="BXT/tva7";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0c::61e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 17.05.22 18:19, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Tue, May 17, 2022 at 12:44 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 16.05.22 20:01, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Mon, May 16, 2022 at 6:57 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 13.05.22 18:28, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Fri, May 13, 2022 at 4:33 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 13.05.22 17:20, Lad, Prabhakar wrote:
>>>>>>> On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>
>>>>>>>> On 13.05.22 13:32, Lad, Prabhakar wrote:
>>>>>>>>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
>>>>>>>>>> actually crashing on hvc in arch_entry, and that because of Linux not
>>>>>>>>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
>>>>>>>>>>
>>>>>>>>>> Could you share the boot log of the kernel?
>>>>>>>>>>
>>>>>>>>> Attached is the complete log.
>>>>>>>>>
>>>>>>>>
>>>>>>>> "CPU: All CPU(s) started at EL1"
>>>>>>>>
>>>>>>>> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
>>>>>>>>
>>>>>>> Argh my bad, I've now enabled it to start in EL2 mode (attached are
>>>>>>> the complete logs). Now I see the below panic,
>>>>>>>
>>>>>>> [   33.920507] jailhouse: loading out-of-tree module taints kernel.
>>>>>>> Reading configuration set:
>>>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>>>> Overlapping memory regions inside cell: None
>>>>>>> Overlapping memory regions with hypervisor: None
>>>>>>> Missing resource interceptions for architecture arm64: None
>>>>>>> [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
>>>>>>> code 0x5a000000 -- HVC (AArch64)
>>>>
>>>> "HVC instruction execution in AArch64 state, when HVC is not disabled",
>>>> origin: EL2 (hypervisor mode).
>>>>
>>>> Is KVM off again when you start Jailhouse here? Does the CPU support VHE
>>>> (Virtualization Host Extension)? Is CONFIG_ARM64_VHE enabled? Try to
>>>> turn that off.
>>>>
>>> KVM was OFF, I have enabled both CONFIG_VIRTUALIZATION and CONFIG_KVM
>>> (I have attached the complete kernel config). Yes the CPU does have
>>> VHE support. I did it by disabling CONFIG_ARM64_VHE which did not make
>>> any difference.
>>>
>>> With the VHE disable now I get the below output:
>>> root@smarc-rzg2l:~# dmesg | grep -i kvm
>>> [    0.095927] kvm [1]: IPA Size Limit: 40 bits
>>> [    0.096895] kvm [1]: GICv3: no GICV resource entry
>>> [    0.096916] kvm [1]: disabling GICv2 emulation
>>> [    0.096949] kvm [1]: GIC system register CPU interface enabled
>>> [    0.097045] kvm [1]: vgic interrupt IRQ9
>>> [    0.097156] kvm [1]: Hyp mode initialized successfully
>>> root@smarc-rzg2l:~#
>>>
>>> Now with the above configs I don't get any output on the console when
>>> the root cell is enabled:
>>>
>>> root@smarc-rzg2l:~# sh -x ./hyp.sh
>>> + insmod jailhouse.ko
>>> [   35.379219] jailhouse: loading out-of-tree module taints kernel.
>>> + jailhouse config check -a arm64 renesas-r9a07g054l2.cell
>>> Reading configuration set:
>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>> Overlapping memory regions inside cell: None
>>> Overlapping memory regions with hypervisor: None
>>> Missing resource interceptions for architecture arm64: None
>>> + jailhouse enable renesas-r9a07g054l2.cell
>>> [   36.217465] obcode @arm_dcaches_flush: d53b0024
>>> [   36.217469] obcode @arm_dcaches_flush: d53b0024
>>>
>>> Any pointers on debugging this further, has anyone tried jailhouse on
>>> Cortex-A55 before?
>>
>> Hmm, at least not I so far. Might be the point that we are missing some
>> subtle difference here around the way the setup works then.
>>
> Right.
> 
>> In any case, the fact that at least the previous crash is gone indicates
>> that something changed. You could check if you reach now the second hvc
>> by adding a ret in front of it. If you, you may end up in hyp mode,
>> maybe just not have a working UART yet (is the model you have on the
>> board in principle already supported by Jailhouse?), run into a
>> different issue, but just don't see Jailhouse report of it.
>>
> It's not going pass the arm_dcaches_flush statement.
> 
> With the below diff, I don't see any logs on console
> option #1
> diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
> index 39dad4af..ce29b8e8 100644
> --- a/hypervisor/arch/arm64/caches.S
> +++ b/hypervisor/arch/arm64/caches.S
> @@ -40,6 +40,7 @@
>   */
>         .global arm_dcaches_flush
>  arm_dcaches_flush:
> +       ret
>         dcache_line_size x3, x4
>         add     x1, x0, x1
>         sub     x4, x3, #1
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index a9cabf7f..c8ebf695 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -97,6 +97,7 @@ arch_entry:
>         ldr     x1, [x0, #HEADER_CORE_SIZE]
>         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
>         bl      arm_dcaches_flush
> +       ret
> 
>         /* install bootstrap_vectors */
>         ldr     x1, =bootstrap_vectors
> 
> 

Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
lr, thus the second ret will only return to where the first ret jumped
to - endless loop. You would have to restore lr (x30) from x17 in
arch_entry first:

mov x30, x17
ret

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/35cddc35-a563-ca93-8e29-b9ae06844030%40siemens.com.
