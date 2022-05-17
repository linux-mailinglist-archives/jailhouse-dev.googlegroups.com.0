Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKEVR2KAMGQEAVO6SSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737652A0A9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 May 2022 13:44:41 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id s16-20020adfeb10000000b0020cc4e5e683sf4602739wrn.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 May 2022 04:44:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652787881; cv=pass;
        d=google.com; s=arc-20160816;
        b=MubEMTRLhqswBnBpBUGz1IF2tJA23aDgb1NnFYrl95n0MsMVcMeEpdmu/Gn9koX5Ww
         TAmINmrEDDLCoZZEzQEFUGEWt91+kK1pIC6sIdiQMdIQmPjiKXZbo34ysl5n/wPMxeFu
         DuQGncqzPRyRdAjESFKrsMIhopLDE5AlSK4imXWjGhIrpL/cqriJzS9kC5XlX6DbmyiH
         vh3w4bcT7fgNQ00TZmJGd8Vfp3dKdp5cqyr/aLJxBZ/hMaNcuSetWFc0WD5pPJMEIi3j
         IZY1zbqr36fnsRLi/+rmhM/jBfaxs7qD+9JNlxLttDaa9V/WqxsqreQi722Pq1wak5FN
         cHbw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=yEuWsVThZJRHZb8Y5o31jYwKOjFqSNKxFNOhkoTAdqk=;
        b=F3iQAtJ/IfQ7t3/KNHLnITH6WSi0sq1E63pB9PZYtSd0K7kI9GYURSAlIxAlo4kMnc
         cC72VxAgzrutDm3srRtqjIMzCv3PFb5fYZ1MALWpfPcOFptBuWTDtG5mU6RtnXU9tM32
         qCle+8jmJUaBiV5jeIfNzhg7bO6RDMBN+XN/olxK2KMaefrJvtZCVGHEvpi2nUXd3Q8/
         /MvxNe9A7EoOS+cHTUE3In6UpGuoUL4VtkMyUSmfAh53Qt4E74D7j88NKMoLhZdi0TVP
         p9at0fUZxWHoxpEMbNIikLwM11OlavhGL7PnMflZdHIA4+YQPNuvly3sl9/Qb73ZXCyW
         zVNA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=XvvA8wBw;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::600 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yEuWsVThZJRHZb8Y5o31jYwKOjFqSNKxFNOhkoTAdqk=;
        b=GgHk7/gK/gBoNz8I+181U3hJwOIYu7Ui8DLjbDV/EgDoPOTXz+yWs9zamIy8oK+AlN
         Kw5VWQhwwxobWowT0NIl98gB/mILil+WoLn+Y6cCZ2jPLinvRirVqojtmtoSWlXwuHWg
         GZ5lAKRk4OFL/tyoinlSbBNwN3NbId9FnIq1+keh4p0bXR0A6hXuY92zFVbpLqHZjQiM
         TF/UyVCOWxZIQrli/0T5It6Kh0/izd0i2S3pxOMGtdyf70zYYrf+C0jR7F69C5Qni6AT
         uYElAEr99b19f5coD7e1G0mxYiYk7w0ILYc3sUjon3QgP73f2+NFAZ3VWPkkcpRL6RYT
         rJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yEuWsVThZJRHZb8Y5o31jYwKOjFqSNKxFNOhkoTAdqk=;
        b=7yC9JOxmxTCHtMHgmHa8Y4rPHkVISd/vkM3o08B2mge1cPMNRoggylYhgkx5LnwriZ
         cHjhvkaedLvxT+foGC0t+aD1GWujeOOi50e3Ku/gDEqDSkoMJ7YXtMrfkoNoTL5Tq1TC
         ynvH6BY5nbSc6L0mPGIginSqC2Q2a0p3jWwhh91Am4ooe9sx0+HvSA6l6lrAAna4rUlU
         3Vb+7sEXKMKY15aKZKVL9s5WJfryp3LwfQmsXA7+C8axuZrz+9FdSKjuALolzmVnuRyT
         IhW1Uv75Y5MeBv59LH0ocCwCATWVjfiLDGOiCGSnaF/6FBmMI5fqUkUzSW+h64sFb5RY
         4RmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5315QLg6kXZgZt1MoGH18D1qCGvbT1u6UkVi/wKqx+omSLSUYikA
	AX7t+PV8MS0IWdxLQtIrJBw=
