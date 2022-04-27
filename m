Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBE6DUOJQMGQE6HMA7FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 411BE511119
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 08:24:20 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id l11-20020adfc78b000000b0020abc1ce7e4sf348477wrg.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 23:24:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651040660; cv=pass;
        d=google.com; s=arc-20160816;
        b=i5UjQvM/lccQPlzoM+CNbTX/BJ4ewCGrXHHmr4pAq5nBVNxW0XogX5+2oVttgEf/BE
         Ql1OlR2wpEpvfafcyVLeF2dFWDlIlLCA06CdVvqbTUUHaj/0Wt3ZNhSyvh5ZMG4nv6p0
         2XaEDXHy2gzY82sa+k1fDoq0zNbX36GKsMB9N8F9urJUwe3Skcp/hj8ztkFYSesgHKgt
         OuCAFTf6wuG9SiSPjNmI02Qx9ADfsTpDRizcJbVQGNa7gUFxx7hObNmDgVrFyiswqZMT
         b1GBvtH93MvpwR3YSH68pBZ5dOJe6E0s0bTH1p8KUqs06WB7culCk2sqJAuI2Cgl5pUY
         D91g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=53Q2xRLTAtXFsz/VbO5ZCVmiDVtM4jHMPJVWXz2Yd8E=;
        b=Hh0lYjHqPkPY35qPv8VZytEIEkwG12kWnGUwKDVwNjcFg3Wj94RIKMCT/OGKLA1A/5
         EV0EYIPeA81DPK5OoAiWVz/T5c0yLHYaZ5jRVv1xpUj+tpJk9UmJwu6Y+qx5wjJ7JE3G
         I/zKOrECzIlWFjSBPZ+uQBmAwm+8yjc60FAvpib3z4XQ3PlIAO2uuvnglAWjX4gXMREA
         e8vk8TOqCQsTIjZ91PjhAaRuGZty7RN+eyFaDAUQaJ+jny/zjnivqCZhP0BsE0UrvEJV
         FGZg1ssqNTykEJN5hOS9zp92KBjtKwlKoU3t2CzW8MARDtmv1KA5m6/2b+ZBAHDq1mMF
         jGWA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ahosCoWy;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::619 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=53Q2xRLTAtXFsz/VbO5ZCVmiDVtM4jHMPJVWXz2Yd8E=;
        b=qS9DNrp3Xjmc01gPPyO962pfR1OoeNG/nrz8pHMV4iEKrUhj7ZHmjRq4G2PIBCMPBV
         O77BZjCQ75vPnaWTM8pYZTgjEAwdBCnuASvQkcXtcecIJnRO4mNOAfxszsgwcsPPohP5
         ehXZ6TsQ96w8eD21hmDTVX0vifbFW7OnqvB+CirmInlGlj0KBU95lpKafGEVfgim1rqY
         mGbO/LvTTqiKqVbtwxw/qnpQYaV1huuxDjtm1OwbQRUgjSSfqSRVaTi7HJ2RDHyw79e7
         9hqs4Ci/avDH3wKCdQVKqW/qugZBL4pE9PMK9KQDnE+5PL/bGyl66XMVb7i8TlHe76JK
         lD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=53Q2xRLTAtXFsz/VbO5ZCVmiDVtM4jHMPJVWXz2Yd8E=;
        b=AWo3Sm+c5vfbWD0mi1cT+yE6IXAhBepm53f2wKzLGUrBXm/6AGoTMdChKVNLKqjj1n
         hlD8IH0UUimM/TUid/gMr2lgHKhVXhrrq15lNoT/YRRui3aVZvoV4dj+Ru48krbQlSkg
         rFrT8SDOuxrUqngASE/+S+tco11ebM/bk9nIJ7dbLayGkpHeCpybAfQvfTds9Lu03M+a
         6tsi9AB629GmFnHd69MfuXLpTJHihAVSJy173I8QFGwshzUxXrI1viSrLxT4mVqbkq0X
         s6GlFsjNOMB8+j6IRyeibpK/SNNZ6qiGqla35Y+NORsf++64Cwg3QoTuKwVbjwb46OEI
         Z3Zg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SdwiHAJ4CeY3mLMP0Gaj+PFEQ46xiwtwAPceHAiMBvvGDWpFL
	0eC4C+QubOYTYRuGdbXCKbg=
X-Google-Smtp-Source: ABdhPJwxe6Hm6UmGTuyZP4HpySOQ+jknBBThfMMcyaSIjPT8Xfqgdk/Xz/Ed4zXEuHYQa8GN3TTjTA==
X-Received: by 2002:adf:d213:0:b0:20a:d703:154f with SMTP id j19-20020adfd213000000b0020ad703154fmr14674564wrh.604.1651040659713;
        Tue, 26 Apr 2022 23:24:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6d84:0:b0:20a:eafa:40fb with SMTP id l4-20020a5d6d84000000b0020aeafa40fbls1603232wrs.3.gmail;
 Tue, 26 Apr 2022 23:24:18 -0700 (PDT)
