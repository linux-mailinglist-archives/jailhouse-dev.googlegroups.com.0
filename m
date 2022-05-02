Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGMGYCJQMGQE6L2T7XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270B5173F5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 May 2022 18:13:14 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id u3-20020a05600c210300b0039430c7665esf1744500wml.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 May 2022 09:13:14 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651507994; cv=pass;
        d=google.com; s=arc-20160816;
        b=d6KONIdg5bMXUkRb/hYut4eFk5dExbX80ZudofW8ehAJHMtiV7E2TDvXZsqH7vj9J3
         V/Fts9ouzupRclSvqCjR8AauOtLU8IcT6H7E+Osty4bmmUhLylwmLLLLMf1H6pzbgvO/
         b7zspMCTOLv0uBULEo11fuJudUs+3VYhgTL6+eaW/E3GB9nqVPqHaDLsldLTBXeg3g84
         sSnKV7uTEN5+oUZpaHsb5fqR1tQ5tqhNNFyAV6tbA73LFkBSysVL7/irkFfLlOD3KXHd
         dVA3hNkkq1V4mGyHZWlq7/4BT5u8Et4QEdD2ad8Z/30V5BgfQBzS1I2u6mxA/SR69HI3
         WgBg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=nR4pfFci9Z29gW1w3Y3bwmsZjArEBMViiBEXGaLzz7M=;
        b=xXungPyJlj0sUcl7GSJhZGhDGM1xKyQfxaW0Puc6gyrmstIF905FkI4q/9Yz485iE4
         1UuXbMVqp31tLVEflSvXOZIq4cJ5EiSFF/ysfl2pPoV/BP9oGXtcMSBNodK3JMXmUj+M
         YSENy8k1YGNPMu2scx6JovxnEltxex45VDotMJ6tXr6g7FlRAYw6cY28Sj9PleByBV1S
         HVuY3qAt0A8pBYvgeSzJx4iwlHgKREGNuqQVh46aQYi5qlo+Ou4BMZnGseVOXwiHLG86
         nG+Lg1Rf55fWsWd965FDxYxjtAgQtuROB371D29Bi7uExnfAZlXQnb9aJRym7zDg6bJt
         VQxw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=c5py0gtg;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::61f as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nR4pfFci9Z29gW1w3Y3bwmsZjArEBMViiBEXGaLzz7M=;
        b=mEZ/ZSPCgK8C3Qo3ZUvfPPiUTHDETT+hjN16c8fstvKjCpVrQFJL80u6g9u9GqcOOV
         sNgGb4OXQJxoaaRVMbLFSymcQUn5WalZRqGheZG4o4bdCX7mNrc+Wh2doGDwGMIPqLmk
         LGIECClajKxIPG0pZvC6K9ROfT3OJcE2R8s6V1jtGww5vUsL2wSI4ETWiEG+Clsd5FsP
         lEnNvjyrSzIj7BBUNjb4KMHPVDUoOX4ODEO4wjD5ngC3wghi+zH2jcTI8kX39AcVj0C0
         z4G0uPlItjzH3o8Pv9RrXdjdIVd4uZ2ZPgFtXFpNAVq+B6TdONitbrXrwIgF4ZP/e7Rq
         EkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nR4pfFci9Z29gW1w3Y3bwmsZjArEBMViiBEXGaLzz7M=;
        b=IwTX6aigmv48CD/7g0VxZClUI4t2RYlA/tukxma7+C36D3FmWb7w1+ITk9q/UduexZ
         8McOT/Sa7ntLeKg2AYYrnUeVY6PfjlmIcTWImrY7QBdlrhYqswx/kFjZOZK+VXaUXVmH
         SLnWCrAJ9HF2Ffj58owBjv9pnKNu4V3JViiDnkXvJFB49fXBPQXt8Vu7/5reY71opSYP
         vQ9f/q7gPPPVoxt5xGaLemqC8CHk8Uwz111NhU8AIE+uJHASegLwd5LV1NfqXvmzgao3
         zT1Mf2Gr65I6LuQZmjhYoTT1uX1acE4dDJDEVjsXC+CMxAHhU9+sAQYXgyMo1PuHo+Ux
         3J6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335Q49PNaaljUuHXquvErK/dAiRaU/efqbYzYUema9zFcTRkbbk
	QKhkq9pqODEnb+Yd0vceWw4=
