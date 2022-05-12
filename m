Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD566KJQMGQEQR3ZX5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 328EF52451E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 07:45:52 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id s29-20020a50ab1d000000b00427e495f00csf2500572edc.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 22:45:52 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652334352; cv=pass;
        d=google.com; s=arc-20160816;
        b=L6C+PzZ96XPT9vhKc0XKozMLoP7zua2HEo49WmpqD9ofvRhHWdjyvgdM0yHR6fn3Wb
         0InKo39tQoKjKiaRk7Z9OOSnYworDq0f/ilFKkjiFq3VRMCGQIzGvcpWWD7Jl79QuLDz
         Cfexr10bPWDAWC9YmxrBNHvGN51+iUGrDrNJtk7QcqMvx0t9EZpJ6fMPgy6weCMPruUv
         9qTvL3/dP6JWizuafKe8oWJTOOZetWb6bBPEzAhU0GCrU5/B0zNExApeC/jWKUf5lX95
         6NDjR0kI/xvfZgvfMxF+e7HX1uDEItCMqd0g5gkDp3zORXtk4gq/H6ppQlHH0HasxTQV
         gW0A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=9A3iQiBjBjiQVlRsQjpUE2whGRmJ/FPb81yAfBO48WU=;
        b=Jp9BhfQhmVrWdJWyU3NzB98TLn82XM9kRhKI6luHyVfl1cpG5S6yE8zUA/6qpf5pxA
         4NzrjkdIPDo3MWPSghgQsQoK6SVRuWWWCORDJSx5AaxS0NfdcQD2KYatdp37vKDMF3EK
         wxl/kyBVUW1tFL5WF+gN52ElCGItzlg2itWSrkOn17lDqotSrKPvzGNHyLP1Cw+G12q4
         5KXR1Cylc/OvmGlLqMXweolIJ7D060bPQ1pOZeuaVs0oGgBKK+rPYRp9ktBSX8xKiBky
         GsypXR2ff6fY0BEbAzlvvsHLVDPREbAqATmP+pyAFOhuc9W6u+VR4foOleGHEa14qVZI
         Tdaw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ljOsXsZ6;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::629 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9A3iQiBjBjiQVlRsQjpUE2whGRmJ/FPb81yAfBO48WU=;
        b=Th2qBNYbrCETg3XkAnNjrK54TFcITBHCjmpQIvEfsXAG6FAhLxQj9lBrrFnlhZ4uxT
         WdyR2lTUf92uWijcTfW0vcFqpVa3Ej+zzwlASRBduNM4arX09yxQni70B8M8WMTOqlPi
         idiKV7GEXTBZwGN6md+5JL62ovAAVxdC8/SLBoecVSVaRxhBTe2z40jCBNdtMwl52QAX
         IL1s0rQaQSLovMXvfJSyksUw+kIln4R5UnSVJ6/6lkkMU7IB0SM+1RL6pqvnGh/dmqlI
         /7prYL9BghwpjK/oPHJBn4r5WRvAoraW8ouxVjTKAo4LJYroku9/IDYiTegWvkeB//qh
         ycgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9A3iQiBjBjiQVlRsQjpUE2whGRmJ/FPb81yAfBO48WU=;
        b=QEfSg/qZpZTLbmkWMlq52r5yAKNC1lV2IG273fg6WP3TPx59sQ4cku5bpt/fYZolUt
         DnIYm4rO9Bk0fPacabVM8oMoPpahWfnzvftcYJ3AUrcGwMRFkPDY5Mg4C8hwsN/RX3vl
         IDwJmNa4l1GxCkwFyu9jIPAYkkRhiMCXwnzuue5+sbVj8Gb3rOtic0IaevkQefx6u0tk
         Y2av/jJQ8ebkz2U03ZAg8qmSQuGO5yrNuewzTLjDbFO425kGVqGfmxlWcZ7eD1vxXur3
         w2Q2r2UZkyOsZ5Bp156hmrfz/7UKKg4ezP1udY3aj7gSpQeVY1Uph4g44tD6U7YAC5fw
         YSig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533mY0GiX8dSxPSQUQ75gXBItsEb0hUGrQdnzorTSUaMMrC3lVTA
	x4QqsK9JqfzZN19Ok3o8Zxs=
