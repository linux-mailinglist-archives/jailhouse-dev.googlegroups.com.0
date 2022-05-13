Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMVY7CJQMGQEUBYEJPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D8525DCD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 10:52:04 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id s3-20020aca5e03000000b0032297c4e2a5sf2556172oib.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 01:52:04 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652431922; cv=pass;
        d=google.com; s=arc-20160816;
        b=F/ba1RIUHXos4GSJDUy/J7tMlXED0K+QpIk4t4b0D8tuPWuzs+SPO3ceCWa151MHZ9
         7k6QSI0F9jthod/fwWbcx1j/6v8u1XTfxCvJObALEsKHLEbsLQnolNq7lQJqi88qK6nl
         H46SIRfc0CX6pT5sDNXpojvCOLU9ltISzmnTAMbWK67JVKLfpOHGo9gSP7236OrQYHfr
         rWW4b6mOLl/hnUHsK2nhumJHDshjP5JXT8VK5S5R3MnlYN2jMUeURWlAwFZVQzQeFEvS
         kyAblJd958uVc4OSvYXWUh/1HiIfJovzEhIpJSaSY7HAPaYzNW6K6vd8MW+XYFZ+ccm6
         q7cg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=bQrQlC2xjSpvhSJSaScaUVjCR55JbLK3LPDM4bDUZw4=;
        b=Y36KpRJxnxtoYRIshGHaOnr0owzKh5q6hDCfqJgGrQ/IFl/BbtdaNnY2wjhXHRDvv6
         v2M505z4Pa3RY9yJXEU2gRj2XDjX4Uh9yC8fXulePi6To4ndEr04DLum8MMRO012cZPd
         02RtFaxnPrOavw2HPl1imlyhxDK3MGtP/aSBpD8QSjSV1F66zop5MnFEv6jfLmGWEoue
         jyPCWoWiFhz1RoWNQEEGp9O87yJXouQXxuwL5ShZV+OQd9cfWjgMsaub/ZeUSHwCoj3R
         teYEoEf9nHr7kLQAY3NfshlDIFgASPaCqTyhmcHE9cTXFA0+d0iqzQSBiJKJGSiF2VBF
         T7Mw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=m2k1tm97;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::62e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bQrQlC2xjSpvhSJSaScaUVjCR55JbLK3LPDM4bDUZw4=;
        b=rHmI1wR9buKucvMbKbD61ox42HWR67o1zXy85JW+atcS/whzEspgyeqQgl/TbChVDI
         oNIjtqjfe+XwBepHPOG7SOLIA7o3vxRysMZcJ6uhyGYavOSi7sDyyOIO+8mKEFDD4Nmb
         waElP2DrxKnthYCWYmhbrSztilXyB3YAOFMOjpg3FfcPs54RbvjmOw5MLVyKBTBPfRtH
         1xxlhWG3GLjAv2zM2hKGY9DKqo9FbIX/Y/frcOulLi4AwyPidvwwKgr1fjyVuw2hktzm
         kN2ANvxPt2o8zCXS48f43PVWnCpb/eYRLoCLh+QcLOltG5Yf/C9+zi+mJ0k1OWCDeuwd
         wBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bQrQlC2xjSpvhSJSaScaUVjCR55JbLK3LPDM4bDUZw4=;
        b=4GoxDVDSf4JpzcA3gfTufwObClleaIZZ0utET8ytnYPNlTxuPA0749I/jilo5daKR8
         RlbDSpVITOlwmZDDd9cQc0b51NHGaQDDHirxQXApGJ94qg+xpWvGav358FuxBQ0JsNEN
         sL4SaAJJiNrILPvR76/Y6tafj3srPMUWYlyFy/sIiaO7R2ISdsj9nvLyj42nGZGG0kVE
         BPXzrScnDTv/yEM5iirgQj9nTY+jHmAhLsikw2Rh5Y0NTJThd/VvNVzkP5NDr/bfAnTP
         8a6XNGG31mjAJ9gAvCWnRiYLY58jGgJmm+WEw+PGoymhPHK9LUQvMW5h774cXn68PnL9
         zUvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530AnPe0SpCsBoLCW1E2GnXuGLmzEAsZ73e6fCfYPlpbojQRht/a
	Qhe4Az6Z7eBUenhnSrV1PKk=
