Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVGGZKKQMGQEF33ZK4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF15541FD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jun 2022 07:06:29 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id qw12-20020a1709066a0c00b00722e6059673sf1567105ejc.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jun 2022 22:06:29 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1655874389; cv=pass;
        d=google.com; s=arc-20160816;
        b=XwPV8DOpFZh+GhG+9MePkLeOIP/mkTPex9HaxUhBacWfkXEdmkuXPB3LyVsbRR88nU
         cSyD19Mymttym0W3ChuiRXJDGq34Bjr7V/pmfG4lwa/+4WCzG0UPxTEluq1iRXeJbG3r
         RkAGEqf9YrHhZA56aPJDtgcvvRIVEH3/3p6Z3NC1+DZCajiktXOs62DFEtI7tHqEn+Ad
         CNmyOdWNnavgwc/6Zve4H99fKHfnAr0+6FkbqByXHFdvL5nAV7HTJh8rCgrRGP7n4a0U
         kG8AbJnrkND/rOIwhlt5bf9KM9IajItvP0mn9G/76urXJLg6R/KmIYckY2xkQk1xLxJh
         Ck1g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=rzg+N75vX/HK45XcC859yzKApn++GA2r5gRbvDA8/CI=;
        b=ES2p46wlhCCEhjTvvL+sSyQUyTdhbT9nVBioZA3h3dLhSLReqwS87JdZJB+izBgNxw
         FM6kwS4WnkZTsyYMFHMxGUZE/3ucCDoxhjlpa+sjW9lGb1fKns6enFs8djeJBWqHgyyn
         gR3SzhOLQDe12ySA98DZIwLXo2Siys6FAO+o94KVostwWGTWVxA5hgkaYf7oNdaKCDWw
         A1Wnmc7u6Uw/DW2hhH8afkoCzH5nYOlEKk8UXV8k/+DVK5Q39iiAMjioQp5yVazg/d7z
         xW72Sj5ah9fPje5wWSDqYQhzWT/MH6a6XUYUciW+/q0U2SdffVKcsopQNtgiZs8zB394
         bgIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=CmYHlwEz;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.3.73 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rzg+N75vX/HK45XcC859yzKApn++GA2r5gRbvDA8/CI=;
        b=YYjN2FsOBt/9NsN9n0kXeCs48dgLuPM+HZICrtqicZoCeK8kHka4wBy+sJZ3EfRScz
         xL6Tcl/Oj0QjFzDjaekQ5OyGqTKkBIrCMg7uzrJAMhSod77kbNhNgAT8FBM+pWFNecvT
         Y1KopfudtoyciRDUa967NF8uYuvAZQm7IXjFkdG/vYb9FQUzVc8cihiIAU7wW7p311Ct
         f2BvGzugDoGogpqIsN+OBREHY+nUbxGofdxYle7tCVvuj6dxONBr3rM7HBqjAxGYm29s
         ysYPkMA/jiNBJ8A9HyhP4qQlC040tN/T7XvERmOiCfKmCNBo3Bb+WqmyQuAa4dPG7DHo
         4W/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rzg+N75vX/HK45XcC859yzKApn++GA2r5gRbvDA8/CI=;
        b=mpkUnurGT39ltb85ePvlNS1DcM/4JYQfotRYYV/Z9md1YcP1ugDIEWtP9hXUjhZ9TN
         MIx5pOxgCIJrHw+oevQ0kZ+5JJ+KjCJ2a9cD5f5P0Hy2b1380zETJsGNFqclneZlz1Fg
         2WJ9+Wb3JCO6/cMnobpZW8VWpyVEbrvfX3GjTfyeYfj309yQCUp0bKKsTEuApcWit4hl
         E0lliq6rAiNsYWPuBmo9NRHoBNzKoiM72troNEm6S7KDG1bNcmHPiY7ZPrYvv1N9Uz7R
         lXNkdCWk/hdawwkF1gGmUecTR1hUTC9JkjSuD6Y7pHidmOwHconxW62GYrMk7pn+9sgZ
         fNbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+iQa5rYGqPqvIEQgmtqA3zHOrL/JOYQwvNuWE+lCtmsMCC888O
	RQLr5K+9JNBKMke5c70CGjE=