X-Google-Smtp-Source: ABdhPJy2FBB8GNI5s9jOLw3p2yBTU7eAA9qQ8T+TVoTw13ILpH5TK2TNKmPDTDDPS0xWw5K/MHjtKg==
X-Received: by 2002:a05:6000:1a8c:b0:20c:bd6b:ecaf with SMTP id f12-20020a0560001a8c00b0020cbd6becafmr18081605wry.341.1652787881038;
        Tue, 17 May 2022 04:44:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f0e:b0:396:fee5:f6f1 with SMTP id
 l14-20020a05600c4f0e00b00396fee5f6f1ls1117170wmq.1.gmail; Tue, 17 May 2022
 04:44:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4207:b0:395:c855:2aba with SMTP id x7-20020a05600c420700b00395c8552abamr21381658wmh.66.1652787879411;
        Tue, 17 May 2022 04:44:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652787879; cv=pass;
        d=google.com; s=arc-20160816;
        b=VEtbW15WunNjApmDD34zlisUeVxjT0mZyhbM636lz0pCi0m2h0uZpnpdkz5PKDaCTo
         k1LyCK1ALa1a3QIlOjFvP5qu5JjCATF2yMWBSbL+PjHV2YCSNnn9AbpxtlmYNC7GqZsy
         xHKQtVCftIAUSCCFnvzZHLuG5pG34Dq9WLQhRxTHyixljD6HN2r6HOD/emmM6z7nOtaU
         +NUGYTTyG/BKMazO45Gf7D0B3GbcbTlYeGa97d2oO9y/4tSLI6Jtq2dMlh0iCf7w5EvG
         yd6uEOCOitvn9gLq4r8R3Q1Ew3hZXp7kg9ws/oQyXsYtGQi1gh+fJJoCZnvCMKbbolSU
         cu+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IZow9vndfD8NYD7sOZnpE1hDfJCMctREBPDaNo6PegA=;
        b=TP8xeuATTxz3EjqDX3BVQw6fUqhMahecNDSsptcGh6MNOQ18KtAmczTki6wkjUdWWk
         34ZJgJIXWuVQRAaT2INpCntUPQeLWY/8V5w9ad+0Rcm5Z7lDZgsiinJs+aioP0jCgt4l
         LAcXhIYb58pXT9xDx/pJWu59ezCyDE4b2NikbdeVPW884lkLURvU1ih7Yi/UnHUaSi3S
         QhYkhvqjlyBtlVG7a7kNu0PafVoCyP8D9KdGR/35UnHcOJoyQ/DGuWVgQZM0Lhlm1zr8
         pLIPPjt/GkKoimFIYeTW7bui/FRXdOuoV0HjH8A9XMSaXEtKoS36pbFxriRUCxy0PK/s
         lvvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=XvvA8wBw;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::600 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0600.outbound.protection.outlook.com. [2a01:111:f400:fe0c::600])
        by gmr-mx.google.com with ESMTPS id a5-20020adfeec5000000b0020c7be5f931si557634wrp.8.2022.05.17.04.44.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 May 2022 04:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::600 as permitted sender) client-ip=2a01:111:f400:fe0c::600;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrkX+lXVL708zXmMh6CxhjtXBVbI7FyBqEf0pfebbADffx+aKb1jyV7jAKH5/CxM3Qy0zqiszBFKKpSIE4NG9fXOxrzWf3TMywx+9Gm/1bnyrLiUsdKOmcSJcDSbSizeI79V6gitkJcNUbN9B8sPrXoRKyJHdM65XA5bQY2vrpRsU+UpJ5STcslxDMp7zQFIXh+uiGEfRbTX1ZfziaWYAdPvTCrCY+BpgoJYyV55Pv/QcqyhloOfL/2LRkcA2VGEcZnVdi/PWgW5XE1XYOAOT9ZQZP9Hsov0dRtV0HqD/6C5Q6CskzpWNjHoql2qQQHy9t7Kxr5/+FiDNTmB3p/P8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZow9vndfD8NYD7sOZnpE1hDfJCMctREBPDaNo6PegA=;
 b=DPaZc2G33TlzcN1nWmb3txoFhKjSLWPkBtE9/qtK14dqg0sDbemgVMrkZue6d85J1kGzyt/DvAbM7djAORul4i412JjP98ad/UtSIAeeYZLnjCrqNVFNMadG1HYlnnrqmxQJc5SaTtfJ1G+Czwd8i8fYxAG4JeZUU9ajA9VCHoEty0p8Hi+76/VQFD+nWWTH/Cq/StYmlSYLLvrHpR6SSfhayrH01u7extzLcB7fItOGJqkBAfMgEJ89n98qLWaL2a0Q0CqaP0Ml4XEooxvqXvN6jVijt6bEt/tWGIvPZXVyzq3naQqavJb6nVDUF2b6tVu6FVBUd0wVaYSm61hH7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::22)
 by PR3PR10MB4063.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 11:44:38 +0000
