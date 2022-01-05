Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUM52WHAMGQEOTR25YA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD10484EE7
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jan 2022 08:54:58 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id d7-20020aa7ce07000000b003f84e9b9c2fsf27102789edv.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jan 2022 23:54:58 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641369298; cv=pass;
        d=google.com; s=arc-20160816;
        b=iQ6PEU6/xUJI3XYmCBKVp/p5ZD3TLGIkOR9iSrR+EzLj01HOtOIjp+yH0FkpCsIioy
         5U7L9hvpJ+DV4kE6+R8nkG+b/j3taJpKOovHeUvZ/DDGh5Q5ol/YSJrUnjjF9LSsV5kg
         oO0/vWsAj6eXKnAcA4ZGNuv4c0MeYNTs9cjUBIxc1GgE98k/XbDPi8JAGS+UVSm+3Tgf
         FwfmC/EWctOOctVQaXudmqhOYtS3tANkgtKKsIV+gzgAEUmsQyQadBnFYoB4q4e2imaa
         id1V56fwPznD9GVElK02WGXEes0c31fMWbnmVC9TiHLFxkyJL6dReSb0EuQLnFv3opVw
         q00w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=W/2OpiY82KDON6h8FZo17MHA6wLXPWfe3+jYu3Kh+6U=;
        b=bf/7K+U734+BV4lf5ooKVKTydVnbQ5fyrQsEkfVl6i+1umszdSPFLFa/vhxN+j8rrx
         KnFNO2MAZ+yLyuzMdJr3Wu1FcGAqv2lXE87MO0YfAwjsrrMH/yi+GVoX49Se3WJ1hgjZ
         ROB3SDag3O5FsfB3xBXopTFijserxkTTnWrFaYg1RqomxIIOQuyofoE9V0DwtscqBDZT
         iWOvCzK3iVQ42Tqq6kfcOqdmcF+47wvx/0VZOnq7b9VUSPPJ/ATCVghWPMyz3tBFf16u
         tr6kyKLuMlfzka6bpWH/4yX0GMiUKM6xP38RBDXmH40JAwtKiTdyd1K3Lvy4IILZpZxl
         607A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="O/+q76Nw";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::603 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W/2OpiY82KDON6h8FZo17MHA6wLXPWfe3+jYu3Kh+6U=;
        b=SMlgQ9ibCxO4Ma7Vw29yVdX+0xqAVMrrHg3gDUr8o+ekjp8hp5KFyw5h00SB5z4QOr
         VpY6oWW5wsWws1EQRHXHczcV44B006JGPQOZzSzsZ7nkSUw8tToFHd7bltsA0FJytt37
         SskyB+sU2FEhCFh8gHUZazZ8CnUGRGSpj58ZG8nrBt2C98tsoeHRZ+pV7iu8iGDUWbws
         1VUo8iieq7trjIsrtxy8P8f+Pi9sLbIzu6Yx/jlWvan+PgGR/NvrhZJNlbpeJ3gIc9KW
         3BuVPfjG+jaQw0GPRGbsy87g+O7N4iHXWM4TcUhzDE0T9loVWvFielTiszJZiqPWm77X
         T+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W/2OpiY82KDON6h8FZo17MHA6wLXPWfe3+jYu3Kh+6U=;
        b=j6WegMIJjMSuGHkmEbQLRKOZFhC/fxk8MSuOlQ/S2Tkn2VjLxFbsTKls3iXBTyykIu
         hZODThIpbyhJy8ZLEEmRrDUAfW4eVV5afQOIQMD8M+3ZzUvnvBs5bWavIV6c77foDpkn
         ao/CKDipoFaCTt+qY5UR0VhBINnaH5CpmToP1/eKTCtg9yYhiAyAAdQ6CHM958tuqLT0
         5Mx5So9WlWsBn6VZElF1S4ANKudXMdv9/31jYIFP/8hwIsNxA/wAePt0vchOd7Tr8yuD
         37SuBM12gHexQPL3fZiclR9npBMJViPoD5cH5p4kJPyCSOZcwJcYlu/RF8jrACWvP4IH
         FnGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530oG4YwSEUMdS+Mj53jLJdX+gB1V/nL3P9PgreaHNGugBNRFcOh
	+4T0kJH5Yg6KPRDkf9+7218=
