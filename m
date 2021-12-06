Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKMIXCGQMGQENQDRLSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3c.google.com (mail-oo1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44C4695D1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 13:38:03 +0100 (CET)
Received: by mail-oo1-xc3c.google.com with SMTP id b8-20020a4a9bc8000000b002c5d4b37b30sf7886337ook.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 04:38:03 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638794282; cv=pass;
        d=google.com; s=arc-20160816;
        b=LZ4BhtK8Bm9/ZdwSiVZ+elf+soEMcoCrli4UIX2m548LFBoL4PXOWBU30Ns7oJiYiB
         Gn0qgw6Roev0dLUcQvGdzoosB9U+Qws3p38lV3oN+W/Gr4MX+pG7Fr0L31dAA3l8akYV
         tUQZmW0OBKSkuGx1ans4kQyC8XK3C4djncvT5ncur90bz/YKJye9vGpscEwm5KYQo61h
         Tj4PbnAfKkMvi01E6lMeMhiDpdb60SCuXs+QHgCojWhrG4uT0BlqK96UyXTisW0osZmW
         DZ/NjbB1YgI+JqXtf3JTusNP3ktsmtvEIdABygNPIFyOteavFxddAC5znafjmYBA5ZsQ
         daJw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=dTnGSDoxAA9ptePmj2rKOtUdqMwU5+pPBjRaMIGMKAo=;
        b=c2KoD9RrHgZTlnYj+AMv109KDY7PHexXYmQ78w8wTdA0o87S/ZEwt+s0GagQyin1LA
         2GznmDR91w5PQGn597t/+t+G3Bm3QfW3/7A7EqdsZGiVp0bAVBhUgzqr+jSgSfx27zk1
         gK7jtNRi9IrVMUC8vM89+nFvDG+alUXL8x+8m3xiDM9qtDbCZiu5wJMookQI/b+OUsBO
         FI49MiYS0h2GE21xG6QiuC+Mgcdhix9O495IUpNxBPTVEjSTPD9pBnEZ34Ic4xswACOk
         YUexnW5wcKc2vjIh2JT09VYqLBXJWwGpcuqMI+ygE+0iCO8eN/UjNGiXPSJ5T4d8oKoc
         ejkA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hizO9OIj;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.82 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dTnGSDoxAA9ptePmj2rKOtUdqMwU5+pPBjRaMIGMKAo=;
        b=bEjA8r4Ayd6ooGqEbw4c9dnjbggaCcsn93iAlG7BG79n3prm5VKTczzsPB2pSS6Q+5
         kx97F0n53AbDk4yiVXWVyG7aSY02frwDlMYo++bY+IjXnXQe+Jy9KK40oaUTXAnFX+67
         4jFjD3NwbkCGjeJFo2DAoKtTi+kLbxaYOgvS3kAcMrjBi8saxfTo6TRdr/FOJq1uEyKp
         o+2+qkjza34YdltZvfBAcHDhRvnp2v1KPHbHHLoZ/edxapIckdf5aqZ/Qxyrg1nlNB3H
         P0DURSOgttiAm2Z5gbdHWnPlqjxSaT8o6U/AO2uKCPkg604dljdQQM9hijrCXosGiVQT
         Cyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dTnGSDoxAA9ptePmj2rKOtUdqMwU5+pPBjRaMIGMKAo=;
        b=h6kzD23WXsH0HFe8GqSwsEW4JyHBQ34nzNw2foJ6RBI6Nh6P2TP5GwIpHS4pYxONER
         bjBmXe0wJlEhVvaFmvHhSHR2Iu1wNR/th0oCyE6aE1j+BNdAz/sDZpLcs02J9d1wl1fg
         BgjAa81aQmhIRerW3ctR7eh9F5ROLSp6hRWLbW2s10sS8Yem5n70I4U+rO1aIJZB3Ov0
         KK0zC6twOLKEZxhzhau20hUvEWeeeOY6sf+/NtXeuZDbh+V3JolQWwUrvlM0oknBgr5k
         +LLEHy0vAqdXmIeMfKOdAhngi/7azCi6+GvmkcLqier8YrcnZWljZRZTAo2zmEUdfM3y
         l5dg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xOq+4tD6gqU+Of7sPoF15hsXkcO/VDeaZ8PwqTs5jJ2hQWsHu
	8BW9MMNAlsbYpb9KSZK+MfU=
X-Google-Smtp-Source: ABdhPJw/BncfJSfPTDHitDGBuCjPq/X357TMmjHaO0Fra/uU87Z2VYrU4qwA291nFL9n77HXVkK4ag==
X-Received: by 2002:a9d:628f:: with SMTP id x15mr18231559otk.348.1638794281995;
        Mon, 06 Dec 2021 04:38:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:37d7:: with SMTP id r206ls1132028oor.2.gmail; Mon, 06
 Dec 2021 04:38:01 -0800 (PST)
X-Received: by 2002:a4a:3451:: with SMTP id n17mr22305226oof.28.1638794281338;
        Mon, 06 Dec 2021 04:38:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638794281; cv=pass;
        d=google.com; s=arc-20160816;
        b=bJ0Y8Q1zPA1vBzlg/w05oDqISDQAE1Nv7Dle2/2Z/M5P9GHgno/u57nVy1q5/b7pCP
         Y6FEOhCY1KIa6VupPkCr6Jk96AgJ2M3vUy8XErO5mWmsbQeo40j/XEy/hOlt+LAodZZi
         ELRgMFlKuDuUhX7ziiDduSlQbNHodEkrBHVcSYJYKd2szYueSOR0T4UZxEhridjg0bxr
         5PQ1twZzQKcUj5MkkGdv3y8aoQ37JnP5VACiAM4DR+K4gXVZ/b2XmGVVi4bg14Lw6yLY
         w05bekVwrTgKvt/zDFizrXI5LBJ7WwpTLGm32VyBP8onDxRQFXdDGCQvxPl9HX8qfJHL
         cfqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=gSfy6Lomut40Q/33UXwWxNV2o+SpRCf8XF35phBdrdc=;
        b=fZlQflZMb39HI6IQnQ+a4gkILnHVgPRSrDSk9X/zB98eOrgXRS29OMjrE8H1RQ6udr
         DV7XwHMG6iomf6efaaUd18SUt7LOWiLAtUrb+0fpIJiz+4yc5JQTA06VXTMxQFeFQ3jb
         1ttQjx+kkGNcN91ShEt95/W+q4bkFRvvxQZyTJkVxjBymMnIzRl+B5c1P0rzHNRhyZ6G
         5paTvd+4UgUHfMmM7XnYu9BlUATEyFiJ3o8pPg0gyOitkdde1Vj9Qnu3MVXiwh3tjlA+
         c1qZxuFx6uVI1U6M0zY+k2JhpqnvILK4SqU2bpwb5HeyTGB/cMFX3KA6aqOkwF+WQPjm
         7B4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hizO9OIj;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.82 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com. [40.107.20.82])
        by gmr-mx.google.com with ESMTPS id bg19si1227584oib.5.2021.12.06.04.38.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 04:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.82 as permitted sender) client-ip=40.107.20.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyYTtDaWw56L8cLKgyox8KMJepgmiHoCSSCDjpEcEnDQy++VGsYaKINh1YIFGw8Bw1h6298D8H0wFayt9v4y6YSOS47HJCqxbG/bwHh9WqemLmXiQyatCpWN89xg75mvfvwWKsNHal9bIJ/R2Mg5NuMuGSvnEGelfFXON/w8uJbY3WD9jUeY9RS1rQS7dZ6AR+bDQPx8WfxA3qLhSli6jEV+fF3HGfwS+tiO9nKdXpEWOY9EA+baDctOEtj3kwFCRutZ9teAONYtgC7YdCZoIa8kKOQ2Qtn/LWSq484elKUcl72eVe9BwIetzFgIWfOAhMS1cCfg1AMRcZkQtOY6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSfy6Lomut40Q/33UXwWxNV2o+SpRCf8XF35phBdrdc=;
 b=AjEQ24s6oZdDcUHbp27c7WdQ5Y/XJeuFKg+7W5RWN9Aojxr3+YI2GvUBT2y5me9p5o5AgRRK1CpaRTNG5OMHeOOVTm5xags/PzFbmO8Vx59cdNIXkUFryguF4nxvSmVW4AoYJgn/mHgRUjn9BBlwuWV73jXKPAt/QX3oM1n0ouwvWPLbZIeu+t8kJPFiBtk9VPMWrn2AEwM/eUW//z8Qsr6UcP4XnEHs9ig2+H1yUqN2zrq1C8+LtArLRLo5cNTiUmNkE9Te4pOAJUL/+WDxBqTsi+oMr0DXantFwwfhGSh9ZKaH+0ZVmWQnzNjTIKEROp+nMsbG17OvZecupmU9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=binary-kitchen.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6PR07CA0064.eurprd07.prod.outlook.com (2603:10a6:6:2a::26) by
 HE1PR1001MB0987.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:71::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.20; Mon, 6 Dec 2021 12:37:58 +0000