X-Google-Smtp-Source: ABdhPJwi7ugVhmo2TPkTbskd77rOWk8xKOAkA1OQx1QS8DYtlvFW0gjQC03cvSR2zofrbZ+TjoNTIA==
X-Received: by 2002:a05:6808:118d:b0:2f9:ee54:8d05 with SMTP id j13-20020a056808118d00b002f9ee548d05mr7204896oil.273.1652431922685;
        Fri, 13 May 2022 01:52:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:3c0d:b0:ee:1085:401e with SMTP id
 gk13-20020a0568703c0d00b000ee1085401els3224000oab.1.gmail; Fri, 13 May 2022
 01:52:01 -0700 (PDT)
X-Received: by 2002:a05:6870:fba4:b0:ed:509b:8a33 with SMTP id kv36-20020a056870fba400b000ed509b8a33mr7628021oab.123.1652431921886;
        Fri, 13 May 2022 01:52:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652431921; cv=pass;
        d=google.com; s=arc-20160816;
        b=VopTXLvLQ1fc3zsSVj5OrXdF4+eIHvlL1gLfRu55NfXXhxX41PHRZQMV2xUAnuX+f8
         KrTSjsZI9qWEhIY4UohU2vzQHCPACCMMK+qBtnvM7J+21H6+VnRPDG+34EZRoDTd/hKX
         KSfCGKl1eYEs7DLErIuuSrtzYWg97V/oxWFKlNvwsMD1Hoz/1eeSPANxHQQ4nW93MuGC
         tznDRhIEWdIEmROKVkW2ZLKw8J51P9yIVZtPQ79uYMMXYWMchZVhJwYv4IjDu4wnE0kK
         PGaKgdw0b6w771q0GMfg1gRplF6Q8D2+JuMXTRgIgIf3BittRAUoaFR3sZf/+/yKH7zA
         U4dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YcmqtfWSyoGXU5fRLqzMmTaTaIXHfVNJzoKN1ubeyZ8=;
        b=iR8DNgk80/UdkC2y+uvoUc2I9HvuxZ+x2sCuX1C4IEYoBgA/FsDKUnHxsYWQzlZmql
         zn0Iu2NBuxBARxS3EUpTFgxMAAHVkBv+rqor/cK+eEMQ4GBnXj0cKgTLZGGrBASHa8Om
         OfQVHSi1P0SCvkqIv1ISUGAmV9C6Eji/+L7azIhiEaYMPrlBvbwJ42lYd64pw2pIHHyF
         3Gbzgny5xlWfv3W/VwVwtoFcVe/eEKP3OMKB2uH1yBeuOm1BKxi1FUSm+w/oxyAeE/BP
         6l/KuAIgoae24ctiXnG8ffoRGkEuvNyA/V9DAkas/FKqcDdqxMCWRXBZHXJ5aV5h7I+j
         zY8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=m2k1tm97;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::62e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on062e.outbound.protection.outlook.com. [2a01:111:f400:fe1f::62e])
        by gmr-mx.google.com with ESMTPS id 50-20020a9d0335000000b0060636b690e3si163675otv.1.2022.05.13.01.52.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 May 2022 01:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::62e as permitted sender) client-ip=2a01:111:f400:fe1f::62e;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAiK8itjhlhQ/MH3vo/15/e7KhIuKv8xv0QA2brrNJrUHXrXZZcpQGD/m5EocgG8AC4Hqv19lbKgo1p0Jk3tx3BXYa7VK1kvuhavQjwI2lTo4/u1ehQ+oauCK19Yl9KFkS8vfrdo7ywrJvf9Cj27Cxt180d764A9CxjhMK6RI1vuUjoKIxESHOwtgxOLMFaup8nZF7glwXXrIFulbwVT2hlve7eaXtaoIVV9h4UvuXYTyz/jNwukVvtSfsS55SONiX+ey9Vfa/No6AUW/T4jolyCfB3rszRIbFFwlqIdLokc0LcRmOXaewRI7NZUta6pwMakg3ZhtslCAp6IgrHwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcmqtfWSyoGXU5fRLqzMmTaTaIXHfVNJzoKN1ubeyZ8=;
 b=PrzoN7N/ZAgMqndlo4YUJOKJXs4f4q3wzLVU9Iitn4FAr3otp7lqDg1hwFV0/QgRI4mATMkMn2d3uIULtqOtbXp3k4JZCrfPoX9SpOl3Gb07n0Yec4XOf2UlNExy4vZdCQtmX5KbTdWcWWCk0q1iDPehdZpDZ+xyKQxPmof3Q9/ekMhXMKI7NP3+mxqen0PYwMEgP90CUKePHXsmBmkgOgnT9vfhjaux0RNhrv/YqnI1fK2btHt7qXzB5ICVXDBVFca89Wh/VWH1CpFK2uOsFxnOR4mar4Y+S5h4MWap6FsRVDUZxJDTyj8dQJDwpXouHDEbhSLDN/YLTZ5iR7NEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::17)
 by VI1PR10MB2157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:86::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 08:51:58 +0000