X-Google-Smtp-Source: ABdhPJzie5jbTHuxynBuxca+pyxfrsmGPBIccB1RJxXncHRBNCieCvrmqEMhnK7LTsHslTBs4taNcg==
X-Received: by 2002:a05:6402:42d5:: with SMTP id i21mr53274945edc.23.1641369298002;
        Tue, 04 Jan 2022 23:54:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:a407:: with SMTP id sg7ls13120298ejc.2.gmail; Tue,
 04 Jan 2022 23:54:57 -0800 (PST)
X-Received: by 2002:a17:906:888f:: with SMTP id ak15mr41487378ejc.0.1641369297068;
        Tue, 04 Jan 2022 23:54:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641369297; cv=pass;
        d=google.com; s=arc-20160816;
        b=C8WSG6VWe6CyN8/65J3eXa0KGkDiFECweWiu0OFmkyqsm99zWg8skoCHSpYQ33dQeM
         0a9pi+TrcD1w1jVmRzA/Mp4Y5fpxGZODfrOzRD4pyXL0FjuBAonhngIKhiPl0DY5Etjo
         Cwld39PKutJITvKGoJZq7/yJ5nzByurm+oOmSMf0Rp+MGQ/DeNOJ2O8W6v3NA7XXoPFL
         yzYz7DY/vwBuAuGtqIiTXlwfAOa4nasOplpfesHBZOXCUgsHOqDpBYasivNsVTjJkqsN
         4aNLrICTEK1HSty86hESvSKGiOyVQKH88r9f2SLVIlbbzuNu/Ppig++wJUDxYJG3jpGt
         p0sQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=awJBFPtvr+DkXNi0l43JJs5iiYIPgZRZ+eARrf4te48=;
        b=iyOWKqQAT8XkxuXESPZKCLIzOSXv1mPGKJRsuaZehPGthkJxLqN3a12fqtsNDKlFoH
         abiLLNwUFkbs2DH1vMq2+gsU1tnboaMcP1XrhVb6fG0yTXFzNSRE2bf/9KKcFExGiaJ8
         RQ9yOESJfV5C8wYWLYP9sF2dysmwTioT1X3n83oR7NEkOC1KTRy6baST8NpOZ/wtFRWg
         IWVW9yBkOuocrF+0pke+xdcJagHqlvPX2/i1iOmkhJ7cgq/UR3zzgvgKnpZLQWAKLv9U
         oJ2Xxq3LbPEb7C8Tm9U5/y/Flvl0rnmi487IfYyN5CS2Qlcvl/OmQlfqmmV4BuwgmXRY
         jk+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="O/+q76Nw";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::603 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0603.outbound.protection.outlook.com. [2a01:111:f400:fe07::603])
        by gmr-mx.google.com with ESMTPS id y24si2006559eds.4.2022.01.04.23.54.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jan 2022 23:54:57 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::603 as permitted sender) client-ip=2a01:111:f400:fe07::603;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbm6cLg7pqK6HSlhiods2D39FJqiLQ9o+9ujtxngGl8yGSeJcpyBDvH0HPwUEEINUSNsjGa86tyV8kxFeLI0patj6BT4dh/N5QSBJ8rUbti57o2ETIl8L6Oy3pWwD8uXupiycYbND5Q//0O0k5xwkCGfbuYOMZBwGktMcHVdUSqgmrJzeCBM+zufIQQVUHEqyv71PYVepHjxKiswUSUzQcGUKqdO/bQkwccA5KfBvmXSo+3JlDOvlSv+Av+2mUVNMIkMNH35SMy61gW7r+eKByzmVY89f0rf7/HsLWhs70UeBrx76Z3gng7tmYy5Pbi1gR66JTseauRcWZ4+fzr7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awJBFPtvr+DkXNi0l43JJs5iiYIPgZRZ+eARrf4te48=;
 b=iaapX7ld5l20lf9/78vK8sRA5u/RMV9kZLE9Q42k3kJvEyu8E4eklfyI2cSnTBQ5E8lZAaId67/zGLiiVX0trYDshR+TVHAd7egZejtRVNBZmlds8/wN//QrCLGDB8Gl9XhqX82QRGg3ZP8kc/B2aBqjJ6XB5w0mtWyvTenbsVu190qewnaVP0RvmXOpabZJwPs0E1U6pX9Yq0JhDdH7/9Tg7M+TzGTwZeGBHoT+Vu5zZfygNwZbT9ZpZtqRCUqlJYXIGXx9KawpXVOr/EsjxKHrizdBazP7XkUvjLKMKCVQxqfR9Pr6Ih8D7UL7OSUhedG43sMXFNPhCLUGn/s8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0008.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::13)
 by AM0PR10MB3236.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:184::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 07:54:56 +0000
