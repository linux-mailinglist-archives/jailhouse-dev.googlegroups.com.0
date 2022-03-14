Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZVDXSIQMGQENYWNQZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18B4D7F4B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 10:59:03 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id bd5-20020a05651c168500b002467c7cdfb2sf6234073ljb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 02:59:03 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647251943; cv=pass;
        d=google.com; s=arc-20160816;
        b=XNw4PEY3rVjcz9K4aJVRljhPE/RnkUmgWg1l8wE0POAvWpu94JixH+p0CjxjO3VIgk
         pIiZTTWi/LHdZmfo00Ar0ueucSgWBuCuk1Z2Za37CEvJKWt+ZgPxEkNxSqKIKJ2L5W2W
         p27JilQG4sj0fSzIlMSkYcFqYBlClHespbOmfH4nSYqmgcGW3116yauwO/2eEmFHLaGy
         By7EIMZR0e5th4GNS8kxC344HgWUC5mJobGPdtOivuk9kZFqPQ91qTJf4EneX2pAzMfK
         zCcnhEdwpx6gFyi5OCc2RRcEaOax3WwFnz/aZ8+rwrx4S8ddoCet8sfZxquvfYK7Dq9N
         85Xg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=MYrJkVeGOdNWb3U7iaqbr2JJVjRh0JqzRTciNf1Citg=;
        b=s730R9blI9N7NblQ1ygyITMpTgfUsyhZvcWpq1zrnDAQZUzjpjEHgVoXGI3FqXstAC
         l38IhA6Rv+Ddix/7hU3SE3jEDF4orawNOPuZTxsPCZjbDcL66yWnTyxQfdy4sZw0AL4f
         MoN4NcDxVK0tA2uXzYueyIJPcPlyHdzDS/ArTMf2ui6/3svBlyZC+hhGUj/BGZntWrBW
         e+ZhnvK+722xoWUFOF26N5KzjPbvLuWPpgpC075ZP0JlgL5EZlNJwsI+Dpeu9kNB51GB
         EHjS1W1JGHfLW4AzIx+FtiO0BvPl1QhxP8+zox8APnqJLcVdG3p3M8NRbx1dNq8euX0G
         M85Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=jISfWs7o;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MYrJkVeGOdNWb3U7iaqbr2JJVjRh0JqzRTciNf1Citg=;
        b=XRK/Bs0dCstlDAmMrx1tVv6p2O4og1SoYpFMZRVkaWNG7fOI7pDM+9Gvr+B94JRXoa
         okii0E68NVOhiAt2lRDq1JnzUfMA9t984gZAYExsxXIuHv7cSbVrOBXsDVuRDJ+v3uKa
         Ji7ntiHdxNafu8kqLrQQlv2hKMRp+wQEGHvMxsCDxYR3gjZGpcq0kXPA1iBVBbTlB0p3
         N2xWWFh4o64/ETsUes6uky21udNH7DycOIfX8AHPS1BIz05R+Cz670RFydFLA0xv43zn
         xgryjrhjpjKlR+tvfQdExVO1Mf+Y9kpzO5s1TA3ClcqbH8vRN7jI2v0YuZDjvE3lt0lU
         DeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MYrJkVeGOdNWb3U7iaqbr2JJVjRh0JqzRTciNf1Citg=;
        b=4fa5ulxx4ig8KLbRhKN8oeA0r1bnxzeacTJE9UVOnnBRdIWyr9GhhlmE27CJpxQZTO
         dBICHSL9RWfRck2ddB4dEnhDIkHkX4qfEVg+n8CyB6nzrY2pEUUPFr0Ot44C0/24X8Qn
         JXYMZkxdpdzg3y8xPViKyP6/tJX0N6Wt0orEu3HCdBjNVEFrOvSDZgV8ByKWUQ2i3sPZ
         C5VCl7L3xMciw2hIJwIgEANFCClslVI5UNyPXBl0pOHSOi0KBgxQzZA/BoMlQoGWUukO
         Wog9T4tgBj0XHPmo3POc21X+0zXCb9f/qI39+zi+WD5vCErpciceqAZQIDWnE/e4FSaU
         N+OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530dta1fxj6PUSlcO7gqJow5T/0X3oTk0q3ab8Iuufwicl3/palC
	xnfw9pN0c11OJwQ9nfmZ2zQ=