X-Google-Smtp-Source: ABdhPJxI2ak1TJq3K8ZxNDzS3w0qAQAdFigj5JDLZMz6MeOlH1pCC6XzOO4fZwbRTzwmquulRz4Tcg==
X-Received: by 2002:a05:6402:845:b0:427:d812:8f68 with SMTP id b5-20020a056402084500b00427d8128f68mr33727722edz.73.1652334351758;
        Wed, 11 May 2022 22:45:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2741:b0:41f:7eee:e393 with SMTP id
 z1-20020a056402274100b0041f7eeee393ls601806edd.3.gmail; Wed, 11 May 2022
 22:45:50 -0700 (PDT)
X-Received: by 2002:a05:6402:26ca:b0:427:c181:b0ed with SMTP id x10-20020a05640226ca00b00427c181b0edmr33427095edd.400.1652334349949;
        Wed, 11 May 2022 22:45:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652334349; cv=pass;
        d=google.com; s=arc-20160816;
        b=uqDjLJPzxOvZABocRsUbEYdkY57bQOn6DpHS0Sj2pS5MPdUZib29SMtCW9ejE963AE
         X7HIarvxNMqic0OReZKPair5jRZzaz47j+on1ssw50fTy3HsKrInHjFUPqRwxFJqB/j7
         lV27u+ur/qNNpfY7B5bXs2IMoIHXustyIuMZUN/B9ZJ4fqXgmOBO65wDjCaEMNXAsLYJ
         9hIdaM7L+k5BSpzWwmRswscpodYyW2Vn+ezeekwfRpdD0If9tg5xhzPdKiDitXFT1zo7
         3e7Tjg+Iaa5hGp8t5n8aZ233IBDok3bl7nwS/sxXEd/CjZrioxUDp/gRpwUOcsnxXQ0F
         qIFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7Bpkm7Oi6y2gCU3W6M5p6TTgwoUeYu/f5gwaNosnVZo=;
        b=FmVvKx/HoNapxT9UatY/PZfqV2X+qy4D9s12pBLP9G2+lNPxAuANLVGzJbkov0fsul
         o1XWpt3kKtr2TiLkwG8+DTT6mhJHrfaw5l8I5w9EXvhmKyWAdqtIuezbNzPhKMqzygIz
         GmNzmxHzOtui3JZmHWxSH9gK4ICJpKgcuDSOroPkOSAbpWje4ovxsmkfwF4GtLvBcz0X
         FdxIMr5CqZ3KL8biExn1HLMBwowU6qafL04WtC3zAYstVSZ5m1ddxe3uOkyd8Y7XLGNr
         zbhLGhEtKntucXt7/p42pKGpcCtGehCiW/rsuKlPTtJbAnIJU4bN41j4WCVHW3IouN3O
         y74g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ljOsXsZ6;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::629 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0629.outbound.protection.outlook.com. [2a01:111:f400:fe0c::629])
        by gmr-mx.google.com with ESMTPS id gv43-20020a1709072beb00b006e8421b806dsi308527ejc.1.2022.05.11.22.45.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 May 2022 22:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::629 as permitted sender) client-ip=2a01:111:f400:fe0c::629;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLGqobOk6g616krPfl2z04yM9m/ViI9q3zIadC6J2Zxm43neQMChVEIUBuifWg5XH1dZQY9VNpNQoJ7SHUy+JOF1ys0jLkJT4Lnz6Rzid3O/cU2Kyq+zbWTZrkfwz/L1CcjslItHcZXiNHY0x5XfOQU9/SsBjpKbccNW/yHeIyCnH6pJOGn+WemBNIgO3o0Kn61QBWAp/bd50EUt9mySovF4gmlHxHu0M4It0TS7NYGYYgILgnTZve+7lPHyloRMX3AHefyxVMKTbcmh9Fo44gUbXmPRgeaM7AHk/X1Lwad0PZmdczrFpG5SLPU5lsp7n1e2ZS6Vw+IGh+tvyXSpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Bpkm7Oi6y2gCU3W6M5p6TTgwoUeYu/f5gwaNosnVZo=;
 b=CDduyAKxkSA0hdfzcW8FODLJy5rzalVp/LZZ7oLPZyxTqQlbhqh1TkoJJX1otzGlpa31iKeT/m6baxgokheBXVYyh0QEL2atkZ4qFkelKsaNtyalMKBfZc+TFF6XlMUO+71iCR2K65ydIbhThhsTwKuSIqIZwqBmHemqBF8Aj+fuswY3220+/8jg7xK1KSYysgBeda+Ts+jifqNDZJf4W3NwrF9/I+FONWhe7CYwd26vFgCe9oLXnCk3+BQsblgp4m0T6nWhclhbue9j4c3iIgvy9gR216ThGJuirnkzZyD8bt+WaV2oEUvdXsTO+dFLDppfm3coPLhaU4GissrR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6PR0801CA0061.eurprd08.prod.outlook.com (2603:10a6:4:2b::29)
 by AS8PR10MB4757.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:31a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 05:45:49 +0000