Received: from HE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::ee) by SV0P279CA0008.outlook.office365.com
 (2603:10a6:f10:11::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Wed, 5 Jan 2022 07:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT021.mail.protection.outlook.com (10.152.0.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Wed, 5 Jan 2022 07:54:56 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 08:54:55 +0100
Received: from [167.87.0.42] (167.87.0.42) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 08:54:55 +0100
Message-ID: <087160d4-a13d-4b2f-6aeb-db370227490c@siemens.com>
Date: Wed, 5 Jan 2022 08:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Building Non-Root-Linux
Content-Language: en-US
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <1564aad3-da0a-49dc-9966-525688ee83f5n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <1564aad3-da0a-49dc-9966-525688ee83f5n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.0.42]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08937f8d-4730-4b31-0c3c-08d9d020aa3a
X-MS-TrafficTypeDiagnostic: AM0PR10MB3236:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB3236B743371198E29CD17B28954B9@AM0PR10MB3236.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1lzT09EdWdQQUZUZThWZWdDQmlid0gyc2VLYVV6ODhCdTA1bHVOeHVIMTBr?=
 =?utf-8?B?RjhRcG5JVDlOc3IrVWozZ25SYkl0OE5FbVNnUytjM1FVZ2VxUmptUUFuZE5R?=
 =?utf-8?B?S3dTVzBGNHlNeFpNY3VDVkpadUQ3bzZhaEhtNlhnYm1RczRNR05SU0M1NnJq?=
 =?utf-8?B?UklnbENONDBRT3BhQStrWEdRRkZQVDVTV083QUpZelhyc3N1WWUvbUp6dnR6?=
 =?utf-8?B?YnlDNm1wUUU3VUJ3RzBxU3BZM1BFeDVmVi9La2puUit2dWl1UkNlUFdwK0Y2?=
 =?utf-8?B?M3hYT3RPTmtQZUJ2STFycE5LMDFVcmJwRi9kWVNtbzE5Yi8vUlAvb2RySTJl?=
 =?utf-8?B?aGtPYThFV1B2MDE4MmxldjdpTkRiZmcxakNGZmhNSEpLSkptUTBFd0gxYmYx?=
 =?utf-8?B?aTZHNGY2ZTliZnlOV1ZkeTdLeTBQLzM4NnBueHpEc3hsN01kWmp5dmVOclFu?=
 =?utf-8?B?Q3hOb1VFOFdCZ0dzTW9nbUxSdmtvWTRxWDRkTTY2U0NoMzJnYlJ3UWs2dGM5?=
 =?utf-8?B?RjRQQVFDSFFtOUJ1amZ6UU9GdmUrOUFObTZrcTJMSUZCdnJ2TndtTGpkUkJG?=
 =?utf-8?B?V2RSSFBkSi85cGM3aUwvNTh5cEZ2RXFaRmhBTndRcm9DQkoyaTVyNTZqUzAz?=
 =?utf-8?B?Yjd4RlkzelY3dkhKdUdQMzRyaW84d2pBV01qT1lpLzFsMnFwKzhyREc0N2Q1?=
 =?utf-8?B?bDNIcWNRam9Cb3dBOXk4YVBRVjBSNU9ZalVRNGNqcVM2Q1YvWUk3eGg0ZTN4?=
 =?utf-8?B?M1R4TlJmTm9VTzNpZlZEM3RVNWdIYjRLZURYa1paNWJwcUJqYjRiRVFJZXBx?=
 =?utf-8?B?NzF0UzNQUU9qeEVxTE80clFpdVB1YVhxRHFVdmd2ZThFeVg5NGpYRUlwb1Z2?=
 =?utf-8?B?azRTdGpJbGk4QnBvZmhDUHRtK1QwOFBReDJnbEdEMm9QSnZESTN0b2xvYklm?=
 =?utf-8?B?ZitmeDJ2c3I2OHc2MHdkcllzSzlCb3NOSnhtdEoydExtTC9HS2pueGRxYm5R?=
 =?utf-8?B?cHhKeFl5S1Fpb0lBRXNjSmRIblJoWDRCNklNVHdwNzdZd3IyQUd5Z0gxb3Ir?=
 =?utf-8?B?L3hUZXB5aHduemRuTWhQUldZSjZRQWI2L2h3Ty9Qc1FkelFCUTR4QVlxKzB2?=
 =?utf-8?B?TXFlOUJCS3FEUEUraHZZdlcwYWtnc2tLWDZDcmcrSkpmUExRZFdQUGhvTGRl?=
 =?utf-8?B?bkdrK3FtNTRHKzk1elVjeXFaSVhIaGhWdURybDJ3RnVsd0NKODJNOXZhREZ4?=
 =?utf-8?B?SVBVOEJoNWhCOHc3QVZFWEJZSkJpTU5xTWorOVptM0d3Nkp1dz09?=
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(186003)(70206006)(83380400001)(70586007)(316002)(6706004)(36756003)(966005)(31696002)(2906002)(7636003)(36860700001)(31686004)(47076005)(86362001)(16576012)(110136005)(508600001)(82310400004)(44832011)(40460700001)(53546011)(956004)(8936002)(336012)(3480700007)(82960400001)(356005)(26005)(16526019)(5660300002)(8676002)(2616005)(7596003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 07:54:56.2314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08937f8d-4730-4b31-0c3c-08d9d020aa3a
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3236
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="O/+q76Nw";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe07::603 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 04.01.22 14:53, Moustafa Nofal wrote:
> Hello everyone, I am still using RPi4, I have 1GB allocated memory for
> Jailhouse and now I need to build a custom Linux for the non-root cell.
> I started with the easiest method using buildroot, but I got an error
> while loading the 153Mb image:=C2=A0

If that image is so large, why using buildroot?

Did you have a look at
https://github.com/siemens/jailhouse-images/blob/master/recipes-core/non-ro=
ot-initramfs/files/arm64-config
to get smaller images?

> No space found to load all images
> I reserved 1GB using device tree @0x2000 0000
> Is there an attribute in rpi4-linux-demo.c that specifies space?

This region defines the primary RAM of the inmate:

https://github.com/siemens/jailhouse/blob/6234762737513985d5de14d860773ca32=
57f858c/configs/arm64/rpi4-linux-demo.c#L103

> What I understand, that the user can either give a full image that
> includes also the rootfs.cpio, or and image and a rootfs.cpio
> Is is possible to use Yocto for building a small linux for the non-root
> cell?

You can use any ramdisk build system that you like.

> From where can I start to use ISAR-build, to build a Linux for the
> non-root cell?

Due to size constraints we have with some targets (the Orange Pi Zero
has only 256M, and we start Linux twice on it), even jailhouse-images
uses a buildroot recipe to get a uclibc-based minimal rootfs for the
inmates. If you do not have such size constraints, you could use a
regular minimal Debian rootfs as well, just converting it into cpio
(image class cpiogz-img,
https://github.com/ilbers/isar/blob/master/meta/classes/cpiogz-img.bbclass)=
.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/087160d4-a13d-4b2f-6aeb-db370227490c%40siemens.com.
