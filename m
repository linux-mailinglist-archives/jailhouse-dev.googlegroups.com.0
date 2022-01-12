Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVXP7GHAMGQET7ZRY6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD2548BEA2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 07:40:23 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id d12-20020a196b0c000000b0042afa90ae9bsf976381lfa.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 22:40:23 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641969623; cv=pass;
        d=google.com; s=arc-20160816;
        b=esaLsjV6niXhERbwYRs+t7Rrh/c7PdfZvU5gMFc9NJ2HvRf+W+iM2aYEryoHdL6YNM
         I3r2xdt071/kKbBI5qmIlaCP5yk89uDvuEgDvRu/IT3+GoM8JJ9TnjvJpqsF/sY4Pa95
         Az2GvSnGF+AGc9fZ/JZdIE6m8tGBGclnx+3WXh4cUwsgoXq+ZkaY2062rrHHYQEYmqYn
         R7LP63dB7IfSGj8GuqmE+SLqGSyBGGppad8zZ/QMwgwcHe7fCUtKBuCt4Gnswn09oXmk
         Oz/Py83/VAo2lxZhRAGzO9RS0MUPMbC+5xkWMKCV5u8fiJnwTtdUPYJqUXjARB2tiEH4
         P4pQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=7eEzCyEJsoZIRIlzkFcIA+T6SqiY61OcqYz4C5c/KnM=;
        b=eStB2TFyA9qosmKW7NDUwJyS5zUAen6/LsdF63vZx9V5h3bP5A0XfWLOAThHnHw89A
         yH/eUKkKViUq7dHU/7h3a7TaTF/qVSKfTfSR2qha8PbeueZ5kjXfxlw4VyXcwqk03dGG
         KjO+5BYsEeey+alzcxcE+vCynqne1tlaADWngKtyOf3CBpcXfugragMnOtQ1GPSn75N+
         YZUmGJSYTmZwFEFX6cFnMgMuI30m14VRG2QLYFKSG+3Kkh/FjRtq+Na1YIKU/dL6b8oJ
         oxTqGMjNdfA/rvWsGks+zKIo5auCby30wDZgNLo+ybqpxpq44L6Iz7wqVrtHvS4MBZs4
         05PQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lNYs79AX;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::629 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7eEzCyEJsoZIRIlzkFcIA+T6SqiY61OcqYz4C5c/KnM=;
        b=n41p6S5GFLXDLTRvEN09TUVuShV3ueWKTi/s6MY3zMoFfkGsTBHte5Zzas31mGrAy9
         +IGxW1Le1xSNXzlAblGfYiily1ph30DvE1IXHmkuQ88wKKIgCtECHUtV6TUSw3een8iQ
         DdSnlulrhN0SzykelZ9+bJ4R1T2Vq6QIT68ohOneI3bUP1XJTbd5Wfb/4zGUehfIoexn
         Cmq+NJrEt4a8C51nfbbpOLXa/d2Se3oPXshhVDsJfJARQ1OPa2U48WCkmSj6YrA29xVP
         3UmbwvE0cGRndyeOzkFxDhHbocB7tIvBfpqLwp8U8saH638+oowZXeaNjaJ46d2PntbU
         rkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7eEzCyEJsoZIRIlzkFcIA+T6SqiY61OcqYz4C5c/KnM=;
        b=woN/JVid8DAqXZjpgoMsRKVjSgnbHt3z0MKF0EIyat+7ISO3NO5w91fTRJ0yfOufhq
         l680HrU4Sbcq1Vw2JrL+HaUGc5J2ZWz/BGHyOHY47txGZIhHlNYb3NFG5Pxya4JCj30c
         HNf70vlHRpgyAcpGh66oyOnoPbhs3g7wpitEG/R5T2lV6G4HqE0om1GFcCx62aW9vkxc
         SX1brvQFuIcfaMYWUkYl+9YYCbiAKYGFlBUTm4u0ntPj1Weh5qWI2wO8tgEBjzVfTUEj
         1wX+sOiv8/UksSYnj9GVYZ8ERLmpIMFqlL8IH3UTmp+0ZcKTQkQOgowcFpT93/vvF6oW
         Vtxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Qu4gW8qcQZkyLictyV+0LEDmwQDKN+7mApb0r/WJwOkPEvHQK
	4lBBhPPtVFS6CTktnBw57wY=
X-Google-Smtp-Source: ABdhPJz2dr7EX6fMj4F8Bw0yDXqup2q8YpDpS6gJ9zSBWWllaOYLR7CDxcZ7OhG0ANLTbfliEmxEAw==
X-Received: by 2002:ac2:4c51:: with SMTP id o17mr6012917lfk.558.1641969622761;
        Tue, 11 Jan 2022 22:40:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:158e:: with SMTP id bp14ls2374495lfb.2.gmail; Tue,
 11 Jan 2022 22:40:21 -0800 (PST)
