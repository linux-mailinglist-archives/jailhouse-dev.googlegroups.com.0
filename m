Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFOG7SHAMGQE52ZRT7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5B48CB46
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 19:51:01 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id m9-20020a05600c4f4900b0034644da3525sf2080502wmq.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 10:51:01 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1642013461; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ikin+f+H3bTOSy8dviAQ0cozwNYd3VnZm2bncHhevWrK8xtH+7tRY5dKAA2jjACHdq
         n+8gRBWxzE+3P0VrI/O0aL++FiZKnl56uXGyDFtWZyVgGZqcsDIEo/UoC6jJO2iFavx6
         EA8avZop8M11XxW8dlzNMSIoFnEW1eNSKfIEcqEqg2z1xe2eAholKr2UQSLHZHGKw4CN
         QqjQppZDNHDmDSo3cMgXWUd9CFPPi7zWLD54K85k79feyFDdRSkxmqaBwbomohCbP1jV
         y/z/jFKny+ZcJGCPpfInfA8EBS7iy6dwm7ab0+H3UWEq1Ak4fOumulMp/BKb56xpbO6Q
         +vcg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=KN6F+YF1ymmwe84BS+XfL4LXPZw1A3JYL5NCJw8j280=;
        b=w9sfHfoUR107dqQyj16AVcz+TOa5ghk38fBZaHMEqkTkO3zwrveL9Jc2fnEId41g4d
         XRQMKPcSNIQwNLrbjKJx2U1pwKyqvDmmt8OhvYfbUbUt4aIpef5dRgb7Qc/MZlfnC8Lp
         rgqEd9hq3YS0bZ1+eR84W05sk8wwT0blJ9D8UsiytDlaJ/reQnISE5BMaYvmquKizZmM
         ixhSlAOgF/B3Fe4H11Nbq6ZIXY/VjWjwg8C95X2YSpduf5kz5Sb2D2k8NWfjvy4O/bz5
         KuxHkWp1G0gbTtGmvtoGWIGyb3IVhOiA4mjAhrshxVkQHC7ifiPG1BMZeM3jca1HOajw
         DS1Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ep1mDd8f;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::60e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KN6F+YF1ymmwe84BS+XfL4LXPZw1A3JYL5NCJw8j280=;
        b=I0PCsyu9VN8cQmi1nTYmvUa2IqJRy4oq0vAkiDsmS3lIPAUYpanFTEhxQrf94FDy8j
         F7/uZIMi3KuqgJnBc+CLPihMXtUWCSYFYyXGnsqhniY5E/BzAO2ieZOwTLrq8PvI5dl3
         qPcYSzkYngsua+Maxxt8TuHp589j2kxJA+Z0znRoAD/z57xV9YliE1sOjb0CDoFsE/TU
         2x74mFNuFKzOicnJ4fj7kcJgsJQV3YwdwBD0jG+AcOXYuLNL4JTjpeMV1efyTw0CKgx/
         cwCtyCiRLY0Cx7jJUZzII48oqxVw4yXLjsrhHkdQc5c+e2TeoxY3b4uoBhwiepgjdWDI
         CJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KN6F+YF1ymmwe84BS+XfL4LXPZw1A3JYL5NCJw8j280=;
        b=ptAIQ4wdo9oz0sI6O9Xi6AOb9ms3VTREH/RpycKNfXJXJemRJPzgSDX11Z+KQKxWvM
         uYdSniRypyBFMdpCI4aWY+KlDRMnReN0X8fhpp5xWI9U02zGQMtgbGq6ZdbTNYxGKCQn
         L4//8hs2ReU5bMvL8OVZU8jdgLXH8b+q1WYVcsOdMg1RIU1hntUtDjYFxKuqqWouU2Oq
         teUD2Cja18LNgpFgLOgpEPSD63x2GwpEuAzsSkU/dM/O9qjV9UYdb5wxkyBLqAqoOmwf
         k1Vlp5n1uJL6rxGg6im/Y5RakhxA0hmVOscFRDQ6mx+suqTSZ8/CqkvazCFlAVezR47Z
         t50g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533y6lSXstBrTXZB31OIOt78eAl29jQ9PqHlfufOTdzvutg03oEN
	2jG8pGzr3D7kThDneu7IsqI=
X-Google-Smtp-Source: ABdhPJyXm8UFaPXaVUVp/2b0Ul3C+Xc2MyEJp0KPn384VGeTXhkjBfTpwBso6K+oUtR++GhztNwqMA==
X-Received: by 2002:a7b:c4d8:: with SMTP id g24mr7965321wmk.79.1642013461590;
        Wed, 12 Jan 2022 10:51:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:53d2:: with SMTP id a18ls54124wrw.1.gmail; Wed, 12 Jan
 2022 10:51:00 -0800 (PST)