Received: from DB5EUR01FT011.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::e6) by DB6PR0801CA0061.outlook.office365.com
 (2603:10a6:4:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 05:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT011.mail.protection.outlook.com (10.152.5.3) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 05:45:48 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 07:45:22 +0200
Received: from [167.87.0.83] (167.87.0.83) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 07:45:22 +0200
Message-ID: <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
Date: Thu, 12 May 2022 07:45:21 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.83]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--19.178800-8.000000
X-TMASE-MatchedRID: qeBAs1OleyY5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tTCL8RFER/j9Myyi
	+n+H050RCOwdkP3NVeYAX1zFjEwVo9LPdQhgZ/lh1GpI2Wh7mMa72LzVxTKQURW4LR41Fi8lSMd
	QR/r3EeR6RHdVK85hV2NlrEE6OjjT+q6H5pp3fffQrOflXxFuVpY+rDpJtqXuGECTbIgjb5sVwP
	MKjZm1aKXNybanokTxc7TE9SuU5smvSD3/eM+8LTIDCR7KoHhIy3ARqB9bsbbl4CKqupkMr0VPv
	T0zx0mIc9Jc7K8Zqmo8WMkQWv6iUD0yuKrQIMCAGLeSok4rrZC24oEZ6SpSkj80Za3RRg8E/gFZ
	+etRZWNZrlXwLmYtEb3UjEen802ImQBrbl8CZgQCl30gpd5m8=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.178800-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 6FBE54AA6CD85FF480442D53A35EF7FD3725FD06A50A9F46C41DBE5901DF6D8A2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc1e003a-0163-47f5-b855-08da33daaadf
