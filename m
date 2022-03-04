Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAPHQ2IQMGQEZORJQJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id C956A4CCDEB
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 07:36:51 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id t26-20020a0568301e3a00b005af6b88cf12sf5155799otr.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 22:36:51 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646375810; cv=pass;
        d=google.com; s=arc-20160816;
        b=GnLvo75ETcIsYLk4mI3S0RmItTiARyvLje8RRNMrfrLFZxi2+/I6kxZuaLpmV7CsKT
         nfxUZvyKD6W9q33VPyQzfuLKxxY6ncvZeVU2/+Jw6mlWJmn4R/FvSMtoh6YUemmMzJyp
         Oj4oEk0aTPJFfe+S8fFA5mdpEE73jdHTsLfePty+SywXzHKf1sn9wvN+uyGreGoqgHIW
         GG6TDBIBl/h7TZ9o2FR29ekkhSLtN1vLNjqm31B0PhteU2VNlGayDRFvxn6ywApIV09t
         CvoND6BpPUDDZFTJBD6GTcTWU3mFfWam0GtC2826TRMEnAqQ+XkYzJ2PG62O888Ak491
         COSA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=+bs+DEJYrmE+oo4V1VEDyKGMqPPeaaAoV9ZAEcgxMig=;
        b=lS2u/7qJBKu4YdnHM9D7kpqQ6UBW1PThhsDxeUqA6UPWSNPzoO2sVhXGwFaC147n73
         YhwWpiJeaD2OJOvER+20vjolMB8s+AjeIJ2xJJA7wW0AvcRuxYLL+ETb3AIghBN7pmnT
         ZzbFEXvKRl9y+4IcKIVhva3QGoin9sl5GtFcMogJmevm0nZOZ2wwzdslzeyHi3/7muLa
         gAxwGnh+DMYVdmLzyX6F59INnimYioQodNmRc2vzkPe0NQqWHQJm8o1QIn2OMeHrwTo2
         JBsmLI5jEhuWx8e33LDR8yhjKIKCFD0icFumi9sdFHH1aEslswEsSuPnwJte9W91frc8
         oapg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=wWErZ0uo;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::626 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+bs+DEJYrmE+oo4V1VEDyKGMqPPeaaAoV9ZAEcgxMig=;
        b=sOIQehLGi6IFgSarijLS+7sPZslNlkbUIJ/gyrCirJxPpkyr75CHRnpY5QP9h8y6bu
         bpC9esEEUwEBHhzodvxnG49Nm50ypsFsh++lhoL48G1FHPGhiRPj8KIXyOlLhLqX53Nd
         LCv4jzF4clORM53mkz5o2CdKWa2euFxHw+XL4ZHKiSNIBdf4Xsh+8a24sLXWVCvjJcor
         tw7ndVHzBkgzC3cy4s10HXEaMWD85/FKjajsyba8texr1yzbanDdsTIt1EMjRjeiyRZj
         S8zarFWLQGzv2fBuNXsdZoCORC+vWAQIQ7jTRjAjgP8uNsBJmSpaVLX/qCWp3Y3aegjp
         NQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+bs+DEJYrmE+oo4V1VEDyKGMqPPeaaAoV9ZAEcgxMig=;
        b=ijaQXwxyqe5a7+VTmz9as1ij9j5fcxAOhn+XeqhqLfYqGRUj5GV6upLqBH5hTpmneM
         mIfkryLi3QB6dndx1MLQWQiHkwcm5OZOZ1ekcVas2oKcRA1E0MZHKctQ3hsm2QL4qV5c
         p5YmD0dlzCp8vxFTAIdSCXAUyiq81ZcKOJo7R4PvtFZInM+eXCsKjyoynY6V53QhFvxi
         +XX8cVbqXGSn1u67jvwyUUzu1F1an2yFnE3DEs8k1PDEo2Cv8HPAquITnJWDXM/izcef
         scxbHjwOpO+CWsNvCZIvpj7GdcZ4OlyWOIFFAfxC6+1IhxsxpOYZodiInJPXSuYdz0sI
         5DSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318kK9YQiF0ZSfx9PY7pA3EVujZ45KUwisswlJjCBROnHBX5rfk
	7I5uVCDkG3eZQfV+EfEZVCQ=