X-Received: by 2002:adf:a59a:: with SMTP id g26mr939730wrc.262.1642013460532;
        Wed, 12 Jan 2022 10:51:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1642013460; cv=pass;
        d=google.com; s=arc-20160816;
        b=GP3NIg84c8FAbTmbgljAu4aztVcVWua4ZLIMay+d27TfGuNJtrpMT509pdOECIcTze
         UvjR0w3X6fc08pvk5iU09qpTkeJCQNiErYnVWXlJkgjc4pCHjvYGPCeBOKmEanHaJukW
         3MvgYYwgBI2palATOH+83z4ZZcopsy50p3T7BByCyu6Q5JnrQiWQjcHTrokF54HKqNyg
         m6FuqYsAG2AKN2mctKL0zqRAvn0P1gUUiqKLsCtYuE0ucZj0Oo38DEJZ5q3Bppzq5FNT
         aqWxTa8euFthzTwjNdtFDD1HAYWK8a9HmOnW5QsSSrk2p0M2dLk1y5GgyoLelFn2tRXA
         ySow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PgJ8mWFfjUWBRQK7jcKafQ49R9Ny7RSROUWG3Isvz7Y=;
        b=UNk3APPCz/KZBG7Ymne5XnRwk/p18vLxBBV94x8NMfikOaW8thBEqVbXcvTSnBvE4H
         T8JbeZ/zYzulw69KwLwInDsKd+4f6idt5g2rjoYTjwXgEDrfOUknNIg1q4SOPevJ/gUq
         gDQR12FAaH45XbNf/yMfFKV7XWBu4U5RHnKHYqUoeZU3E7GlYkDlhFWt33/AUzJSZa9V
         UrOl88inTrUwQpWTsipUPHImBOV6UFqKnbN8wb4cDgxI6PdBDaqo+nqo9oZRgeWdFp2Z
         kQJyxDeeKi0ZY2St7CBv3O5sNhsLzgwLGiXkO+0I4m7ZFX8RlJRFjfjwRR/Nd7tKTwAN
         oeKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ep1mDd8f;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::60e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on060e.outbound.protection.outlook.com. [2a01:111:f400:fe08::60e])
        by gmr-mx.google.com with ESMTPS id s202si331634wme.2.2022.01.12.10.51.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jan 2022 10:51:00 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe08::60e as permitted sender) client-ip=2a01:111:f400:fe08::60e;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy7P+9caWPON+4ufr18JweZojYLj6temO2lAK/uttJVEp/dHgF0S+Kmp7Zi9eNeUaPq3H9vd8gPIayFYLBuNz9Y9n5WOOXz3JCRHtfrxtyd2chP7nQ2Er4oOcVwjFahuUxR5TDLd44o2dk+lqSILuVN1q3QTVTLVDtY0ceMyQrTNr7hhPlPkiGx+RprjPgMnxn6X0b+esky5gh8rOirXAOXKvjxJJduv7f+n8TeiadhdnRGjQVerNq6nPmsEY8XZlD5N80E3oirc/PdE3uWDrktOB0f2tYqg+HGyDOHUTZbhh0Qo/SvmdNLqH3YlqN1N8IdGpwf92V87QHcIOEE+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgJ8mWFfjUWBRQK7jcKafQ49R9Ny7RSROUWG3Isvz7Y=;
 b=WhE6tiRiexTgcRMrd/r5vSOqCpcWGZmIxf/X/XyvJAcPQzVUKmBEyBtDXp/tRAprG56TpZW1TLBzOTS6I8yTwcWGNMRBrz/QeRmx6pR/sD15JsWSQ8c+k4vbXdqiOIA6bS4duX04xed6m5nl/JAZBKESwHuWfTiwR05V3JDxbhNmi5/R5zW/RWo3NCPt/yVLBIal8iv/bA2qpgGajwP3A8DZJkfMZZzo4UWA4Ky4DnSCn8Eilp7hCnbnG0TnlkfcQrAWMNeHtoJ191WrHP5by35bWtXcCj/r8eTli+Q7sMOcIYq9fajEt7Dl19TDDORHJddaAj1+qr+a26AGNI/8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB8P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::20)
 by AS1PR10MB5142.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 18:50:59 +0000