X-Google-Smtp-Source: AGRyM1uYR/qARJ9/rYkpWJY81FfxlNe6p5JmTALyfGxLYMPU6KJGu83hTUqa/tzQSwC/Dp/rxz+urw==
X-Received: by 2002:a17:907:1ca3:b0:705:5a6c:d113 with SMTP id nb35-20020a1709071ca300b007055a6cd113mr1404089ejc.535.1655874389022;
        Tue, 21 Jun 2022 22:06:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40c3:b0:435:89f5:289a with SMTP id
 z3-20020a05640240c300b0043589f5289als484182edb.3.gmail; Tue, 21 Jun 2022
 22:06:27 -0700 (PDT)
X-Received: by 2002:a05:6402:750:b0:435:68bb:8552 with SMTP id p16-20020a056402075000b0043568bb8552mr1930914edy.155.1655874387266;
        Tue, 21 Jun 2022 22:06:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1655874387; cv=pass;
        d=google.com; s=arc-20160816;
        b=G53UM6g4Gi6bB13jJe0Ltbrpe6RvY2TZ7Hac5Xeh8A3zZnKrftyBrwVZDf5SxaGn21
         2ftzHAw68XtxRfdQUnPIYzkemGumKPWY88SVsbOz7/fMmyADsf0Ura07ZMOvzaNjOJUC
         udTf8EnF1hdzY/YCKaizdZDUNiEVO5TM/vDpDgxnyPGetT5UjKqrRK0iKUBOWwcW8nYy
         UJf0W4j2nyuNGUWjR1CF8MqcqpTYdGdwcgxOIN4cSlNa6WBfAFV59XWJKpNhwJrdeDb9
         GdvZMOwgpAHUsYn2GsQVKoAcxVRIiezXforOO2sFpA5MtAxcTTE29+mR7TGiwIIcRVrr
         hsJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0z6DgpmO0osYuQN019qMtesGk/5Lv2w3oLVDRb0xabI=;
        b=dzuA1vuG/RxS16ENl4fbb46a0PElyAHtyTatZC7Or2JVkmEnFs2PLfDuzWKvMflXGl
         f7AArScNSYUNLjbxi5/m0ePnvEpP7XeL4+hJ2cSjV23op0bRqmVDUw6okdyRo0zJE+H2
         E6CQ3Kab/uVVA+Z002MmbNJayoB2JaJL5ZPFQLRy3bN1poDfrIi7y/RkHVpAN+JblTw1
         seJEaWBqlGv7aVrnl9x+ngC7Wwf1bUkeKhu4AswJ63KqJK0lHYw0c9s21KFIw3Scd6x7
         Wgsso+WKdNvL/Ys44YckAwvPlSO48fWmi6Mqgn3YUYCg++ZuHamdXKH/exuPRsJ7soF8
         uEGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=CmYHlwEz;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.3.73 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30073.outbound.protection.outlook.com. [40.107.3.73])
        by gmr-mx.google.com with ESMTPS id er13-20020a056402448d00b0042b8a96e45asi748850edb.1.2022.06.21.22.06.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jun 2022 22:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.3.73 as permitted sender) client-ip=40.107.3.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhUpengLBBWElrta2AbyhQC9jiEgFhLeSfhrVM2Ucd6xy3uzuSCwGDbmUsAYvqxmU5AFSrH0VTe7s0fl1zWw+1mz5QlRxbYzFzajBgt1wtBeeP6BtdaTBFtd8kOTyg5Dnwr82xNdfwANm5f0s3J2EpUHAGy4FslKnvZEMWUi89gaSjLO6+BuiV4DeIhjqKUZ9tqv1gQ6U4jxGWO7sUeVHCbGFSBBdY6KIVDkAeC//vQ3m07RrsxHwITFLwmuuj4Vcba65DoGUdbm9wJda4j9nTS1bInGG2D7kW9E9jmbQwd1p8Xue1RNhxCVvaiKKbmcmGMD3IhxWYPZkOcGsjbT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z6DgpmO0osYuQN019qMtesGk/5Lv2w3oLVDRb0xabI=;
 b=bteG3Nc87wM/pPwBS1pZXI5N7sKzVfD1O0YftHCdaSwhdrvMMq66fsHaTMwaS5b1eGE9jDekQE01zvmVLww8dbtokiPUnGjKihrIRaeZK4vGYZ5mfxdrX5ZpPmyVuYzJxLLKsEv3m9CLKTFSjOoNA2KgHvtsmBzxmP0XHoluqkTGjmG5Ql/PkeI41ZuwUzNeUn1Jnz0YYcFYPevT4Q/KelFpYGWBgN2uI/YYfUG/Z8YDWUgQ7CCp1bEmn0a3391CMOqPi8RQMerZana0vyt3u8zvlubTVGXgnVkQYCjDvwlBirJihPpoGwbrp6VP1wbx5yG4CPALHv2SDFsI+FMyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from OS6P279CA0023.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:33::9) by
 PAXPR10MB5349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:289::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.22; Wed, 22 Jun 2022 05:06:26 +0000