X-Google-Smtp-Source: ABdhPJxu+bMo+spEnYFA9ZWjLhY5PMf339ZHIEUeNKbdiQosgtgDD9T0uUXfLsHQUa5Uk/vFLnjrTg==
X-Received: by 2002:a2e:9f02:0:b0:244:8e4b:5aaa with SMTP id u2-20020a2e9f02000000b002448e4b5aaamr13856107ljk.249.1647251942839;
        Mon, 14 Mar 2022 02:59:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f8e:b0:448:2012:773d with SMTP id
 x14-20020a0565123f8e00b004482012773dls1533345lfa.3.gmail; Mon, 14 Mar 2022
 02:59:01 -0700 (PDT)
X-Received: by 2002:ac2:4c42:0:b0:448:622e:5e81 with SMTP id o2-20020ac24c42000000b00448622e5e81mr12055252lfk.425.1647251941184;
        Mon, 14 Mar 2022 02:59:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647251941; cv=pass;
        d=google.com; s=arc-20160816;
        b=TE1FXmZKL95O/A9Bq5K4CLfMB8WmTiH/eg2Upiopj9Lesrg35ODlz6zP5+S0DO6PJQ
         Vva35csT2vSS7xryDaouuUcKepIdxZy3Sk1u+GrgiME+dzJsCGYVHy7auWAIOAeGWFlx
         Rgfqw6FOz4+IN1y7kCNbDwYdu0wLGSmEnAfaO1QyKQP7+jGrCcv85tP7ChnGuZLOPrj2
         XqH5Cn/72k1qix31JBKeqg5rrR8zeEPvvzVH8hQHc4NvdxFpCN6+cRfSoXxGokh6W7Gh
         6UU/u5CNnCnhL2X+zbSzzh8c0/EXE7YPOnSKzLHADupzTflULn1hS1YIYbpWRgbuYl7i
         1vsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NRoHNl/ia+73qkndghkg0gxkEMD35AkLYfQYdIPDokE=;
        b=CjAnWdKESpYKRa9T4ig5vMIbBbzrZl0yzgvCQ7vF5+eLsv2W/jELjfjvcHzD+y/UPp
         cQVtj76VW7vRk28yuyRYzhmCKKUuFRtWd1n5PJsRFPnK9v1gLkCOQobBF4Hv1s3abqBV
         pDKUu9X2Uqy2BuJM+n7DEBnlQA6WA9Ftv4nACo72GfAOCjeNnHsFGuxMu1F6HXeeNWdo
         JZnKtEMAXCOqQc1jztIGz8qZ994m0pTIa05WWJ0S83udO0mlMzeYBZapfjt2tlUjrg19
         /2EZLCu0ZE/khf/HoY36GheQhvv38w6/+nH2xTfdP7MwoNM0Kj1DbvGf1xMkncPameWU
         pWZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=jISfWs7o;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0616.outbound.protection.outlook.com. [2a01:111:f400:fe0e::616])
        by gmr-mx.google.com with ESMTPS id u7-20020a056512128700b0044826dbc513si1063123lfs.8.2022.03.14.02.59.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Mar 2022 02:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::616 as permitted sender) client-ip=2a01:111:f400:fe0e::616;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nc1RdQnI83wKyhn78ExpB3ESWeLumG0MLkNU1aHFpHMkTb13eRiM+HMy9WNNllJjRUkb4KOSgmq311c2ZXw4Hih2ETncQweCamtSpEIjrEScekkMs9d+RAu6YNGnHx5dPj+kH3fJPXcY61SInv9W/wEQ0Bq/4uNQ8X6HkfqQ6dk5v1pvImScsEMvga17HGdYRiBx2FbQGsJu4IPm9qHGJBsa5eE4UpGJPIzZ+bOQ2GoKoC29vN9whzENnyp/oT4N53QKM2KeY78kQv2u/XgntfCvXfifL2JapzrdpjjmISnK/65sjp5d2RoLeBmBaEjShuuuWuaX0gqhqM4VfEro7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRoHNl/ia+73qkndghkg0gxkEMD35AkLYfQYdIPDokE=;
 b=a5Je/AkTPw6zK6wKywih/T0jfDOfdD6I7bAYyeaT83XRMpiKqn2b96/6FXC/pajG7SUzdNHg3p+q7kSVO34D3tubqTD4wlIpGTTjhm7If5OWa4ccqA7H72RTC2xB/fq5l2+nbiWXqTV0hgqCukl+AmG5K1q55ijCTKFNG4MOcieVCgzfSDab0fwd7SsfstrrjHLjFQbVzh90hXqiVmZz7xVJMpzYoBUCFBZMWPpWAURoq35SXS7hqeFFu0Mt+rCrHh2liqsD9UlAZUY9LsavcONv+/mUVW88tF/rWSrGvewruEbFKHvUczf5lcoUH4RDOr4U8Omfdiw0M/mIyxRYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from SV0P279CA0032.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::19)
 by DB9PR10MB4524.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Mon, 14 Mar
 2022 09:58:59 +0000