Received: from VE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:21b:cafe::43) by AM8P251CA0017.outlook.office365.com
 (2603:10a6:20b:21b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Tue, 17 May 2022 11:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT032.mail.protection.outlook.com (10.152.2.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 11:44:37 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Tue, 17 May 2022 13:44:36 +0200
Received: from [167.87.33.29] (167.87.33.29) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Tue, 17 May
 2022 13:44:36 +0200
Message-ID: <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com>
Date: Tue, 17 May 2022 13:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
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
 <8e895901-cd60-9696-935a-293245586a77@siemens.com>
 <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.33.29]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.521900-8.000000
X-TMASE-MatchedRID: odSQQebQng05QaOxwNGfvo9bHfxDWoibUlQrLabIzZN08zy97KsgJsRJ
	LE/FNr2DY4zJvUjGrxXioAGxQy4eNYLPV37BrMJjp1g3Gnmqog5mC5UkZj+/T/go8BKl9ae5AQ8
	mtiWx//qZHfpKN1YMZfVPDFRnPwE4ULd14sEtBkF6/Ws1m/D19VVecXIb1FSr0MohG+IQ2sfx6P
	TcDxSp5QWqvFWg3Xg6gm7WCykPm9R55ynAVG2b6A092JK4Ug5YcFR5Op/4/wRT2G3xw+NXjthQO
	8CvZj/XCXjDiV/HPZztOa5rI8bsUFm9RBQ+WJcuNQCs8d6D0K369udj0zppv5GzIhDiMWXrjlRp
	8uau9oaXbcZfsC7t1LMeapFjC2iRg+KYTANwVp0wflweu99/zHrSP9RtGZYomS4eyDF9QUdoqrV
	iHDnSO6Rea8wUAdQ6Hb9zBU4IqPHSe7fNpJWzjU+oHek5MFSPeKZAID3hHVYRBjzsfzCd+X1gZ5
	8HZuyTQS//wyolXM5PT/REbnZuzjPMfhWOlpqCtaq95lOCxV/n5akZ7P+qqDXKFtsDtZ7TLozI+
	rhNYbm2zFWqrVN4BV43rBTndKTO4vM1YF6AJbZFi+KwZZttL7ew1twePJJB3QfwsVk0UbtuRXh7
	bFKB7qpATC6DGP/KTkJ2P5N1fw840fxT+sxFPVjdJjbuFkauSwwcGKLTYEc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.521900-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 5748977D84B58F2807C4D8C6773825B4C2D68212435A46AEAE408234164407D52000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 040ef425-bbf3-446b-183a-08da37fa9f38
X-MS-TrafficTypeDiagnostic: PR3PR10MB4063:EE_
X-Microsoft-Antispam-PRVS: <PR3PR10MB40638BF22D37C72399CA9FE095CE9@PR3PR10MB4063.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mlFEmYZGpxmEX5bHxTsQ8AC3lDXOFiM1aAUsfvnb1KzE15VcIMvTQWuEKVsr7cvtC0GhhoRSd9RX7aH/m08MEBJ5k8yfFiqXWsO8xUsZeprxAEnaCo7CT6FyOJFaVW1iRfnXesYsNMeLP9kePXI1JgofGDLxF48jeQMyyepdXBt+n77aLP13FuXZWzJCbT/6BM9+piwkTc7EaEt9KAAJjd8zuwXsNtZG5vVio7CJLRmDTNWQKdDMfY+ZtSC3VylDK5WgmXsP7pyZ0Hz9h2KBkH/iF1GBsp8isJLATgMTT7u9XDySLkqEsp0TwSTIJjxpNVE82zT1tH8eunf1bx/XEY3xqbk+sCeCgBAa6Tcx5uoCmSXoxFEEAU9Im6QIX1OGSyqY+wwcjAOR9tmv1aWNR9zBwBYTce3aVuzfaGKDqt0D1ikF8pHqxX6IKWMkqApemxUUl40/e2yz32ixXAqC6vIDLNcg4atXzcSsWgyTY3Ygbs6QBwjmAvohh2RwXw/1byeh//ivQ/aAxItLYkkvUD0CFbhNw5mg/kPytoLXibBMrwjf9/wW+cmBbAVu7/ByCRpoDzRfmey4Hm/Vw3XG5za/wHF5RYiUl03QuQKiLkwkYCeODuMJ0hYmVa8skdSkmWm0hlD7QsLJvsYOdV96uFzT4eTF8ZqofXNkkpBtpsIYrEMMetZlAsZCzQAmYyZgwjaB9SFVWgGvJouMaeI8wsnuz9clP5HRzVcXeVR9+lJzjdk0/wi7S2mLsqa8ygb4uaQ1kOnthPTC9v1uH4ySw==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(956004)(2616005)(53546011)(186003)(26005)(36756003)(16526019)(83380400001)(508600001)(16576012)(31686004)(5660300002)(44832011)(8936002)(8676002)(86362001)(81166007)(2906002)(40460700003)(4326008)(31696002)(36860700001)(70206006)(70586007)(82960400001)(356005)(82310400005)(316002)(6916009)(336012)(47076005)(6706004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 11:44:37.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040ef425-bbf3-446b-183a-08da37fa9f38
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4063
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=XvvA8wBw;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0c::600 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 16.05.22 20:01, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Mon, May 16, 2022 at 6:57 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 13.05.22 18:28, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Fri, May 13, 2022 at 4:33 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 13.05.22 17:20, Lad, Prabhakar wrote:
>>>>> On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 13.05.22 13:32, Lad, Prabhakar wrote:
>>>>>>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
>>>>>>>> actually crashing on hvc in arch_entry, and that because of Linux not
>>>>>>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
>>>>>>>>
>>>>>>>> Could you share the boot log of the kernel?
>>>>>>>>
>>>>>>> Attached is the complete log.
>>>>>>>
>>>>>>
>>>>>> "CPU: All CPU(s) started at EL1"
>>>>>>
>>>>>> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
>>>>>>
>>>>> Argh my bad, I've now enabled it to start in EL2 mode (attached are
>>>>> the complete logs). Now I see the below panic,
>>>>>
>>>>> [   33.920507] jailhouse: loading out-of-tree module taints kernel.
>>>>> Reading configuration set:
>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>> Overlapping memory regions inside cell: None
>>>>> Overlapping memory regions with hypervisor: None
>>>>> Missing resource interceptions for architecture arm64: None
>>>>> [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
>>>>> code 0x5a000000 -- HVC (AArch64)
>>
>> "HVC instruction execution in AArch64 state, when HVC is not disabled",
>> origin: EL2 (hypervisor mode).
>>
>> Is KVM off again when you start Jailhouse here? Does the CPU support VHE
>> (Virtualization Host Extension)? Is CONFIG_ARM64_VHE enabled? Try to
>> turn that off.
>>
> KVM was OFF, I have enabled both CONFIG_VIRTUALIZATION and CONFIG_KVM
> (I have attached the complete kernel config). Yes the CPU does have
> VHE support. I did it by disabling CONFIG_ARM64_VHE which did not make
> any difference.
> 
> With the VHE disable now I get the below output:
> root@smarc-rzg2l:~# dmesg | grep -i kvm
> [    0.095927] kvm [1]: IPA Size Limit: 40 bits
> [    0.096895] kvm [1]: GICv3: no GICV resource entry
> [    0.096916] kvm [1]: disabling GICv2 emulation
> [    0.096949] kvm [1]: GIC system register CPU interface enabled
> [    0.097045] kvm [1]: vgic interrupt IRQ9
> [    0.097156] kvm [1]: Hyp mode initialized successfully
> root@smarc-rzg2l:~#
> 
> Now with the above configs I don't get any output on the console when
> the root cell is enabled:
> 
> root@smarc-rzg2l:~# sh -x ./hyp.sh
> + insmod jailhouse.ko
> [   35.379219] jailhouse: loading out-of-tree module taints kernel.
> + jailhouse config check -a arm64 renesas-r9a07g054l2.cell
> Reading configuration set:
>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing resource interceptions for architecture arm64: None
> + jailhouse enable renesas-r9a07g054l2.cell
> [   36.217465] obcode @arm_dcaches_flush: d53b0024
> [   36.217469] obcode @arm_dcaches_flush: d53b0024
> 
> Any pointers on debugging this further, has anyone tried jailhouse on
> Cortex-A55 before?

Hmm, at least not I so far. Might be the point that we are missing some
subtle difference here around the way the setup works then.

In any case, the fact that at least the previous crash is gone indicates
that something changed. You could check if you reach now the second hvc
by adding a ret in front of it. If you, you may end up in hyp mode,
maybe just not have a working UART yet (is the model you have on the
board in principle already supported by Jailhouse?), run into a
different issue, but just don't see Jailhouse report of it.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/234b1a2d-ea25-e38c-5053-eea15f57b933%40siemens.com.