Received: from HE1EUR01FT066.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:33:cafe::ff) by OS6P279CA0023.outlook.office365.com
 (2603:10a6:e10:33::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Wed, 22 Jun 2022 05:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT066.mail.protection.outlook.com (10.152.0.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Wed, 22 Jun 2022 05:06:25 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Wed, 22 Jun 2022 07:06:25 +0200
Received: from [139.21.17.57] (139.21.17.57) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.9; Wed, 22 Jun
 2022 07:06:24 +0200
Message-ID: <6e8fc5f5-40fa-293f-a6e8-21913b4b1ad6@siemens.com>
Date: Wed, 22 Jun 2022 07:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Error with Jailhouse Demo Images
Content-Language: en-US
To: Marco Barletta <barlettamarco8@gmail.com>,
	<jailhouse-dev@googlegroups.com>
References: <befbf4a6-dd9e-fc70-6fef-e3fe193184a7@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <befbf4a6-dd9e-fc70-6fef-e3fe193184a7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.21.17.57]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--12.598500-8.000000
X-TMASE-MatchedRID: EhMq+2gclHto0FBZlmedTi38wR0jlFMDPWKLA6/g//vx5KZMlKYS/f3M
	wv7J07DXkshAoFcG3yTeA4vvVAfJy0H17M0IhBKB0tQ/xkSs2nl/P3xLXaXFeyyKzJY7d2nbPIA
	Xg1uNCQtvo4xXFXM05d+XQ++q8wX3rdoLblq9S5olKHq5PdPl/aeOtM+NJ84fbl4CKqupkMr0VP
	vT0zx0mKfub87GOZij8P7ohAxHFTni8zVgXoAltkWL4rBlm20vt5CrqYXZLj/dB/CxWTRRu25Fe
	HtsUoHu9sAL9uDAXYYVcN3d0Penl7KhHJPCe/tBEVXohkqKuJPFhXMjdQIJpg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.598500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 5C984DA6AAD7B18B9458EC69F76AEC57F5F3CEFAAC8CBCAEF103F3699B6493E42000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5764ee4-a95d-4a53-6c66-08da540cf553
X-MS-TrafficTypeDiagnostic: PAXPR10MB5349:EE_
X-Microsoft-Antispam-PRVS: <PAXPR10MB534950FA635D3BAC70D68A0C95B29@PAXPR10MB5349.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NV470rqfql+DFdQ+CLeAQxYV6rsuucDQNjVOE/Yzkte4EYHKs37TE38IS1HDZrVhnpZ/exQGJ5AkoON5dRB8f1du331zCTOVy6hy6yXPQzOtGVKH9EEeZs8PCIEmdTn1PC3zwnNVTMkaroIBd6NXsn7VzYGORqg3fuJ1izYnHRL9q5ppzM7KEE61K12XFX9K6rvKP10DsxzNGm7X6FWFusnzW+wFHz8z9U3Gjx0s/5Flw8wYoKpIEYNYmlOiWDgihHkqZ6k2vfH3rb/LKRm/woHE3KaKApdQYOcYhlug7wVA5zEh+3r5SmV3PQHXRConr6lwVTdcC8f4FeyBTg69tbyCym5taVdz/BhrK9L+Q95YCNez1N9Wu2v4VO18aHlG/i/dmJQqwqfy6I0hSUyhR+ylD8Hs3GvCwebpYdRRmWHsaS4RD/TXCWkZwKDYtMtYsyp2OrMDNKSR9dd0wKYToaWXIHLsP3zwtz5l/H5Dje9SFyJdpM4Jx2C/XMqKy98SQf85pnKYpXcogojoyzvT0m++H6iNdrrLvF4nk1zVltHrgz6ReKVN41Plz4Zoe3LXuOi464SE0kLPhulac/ouJs0m+xCaoqGX88sAk9FsB2nfot34FNiZCSmMzS6ZjpuoC2zL9sbCR//58KRNx3HvusaMnsdCLkEqJerBrjnt+qXy1jtmxT4uO9FMPOsl4QY+ki2e475mwLqhvnMMqJmDp12yACrryPVMSJ6aMSZRmCjWFgYpq36jjVVghMz6y7ja6uW+R7FAYYKjAWv6boxWAbG6a+HmJteTSnPiA4NNl6q9NC3CObDwKNdZZ1Gea0ts
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(46966006)(40470700004)(36860700001)(2906002)(66574015)(8936002)(478600001)(83380400001)(5660300002)(31686004)(336012)(16526019)(47076005)(186003)(53546011)(82310400005)(40480700001)(36756003)(31696002)(82960400001)(16576012)(8676002)(86362001)(70206006)(70586007)(110136005)(6706004)(44832011)(316002)(82740400003)(81166007)(2616005)(956004)(41300700001)(40460700003)(26005)(356005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 05:06:25.7758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5764ee4-a95d-4a53-6c66-08da540cf553
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT066.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5349
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=CmYHlwEz;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.3.73 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 20.06.22 09:33, Marco Barletta wrote:
> Dear all;
> 
> I was trying to build JH for QEMU with the kas container in jailhouse
> demo images. Suddenly the building failes due to this error:
> 
> git -c core.fsyncobjectfiles=0 ls-remote
> git://github.com/siemens/jailhouse failed with exit code 128, output:
> 2022/06/20 07:26:47 socat[251] E connect(5, AF=2 140.82.121.3:9418, 16):
> Connection timed out
> fatal: Could not read from remote repository.
> 
> (Yes I have internet connection, of course, and the IP correctly
> responds to ping).
> 
> Any advice? Has something changed with the git protocol?
> 

You need

diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index 66d7ee3..f4325ae 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -25,7 +25,7 @@ EXTRA_JAILHOUSE_CONFIGS_amd64 = " \
     "
 
 SRC_URI = " \
-    git://github.com/siemens/jailhouse;branch=next \
+    git://github.com/siemens/jailhouse;branch=next;protocol=https \
     file://debian/ \
     ${@ " ".join(["file://" + cfg for cfg in d.getVar('EXTRA_JAILHOUSE_CONFIGS').split()]) } \
     "

I'll push a patch "soon".

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6e8fc5f5-40fa-293f-a6e8-21913b4b1ad6%40siemens.com.