X-Google-Smtp-Source: ABdhPJw26GtGoZSAjHbSeE7GoCcZ/6ynzJqO3Gon2tpVE1i5Yq5vf3dFNrhEInQpFYf22P0vOs9Dow==
X-Received: by 2002:a05:6870:f58f:b0:d4:395b:535e with SMTP id eh15-20020a056870f58f00b000d4395b535emr6871873oab.136.1646375810280;
        Thu, 03 Mar 2022 22:36:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:180e:b0:2cc:2c1b:e0a0 with SMTP id
 bh14-20020a056808180e00b002cc2c1be0a0ls1696482oib.2.gmail; Thu, 03 Mar 2022
 22:36:49 -0800 (PST)
X-Received: by 2002:a54:4611:0:b0:2d7:988a:5784 with SMTP id p17-20020a544611000000b002d7988a5784mr8165299oip.156.1646375809644;
        Thu, 03 Mar 2022 22:36:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646375809; cv=pass;
        d=google.com; s=arc-20160816;
        b=kQ0wdTV9sOG8+jvdmAp6yxMXewQgVt02YoOzhP9efBxGo6vKXo3sLtGEOVAFUbn1Qo
         GNoZicFouDFFzVkpM2OkIBx/W0hpCxJ57RrAJg+V3brpli73hUPR2VnmaH8pa+yUytfI
         JSXH9ShIknIZmnY0DVsFlakfL7rAL97RmLF5jtQaTEbek1UWYYWGcjhUyZInQk6PKUz3
         1cfObBw09x/utQee+ebQyrY/CWf40gDu55jMDBpvrw7ZUW2cztBn6zBWkBNOgVZBvBdg
         equDXEYs7/a2piE59p3+KGIWprGiN+Ly5dJ//RB3ywKcPDpoIwbZM/VnuZ8yWzps9BZo
         5Ohg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iuUD9DU7jB0GnOGFdcu1LDCyEVApDqVknDrB+JJlJKI=;
        b=rVh+uZKUHVkTXfYWUmBwiEHSZXRj9wQ1NEJBfVoRAsGaE2n00b3bsGxD8/rSRaaHyz
         RE2+q7vHCCQZKUP7Wk7fSkHy2Emh52Qn9qG4+Vwr+2pHiMJuWb6n1fystu1HKLYfLTzK
         liFt8nSucKHKckT4MZrmfvh5ePykoeR6atBJdlqBhokdjiCNvOtKJmkywoiaKbJi7CkK
         UBwq79r5SpgLx06rCL7zxdZIewiRx6gS8IarknC4TaENcYvYmKR1ZLMCzDFGgAU15B61
         KRYYTub05u0JTb2lx1lhe8gAa9u0i+CKZmYEftcnbxuPQjVWcM4DQnhZulCyxKkufHXx
         LNYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=wWErZ0uo;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::626 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20626.outbound.protection.outlook.com. [2a01:111:f400:7e1a::626])
        by gmr-mx.google.com with ESMTPS id k8-20020a4ab288000000b0031c361dd941si147357ooo.0.2022.03.03.22.36.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 22:36:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::626 as permitted sender) client-ip=2a01:111:f400:7e1a::626;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ju+ps5gQgq/otv34MnBBzIRwm/CD/U4UODwxMqnJ32WmrIjmyZcU9ij0P94NF0VptLd/CJndloun8sFXWprepJyrhOIKRdXxb5v0+tROW6nVlSUy3iuirzBAr9UNTg4q7M090x5Ee7yUfc/EIIteTAph8qpb+n413uKUfPO/ODk/5AL/2YaU5z5BoPBJVbKnJw07TZKZHiuR7AzKr8JdkL6AqgMwhjCI+xKFquR6DB0tl2er4qGIC9UzAS5VziKINydfMy+qeIfxF32ncOdFv3NZpLYgLvZwNE3fGDap7hEaCkipfrLJpO6d7KhFK6hinJiXWa7mwGw/8tsLEi0Ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuUD9DU7jB0GnOGFdcu1LDCyEVApDqVknDrB+JJlJKI=;
 b=WIjz++5hk4EHKwr0+wcIhNgeVrYtn3tXSGzh3eL+4+SQM3CwTrQIZN3V6boAuYQ/mdUlCZaRuywsBx55e8zd9G7RHOxNzIRUc7WP+ZBMSb6YYOF9X6e49ZJFcWXfzByxgNhH3VCAoqqwFBuUaFOIo6Yj7+wcyp50rTN16qFsQwL4lQ5Yhxj+LyqolZMrEBbV895Lw1zk3aup9xzi9LuuqTQspIGTF0nCT5YklaGohJPFjTePkckf79jDXnMJ7v0vJ+X7zso4jCxgcdM5q/m4i3zCwIGtqV51HqnrPN7nctHacz1T0hMN9H81T46OjfS7fV34e5ziff4aazy9XFmMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from DB6PR0301CA0003.eurprd03.prod.outlook.com (2603:10a6:4:3e::13)
 by AS1PR10MB5337.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 4 Mar
 2022 06:36:48 +0000