X-Google-Smtp-Source: ABdhPJyAZptR00OmWxJoClf1cY9Sy9dB4YQeCxskREEF126kwGB3pFQtUTzKocL69xd3BJ5pEfQOqg==
X-Received: by 2002:a05:600c:21d1:b0:381:4fed:159a with SMTP id x17-20020a05600c21d100b003814fed159amr11627934wmj.143.1651507993984;
        Mon, 02 May 2022 09:13:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c9a:b0:393:e698:3558 with SMTP id
 k26-20020a05600c1c9a00b00393e6983558ls4911406wms.0.gmail; Mon, 02 May 2022
 09:13:12 -0700 (PDT)
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id m2-20020a7bce02000000b003812007f75cmr15716844wmc.6.1651507992448;
        Mon, 02 May 2022 09:13:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651507992; cv=pass;
        d=google.com; s=arc-20160816;
        b=uksShNMczFrvoV9vgbzo807PS8jhYTnwShEFd3VCUxnIskEZd91bujzFXT0WyE+lzk
         1zwY9cIzkqyw80Q8glT8QhpcCbqjhrUo7eeh+CcV4VaYL9DFXCEBGGILVzOjyCG3gFkT
         uJ8yL9QKdBkhcMX0k3eLpx91+/UX0iO32pkyiD2xaDKz0EraA1krkR8CIuHwjKCI8X1H
         8+XlQTNmyJJ5+pwNY8KhSRh2E9GZ9DC3avKvZQip/VXupjpusKMevITxcH4Cz0Aepzmu
         w85XGN+mk+WmE4pWonkU2gC67OBx6SJKPSgEOTn55nAJI1RQutl84+nHXL2tZ9SyE10I
         2Y5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nvmPpaKYaN/fm5dLuRVJDam7yHiU5k+BI1HmB406rvA=;
        b=ZbWYQvNNfkvQBNLkoRZKstLH7mcmudYR0gucRKkbq8gwy4IJ7dfqiH/kMqNjOpFHG0
         N9vRTdVYoE4e74LH5SVki59Cu+WE3opKW61chmvYqMBnGw6gTQCgs6cIGuaXawdE/GlH
         p89/4AnKkuYxJyhie6ikpFPBVvZlJW5264OBw3ljcy4m+ohZW2ohEhQtVCnfgsvG++8M
         aNiUbPstnbcXsV6JaNsB1RGG8CqFgOiISnoIgSHZjivBvMEAVMLhFS4wwlanWZuyvBq9
         uvcdi8Gi8fpRwr2C/Hme5TeHz2caQnI0i4L5NPw7Gh79VD67iPqxv/+S4EKcyVF/W+wP
         FLnw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=c5py0gtg;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::61f as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on061f.outbound.protection.outlook.com. [2a01:111:f400:fe06::61f])
        by gmr-mx.google.com with ESMTPS id c13-20020adfe70d000000b0020ae37338dcsi903842wrm.8.2022.05.02.09.13.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 May 2022 09:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::61f as permitted sender) client-ip=2a01:111:f400:fe06::61f;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIwgQDuXT27DYFo+eXvmH+Lrj/DXSqqVa1DDIkPdVeea4dHYL662aVvJ5aEsvSO7YweG+A/jzhiCiXSa+qPEUPpxkvb0n//atTBAJ0f2Xdxh21NmIZ2RXRtu6/yhP9pjZ4Phe7A1xIgzzrwrzypo3Eo5L694ttTzay0YxjCLhjtT0KTcSZw78KmHPuUnKHKf81naJX2J9j8/rMCGJo8bAIbS1Y4u/Oc7r4dN+KN+IDca1xmJ8dxHH1pJKjWlRNRQfta5l+pzn31bbaYRVlep30albhmX5NA3S/K3H22krpX2p2bpOhkCuVKGN/JYp+tRABkWFEuA4T6GTLJmn8PWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvmPpaKYaN/fm5dLuRVJDam7yHiU5k+BI1HmB406rvA=;
 b=YV7zXZw3xBO4Y7HtfEI969hokdHSCgY3M5V5MzA9U60lTL41xFWB3XAdn7w3+I83gwQRuKWO1TGIJ0yrVYx0S8h1jRxqPpJvgBME4+bj27mqG+muZGbY3Xo+ghWETQacqq9ataqdWy3WNexFGfhrNpHeJZHS7JNmoo9Vq9kNkgi1pgneHcpce6SVr6du/f0poFgO2iwUxsnKKDjohlb+DsNg6hN09FvU/c0xv3gVq5go0o6/HlP6z5zjjfyTVrRioze/INOHUon1VFHsA21TkiYL4CtrBDi2OkHbr5Ncguz8PCuuzP1ViMjr5/sxsM5j8XvKQtD6tI0sja0m5Az4vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2PR04CA0350.eurprd04.prod.outlook.com (2603:10a6:10:2b4::22)
 by AM0PR10MB1907.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 2 May
 2022 16:13:11 +0000