Received: from HE1EUR01FT079.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::5b) by SV0P279CA0032.outlook.office365.com
 (2603:10a6:f10:12::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Mon, 14 Mar 2022 09:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT079.mail.protection.outlook.com (10.152.0.240) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.10 via Frontend Transport; Mon, 14 Mar 2022 09:58:58 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Mon, 14 Mar 2022 10:58:58 +0100
Received: from [167.87.72.30] (167.87.72.30) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Mar
 2022 10:58:57 +0100
Message-ID: <495ff8d1-23e1-6c5c-dceb-de7200eb05b5@siemens.com>
Date: Mon, 14 Mar 2022 10:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] configs: arm64: add emmc inmate configuration for
 k3-am654-idk
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, <jailhouse-dev@googlegroups.com>
References: <20220314061938.3304-1-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220314061938.3304-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.30]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59cccae2-d0cd-43eb-c30a-08da05a14283
X-MS-TrafficTypeDiagnostic: DB9PR10MB4524:EE_
X-Microsoft-Antispam-PRVS: <DB9PR10MB45244C0D88E7D4D42A3F6C4E950F9@DB9PR10MB4524.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGSEUax7ss8PG0MzIb6sX8nlu0TpM/OeM38CH6G1n5vGBo1/S9FVIvVfSfLt9gTjchr9oUauzT+XkoMrNcHAm264IwpOaYrmpIaPgyiSO+U1UUSewze127DlFgz5+15RhtM7MbcJdH5JejXwCngSzCybAVJHP8FT3KhCFrWqZgI4omKSTS4Zm9ECN7qxyJOCwUC3DTWZqMWCwGPvwHOMTaVZpkGxIh2fHFYOdrZjya+Uor3poiEok18XbnUjndReyp7wR8QaoTkWolPFoTJ5VMxNhAhaUCtFYBQCUfv7yH98BYb0JCJR5S8qil+YVMOCQ3rYB/WoUX1nwwI57xf9emQ0lCIT2sQowtUz+qP13XJHBBDv5pe6CVKMSVk2s5jnB+6S88JpVytDx/eUsP9rHb9qpIAfhCOVpcu58WTdGPSs7E1EH5cDbeJOjWvfVmfE2JyzWzw4bzKAPoEE2YHy4LPcpcMtOkUfSWxjYd2Zk7u0vIsJaIhtA/0OKZW+quhP/PDOVl1w9sbrpPgf7bw4oWKAgu7HuY0ccJ1GkQH92jHJR/5/Kis6d6qhE+Pe59aqXe2rNnKM8czzRqsIfd8xTlEJ8m0iNbw6qfBl39C23oqI13fs7/9c4J/M2BMLB/Dc6R41MpttOQ0v+BkX4t6oGEUy/WjeIMmM97AfNOiOIPLZh5eZA1sgBz5ihB7hmMc3roguJUZ1vxt6bYyUVuTR1b0do/xHI3jt4HxwgPhxHM8=
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7636003)(7596003)(36756003)(70206006)(8676002)(110136005)(40460700003)(86362001)(356005)(31696002)(82960400001)(508600001)(70586007)(6706004)(31686004)(316002)(16576012)(2616005)(82310400004)(8936002)(956004)(83380400001)(47076005)(5660300002)(44832011)(53546011)(36860700001)(2906002)(26005)(336012)(16526019)(186003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 09:58:58.9370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cccae2-d0cd-43eb-c30a-08da05a14283
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT079.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4524
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=jISfWs7o;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0e::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 14.03.22 07:19, 'Matt Ranostay' via Jailhouse wrote:
> Add eMMC support for k3-am654-idk in a linux inmate cell using
> ENABLE_INMATE_CELL_EMMC macro, and respective device tree changes
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
> Changes from v1:
> * Split out eMMC enablement to its own inmate configuration
> 
> Changes from v2:
> * Recombined eMMC enablement to one configuration that is enabled
>   with ENABLE_INMATE_CELL_EMMC define
> * Dropped patches that were already merged
> 
>  .../arm64/dts/inmate-k3-am654-idk-emmc.dts    | 45 +++++++++++++++++++
>  configs/arm64/k3-am654-idk-linux-demo.c       | 22 ++++++++-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> 
> diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> new file mode 100644
> index 00000000..150e31fe
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> @@ -0,0 +1,45 @@
> +/dts-v1/;
> +
> +#include "inmate-k3-am654-idk.dts"
> +
> +/ {
> +	sdhci0: mmc@4f80000 {
> +		compatible = "ti,am654-sdhci-5.1";
> +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> +		power-domains = <&k3_pds 47 1>;
> +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> +		clock-names = "clk_ahb", "clk_xin";
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +		mmc-ddr-1_8v;
> +		mmc-hs200-1_8v;
> +		ti,otap-del-sel-legacy = <0x0>;
> +		ti,otap-del-sel-mmc-hs = <0x0>;
> +		ti,otap-del-sel-sd-hs = <0x0>;
> +		ti,otap-del-sel-sdr12 = <0x0>;
> +		ti,otap-del-sel-sdr25 = <0x0>;
> +		ti,otap-del-sel-sdr50 = <0x8>;
> +		ti,otap-del-sel-sdr104 = <0x7>;
> +		ti,otap-del-sel-ddr50 = <0x5>;
> +		ti,otap-del-sel-ddr52 = <0x5>;
> +		ti,otap-del-sel-hs200 = <0x5>;
> +		ti,otap-del-sel-hs400 = <0x0>;
> +		ti,trm-icp = <0x8>;
> +		dma-coherent;
> +	};
> +};
> +
> +&mcu_uart0 {
> +	power-domains = <&k3_pds 149 1>;
> +};
> +
> +&k3_pds {
> +	#power-domain-cells = <2>;
> +};
> +
> +&sdhci0 {
> +	/* eMMC */
> +	non-removable;
> +	ti,driver-strength-ohm = <50>;
> +	bus-width = <8>;
> +	disable-wp;
> +};
> diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
> index fdf5fea8..844554a7 100644
> --- a/configs/arm64/k3-am654-idk-linux-demo.c
> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> @@ -23,7 +23,7 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[17];
> +	struct jailhouse_memory mem_regions[19];

This does not give warnings if emmc is off? If not, I'm still not sure
right now if Jailhouse handles Null memregions well. Should at least be
tested. configs/x86/linux-x86-demo.c does that differently, though.

>  	struct jailhouse_irqchip irqchips[3];
>  	struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
> @@ -112,6 +112,22 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> +#ifdef ENABLE_INMATE_CELL_EMMC

CONFIG_AM654_INMATE_CELL_EMMC

> +		/* sdhci0 */ {
> +			.phys_start = 0x4f80000,
> +			.virt_start = 0x4f80000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f90000,
> +			.virt_start = 0x4f90000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +#endif
>  		/* main sproxy target_data host_id=A53_3 */ {
>  			.phys_start = 0x3240f000,
>  			.virt_start = 0x3240f000,
> @@ -153,6 +169,10 @@ struct {
>  			.address = 0x01800000,
>  			.pin_base = 160,
>  			.pin_bitmap = {
> +#ifdef ENABLE_INMATE_CELL_EMMC
> +			/* sdhc */
> +			1 << (168 - 160) |
> +#endif
>  			/* vpci */
>  			1 << (189 - 160) |
>  			1 << (190 - 160),

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/495ff8d1-23e1-6c5c-dceb-de7200eb05b5%40siemens.com.