Received: from DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::1a) by DB6PR0301CA0003.outlook.office365.com
 (2603:10a6:4:3e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 4 Mar 2022 06:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT030.mail.protection.outlook.com (10.152.4.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 06:36:48 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Mar 2022 07:36:47 +0100
Received: from [167.87.0.77] (167.87.0.77) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 07:36:47 +0100
Message-ID: <c8697abb-27a5-6560-513c-067c4d32c389@siemens.com>
Date: Fri, 4 Mar 2022 07:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk
 linux demo inmate
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, <jailhouse-dev@googlegroups.com>
References: <20220304021615.2862-1-mranostay@ti.com>
 <20220304021615.2862-2-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220304021615.2862-2-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.77]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ed725b-b8ba-48ba-48c4-08d9fda95be7
X-MS-TrafficTypeDiagnostic: AS1PR10MB5337:EE_
X-Microsoft-Antispam-PRVS: <AS1PR10MB53374E94D26966CD9A279F9095059@AS1PR10MB5337.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QLwbqDJNgv+Y5MsxF2vibikCAGTEviJrhYijxYfMRQdh3gwAaUHbAHFYMknlrcWPfJgB1xWGY11UEFCA6AxZr7x+fcPkFseCJNLnl2nex2aEW3kfuKBrbPPQnT5D1N/OWOs0FuceFW8gt463o/v4qEDTMgCj3H4YjYfLz4K5uevzGl9apHw8Gxk6ix5Z6rmzXHnBhbZltJ3YKLQH1xPZHghMyOGjgHf85pQNyIpe+8b2L6ZO0IB9/v6sSlyb9Is9wVSi++sBA9y+hhtqlXuOwvE2QS9mNS9DpAZJCGA4vOETj64+G3If3IpsgW6tbRWnXKumLhYfAh/IRYyJp9F2lFZsh/ggTiMZ0krqn68tQBA3m95r4yyJffFPX/dO30taL4z+5M39LMGv+UhZZvLnT8LCaX+rsoGG+nn/Ttm9dqLrFSzv0dTAAv3DsJ/PLPCnLc2Gw38+hP3dgJqApuE1wMykFzQv2YuaIXK9O+lh/QuGhgn1gIozmbvZS0tS+lTJQesMwfHuCaH2xZ2P0Zs5FUyGpqGpuo1qo9/ehqXjZ1BearugOOLqrA8I05bpjCEwtqopSdQTMRsbmsf4UpvSDmCuSkXLtp6DqXdDFTEvvm8KsyvAR2VumSvPRZtLztO9RVA5bCLATJmPk/Q3NJtT0REQ53jILYWt9c2wTPSaZ0A3WvAaJwCZWU8RVjW0ZVX/kOrEN7+7lJcWWksArWAehQzi5rPaiTk/4pK1c2rYTb5qrNgJEAk2u14Rq3onAJJoAgT844gLIJXUj2EiMbwxLA==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(16526019)(44832011)(8936002)(508600001)(4744005)(356005)(2616005)(70206006)(70586007)(8676002)(2906002)(956004)(31686004)(36756003)(186003)(5660300002)(26005)(36860700001)(336012)(47076005)(6706004)(86362001)(316002)(110136005)(16576012)(82310400004)(82960400001)(31696002)(81166007)(40460700003)(53546011)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 06:36:48.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ed725b-b8ba-48ba-48c4-08d9fda95be7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5337
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=wWErZ0uo;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1a::626 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 04.03.22 03:16, 'Matt Ranostay' via Jailhouse wrote:
> Add eMMC support to k3-am654-idk-linux-demo inmate which requires
> several device tree changes, and addition memory mappings open
> 

And what does the root cell use then as mass storage? Normally, that's
where the eMMC belongs to.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c8697abb-27a5-6560-513c-067c4d32c389%40siemens.com.