Received: from DB5EUR01FT006.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::3b) by DB8P191CA0010.outlook.office365.com
 (2603:10a6:10:130::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Wed, 12 Jan 2022 18:50:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT006.mail.protection.outlook.com (10.152.4.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 18:50:58 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 19:50:58 +0100
Received: from [139.22.143.158] (139.22.143.158) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 19:50:58 +0100
Message-ID: <c53301ae-6590-1d58-083b-1de362fb12c3@siemens.com>
Date: Wed, 12 Jan 2022 19:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <peng.fan@nxp.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
 <b96280bc-3f0c-c959-ed29-e23e7b07108f@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <b96280bc-3f0c-c959-ed29-e23e7b07108f@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.143.158]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 487783b1-d137-4fdb-db8d-08d9d5fc7910
X-MS-TrafficTypeDiagnostic: AS1PR10MB5142:EE_
X-Microsoft-Antispam-PRVS: <AS1PR10MB5142ECB2BEEC267ED80D691E95529@AS1PR10MB5142.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzLvC37U7el9jiY1rMH2u44KNzSha1qt0G0G1HCHkT52bNZh/Gq4kNR4cbt4Nz32Y/VtsvDcyVU6Nlz3U6k1ctjAuTIbr2KVi5ltDsZJD6spQi6+sObxdQywXsZ6Us18UFd2fu+1CxEAD37rZdeKvAgI2FE/tgor7Bwu/kU/8ZIqOdsM4UGwlYZl1P/bxtVl8m5Wym6gRwQn66Y+heRdo+LR2o29Ke+G2F2a3L+HrdgvriKXqTbvcM4Cld0ESOMcJfNQtjL//nqu7aY3MBruw4FnJad89z5BlYvZM7dalNZG4dTJqKR8Bfx01CIvdOKUVIUKzsOjX8LeoM3qjg0jtyzYpzNcqaTn0kzyQNmtD26Ci7gxxyhA8Zsjln8V4iQHy1fkXSGo09WxVrpn6bshM0jL/l20w2y96E/yeREa3AIMBJxUSBI2JCxwd9yICKIbRfl2WDzrrRf5mBjKLxX9WmGqxk/ChbyVuhS81eCUItRBnon8aV74CskqmW/sTfDftBTRYRvauZ06BwRyY4FCfogum0gX1i+6wpJbCEGnZTgjasHf1Tw1+rcM7AvR5Yl4wAwDMUfRcGewGKwTX6ImDUMwStpZOtpFon5J3Jfdx7K2viEc1swXBMJnZP6ZzQcJQMCbPdAymXBNTQr/Jmybje5T3s577k3zbKAchmtufL/JBNgrWX7gwNgztMrdHXUx2dAX9x4F9O5xUUQhmnNZ9FfGVBI73NmRs/iSb/M6WMXRNhUCZLMEmwYgQUoUuHGzzqfRXD/ywnDnLgFrEgjCTaBO4vnCmELbZZg5leRo7/xvHX6bawNNeDL8pYo53PUvILw3wRDzgwNi2PDF9GvRn9jAHiFFTROiqBavz6FPWwo=
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(47076005)(86362001)(53546011)(70586007)(70206006)(40460700001)(81166007)(82310400004)(31686004)(26005)(36860700001)(186003)(6706004)(36756003)(4326008)(8936002)(5660300002)(8676002)(2906002)(336012)(31696002)(16526019)(2616005)(110136005)(956004)(4744005)(356005)(498600001)(16576012)(82960400001)(44832011)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 18:50:58.8477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487783b1-d137-4fdb-db8d-08d9d5fc7910
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT006.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5142
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=ep1mDd8f;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe08::60e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 12.01.22 14:54, Ralf Ramsauer wrote:
>=20
>=20
> On 12/01/2022 07:56, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> With gcc 5.15, met the following error
>>
>> hypervisor/arch/arm64/control.c:33:9:
>> error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [0,=
 0]=20
>> [-Werror=3Darray-bounds]
>> =C2=A0=C2=A0=C2=A0 33 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
memset(&this_cpu_data()->guest_regs, 0, sizeof(union=20
>> registers));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |        =20
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> I see the same error on gcc-11.1.
>=20
> My local workaround is to add -ffreestanding to hypervisor/Makefile, as=
=20
> this avoids builtin gcc-magic such as undesired inlining of memsets with=
=20
> constant size.
>=20
> We already use -ffreestanding for inmates, and I guess we should do it=20
> for the hypervisor as well.
>=20

The kernel uses -ffreestanding at least for its (generic) string=20
functions. So for us maybe

CFLAGS_lib.o :=3D -freestanding

?

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
jailhouse-dev/c53301ae-6590-1d58-083b-1de362fb12c3%40siemens.com.