Received: from DB5EUR01FT066.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::e0) by DU2P251CA0013.outlook.office365.com
 (2603:10a6:10:230::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15 via Frontend
 Transport; Fri, 13 May 2022 08:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT066.mail.protection.outlook.com (10.152.4.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 08:51:58 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 10:51:58 +0200
Received: from [139.22.104.221] (139.22.104.221) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 10:51:57 +0200
Message-ID: <e0aaf1b9-700d-ba22-270d-049ac10be44c@siemens.com>
Date: Fri, 13 May 2022 10:51:57 +0200
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
 <a866cda9-fa1c-3033-3cc9-b0762b0ae6b5@siemens.com>
 <CA+V-a8uh_mJNrN8R8cHb+MwTG1=DPyjy3kEOwfozRdOL+jz3zw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8uh_mJNrN8R8cHb+MwTG1=DPyjy3kEOwfozRdOL+jz3zw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.104.221]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.914100-8.000000
X-TMASE-MatchedRID: BT/GoH6jIcY5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tTCL8RFER/j9Myyi
	+n+H050RCOwdkP3NVeYAX1zFjEwVo9LPdQhgZ/lh1GpI2Wh7mMa72LzVxTKQURW4LR41Fi8lSMd
	QR/r3EeR6RHdVK85hV2NlrEE6OjjT+q6H5pp3fffQrOflXxFuVpY+rDpJtqXuGECTbIgjb5sVwP
	MKjZm1aKXNybanokTxc7TE9SuU5smvSD3/eM+8LTIDCR7KoHhIy3ARqB9bsbB89GKHo03nbDvsJ
	EJ3LgvOnYh8o5mXik/0etkVHtq/8aUiTYmfzyKd3ZNwOPBqrYAM0/G7XUdeOEsxw9kf3dvEYj0z
	DHPzJp3unRG7yMq8UQyMOxzPzlhV2xMFrvDMyRwsZhPVDrsSPm0GdS2zsXWJUXYcPwQc2nLPSJu
	5jov2bWXfwzppZ8SOK5fhRxt1aAA41sIOnMj8YdFnFuhtKX0KGnquim0WHzpyEWs4H2RqcP6OWz
	RxLAk7Zk7gsuflVKvK0M8RWx8ZT3mzd9ajBAw0xuauhSu97OePGAeSn124KDaBf8SaPLVKMNYCH
	b1Hda8ca4/Pkh8NeoKCKkeJEujnMHjwPRUnk8IkzFuWakGuiu2g4HrKjPnvKUR83BvqIt4oSd18
	bdmwJlA5sW5MqCJ0Xi3Ny3q/8YOP2jGZIlPmqRk6XtYogiau9c69BWUTGwRjjVhf+j/wpKdDgyP
	Bo71yq2rl3dzGQ1Ud9zxWFpGU2F3iasxXYXLLuUxaX9ADylPDUbo4ia2wk1RdfJFPDtKw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.914100-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: ED9D7C4A80DE710E6F6A3C590443A555CD8EC40D75BB142269D4A3F5837F15F22000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8fb0f13-500f-495f-b850-08da34bdd6f4
X-MS-TrafficTypeDiagnostic: VI1PR10MB2157:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB2157AFB357B5B1E43BC5F93195CA9@VI1PR10MB2157.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cjqpnDxQKQbDFJcozaQIFb+5v2Oo1xR9nErKm7UvmFGIlMIl3UZGqPpvZQoDx87ZcwdFzlNhCMCsj+9eJw5VkevXHEZZK4XDtcGPwUzuP01YBssDqhz7R+TLTMDWsw3EdWrguozr6+x3mmsMcPi5xPMzEdC/6YhWgYd2pSJOtqHnGhWLICzMyCGOMK+ZwEtMn7glaukpn1E70lEaNOxxN97CqzNKEk3ZUO9RymZOHh6Cbm/Rou9yN1eMQoYE/bvtSphndCc5u8Hs9aCc1om+Vr4lvOBVWdmOhbsMjNTem/2nNAkPRm9zxVKPS73ns8By9y+56NLwY9SEuvsz3A1AAH9OTrK+DrGPDadaHjLttSCeDYaCMcvashdUBJ2vq260nmN0pUxrRMnyGzL5mJcNm8DQqYuUguk3C9gzEMl56PzJsZElrGlUCC0HIDvZ7p3DC1oMxN/WjSt2L68xmwwjN2KAvIA4PpVccvGhjWAyRWf/bXW2FZ8TkAJzoUUoN2smJvmDYCzS5rVUGF02mcTFw+7yK4NrYDVfdyqcJIIk3jzxJd+jWdGWRH+X1/8OTvX+MJgFoKgFzIymCblZ1DfHsGexgyIya8CDQFDv6atGdHsVlTkSfn6DXuJ7efSSA8Y1166D5DFzlKoI1+uK0Om3XhWZLOTqpJCyPPHqQ354t7ny1NbsjVBfXO6ubYGKbvJYDJ0rcgIT6l5CZcufYc7FJc6b2UVYEJ32UpDz186Pdp7gwoeMqlpLrQF8Fm//5YDYQQ6llJYzwJUa9TTRqfBdCf7CxcyvN5b+YaTMt/G7IM1avx3HSirfL6GBEHn4w980Ev8myi7XoCxC6gYAcbsA7ziE3p39PQaspEL3Wyq+L8=
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(30864003)(44832011)(966005)(16576012)(82310400005)(81166007)(356005)(82960400001)(26005)(6706004)(6916009)(2906002)(31686004)(53546011)(186003)(2616005)(956004)(16526019)(36756003)(316002)(5660300002)(47076005)(36860700001)(336012)(508600001)(83380400001)(40460700003)(31696002)(86362001)(4326008)(8676002)(70206006)(70586007)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 08:51:58.5353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fb0f13-500f-495f-b850-08da34bdd6f4
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT066.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2157
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=m2k1tm97;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe1f::62e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 13.05.22 09:31, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Thu, May 12, 2022 at 6:05 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 12.05.22 13:37, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 12.05.22 13:06, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 12.05.22 09:01, Lad, Prabhakar wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>
>>>>>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
>>>>>>>>> Hi Jan,
>>>>>>>>>
>>>>>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
>>>>>>>>>>> To add further more details:
>>>>>>>>>>>
>>>>>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
>>>>>>>>>>> for jailhouse [1].
>>>>>>>>>>>
>>>>>>>>>>> I added some debug prints and I see the panic is caused when entry()
>>>>>>>>>>> function is called (in enter_hypervisor). The entry function lands into
>>>>>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
>>>>>>>>>>> instruction is causing this issue.
>>>>>>>>>>
>>>>>>>>>> So, already the first instruction in the loaded hypervisor binary is not
>>>>>>>>>> executable? That would explain why we see no hypervisor output at all.
>>>>>>>>>>
>>>>>>>>> To clarify when the hypervisor is loaded the output will be via
>>>>>>>>> debug_console specified in the root cell config?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Correct - if you reach entry() in setup.c.
>>>>>>>>
>>>>>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
>>>>>>>>>> e.g.)?
>>>>>>>>>>
>>>>>>>>> Yes I have the below memory reserved in my dts:
>>>>>>>>>
>>>>>>>>>     memory@48000000 {
>>>>>>>>>         device_type = "memory";
>>>>>>>>>         /* first 128MB is reserved for secure area. */
>>>>>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
>>>>>>>>>     };
>>>>>>>>>
>>>>>>>>>     reserved-memory {
>>>>>>>>>         #address-cells = <2>;
>>>>>>>>>         #size-cells = <2>;
>>>>>>>>>         ranges;
>>>>>>>>>
>>>>>>>>>         jh_inmate@a7f00000 {
>>>>>>>>>             status = "okay";
>>>>>>>>>             no-map;
>>>>>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
>>>>>>>>>         };
>>>>>>>>>
>>>>>>>>>         jailhouse: jailhouse@b6f00000 {
>>>>>>>>>             status = "okay";
>>>>>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
>>>>>>>>>             no-map;
>>>>>>>>>         };
>>>>>>>>>     };
>>>>>>>>>
>>>>>>>>> Linux does report the hole in RAM:
>>>>>>>>>
>>>>>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
>>>>>>>>> 48000000-a7efffff : System RAM
>>>>>>>>> b7f00000-bfffffff : System RAM
>>>>>>>>>
>>>>>>>>> And below is my root cell config related to hypervisor memory:
>>>>>>>>>
>>>>>>>>>         .hypervisor_memory = {
>>>>>>>>>             .phys_start = 0xb6f00000,
>>>>>>>>>             .size =       0x1000000,
>>>>>>>>>         },
>>>>>>>>>
>>>>>>>>> Is there anything obvious I have missed above?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Nothing obvious to me so far.
>>>>>>>>
>>>>>>>> So, is this really the first instruction in
>>>>>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
>>>>>>>> Check the reported address by Linux against the disassembly of the
>>>>>>>> hypervisor. You could also play with adding 'ret' as first instruction,
>>>>>>>> to check if that returns without a crash.
>>>>>>>>
>>>>>>> I did play around with ret, below is my observation:
>>>>>>>
>>>>>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
>>>>>>> returned without a crash. Adding a ret at line 99 [1] ie after
>>>>>>> arm_dcaches_flush it never returned.
>>>>>>>
>>>>>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
>>>>>>> first statement in arm_dcaches_flush and was able to see the panic!
>>>>>>
>>>>>> Which Jailhouse revision are you building? Already disassembled
>>>>>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
>>>>>> have here for next:
>>>>>>
>>>>> I'm using the next branch too.
>>>>>
>>>>>> 0000ffffc0203efc <arm_dcaches_flush>:
>>>>>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
>>>>>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
>>>>>>     ...
>>>>>>
>>>>>> 0000ffffc0204800 <arch_entry>:
>>>>>>     ffffc0204800:       aa0003f0        mov     x16, x0
>>>>>>     ffffc0204804:       aa1e03f1        mov     x17, x30
>>>>>>     ...
>>>>>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
>>>>>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
>>>>>>
>>>>>> You could check if there is such a relative call in your case as well.
>>>>> yes it does exist, below is the snippet:
>>>>>
>>>>> 0000ffffc0204000 <arch_entry>:
>>>>>     ffffc0204000:    aa0003f0     mov    x16, x0
>>>>>     ffffc0204004:    aa1e03f1     mov    x17, x30
>>>>>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
>>>>>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
>>>>>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
>>>>>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
>>>>>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
>>>>>     ffffc020401c:    d2880003     mov    x3, #0x4000
>>>>>  // #16384
>>>>>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
>>>>>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
>>>>>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
>>>>>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
>>>>>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
>>>>>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
>>>>>     ffffc0204038:    8b0101ef     add    x15, x15, x1
>>>>>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
>>>>>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
>>>>>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
>>>>>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
>>>>>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
>>>>>     ffffc0204050:    8b0b0021     add    x1, x1, x11
>>>>>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
>>>>>     ffffc0204058:    f100025f     cmp    x18, #0x0
>>>>>     ffffc020405c:    54000041     b.ne    ffffc0204064
>>>>> <arch_entry+0x64>  // b.any
>>>>>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
>>>>>     ffffc0204064:    d4000002     hvc    #0x0
>>>>>     ffffc0204068:    d4000002     hvc    #0x0
>>>>>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
>>>>>
>>>>>> Then you could check, before jumping into arch_entry from the
>>>>>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
>>>>>> as expected. But maybe already the building injects an issue here.
>>>>>>
>>>>> Any pointers on how I could do that?
>>>>>
>>>>
>>>> arm_dcaches_flush is loaded at arch_entry (header->entry +
>>>> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
>>>> what is in your hypervisor.o (likely also d53b0024).
>>>>
>>>> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
>>>> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
>>>> see if that code, specifically dcache_line_size, causes trouble outside
>>>> of Jailhouse as well, maybe as inline assembly in the driver module.
>>>>
>>>
>>> With the below ret added, I get "JAILHOUSE_ENABLE: Success"
>>>
>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
>>> index a9cabf7f..4e98b292 100644
>>> --- a/hypervisor/arch/arm64/entry.S
>>> +++ b/hypervisor/arch/arm64/entry.S
>>> @@ -96,6 +96,7 @@ arch_entry:
>>>          */
>>>         ldr     x1, [x0, #HEADER_CORE_SIZE]
>>>         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
>>> +       ret
>>>         bl      arm_dcaches_flush
>>>
>>>         /* install bootstrap_vectors */
>>>
>>> Now when I undo the above and do the below, Im seeing a panic:
>>>
>>> diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
>>> index 39dad4af..ce29b8e8 100644
>>> --- a/hypervisor/arch/arm64/caches.S
>>> +++ b/hypervisor/arch/arm64/caches.S
>>> @@ -40,6 +40,7 @@
>>>   */
>>>         .global arm_dcaches_flush
>>>  arm_dcaches_flush:
>>> +       ret
>>>         dcache_line_size x3, x4
>>>         add     x1, x0, x1
>>>         sub     x4, x3, #1
>>>
>>> Issue is seen even without dcache_line_size being called. Does that
>>> mean we are not landing in arm_dcaches_flush?
>>
>> Likely. I've never seen such an effect.
>>
>> If you look the reported fault address, when making it relative
>> (subtract hypervisor_mem), is that arm_dcaches_flush (relative to
>> arch_entry)?
>>
> Could you please elaborate on it more. I moved the cache.S code in
> entry.S  file but still seeing the same issue.


$ aarch64-linux-gnu-objdump -x hypervisor/hypervisor.o | \
  grep "arch_entry\|arm_dcaches_flush"
0000ffffc0203efc g       .text  0000000000000000 arm_dcaches_flush
0000ffffc0204800 g       .text  0000000000000000 arch_entry

-> delta of 0x904 here

diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..cb197d77 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -246,6 +246,8 @@ static void enter_hypervisor(void *info)
 
 	entry = header->entry + (unsigned long) hypervisor_mem;
 
+	printk("obcode @arm_dcaches_flush: %08x\n", *(u32 *)(entry - 0x904));
+
 	if (cpu < header->max_cpus)
 		/* either returns 0 or the same error code across all CPUs */
 		err = entry(cpu);


Untested, though.

> 
> In some of the reference platforms LPAE is enabled in the u-boot. Is
> that a strict requirement? Also in the requirement section it's

LPAE is 32-bit arm, your are on 64-bit, no?

> mentioned "Linux is started in HYP mode" does that mean Before loading
> the jailhouse the Linux should be running on EL2? Also to be sure, do
> we need any special configs enabled in TF-A at all?

You need Linux to start in HYP mode so that Linux installs a stub that
KVM (when not using Jailhouse) and Jailhouse can use to take over the
hypervisor role. But your init crashes before arch_entry is able to
issue the related hvc instructions.

TF-A needs to be there in order to have PSCI. Special settings are 
usually only related to SDEI, which is optional.

> 
> Fyi, I am using arm64_defconfig_5.10 [0] (+ additional configs to
> enable my platform) to build the Linux kernel, should these configs be
> sufficient for Jailhouse?

Yes, at least for the various targets we cover with this so far.

Jan

> 
> [0] https://github.com/siemens/jailhouse-images/blob/next/recipes-kernel/linux/files/arm64_defconfig_5.10
> 
> Cheers,
> Prabhakar


-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0aaf1b9-700d-ba22-270d-049ac10be44c%40siemens.com.
