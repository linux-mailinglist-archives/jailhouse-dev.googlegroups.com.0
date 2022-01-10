Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZVZ56HAMGQEZHGKPJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2F489095
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jan 2022 08:14:47 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id d12-20020a196b0c000000b0042afa90ae9bsf3503332lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 09 Jan 2022 23:14:47 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641798887; cv=pass;
        d=google.com; s=arc-20160816;
        b=nyJz8dALDRGYzH67S+xmifhdVEqIM1PtUqF905iyF29iE+Dzf74FlcBq0SEjxfkdxj
         6oq9q2m5YxFSJGMEaH1OaF9LSW2BDW75tzMxLbF6tHDqrnk5X0Bk+PZwu6ZjaZiP3YIr
         gwWioMT3FwLwLoSAzklknBrKXbcFZxYcAmd/7yb6e6JeovY5jDK8BqUWnDLmd7VDgsPL
         CjKMZSS1wJVFCDguntYfkAK/fNvtaWtRhUAio+NKwUa5GefufqWCLgtDaC2qR5IsHeIl
         af0g08PF57PK/pCebMg6Mhx8l5a+R1zeLe8NVfod1YG9lJE8MMuLl2c1wmd5YG8J8EeZ
         vDsw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=v/px1Zm0tiWUhYyrz9vZccgqW1BUN1kHwSTA/KPtDo0=;
        b=smxSByrH5ZADrZ9N+P1Ne16lKRNUnq2N23QzGcmaWME79K89JHKAEY3COsP0icCs8G
         kADwoUlV9/cetusKUBSz/Kk7Kevp0n4KOg79UbqnmrNXeo1yynGC7pwpKhGi7Js1J0DM
         ocwTgO8xoDvoOMj8dmIpCosGKQ99R/cqxayglleHQMr4rqnAd9J1YxpQJVAdzeGGSZaZ
         hntBTs4hlsWuacYCeZLJA1E6siOZk5YcKMDYndnWW15DFF69uk2aJviBEeiBMrHRcTZh
         5mDMHu0vTGpFUFtVeZM4iB1i3CO8y9oLwSJE65fKQIhSAYrzmqd0XDZjxKXf6I8uA8RL
         54IQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Qgorfr9n;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v/px1Zm0tiWUhYyrz9vZccgqW1BUN1kHwSTA/KPtDo0=;
        b=g1jaYOeMdyQMPtUuMu4Gfbx8lrdJ2PmaRrc+Jc+E5txHPgS8Bl/Bno+j6a2Juqe3sq
         o8UGFaOV3xyKIYYJiHRHnR5omh/Ajw9hDqHMHoQ0IDScDJFH4OCruYLc3xe93GVhAl81
         PY9/s4FAbfWNNVPfqdQelNifb3ouXnbHfeHN/hxgmXtbSgmXGPo962Wljz6fUO8Tnte6
         7Q9kREWCj38LdRYyPPp1UNC0Z0frwDCCJ3dry8eEDdElwsqUPtje9Mk7Z9nIIDxXp1me
         VAlSp3rRiRh90JfwaQ18IK9OzlGjCX79FC9WUxXSqLHS/Ruz6yZ2+OaVypV7zqsgwM2L
         xoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v/px1Zm0tiWUhYyrz9vZccgqW1BUN1kHwSTA/KPtDo0=;
        b=DksHyEruhJ5EYNkN2g8Wty/sha42y611QryFTzKqF1ZFilMDPqS9W7MKtiTXrJlTYE
         0+Fj6rAJNbfPPpeKZVWV/HFkWto9ZdxjxqZ7onbm1pOoRNeyz/7jNslE+s30U1+FPt+7
         fK85kpCpbeQorco5/ye5ZkELHoymB2vj++PIayYG/Ow2C4qxFnHoWcHZnxNqHQoZnYjJ
         NTnBONs6Q8hqnQ4DCe9nkavL6ewmuHjz6WiUFBKtN8ySWvmEF2YhvWk/glQIgw9T0Cyv
         JFUoi9rVu32FYbB7NEPfiqBGU8JZi2me4pj61wC7TDRF3IoVALDC7sOc39bGCEVZXTmO
         LuhQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jWu8vgzC7IZ1R4NRw+ji6QORvQ/WyJbojoSbSUkBh1z4aOJsD
	ogK6FDJ5tIKaU1ECF3FrXi4=
X-Google-Smtp-Source: ABdhPJxtGINHyi5otto54uJbS+r8exasadAjN79L1hq59NU4By5lM7QPMaK0Osoi4vz4FxBQS+FJ5Q==
X-Received: by 2002:a05:6512:1285:: with SMTP id u5mr3406608lfs.342.1641798887147;
        Sun, 09 Jan 2022 23:14:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:211c:: with SMTP id a28ls1565768ljq.0.gmail; Sun,
 09 Jan 2022 23:14:46 -0800 (PST)
