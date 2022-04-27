Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBGEUOJQMGQEEZU2D4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306E51111F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 08:26:13 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id x12-20020a2e9dcc000000b0024f2bb07cb8sf132159ljj.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 23:26:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651040772; cv=pass;
        d=google.com; s=arc-20160816;
        b=HXzfiHPoroWc0DCb+TPXIHX7Dxkl3qlIfv4mqHAic7DiDq4IereY8oxzZgHJVo8iuE
         eKd6L1s50af9lI2R+0vW99tG6281BH85HvOIZGRalAsswA0SLUfSp9wXTNN1BoA6n+CJ
         QsHpJk0Y1kx34Yoqne6bTWWVIlsgSnkvqc1TLhVNfdFYie3M1FitFpW6r9WEMi2RvpNt
         qSCqwgsz7cMs3kHLkd+J1D/J1yNoR5gkzp/MtWBQLXxWnOXmQswvW9/GFyafNwjL0XxG
         CzIeMaXXqoq5XmldMvVd6pYML9h64t8DRxp3PsHqZqaUz1K5n/sKqtefkQZtxEPwG1wc
         9GTw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=nCnN5RyigzZtWbJY+tbZEBE0QoK1Myc/ILdM1e8HUWE=;
        b=o+4ONl85THAurYjFMXLuQie6ojZrq8Sxm5YQiohLkZ3UaPbMlHNcuhniZUFyOqK78a
         T/YO6BqMez7gsLjw2ObuNXYbRFUZDO/iZj/RlXVTE/KFT2/wlJFDtZc8erJBTcUtlW6e
         RdaivbruU5Fh8vt8GXBs7+H0auyyS/EPmXLtdkjGUIdp4k/L/Lyq6DoZpu0A9OYagfle
         fQa3lXYnVwuwE8D8vsJ5+bE602qGDr4ALaWKMnMVJNytTG6iHr43c8Z1MrwLzdOzHJyq
         m0Tk/7ram/vUToVBNLD0TKlHMUBEViclivso4R8g4kVva1kUMxe0LHSXhtknV9quLGu7
         CLaw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=sUl5HUzJ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::608 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nCnN5RyigzZtWbJY+tbZEBE0QoK1Myc/ILdM1e8HUWE=;
        b=O4Rl7n+64+txljfrkwCxWc40TlDWTRF5EFpVu8jGdyOHR7dBhVqlWXNxOZS0vBIN0R
         9aoVMp1MaLgmiv4nd1p+SbMq3lUT6YzYdO/Tanwf7EPjGAmgKTADEkPxLi+BaAjQRR4o
         78bvAPNbLaVtmqtJgHuXfF7plKfRAfrcKgu2fInxA9gSChddmswRC5OxNd7J2+c7XjRW
         +n6rZJDsRiyq4R53xsx3OzsPnWKNMfJYbna0RNR8EtFjnf3brtvCt76hGIWTxowk/pN2
         GFown9dbQjtJtshaKuy/tO9gkfefooZEzlSkMVJNUNDE+EZNQfPAamV4SHnFOnmz7aIw
         lYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nCnN5RyigzZtWbJY+tbZEBE0QoK1Myc/ILdM1e8HUWE=;
        b=6uzKWJPoTNw1XlWoM++RhgWIvefPr+UqoyTTQZWLbTuIDyc6VuSd5RY6Z5KQZ+N/kT
         wrCnIBok+FrhJyEKt4kQjt8Z3AMZ+a5U1cpBSe4uxxUZiLKorwJJ0+sbTmq6vNsOhw8f
         NKqa5f4xixenMEBCkxaI3Ha62dIFNana3+3IJy81gbRlywSslmL5otsKvGUj6/W4Be0p
         qnYbClJS52UDo1a2bpEVQLRQ891VsZXpa8mA20GPdngxLzcwLnojaxWdz8urpq7ckzwY
         PCgFbIKRZnNPCO+nhmuZj4dL2QX7s7aHuvFRDa0nxc3MYCjNp+1Lf1ziO5DlXuZF+Y5N
         M5RQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531L0pnH91ydElfz45WaXtUoi04tTzItaf666hLyISBdwCt5JIGY
	PgpJanl1raGVbhEDQajhIrg=