X-MS-TrafficTypeDiagnostic: AS8PR10MB4757:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB475785AF4D2303959A55138295CB9@AS8PR10MB4757.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dKywW7ITt84p3fm9dnpZIkpPSUAXAUSJeXNFBXkf1fG5k2xjcjfhaorEY+Pkqlwz19VRlJyjMop+w+u6FVxq0K/U7JiNPKSjIKdixLmqdx+op4dBln8J9HaKT8K2vt9cYervYbDv7qFD2gGwhXrUwJVbzy6+5/j4vnRXkn1467Hz/Ve225b8pF4OpayQF60t+7/Ak0ObpG5LbpzhN5mmCC2by+OvjQttx38ImRDdMZQzdTJyxFN97VFw7ptr7rT1lQYpUTWLfPEWf+qGc/T3mUmHZbgfG7BLJWC6ejrcAKE8LffC7UFVT7/4nm9U7U4uiQi65P2UgLQ2l86ffevd/NTGUhJHS/XGK6TCJj5XXG0ceFLmnqg3g+rmvTBnmtBLSbovHhDJqFQLmrzTDOGlmGEvfeyJj6mR6lQX4iStOnEKrrbXbXjRkVIkNU9teRbdkc1V1ilOXAJmIGlHyxnVwIXHJqEM8UEH1kJd3K2AwgTOZ7lTosDyEm1ADCJyzVq+zqOGT9k2xgtz6V2Yenc4y6LBQw/qD1F4kjnlSXYcKoDkdXYT6ldvaQyu821wxzoQRCWNbzPOp6S1tUY7ABFVd043ylbqaEq4/LsuP+B1smXtnRU2lCxpUvWx1hjPCNa5E+WdXf6g96ElmBYEPF1mUORrkKl+IBdOcsfMSp5+5qMVJlKW+vMzSOO5UT7TApzGz1kpHyEAPpSMXIKbfIPQN+FvahQpAeJEtLRxWhxpc2iUMBf43+ILV6LKxqUopXc5WLwqvEwbC7E+vkwXF9RL+A==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(47076005)(40460700003)(336012)(31686004)(16526019)(44832011)(36860700001)(2906002)(82960400001)(186003)(36756003)(53546011)(82310400005)(86362001)(8936002)(508600001)(956004)(2616005)(31696002)(81166007)(4326008)(8676002)(316002)(70206006)(70586007)(26005)(6706004)(356005)(6916009)(16576012)(5660300002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 05:45:48.8240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1e003a-0163-47f5-b855-08da33daaadf
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT011.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4757
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=ljOsXsZ6;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0c::629 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 11.05.22 19:09, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 11.05.22 13:20, Prabhakar Lad wrote:
>>> To add further more details:
>>>
>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
>>> for jailhouse [1].
>>>
>>> I added some debug prints and I see the panic is caused when entry()
>>> function is called (in enter_hypervisor). The entry function lands into
>>> assembly code (entry.S). I dont have a JTAG to see which exact
>>> instruction is causing this issue.
>>
>> So, already the first instruction in the loaded hypervisor binary is not
>> executable? That would explain why we see no hypervisor output at all.
>>
> To clarify when the hypervisor is loaded the output will be via
> debug_console specified in the root cell config?
> 

Correct - if you reach entry() in setup.c.

>> Was that memory region properly reserved from Linux (via DTB carve-out
>> e.g.)?
>>
> Yes I have the below memory reserved in my dts:
> 
>     memory@48000000 {
>         device_type = "memory";
>         /* first 128MB is reserved for secure area. */
>         reg = <0x0 0x48000000 0x0 0x78000000>;
>     };
> 
>     reserved-memory {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
> 
>         jh_inmate@a7f00000 {
>             status = "okay";
>             no-map;
>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
>         };
> 
>         jailhouse: jailhouse@b6f00000 {
>             status = "okay";
>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
>             no-map;
>         };
>     };
> 
> Linux does report the hole in RAM:
> 
> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> 48000000-a7efffff : System RAM
> b7f00000-bfffffff : System RAM
> 
> And below is my root cell config related to hypervisor memory:
> 
>         .hypervisor_memory = {
>             .phys_start = 0xb6f00000,
>             .size =       0x1000000,
>         },
> 
> Is there anything obvious I have missed above?
> 

Nothing obvious to me so far.

So, is this really the first instruction in
hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
Check the reported address by Linux against the disassambly of the
hypervisor. You could also play with adding 'ret' as first instruction,
to check if that returns without a crash.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5%40siemens.com.