X-Received: by 2002:a05:651c:223:: with SMTP id z3mr39873612ljn.93.1641798886050;
        Sun, 09 Jan 2022 23:14:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641798886; cv=pass;
        d=google.com; s=arc-20160816;
        b=PKIihugW/hKkn66GaKN4cnh9JK0pLhSX47VH9G0yFvcmCGpyaDJjS0DfxAfnAjS0mw
         v9iXiMnZD9AhjJXu3u9ClFundGZjPgAK+TRlskwKJjFvBJcnCAwKqASSBX1oON0iOtPv
         VCDnjUUBRS5co7Wp1mA0OWBWkxqdavwRU1atnFdtSpXMnESeHvKzyLlc2ARGKAmD8SNe
         FrLr/yRpQNrMWS3/86TQgwKOB2QHLeN7z52NpPqA3oegaehKRit1RxSosixDxZf73UJb
         d1tXtGP++D2bxoelalbevoD1KseBeYNYYY3l8EsDIMxQpErEjH56u12AFParm5/Haaq1
         oLig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=veK9wvgWFSwMUioeRDCjVMChQ9E6+k51PoIoLWSqP8Y=;
        b=qw+43+zwpBoPuv3HOcsXXuQ5bVFtbgD9v77K40mzvZE+CX0MKU0ydoSgCYRTQ37abJ
         t/78S/zrXTzg1ONlfTxUjcHW+F8qbTV/eCSxsu9TlG479vrB6hnNc1Xg88bN/KokFG8h
         XmMCBoaheqqiEysTK5Z57UESrzfCmW2gcuHVOn3ktuTF/Y4Eq5YwiPFYOreqsUpYCBNn
         Fa3gF1j9MALZun3jhTJiYAy0dB1hdWAus04ZIBSC+yujq5/KGTF6F24sK+PemLoglOMP
         noV8YIRGsrDZuWHSLQC9qt6zZlLDJLVV4dfmM9kLAEmwXQlyLrTeM5rWJib2h0QCqF/L
         tW5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Qgorfr9n;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70058.outbound.protection.outlook.com. [40.107.7.58])
        by gmr-mx.google.com with ESMTPS id i21si275638lfv.10.2022.01.09.23.14.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jan 2022 23:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.7.58 as permitted sender) client-ip=40.107.7.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6+jHXCVY0hnPE1Bbiua/RePWv515Xdwott/kFO9Q1GWBcXyjIDJhDvGK5TEaFe65fjb01QydTmQityr0QMxLUvscRAdwzz59qv8z0Zo7Xfsy3s73+E6KEJSThoj2WfcRgBOfKQ8fRzQ3CHlq6C33AAB+6eWX1F99lQP6FMzmZjWYjdzVNgneL6CA4oe0h1muJw5fuHrXdMIkk4yidLlO7uQqQ7TdrqiJo3bI1aXDe6KiofaPUgBvKQQ8qshvutZepsosPyZvZzb/1K4VY4eSZmOSOBakI/Nfay8ffy948VhyI5EoyVlW3hxCwqLtTBCljSTtTiJWWOR38lESDjDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veK9wvgWFSwMUioeRDCjVMChQ9E6+k51PoIoLWSqP8Y=;
 b=CevjEqs4vd+w/6aMTIzlqA8Wc9dMcL8FIpm73ZeQ5kic4sIrKXMk0sefGAlZyfNgQG0vm9RwkbgGbB6lVFsq8hdoi/14Qv//0NrtaIetQR7JENUcPLW5mJGEHn0ScwvMgTWukhEcincsr7t6zoiiVzlXXbrWogx+XjtCdk1jRxUfttONP6JD1NcEexqpgt63/MsEHJ7rYXIuG7sypi1vaUTSw02P/YYTLwWJzzTVQp9nWUQkW24PsrVU+LLyZmRp9OrFEfBC1FOjJRuvG/4Is3/TkqIp2F8cP96z8k5/p3uYPeOLUfxDytsUeySz5X4WbHOBLm/Q0lnH1WTaB10b0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=googlegroups.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by PRAPR10MB5178.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:27b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 07:14:44 +0000