X-Received: by 2002:a5d:5989:0:b0:20a:a2e8:2d8f with SMTP id n9-20020a5d5989000000b0020aa2e82d8fmr21200210wri.106.1651040657941;
        Tue, 26 Apr 2022 23:24:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651040657; cv=pass;
        d=google.com; s=arc-20160816;
        b=zIYJOd8xAndw3dhAWzYfr6UUJXQwfO3t1L2gdbMk71lfgM4T+Emd86l4jpCKhT2b5c
         mbgoEJPVQmSNMerIvWmKqh6+QWNQRRxOqsXEFnj33CoxbGc9Yv4CrlE00U/CRPltjOtW
         QXW2Qoe9t+4EVPXRh+ySUIhBcCgGfqjzXsIksdLznLbQImfmys20zZZPom/K5RoEy2qK
         1ruszDD2wOK+ft7B02eAoti6R4EPhLWeZWnBHtvN2f+dWi5Oxj9Gpku/wBh3X3/NqDyL
         ZINOCxZttgssvqb3K9B4CI1qKpe5VKomci6+T+x3uAfTrlE03jdgpCBnAT9IBE4toJl5
         gx0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7Dzoj8yEdCzEi+LldHfQtXVZruviC0NpCuqoPuaHBkQ=;
        b=f8ovUo7UaqXOQm+VFnvL4trgGHpMPvlO7ND+OQ69ZK+UURYFBItxkc8dfpzgOD9YHG
         WjyT5Q2zDfm290uqsm6maLIQmbSsXbFNWo/UxrzMd+D82PCqPRM7JxESkNuJWK7lq05B
         ctAxzH/WbWz4JIxwR1o8qIJQmuaRyROvxmZrBCHtrm6Pb65+n2ScKK7tXRQ47vXlHsBQ
         e4wbR4x0r7GbHdpN+q6ENQcted4Nrbxl9HqcOCu5PyUt7arWpsVDIEKdB/n4ShtnDhnm
         WfAYj0KLL8omwt2GRubQBa4xQP3Y2777dRzdEES270bSiTZx2umLxzHjX6tSZgj9ENfq
         O9xw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ahosCoWy;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::619 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0619.outbound.protection.outlook.com. [2a01:111:f400:fe0d::619])
        by gmr-mx.google.com with ESMTPS id p16-20020a05600c1d9000b00393faebeaa1si168267wms.4.2022.04.26.23.24.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 23:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::619 as permitted sender) client-ip=2a01:111:f400:fe0d::619;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcNfvO/TgONNFjNKxE2i892ZJvhxgprPLpQTEERPQX/uN0yFxoSw1slOC0OXHEuSzjA3z+btYGhsGzurIJ9MhTUJUpqDZ8zcFWXhejr+4Bap8ZCwYrrERxQkXICdkz5KRvPHneS8ZCO42AXJoERgWfNxIktw3ls7J53raZ+f56C3AYyqBGkwlIniCr0+ZCik5YUa/18s5Xyunu+KlgssWyN1mB8xAXrORIPuzcSZOpVjGYON3P9XQ4SCiZDWiV2jTLIl5AUA2hIELhxwgIGY8afDONxNjmZsp1TF9scoiZW1LCu//eWm0mAv7RVJ8dIHmAji+JYcbG9ADpUZ6yINpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dzoj8yEdCzEi+LldHfQtXVZruviC0NpCuqoPuaHBkQ=;
 b=bCCgb15U+BdzTx3fatp1dyNxs7VxhMoptB2puDf/MJRORHsTdwWlR3X+4YgaYVomDtUI4hhct2xNSr/6mSe2Y0L7xx994DOLNlnQNkGbBSiaE0xo3upD+EyJG9PP/mTKteYYTmP3aBWoqjkloBhgD3I5Yse8gmui2GexaEawXKjbbTss4DrukTHh3eIyTa5wCEbw6cE8uOa6MhKvd3fbYi6orV1Jm/Uw2JHQFad/63SwKB/euREvLXgYASQF9/g3qtYlGq+UidxGFzNDsAZjcLgYOW67oEY02nBPrT9ofRZITNg6Illl55JK/FTZ/yKYReBszk1aTmCNhd+GD7pv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0065.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::16)
 by GV2PR10MB6307.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 06:24:16 +0000