X-Received: by 2002:a05:6512:1320:: with SMTP id x32mr5965105lfu.597.1641969621719;
        Tue, 11 Jan 2022 22:40:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641969621; cv=pass;
        d=google.com; s=arc-20160816;
        b=RURKJVBsqTowgQDBUbJ9X8CwXs8ZOd47F9MG3hPjEr/9J6q4vlXhxvPQhALhzCw1+H
         fbX9eXIZ/SfNbXmA8hGknREZWMosHaK5+bfj5JmG53OeHVf6lzwzCYO0Wjwl7kCdsJYM
         Nu1fJjAm5acZAFE2uEn7TvFS5cMFreyIwQHN9DATcwxTMQogupfhxbk8jFXdvXdtLrpL
         Y41X6Sx+fKHg6afPYg27pGVi9FHnX8rR/eiKGMEOXCi8BFfs9EJslsrSbxuctmy2z5Um
         AlwIx46NG8arMg//D7UXf2sWcBwD9RZK6TYWIRHT61GH0t24DMdQ2UVeKDLgvdaM889G
         Fn4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KUFqcieIbhf7mrWVfJ0loQYCWQnZAevr1vJTNu4fRHs=;
        b=MGDOva+KDINZTOSF05NGz/gCrkbbOvmj18InlmcS6EVx8aaaj9f5Bn9Yf2bWSfcnZN
         FfklG+m/eCA1lMOY2ZoHhd1Hy/O2XUS9cegza/WVBuaBkv74G9sL9/JwXH0pIBJ7Vb2H
         f8EqCh8Juo688DCP2/eE6OqFsNP2x7ek4Nby0H75wKRL8ZsHj5asFj5hzKDMnFafDL0+
         bqYqTk55jNhpGV+I6m8+ZjHRMZunkwBw79oFpfXvBZ48thIOTXmuUZh3pKgcR/yAN2Sg
         lMTasKu5eMb4Svpe8lumFd2dKR1CfY92tgw5voQMrVnW3rf42sNUowxzRgbku9JA0rz/
         r5EQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lNYs79AX;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::629 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20629.outbound.protection.outlook.com. [2a01:111:f400:7e1b::629])
        by gmr-mx.google.com with ESMTPS id d30si26431lfv.2.2022.01.11.22.40.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 22:40:21 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1b::629 as permitted sender) client-ip=2a01:111:f400:7e1b::629;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbny48fRYO/hnbXEjZhvJqO+myawfu747NavjlMTkL9O6QJlB++ioh4kk324IfiaIapYW2m8fiZhYh6ftEJkWyITFIO8CfyXfUMb7XlQUe4n4UZsSIXDphETYCFccaFeVAhm+aeOpzIwqL5FNrnwvG3Vzts9232XF6/rajF1iGzupG/DLoxuWH2R3+Ij+MDbyNi/2YH/LcTkuU2ZdcVZToc2cbLR+Ytl7tdAvEuT+A9RO+VWxwBDrmz/OH5ocAyxwMQozZLX/m1iqnu/soyz6TbasHFtwRFO5UwuNxkBoBMnUpbTuegABzjU8ZajqD66XTESCA5Der60FE9qNs9UcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUFqcieIbhf7mrWVfJ0loQYCWQnZAevr1vJTNu4fRHs=;
 b=a/w9CSQZPHogJkHOqz676xM3xU4ijKAamd/UAzA0c8XnXhdG83cZhgxmhtwtjI+meEeuQcX7kETJsMsauxZVWJyZWTFUQC6kkQ0z+TySteqa4zVUZdEVN68MJqBMsHTbNO95V1h4YeDzFCthyzTFan5R24GoUzAYu6MdGZwwBGN7Uv1nzgfT+pYQWcTsWvnZrJ9AuzfdQjv71hm1URcIwXWnxh26EkMXD1gMAm04TF2Ll+6kmfrTMbjmbMfk7Jp5MmzVBfVpa/Jqe0tn5UlS3yCST2PZVX71wdpqcxYWNVKEDU9DrLB8ivOLSedvjnZ8Ogms6kWD3Zjsa6K5uennbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=googlegroups.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from OL1P279CA0032.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::19)
 by AM0PR10MB2897.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:158::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 12 Jan
 2022 06:40:20 +0000