Received: from DB5EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::9c) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Mon, 10 Jan 2022 07:14:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT035.mail.protection.outlook.com (10.152.4.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.7 via Frontend Transport; Mon, 10 Jan 2022 07:14:44 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 10 Jan 2022 08:14:43 +0100
Received: from [167.87.0.66] (167.87.0.66) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 08:14:43 +0100
Message-ID: <ef2ea9dc-4e55-482d-b53a-c9a1d0e02a9f@siemens.com>
Date: Mon, 10 Jan 2022 08:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] kbuild: Use clean-files instead of clean-dirs from 5.4 onward
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.66]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e5bb0b-6870-47be-1771-08d9d408e0de
X-MS-TrafficTypeDiagnostic: PRAPR10MB5178:EE_
X-Microsoft-Antispam-PRVS: <PRAPR10MB51788489F3EA9AC697F90E8395509@PRAPR10MB5178.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBkH8YlIEVXC3lv5PnBh8M1iKezc8bWht8bjGa+Dcfz5zfvlzIKPIKyEj7H9dv6Swx7kT5QXtJ7beLzJ0esnLxEJ6ZzraEz6t11TH0Bziwu6GBDt8a2NxTurzt/ZkoHwXDzpWqsmpNWtBUb+wDEQya+Z4SI0f8qrIrqbQkoeMjyZfk1BtdmEdUYUL2KvKwTCw4qyoe5B4rpRKg8pGTXEjE9H6G5kW18BUjSua2IMgQFZ2qLAosu2fgpeLzZw+sRAROkfDW6orI8xa/4uuF/r/qbAQRiV+w3Cc6qAQw6RYFWcPWU7sTWv8Q/cOOCQx3J8V3TjJ7UqtUVA6tlw5wHozp65RpSz4k4R87afqJSTGLHJhPGLAnIsIGeZD4XSmMOTIcjQ/UD1YqVOc3VHqmOAogqlOC0zXZCqAsxdcIAJVBmlyu/fgYF5ZFTdOg5ukIa7jdvLF0uGaPNO/Etr34qxNGV5zfKcgVqvdl8VwGBQS3S7ZG3EjsbxvZQ20ctplNAdEuctLVwHIMyoWJMSgixeR2hxdSVutTP05v4jxocnOnf/laMu/1c9Vu9jWhRq0aMcAyudMnxlTyQu2xBY9O5iPpRnil4ckIaNVS7EaQW7yEagYBIupRE4f1Uip+Sy+8uJojw2Bj/YSAeqRm7fdXk82TLexlr9DmVDeKpj8t1BSiyoF/X5t7aEUkQU01yX4qRmW5F6bopVi1eq7kJyaivaCSYv9a7tXOaOKQ6LFnr/tbVx4leVF0QAoE5qK9MHp3qvIuE3DyNv9ADvLKtDJDsbR048LJuhWb/2KEkoXENViNPBHpuWEvti3AFDEuYqFkltDZvQQ7Wy+pWm2gQKhspY6d89kpL5pMMERRVp+0g+MLc=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(82310400004)(47076005)(316002)(44832011)(16576012)(36860700001)(5660300002)(186003)(83380400001)(2616005)(86362001)(956004)(336012)(356005)(4326008)(6706004)(6916009)(16526019)(508600001)(2906002)(31686004)(31696002)(8936002)(70586007)(26005)(81166007)(82960400001)(8676002)(70206006)(40460700001)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 07:14:44.6332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e5bb0b-6870-47be-1771-08d9d408e0de
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5178
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Qgorfr9n;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.7.58 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Since kernel 5.4, clean-dirs is dead and clean-files works for
directories as well. Detect the kernel version and switch over in case
we are on a recent kernel.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Kbuild              | 8 +++++++-
 hypervisor/Makefile | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Kbuild b/Kbuild
index 2863c121..c12f1aef 100644
--- a/Kbuild
+++ b/Kbuild
@@ -71,5 +71,11 @@ endif
 
 clean-files := pyjailhouse/*.pyc pyjailhouse/pci_defs.py
 
-clean-dirs := Documentation/generated hypervisor/include/generated \
+CLEAN_DIRS := Documentation/generated hypervisor/include/generated \
 	      pyjailhouse/__pycache__
+
+ifeq ($(shell test $(VERSION) -ge 5 && test $(PATCHLEVEL) -ge 4 && echo 1),1)
+clean-files += $(CLEAN_DIRS)
+else
+clean-dirs += $(CLEAN_DIRS)
+endif
diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 8ae4e332..c31ad6cf 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -50,7 +50,13 @@ endif
 ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 clean-files += *.gcda arch/*/.*.gcda
 
-clean-dirs := arch/$(SRCARCH)/include/generated
+CLEAN_DIRS := arch/$(SRCARCH)/include/generated
+
+ifeq ($(shell test $(VERSION) -ge 5 && test $(PATCHLEVEL) -ge 4 && echo 1),1)
+clean-files += $(CLEAN_DIRS)
+else
+clean-dirs += $(CLEAN_DIRS)
+endif
 
 define sed-y
 	"/^=>/{s:=>#\(.*\):/* \1 */:; \
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ef2ea9dc-4e55-482d-b53a-c9a1d0e02a9f%40siemens.com.