Received: from DB5EUR01FT103.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::63) by DU2PR04CA0350.outlook.office365.com
 (2603:10a6:10:2b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Mon, 2 May 2022 16:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT103.mail.protection.outlook.com (10.152.5.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 16:13:10 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 2 May 2022 18:13:10 +0200
Received: from [139.22.138.143] (139.22.138.143) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 2 May 2022 18:13:09 +0200
Message-ID: <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com>
Date: Mon, 2 May 2022 18:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Linux and u-boot requirements
Content-Language: en-US
To: Prabhakar Lad <prabhakar.csengg@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.138.143]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--8.559000-8.000000
X-TMASE-MatchedRID: 10+ctCQpgSw5QaOxwNGfvo9bHfxDWoibKx2x0HdtdQGdonALKgiNvN1h
	WsVVuzNoPaYQnKWC98G/35G8ZJR1gPLv2XiL/XywvUS6K+jSHAsHDvjr7OxGkBjDRPpHuqhajWP
	6asaL88VEMv+NYAVspXMWfmr8UEU8xTsa1zsKwGBoFgfZP2Kdx19qQ8L+jl3wSUAFemq7B2VLzG
	xCv79G9Wjliw+xvItdFhWaPtkJY/RodAhGIog21EHEYTPUzJ+IE9EzjFOugexuXgIqq6mQyvRU+
	9PTPHSYhz0lzsrxmqajxYyRBa/qJQPTK4qtAgwIPcCXjNqUmkUgBwKKRHe+r3EWKSSVhmXQ/gJn
	f+StLRfuWII80y6dLFWnU7q96xfovQDRD+CS1VQ=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.559000-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 331FB0E7FE987329A703874F215F68FD40DEF6654ECF0EB93813B72C7D15FBA02000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29033ac1-e8e5-4aa9-6e25-08da2c56a716
X-MS-TrafficTypeDiagnostic: AM0PR10MB1907:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB1907897A4A9C8A5D71D7603095C19@AM0PR10MB1907.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFAwWP+yqZYts9LfZPCaPk2Iyf6UOQLsU79uddS8FZ1CEwsCbJMYoNbbuR02/PkTw7PoQ1LfMYNaVUrHHeEdspqsYnClEDTYXVbDzR95t04niIPTsnaCF7oRcJQNlqzOrDPOxP9YAradIUrgCBqspdOYrXX8zmkdX5LW0NysJb++RkGAEY29YuD915DRycDNNjKLE2F5c8tnDBnTdg7DXMXpElwQzc6Ns32DtRXIrcGEnayxrn+4W065CsU3IeGePUNzyfIen8cs9vVGOKgSw6JYCr45lrH6b1XumcCxpOHFcS1HJ0CURaUIZmal1kNYJ3fvRV82g7P0gd93sEWzvD1OHwUjIOM3kW05M5EJHbK5UFJ6cxYg6ts0CmwJ9xaSTStk3cgJJobS0zPAGVEBs+n1/Yyb+sOt5MQqGwg711S6IdMnW927mGn6n7/6DigCpP2DFoamwmNg3+gFQwS5uOHmmj70XeVwYEJEmvFP36z+FvLC504HVJpwULjz0e6qqxItrC+LaOwGhLBeQRV8IUX9T2+uQF8kALoRGjVAeywI4ITiaKOyfPTwXs4RG/VsC0ZWCjN/65YM+5cvazd3hIhI3ukfGDiEV/eNSPCXhGCv34QIeqeIIxbIlc/4Cedldxa/ZpsVkmsueQdtz6UZcRtcagZ62+iKAaN14/kAn6Yh1z81+GvR5Cw+XsZBOxntr5+WSWjGTBHNBN+4atiA/+36detnGfwgw2Zekv/Im2vm9fmUOeLsre9XZJKl8r9ysZ02GNJvh5BIMwGLPcFf6GxKgILzqSWvhbobNwEG3lX3aon9FK9HizSMtq5XFt/ummgfXBZIBZTEz55njOMpfI+D3CHtIqvl0O/vDa8dngA=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70586007)(70206006)(82310400005)(31686004)(8676002)(81166007)(82960400001)(356005)(40460700003)(8936002)(110136005)(6706004)(5660300002)(3480700007)(44832011)(2906002)(16576012)(508600001)(31696002)(86362001)(316002)(36860700001)(966005)(47076005)(336012)(83380400001)(2616005)(36756003)(956004)(16526019)(186003)(26005)(53546011)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:13:10.7632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29033ac1-e8e5-4aa9-6e25-08da2c56a716
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT103.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1907
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=c5py0gtg;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe06::61f as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 27.04.22 15:19, Prabhakar Lad wrote:
> Hi All,
> 
> I recently tried to build the v0.12 tag with the upstream kernel
> (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
> (cpu_up/cpu_down mainly).

You want to use master or even next for very recent kernels. I haven't
done a release in a too-long-while, so patches to account for kernel
changes can only be found there.

> 
> So I wanted to check what are the strict requirements for Linux and
> u-boot as I plan to add new arm64 platform.
> 
> Also is there any document/link that I can refer to porting on new platform?

No written documents, but if you follow the commit history of
https://github.com/siemens/jailhouse-images you can see how new targets
were hooked up there (mostly Jailhouse-unrelated integration work).
Jailhouse also does not depend on U-Boot, first of all only a working
Linux / firmware integration, ideally from upstream.

Which SoC are you targeting?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b7c5f1aa-e91c-3a9b-b74c-2255184d66a5%40siemens.com.