Received: from HE1EUR01FT009.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::95) by OL1P279CA0032.outlook.office365.com
 (2603:10a6:e10:13::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Wed, 12 Jan 2022 06:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT009.mail.protection.outlook.com (10.152.0.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 06:40:19 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 07:40:18 +0100
Received: from [139.22.143.158] (139.22.143.158) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 07:40:18 +0100
Message-ID: <0d7439be-ae78-c3a7-6310-d008dabc3444@siemens.com>
Date: Wed, 12 Jan 2022 07:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: arm64: Fix dtc warnings from recent kernels
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [139.22.143.158]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06736863-56ac-4b38-6a57-08d9d596669c
X-MS-TrafficTypeDiagnostic: AM0PR10MB2897:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB28976B3E819D516BEF876B8D95529@AM0PR10MB2897.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nO5I4/Jr2TdfuevWv2JHzuwlanHwtq55RuQpoRW7Fobuw8ut/HOfHkMu5pkuT1lu0LclrgmyfqC/rUMJqaWPDl6L9cQvTLfkM0PQiwZXjIev1wehgePJ9A8bMa091tIBegKkZuaCeg1w2qAhNe++yeJE+TVnwVetGXjWiQABQZcbTgFmYzmc2XwB84i0vDjAAzdaj3AuznM8PKi9aqAOMtvmgjTwVBsFiQTWAHuXdIhV1mlj6BD13EmFpqy72HVLL+C4oIEF6lGKQ67TD/+4RZS3gkLmPYeADOthdpUYOL8GuDKLXbnWYzoSxocg6vdB7oAqdKkcz8NVNpLeugJgZzX1jFpZkLpRSqBT0R/gxSGsOjL/ke2q7UoM2fhaWEQ1WmaamG4cXFt9pHaKEvj53kC/OYZK2frmuTyrnF+V+ziviO6qg6555AUZHiYCC/BCMGCJN6vObt9BgeUeSRZb1oM+UJKb5g/hSzPATiaCGrWXHA4vH29A8a+skja7E3X9y+GjDwIEHr8FRYI4EihvcoTL7W04I5mSYUys6LdP3Sw6SUjc3zSNgqkRuJP9czNFZCV8fDb9XFHxMJMTYZIBKljp87gJPaKqEm1njBUNa5pY2NSZtLxSXJw5mngJiJzm7OBRBnK5CxF36n/bMSXdj3HUJvZL3ZOfwvvdb2kFIkzRWuIoJUVYr1IrEgmAq4+zuYY/Ii/V/71uAQB1fW6lWqcoNF2Q0KBLQzOwY9XRPkWTdcwt40nCBULiClhtcPcQJ4sHYjtJ211khsl4kdJVFRBU2xzkM1zBttIfYq8DLgMSj6eroM7wQMPEDikOyRC09jjO9QYaKSruEqP4NQRiwaHvkjaF4blftDNpvHdHixfiDdD7n5yrrBc00q3qLpnFTpyYIO8ufbKQuNqXl1jPsg==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(5660300002)(44832011)(356005)(36860700001)(956004)(16576012)(40460700001)(2616005)(6706004)(86362001)(6916009)(47076005)(336012)(81166007)(316002)(70206006)(26005)(82310400004)(70586007)(508600001)(2906002)(82960400001)(83380400001)(186003)(8676002)(31696002)(8936002)(31686004)(6666004)(36756003)(16526019)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 06:40:19.2192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06736863-56ac-4b38-6a57-08d9d596669c
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT009.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2897
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=lNYs79AX;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1b::629 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

Resolves

jailhouse/configs/arm64/dts/inmate-pine64-plus.dts:81.37-87.4: Warning (unit_address_format): /interrupt-controller@01c81000: unit name should not have leading 0s
jailhouse/configs/arm64/dts/inmate-pine64-plus.dts:89.24-96.4: Warning (unit_address_format): /serial@01c28000: unit name should not have leading 0s
jailhouse/configs/arm64/dts/inmate-pine64-plus.dts:98.15-113.4: Warning (unit_address_format): /pci@02000000: unit name should not have leading 0s

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
  configs/arm64/dts/inmate-pine64-plus.dts | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arm64/dts/inmate-pine64-plus.dts b/configs/arm64/dts/inmate-pine64-plus.dts
index 0f980c98..6d0a12d3 100644
--- a/configs/arm64/dts/inmate-pine64-plus.dts
+++ b/configs/arm64/dts/inmate-pine64-plus.dts
@@ -78,7 +78,7 @@
  		};
  	};
  
-	gic: interrupt-controller@01c81000 {
+	gic: interrupt-controller@1c81000 {
  		compatible = "arm,gic-400";
  		reg = <0x01c81000 0x1000>,
  		      <0x01c82000 0x2000>;
@@ -86,7 +86,7 @@
  		#interrupt-cells = <3>;
  	};
  
-	uart: serial@01c28000 {
+	uart: serial@1c28000 {
  		compatible = "snps,dw-apb-uart";
  		reg = <0x01c28000 0x400>;
  		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
@@ -95,7 +95,7 @@
  		clock-frequency = <24000000>;
  	};
  
-	pci@02000000 {
+	pci@2000000 {
  		compatible = "pci-host-ecam-generic";
  		device_type = "pci";
  		bus-range = <0 0>;
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0d7439be-ae78-c3a7-6310-d008dabc3444%40siemens.com.