X-Google-Smtp-Source: ABdhPJyB+1OeBXi2Vg0tRalFT564gUZgH+pbrpoWXmwSr3w6BVdnCAH4EGS7jIny75aPuJYEQIAcmA==
X-Received: by 2002:a05:6512:ace:b0:472:2d11:a4c0 with SMTP id n14-20020a0565120ace00b004722d11a4c0mr925248lfu.610.1651040772626;
        Tue, 26 Apr 2022 23:26:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls1032869lfb.1.gmail; Tue, 26 Apr 2022
 23:26:10 -0700 (PDT)
X-Received: by 2002:ac2:4e86:0:b0:472:2b36:c431 with SMTP id o6-20020ac24e86000000b004722b36c431mr1188031lfr.252.1651040770876;
        Tue, 26 Apr 2022 23:26:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651040770; cv=pass;
        d=google.com; s=arc-20160816;
        b=gLPVsIIDDhrSM3J+4FHnvnWSbKxPZYJ/cuK3xPgLDkCtfhuZDXHI+nzxqSR8zuEMxL
         aeOLqMKuVAg2qbsur9+SBgwnVLJdvZcGme1dOKkLuO4z//dqHvfUZcPcckc1AM4/JWXt
         QHqAeR8eASp4nyRbAEmrVkG13yHJdbs8KwVlZUyyZnB4dSVUr+hHbrTE+RUGS/sLya2X
         MAQUDagwDtNpwViPM0JPvy7VjYoJuKX+jgbYMGr24uInTM5dZN7WU49nWS7+17w8u5Q6
         LwC3H4O2A+rC6mMuC8T1C3WKpDJJLCDGbOwosmUzPopOhA/hbdj/Nhpdv5cokictwSzD
         fYLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PZuXj3XZLYnhfdr9R8wNw42cO0OgCUUQwoYmHL9K2wE=;
        b=vTML7ZpKLlmlnCG0OkyMz15U4pQlQZ5z6/9RFekxYCkDMBLwe7aqREGVazCnorXzvi
         gI1E65OA1/TJlle/3IqNzyWJ2qTwJykKde7cJ0bhDGa2GBRN7lQJKeT/MDyKGEGqlAqV
         vmyByIQatqW1y1vH8e9zmznSiI5h1X8PINhusw0SqSPXH7nwOwc+8P4oq2fCmrUxFttI
         1LxzAUhoTF5XHKt7JIQOOgdxWOUxR6S6LILR/Itof/7n22qF+jWhaWM2ktdx+AGMc+4w
         Qom2SXmUDVzkIEUViewZRxly+NJq2FrGPPers2FB8Qmq4vb7iZpAltgeC5r66/Npv9L/
         SJeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=sUl5HUzJ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::608 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20608.outbound.protection.outlook.com. [2a01:111:f400:7d00::608])
        by gmr-mx.google.com with ESMTPS id s1-20020a056512314100b00471902f5be2si29888lfi.3.2022.04.26.23.26.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 23:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::608 as permitted sender) client-ip=2a01:111:f400:7d00::608;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+1PvYo270hsfokoir12K2WCFbTFzTNmVTrKZNFUipYD3sqGINGO3kLVBcUwee8QG+b1+gnxd/fjxqO4bRYfB+TWj+fT5I2WmYb2GGPNLxyOtGcQrff+VFkhyeuEqI6wmn09QnkMeFv+yniPiwrmLJFyjztS82bQp95ZEXVuPnYQsqDEdFcN1RcxO0GyVxzJbBlKTsSHNVRy7veIQpXSYHBo/OyYVVooqGvUyBXjjX0OC3zINHRyFAlKi9I5PeUFYvteK6bTSfvViWaVu5lN/favo31rfO6oCMLhcM8oM+k6wgsJj+asLbR2w+jlx1zCthACYt4ldpcMO2pLlMvhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZuXj3XZLYnhfdr9R8wNw42cO0OgCUUQwoYmHL9K2wE=;
 b=XCJiz7sm59eF15mfq81Z2pzQPp5FIedtLdzlx9uLiLV9xzmgz/cGK2kZNNdUAksLBT/9cP7r/ma+TRCBAtGY0rWZs6zsmJNZZ8fkuxOfrvMgeVO4NK+ur8HCMB/NUtoiDpuhxTxdntY3AKmpFZu5s7CBHPC+0rLtJfOOK5Lh6goo+vCGKnIzwYIMGHEfGbz3b61MVZmbOJvtd5j6hFQ3yXWhSu4bIt/XtMAnV6WVhmxT+fLfkxKETGf8KDDMF1wRdCHwJOkiBqHWi0B1KaOlXyk4fYkZE0eMEundrNorgac9Szgw64BiTwJdA6Ots2DIhdIh6hyFe/0JW7b1Q55CEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0029.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::16)
 by AM0PR10MB3299.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 27 Apr
 2022 06:26:09 +0000