Received: from DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::14) by DB6PR07CA0064.outlook.office365.com
 (2603:10a6:6:2a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Mon, 6 Dec 2021 12:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT049.mail.protection.outlook.com (10.152.5.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 12:37:57 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Dec 2021 13:37:57 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 6 Dec
 2021 13:37:57 +0100
Subject: Re: [PATCH] x86: amd_iommu: Skip non-AMD IOMMU types
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: <meep@binary-kitchen.de>
References: <20211206105449.129665-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <44f3b16b-c481-7c42-fe8b-6fd892b73dfd@siemens.com>
Date: Mon, 6 Dec 2021 13:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211206105449.129665-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16694b01-bd73-4eff-c155-08d9b8b53bb5
X-MS-TrafficTypeDiagnostic: HE1PR1001MB0987:EE_
X-Microsoft-Antispam-PRVS: <HE1PR1001MB09874FD3C5792C74A7C8C808956D9@HE1PR1001MB0987.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HXVisNL0y7yKjNkmqEMBgtuVFLavKOxSIRWR0dRYGWboaYu/cfu1jZgxzqj8bQzO2bzpEknLR0JWJ6ddCMQFKdU4MN10sy2b32w+q/r8YHrwoetseQtSm+hHqUPQQxNzMTD6Qoxwdzw1hrgab176Pn2SNPrrYxjd2v43GMT0EeHpxqMa8RLYi+txmCD8UYcxsKqrHVb1v55si0HJD9RnI44UPEM5Z6a4ag6wKZ2K0CQF6wb/XF/RPW4iPnmT/P2lQKBxeYUMrND3Msyq/+jEUOD4yRiiX5Sdl2vSrjYUxIkJuPFH3lVv8EcqhrZXxDOUL3RRUMc458eBmjmonBZR7JloHfgf9B8hxPyC0jtd7iTCPFfGFoH7y+ISVqp1FLgVsIbAQS3wcnMfjmjsbZrcUB5sYgeYhEHYeY4kAruqFORNYgurDkYGhCYmGUB5+LDGSWtxWsPvHVoQAiLRbFrAYMQkHz+7W1HPe3Nz06q4WjzHWfaS96++nHq2NWTADGfmseNv4/YRrtDQ/2BatpIGWFw/Yep3OR4O3q+o8SnkesspQVDie+YLzVoy8zNx6omQ8nbdTl1Ou3PIv3Qu/nodxY24aUPMKCN+WkX5PkNbN212CqRE7woqXyngEIr06qY3cGBpck4yCXrDnZe/yDMuwhnLS4TJ+IzYSvHuTXx2ISI2Km3TYOrzYZVWT5wVghZXHT6HzdG5jXWfbMJ6Ul/eoRA5wxWZJ+LMjmdJt3x2iK81DokhVkWoHzpcPGZ0IgCmjzJv3vSTdSfIPe7bktJzGOpXJPcwbBbDtxBRUxVvegqai+ur09kbv/C/I4Ppvei4GbSvLzgjcVQVpbxoUEZyMtWp5TgeqfBwwTOzrIzVvVA=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(83380400001)(40460700001)(2906002)(16526019)(36756003)(70206006)(86362001)(82960400001)(82310400004)(8936002)(16576012)(8676002)(336012)(186003)(53546011)(4326008)(2616005)(956004)(31686004)(26005)(498600001)(47076005)(5660300002)(110136005)(36860700001)(31696002)(356005)(70586007)(6706004)(81166007)(44832011)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 12:37:57.9213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16694b01-bd73-4eff-c155-08d9b8b53bb5
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB0987
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hizO9OIj;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.20.82 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 06.12.21 11:54, Ralf Ramsauer wrote:
> Running Jailhouse in QEMU with the upstream config is currently broken,
> as qemu-vm.c provides a hardcoded description of the Intel IOMMU. As a
> consequence, starting Jailhouse in QEMU on a AMD system fails.
> 
> Fix it by simply skipping non-AMD IOMMU types and drop a WARNING that
> there's some oddity inside the config.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> Side note: I know we don't do any config sanity checks in the
> hypervisor, but in this case it's way easier than providing two
> qemu-vm.c-variants for Intel and AMD.
> 
>  hypervisor/arch/x86/amd_iommu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
> index 40ec4e20..4b563e9e 100644
> --- a/hypervisor/arch/x86/amd_iommu.c
> +++ b/hypervisor/arch/x86/amd_iommu.c
> @@ -782,8 +782,11 @@ static int amd_iommu_init(void)
>  
>  	iommu = &system_config->platform_info.iommu_units[0];
>  	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
> -		if (iommu->type != JAILHOUSE_IOMMU_AMD)
> -			return trace_error(-EINVAL);
> +		if (iommu->type != JAILHOUSE_IOMMU_AMD) {
> +			printk("WARNING: The config contains a"
> +			       "non-AMD IOMMU type\n");
> +			continue;
> +		}
>  
>  		entry = &iommu_units[iommu_units_count];
>  
> 

Let's better provide Intel/AMD-specific configs (we could keep
qemu-x86.cell as link to qemu-intel-x86.cell). "Just" needs someone to
take care of the AMD part.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/44f3b16b-c481-7c42-fe8b-6fd892b73dfd%40siemens.com.