Received: from HE1EUR01FT070.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::54) by SV0P279CA0065.outlook.office365.com
 (2603:10a6:f10:14::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 27 Apr 2022 06:24:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT070.mail.protection.outlook.com (10.152.1.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:24:15 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 08:24:12 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 08:24:11 +0200
Message-ID: <3c1ce5d2-fb60-a7eb-82df-5466e1320f92@siemens.com>
Date: Wed, 27 Apr 2022 08:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel crash after exiting from enter_hypervisor
Content-Language: en-US
To: manliang tang <manliang.tang@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <a46c03b4-9f14-4240-ad4f-0dad3a335f47n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <a46c03b4-9f14-4240-ad4f-0dad3a335f47n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--15.970000-8.000000
X-TMASE-MatchedRID: rRgX50UcFf45QaOxwNGfvo9bHfxDWoibKx2x0HdtdQGejeo11iW0N5TX
	Nrcm6D3CHWtVZN0asThdNWjRmIR60a2qG99PLRc3ISY37lC/JDkPcRrRRxQ0u6chFrOB9kan2FA
	7wK9mP9eKIo9dsR2z7iIuo+qKgiX7CgJv2fOozEPnYkACacED665Z9Sq9o5Ey+CjwEqX1p7m8xE
	2H2EuMWYDpStszePepPaP83yYyCuQ8Za+agRR2Ye3Yrzf7S5PM4OhwfKpL0fBuXgIqq6mQyvRU+
	9PTPHSYp+5vzsY5mKPw/uiEDEcVOeLzNWBegCW2RYvisGWbbS8TEC0P9PvYRt0H8LFZNFG7JQhr
	LH5KSJ0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.970000-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 08FCE76C0D6A3DD1537897ACFB3A0D7096048255C43D77BDC86ED3E058BC73A02000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5827639d-5aea-43ea-3b68-08da28168db7
X-MS-TrafficTypeDiagnostic: GV2PR10MB6307:EE_
X-Microsoft-Antispam-PRVS: <GV2PR10MB63076DF36C52381436AA17A395FA9@GV2PR10MB6307.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LrWdOOKZbmj34iQdK3V3pxddk0naPU9OsK58sqwY64PuoPjP8+3199cmeY7Chsrs1qL0tQTmMX1qEjTo3YNjYU86E/3NHLEH1CbwXWANnoRZavxWzRx4Yznffjd3lGGsRw5VV2M7+44GJOiVcFUUWtpQMVfodzC/mJsYyPiCP53iX3ERMqyPM4g7kGVxfJgREbNNnJUO4NYehEeNXWxdg71gRskjB2lE/s56xchN2R1yeS3XvliaC67i507x90F/7pJXaS7jCSDaUAMgidut7XSJilMCBYleVdYV8pJWoa55hxp94l0M6DsiriWOMUHvQAUrmpvA0HxXGpY/38NfQhWgC64FHf4MkNJ+oJEeVq7DKRuFQjQQd/BJo5MKuWUGBPCrH6Or+hM+dQyMwqEj0FXG6QO9Rg8Ktc2UwNZrHMBiLjnMRc1z+atQ5VpjJIrMtEBYT1vVEVArQMtkgu23K9m4HwSz0EUf08r2/Bnsz6kE2ZEsdAOXgvS30ScPqvw/Fd5tnBfaiAtWQJXnmoNeGsHwKeTz5MevOGP35qWyfAxG8+I9MomCxeUI5+4FxH8frj/gj5i+/Hx45QLkFYMCT6q1+SVO6tds5DF618DbRkxUJV/ixhhLPPJw5goSjSPguwW+TLsqRFl88TnNcvtQgrJTpamd4HqmMB6qDCYw8dJtBylXpaVSDuFLLRKKlcFplMI0g3qCtqwTsqSpgklxbUF4hwPc70oZ6gMfpoEQEo7E0+p1cTALfcLWwaPuvow/1Xlx5DZZoLpX1C8Pdjo9wA==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(53546011)(82310400005)(47076005)(336012)(36756003)(86362001)(31686004)(16526019)(4744005)(26005)(31696002)(44832011)(186003)(40460700003)(5660300002)(36860700001)(8676002)(83380400001)(70206006)(356005)(70586007)(6706004)(16576012)(110136005)(2906002)(2616005)(8936002)(508600001)(81166007)(956004)(82960400001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:24:15.7590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5827639d-5aea-43ea-3b68-08da28168db7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT070.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6307
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=ahosCoWy;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0d::619 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 13.04.22 13:44, manliang tang wrote:
> Based on Kernel 4.19, I tried to run Jailhouse on real ARM board. I
> build the driver/firmware/tool/configuration file successfully, copy all
> these files to ARM board, then set the bootargs(mem=) and inert the
> driver module. I saw the Kernel crash when run the "jailhouse enable"
> command.
> 1. command
> /data # insmod jailhouse.ko
> /data # cp jailhouse.bin /lib/firmware/
> /data # ./jailhouse enable aml-c2.cell
> 
> 2. Attached is the detailed log
> 

The crash does not directly point to Jailhouse on first sight. Seems
like some callback in ipv6_dev_get_saddr() is pointing to NULL, and the
kernel tries to invoke it. Or do you have CONFIG_CRASH_CELL_ON_PANIC
defined? I'm missing the output of Jailhouse itself. If it detects a
violation and injects such a crash, that may explain the NULL as well.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3c1ce5d2-fb60-a7eb-82df-5466e1320f92%40siemens.com.