Received: from HE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::73) by SV0P279CA0029.outlook.office365.com
 (2603:10a6:f10:12::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 27 Apr 2022 06:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT031.mail.protection.outlook.com (10.152.0.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:26:08 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 08:26:07 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 08:26:06 +0200
Message-ID: <c2c4c771-6772-9511-4b47-49e2473d5531@siemens.com>
Date: Wed, 27 Apr 2022 08:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] driver: sysfs: Replace default_attrs with default_groups
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220426172222.1910982-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220426172222.1910982-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.370400-8.000000
X-TMASE-MatchedRID: 72nS2hokiaQ5QaOxwNGfvo9bHfxDWoibR9fQDKDdQ3cSEYfcJF0pReqh
	uTPUDQDt0MT4bYTRBTdIPDhB+IjkDc4ymjNl6z5PuNcow2BaEoiCrALIB9jKZtzeRUM2WkV7AQ8
	mtiWx//oda1Vk3RqxOEAc6DyoS2rIj6kCfX0Edc48yTEHRf/stGi8YU2giSiP/1dEgwtQ6NCOVG
	ny5q72hg6QlBHhBZuw7nlnMJDXl1nCfvo3UgFFJDD7cDVCwDoDle+q6k7Q/cwvzLls7HTfGX0tC
	KdnhB58vqq8s2MNhPCy5/tFZu9S3Ku6xVHLhqfxIAcCikR3vq+fe9b41vpqTbOUvNzwxxLK0x93
	0NVDZStDh6qTTq9jXE9E+Cneybt4
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.370400-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: E9F5CC484D1B6CEDD3BFBF4D341439A0793B0713FCC0F0A05230141FDCF8C3082000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e9a7785-5157-46d0-1abd-08da2816d0f4
X-MS-TrafficTypeDiagnostic: AM0PR10MB3299:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-Microsoft-Antispam-PRVS: <AM0PR10MB3299E4E396E323257F2F0A2495FA9@AM0PR10MB3299.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ysGMpcUZ13o6TLZKnHUigfuGg+0pQWr9S3NRmoVl7dL7FNvSNb5uggvVbsQUn6EfFu/pRA7AYRi8ohjlNjSZRslP94YCjOTsK2me/aqAV6gi/L3Q7sgYNabBNKqjleKwp+rNdG6+z9AKVCMizn2vWVa/S2GwDxx1feBW3Wd7eARClYByJnmrsAS0oiw/OaPHHbooPOqWVuaBoTpTDqMenBa8D53wCLGf9+JmaIQ3jBnxJbT8elI53fyMo+IQl5ygFAcxa0MWUw7Pj/sDE/JozDaTEnvlrh3OLNABLAA4/kQ47rDPiW4cmXTFS2eUrAIjkSlZc6Rda0X2fclVAzktS5+8ZTn4sEO8oYUy8oAwqNJYEu4WkRRd+DGqCYKrH81Ax+4MEAAInxzLMjIdjxQfgX5UhzZJKbK0kVlCQFX6EQ17oIBOU6Jab1l4acOE8nrjWMthVJYpHjfPPpRlMD5o7Sj/E3FluRUXQ7xf17f2aKq4kv1zq1ZO4xMmQwGLcZwLJSn1A38S6R8P8YWxiQjKVs+fjMV1K4FrNx5JLZMj0xZeDGwVgd9faiqjNNXXWJY1bgt/StuaIb9sWutSB0SFvJ8J6V95yl50cAhoxpfPo1lWa4rLWu4Heyxnbv+SU2ItG4NyM8SYjT1NKl0KuqEIyMD1r7ZXvC609PoaI6nKKdEhR2YHqkJldbIR5gs88Tt798Y9J2cbfoFzLayoMj7JeNsRdrEdqswqS5Y+zt9NIcBMW6v1D5P2p+n72AecYYhNYuwmALgK/6VCPWUxkQRRfA==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(70206006)(5660300002)(44832011)(36756003)(316002)(16576012)(16526019)(186003)(2906002)(4326008)(6706004)(8676002)(83380400001)(8936002)(70586007)(31686004)(110136005)(956004)(47076005)(2616005)(336012)(31696002)(86362001)(40460700003)(508600001)(82310400005)(81166007)(82960400001)(356005)(53546011)(26005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:26:08.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9a7785-5157-46d0-1abd-08da2816d0f4
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3299
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=sUl5HUzJ;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7d00::608 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 26.04.22 19:22, Ralf Ramsauer wrote:
> Since Linux commit cdb4f26a63c3 ("kobject: kobj_type: remove
> default_attrs"), the deprecated kobj member default_attrs is gone. It is
> replaced by default_groups.
> 
> default_groups is available since 2013, so simply switch to
> default_groups, without (hopefully) breaking any older kernel.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  driver/sysfs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/driver/sysfs.c b/driver/sysfs.c
> index a604afa4..f91d5ac5 100644
> --- a/driver/sysfs.c
> +++ b/driver/sysfs.c
> @@ -180,10 +180,11 @@ static struct attribute *cell_stats_attrs[] = {
>  #endif
>  	NULL
>  };
> +ATTRIBUTE_GROUPS(cell_stats);
>  
>  static struct kobj_type cell_stats_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
> -	.default_attrs = cell_stats_attrs,
> +	.default_groups = cell_stats_groups,
>  };
>  
>  static struct attribute *cpu_stats_attrs[] = {
> @@ -212,10 +213,11 @@ static struct attribute *cpu_stats_attrs[] = {
>  #endif
>  	NULL
>  };
> +ATTRIBUTE_GROUPS(cpu_stats);
>  
>  static struct kobj_type cell_cpu_type = {
>  	.sysfs_ops = &kobj_sysfs_ops,
> -	.default_attrs = cpu_stats_attrs,
> +	.default_groups = cpu_stats_groups,
>  };
>  
>  static int print_cpumask(char *buf, size_t size, cpumask_t *mask, bool as_list)
> @@ -342,11 +344,12 @@ static struct attribute *cell_attrs[] = {
>  	&cell_cpus_failed_list_attr.attr,
>  	NULL,
>  };
> +ATTRIBUTE_GROUPS(cell);
>  
>  static struct kobj_type cell_type = {
>  	.release = jailhouse_cell_kobj_release,
>  	.sysfs_ops = &kobj_sysfs_ops,
> -	.default_attrs = cell_attrs,
> +	.default_groups = cell_groups,
>  };
>  
>  static struct cell_cpu *find_cell_cpu(struct cell *cell, unsigned int cpu)

Which kernel versions are compatible with the new API?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c2c4c771-6772-9511-4b47-49e2473d5531%40siemens.com.
