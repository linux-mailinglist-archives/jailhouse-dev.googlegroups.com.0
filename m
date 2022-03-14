Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7XXXWIQMGQECU5VPPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2814D8AD6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 18:31:43 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id t15-20020a5d534f000000b001f1e5759cebsf4658837wrv.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 10:31:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647279103; cv=pass;
        d=google.com; s=arc-20160816;
        b=lRkafratNduvjA1h7fOq8KhEVgbdyymUqwbUBuY/jyINMAGxl68L+eqIr/xXZpsdyj
         mUv//0BvtihEdW+VvOmskRKgQsrSTkEvlWtk4dGsfa/DUWuZnpWHnNu27IDrhmG9iU3y
         VO2kFRZCcJEMZ9jB8zAU8x6DP8Re24Rgz5Z+jl52dqTM9+3op91pr0z4h9/m0HgFuK1s
         BEYT5V0DuK/pH3t0Z44+Ear0Jpiw65Df79XFt0CALOZGO+jl7JzCSL6MDE0Dnb6tOxY+
         zbyZepUAudN879J8cmIo9f+GWfAw6Gr/KB0eNbWVsa4xCWyd/aYA9eVqLXt1mC2V/j6M
         ++Kg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=y/boLJ6hRK07kx5KcIhT0Git0b0bVFN3lBzvrKMCf6Y=;
        b=V4nwzH81yUgPA33H4rQRzwv20GRRi0pSGCqT5A6eP4ZZbnp5cF5cwVFhiYrLUJvWbQ
         5tJWE4LKtT6K2uHpfwz/uYZ3ammwqycMXjwcvNMlcMeIz1WQl52O8qVz0+YE+YkeH3RH
         T3/e7zB5/OtLMhxAAwkKdFuKooXNDls5uOeHHeeBJvb4WnL71/xNMzbc8B4Wl33sGcqy
         bZlA+1bG4Ie5VdaDcFgJXqmlCAYVZLjfMTuaMBTHXAf1WJzslmVCU7nVNDt6Zwg6zUXq
         0CJIJpFOzMSSQMeoNqun/X83pWhkxyR27AuN4rbfcIp13uqGcHjmf26chtBiq34e7sou
         2JUg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hzEB9lAs;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::60d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y/boLJ6hRK07kx5KcIhT0Git0b0bVFN3lBzvrKMCf6Y=;
        b=eyznok3f9//I713XFMDfPlOLDkXDZQ8kzJWlrv+8m4QGUXxGjTkgi8TBbC9FMiPjr7
         LG/c59NGR01VPqlwVklmDrkTalv1JbfadyArDRlax3FBLdX7nLeA7Tzjcxo0x92xn5un
         bssBSP3NpeGcjUiVbxPSEUpHG9KnQ301q0dVy+FeljR3l4cwJI79T2j7+SlJgBZrWKra
         hoUSHbTX16nwiM7sZD35ONR602+0J7bkt0i+xVnJ3UUTS3gXK8Z/76lWrQeG6VnAoBag
         +j0VN86RDI6Jy48ArtRNam3NcpL4GDOw71AuEx/VqiuL2Ka5ovsdZGQ/carer7ug9HCh
         I1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=y/boLJ6hRK07kx5KcIhT0Git0b0bVFN3lBzvrKMCf6Y=;
        b=2Is+44mkb1HwctY2LkBJX0cQqOW4rrkcP3doWW3wWbFVanprdo3lMGMwMpJp+Ra4tI
         RRWVQ8vjC3QlDOsMtGMzc2rQJwHRrmATaDP/neLxfDKxkd8+l/ONp8i1dY2bCq/jkRdb
         eyf/XSsvfvFSpOluktiMRFlAAGB4hqBsPtt9P41fNlfNief4vkJSju8QEq3V/ew6YrRh
         t/9vK0ou8gfftWb2R4037LNu0oOgNEQl93wPcGXNuGgVMHEcmBzh/73n/gjhb/l2nzAc
         7clyh0dsee1Mjxi/+S/lMZm/MM571tQebTlQiLoqN5LbVHm+wVF/P0K0q4V5AQJUwGAd
         IQQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533XOOXkzqnszoVHv0kNUcqBERI1dU5GL5+gWs7hmTh3Imo0ysCV
	XpXv0UCd3Wm45xdgnMbEQl8=
X-Google-Smtp-Source: ABdhPJxiPDuuJl2vAnbc4Jpziz7Sg8uzU2Rk/CTijvDaTYXhBPBkyYSknoUhwqTzu/dFcaFzW3wYuA==
X-Received: by 2002:a7b:c3d5:0:b0:389:a49f:c7e6 with SMTP id t21-20020a7bc3d5000000b00389a49fc7e6mr176054wmj.99.1647279103483;
        Mon, 14 Mar 2022 10:31:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d09:b0:389:a440:3869 with SMTP id
 l9-20020a05600c1d0900b00389a4403869ls22960wms.0.experimental-gmail; Mon, 14
 Mar 2022 10:31:41 -0700 (PDT)
X-Received: by 2002:a1c:2b41:0:b0:380:e379:b8b0 with SMTP id r62-20020a1c2b41000000b00380e379b8b0mr201268wmr.87.1647279101878;
        Mon, 14 Mar 2022 10:31:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647279101; cv=pass;
        d=google.com; s=arc-20160816;
        b=p7jhVTOXE5z2wpOIXpMDklwNuOvaMswTtDjfKMWBQOPvGbPjXaiW0UyG106o9EcgL5
         IO1/nDcwkI7HHmspHkXix7WwBelxrF7u8lOcm9tuM66R+Sfix+r/2yeddyHuk+zZ3KOK
         jN8/XXPy7tf18pRw68vkY+8s0mom7wYKHVtZMzq7WNByIb1bLRoo0AJ953rhJwLerwl2
         ZafRavffM0Q72t4n39k88/9a5/Nc9P60AhvaAtoZkUs0IKDk/68rG2UolbQi37cP6ku8
         I3WxQoT7Ce/LPPc41ZwyiNRnxXnZ9lPWsi7xb7kmLiqy58DfnMgwidtIcfewEcSKpjXS
         4ngA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zrWANn/fXwiiJ7yDM49ZGY8yVOacKV23PsIDWMdB+0E=;
        b=alN3VmbPO6G7sWrIzlXzLz+BbfkjxMQDBIbrTyTIfdl7NkgfTcZcbS1qe29/tRZ1ip
         V4svdhaxUMI99FqbkuGWm2ncv2YutDPHeWxddZHZZyEyTWU4A5gmyDF3u/ZKvqLxHdt/
         mckMxKajLzSL3Dy2FTPQTQoiTQh8YICckjxE3kX0wlRAN+4SEjsIlV0DmWCcsdSbxt9s
         t4ohoBAT14LHRS+4HEiDv6s0uGcbrKyJ+g2my7OC/gDtHgAAM9SpOumWLpQiC9uFV95W
         WPzwkWJvEhzOaJLTIMh82kC+NrETNecoiaaou7VNHYT7jPLjbMoacx1uxWJgsjITttzZ
         Xl2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hzEB9lAs;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::60d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com. [2a01:111:f400:7e1a::60d])
        by gmr-mx.google.com with ESMTPS id a13-20020adfed0d000000b001f0626bf294si898275wro.5.2022.03.14.10.31.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Mar 2022 10:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::60d as permitted sender) client-ip=2a01:111:f400:7e1a::60d;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IH5ZjVeXr/W/s4B54CQkE1cwMXwsZlLGWBLarNX9hC65hK8oA58n/XJJz+d4DBwyzR7eMfrCRDorD64PgPd7x6ndi+wTlM3EBtsv2IAovJqm5zZ1vb3g5lLoh4O+PgNMgVu6c2r2l8wJWdPPpesMpI66HQ+Ic9sdiNWGbKA8TARrJI+Npujo299vGfAvmhGqvOJUSClb3MdToby+tOOjQaiBUa/VgEXxyp/STv8MRa+pdgawhzfti7mrP89Oq1O2OuAY2Thi1iJtBt5/9V9GQ3m95tjPnWwmZ7ohTR9J0uvY0OAg8BAbNgDld45+ZaBbuSfB/70abGB6HemXMczxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrWANn/fXwiiJ7yDM49ZGY8yVOacKV23PsIDWMdB+0E=;
 b=SQqwTM+lfoG28Q9umJg9J98BdGKl63fQg02YI3Q9IJYnzwHubbUkMDjqP5Z2cSubjK5B1qwtWiJ7+bSfIJBLEBNWQ2lkCz/C6q5/xQRZMrMV2vBCeONzrDQ0EY9QBlDrZtIKZZTVQvBlSvDTMJrwRu8CIclaLw66isz4vGpKsHBWM/Fs6kw91G3i2BuAy5zfPv7riQrUaA02EXKIcaYWGTdGIH+069QiGQBq4ZQaG9mhfN+J119pQV4eC30P/hoIBuCZ7TphapQoM35Dd6WJaP7ruuBTkXi2qsxjHM7ZcVUuUSvzJxBzKmK8D7m4LH1QjcmzY4YJYDOJQcteFg2LEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from DB9PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:10:1da::34)
 by AM0PR10MB3585.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:154::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Mon, 14 Mar
 2022 17:31:40 +0000
Received: from DB5EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::a0) by DB9PR05CA0029.outlook.office365.com
 (2603:10a6:10:1da::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Mon, 14 Mar 2022 17:31:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT021.mail.protection.outlook.com (10.152.4.245) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Mon, 14 Mar 2022 17:31:40 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Mon, 14 Mar 2022 18:31:40 +0100
Received: from [167.87.72.30] (167.87.72.30) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Mar
 2022 18:31:39 +0100
Message-ID: <bda0b499-e98d-2207-6adb-5baa8d9811cc@siemens.com>
Date: Mon, 14 Mar 2022 18:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4] configs: arm64: add emmc inmate configuration for
 k3-am654-idk
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, <jailhouse-dev@googlegroups.com>
References: <20220314152209.5859-1-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220314152209.5859-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.30]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d764b952-394d-42fd-7cac-08da05e08031
X-MS-TrafficTypeDiagnostic: AM0PR10MB3585:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB3585690C1F9A9A0E82EC6B80950F9@AM0PR10MB3585.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQ6ORNgzC1DOEqkkUptLc49Zs9ZJ6FV+HdcNiS84lsjjppa/dGzVj35W3Yl4Xkm63Go4Uf9r0RbYmzpEgjuG7b/YJ61i/28HTR4KPjrDl0ilQxbzdw8h3QH2y0BlUsIZWROb1KMJXi9PZnhUxHdVuGDQvx8uLuHQkgUaxM8gXj04ChzYH+xmyoczcKdOJkSyuudkBQsI0ur3AYuZhiZC3KaIStAPz0pheXJx24Y6gqrX+BSTiMFbkTAh8Qf3uUeZKqeDzIlpxoI5R4UtiYIoVY2huUFw4JdFw3nxWky1FX+32NcEO+ICRqrf6Vgf+4lV9aMK+EccDPHZZxFdPbo8fy7gO8t2/jDgfrL0uUA7pMG2EeH+ZYF8plLIZ8EeF8bgRC/ODI98LV1OQSFeeBZDL7SpwraTMLRRbhCHJG+fnBmAOQX12uoFzrtZCA9MAje0Gx5ry2N8cQsHb+jbsuW64/z7eLST3Db5KQ6yg3I3jmQs2+7Q6Pfj2GUckXzHFVC5y5k0uGH+BwM9NN8GK5HdnIxkVwHgMg30yjSA+xyDwSpg4Caix9ECRTN5LH27P/vL68c7WHLMAeMKOaIWiwf2rm5GBkuVuUU1UTLQgBa8PyqF8alFF8FhwYURAWT9y2Mkn4xQFIUOXxZrsS/wQr2p5aZRCjF5SgA53vELGL1EYVlA8bAeCHgYNoN7XjhzTahuLSvdQD/9M/jsnSAtmRCC7u59i6LgtM5ahf+WnUk6wbwEzHsgRX4bmK2eqbgjiDPhAOQ5QokO/2u+ABt+Pt4xhA==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(8936002)(5660300002)(336012)(110136005)(6706004)(316002)(8676002)(70206006)(70586007)(26005)(86362001)(31696002)(16576012)(186003)(16526019)(956004)(2616005)(47076005)(82960400001)(356005)(81166007)(53546011)(31686004)(2906002)(36756003)(40460700003)(83380400001)(82310400004)(508600001)(44832011)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 17:31:40.7105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d764b952-394d-42fd-7cac-08da05e08031
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT021.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3585
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hzEB9lAs;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1a::60d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 14.03.22 16:22, 'Matt Ranostay' via Jailhouse wrote:
> Add eMMC support for k3-am654-idk in a linux inmate cell using
> CONFIG_AM654_INMATE_CELL_EMMC macro, and respective device tree
> changes.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
> 
> Changes from v1:
> * Split out eMMC enablement to its own inmate configuration
> 
> Changes from v2:
> * Recombined eMMC enablement to one configuration that is enabled
>   with ENABLE_INMATE_CELL_EMMC define
> * Dropped patches that were already merged
> 
> Changes from v3:
> * Rename ENABLE_INMATE_CELL_EMMC to CONFIG_AM654_INMATE_CELL_EMMC
> 

How about the memegion array size diff?

Jan

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
> index fdf5fea8..3937dff3 100644
> --- a/configs/arm64/k3-am654-idk-linux-demo.c
> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> @@ -23,7 +23,7 @@
>  struct {
>  	struct jailhouse_cell_desc cell;
>  	__u64 cpus[1];
> -	struct jailhouse_memory mem_regions[17];
> +	struct jailhouse_memory mem_regions[19];
>  	struct jailhouse_irqchip irqchips[3];
>  	struct jailhouse_pci_device pci_devices[2];
>  } __attribute__((packed)) config = {
> @@ -112,6 +112,22 @@ struct {
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>  				JAILHOUSE_MEM_IO,
>  		},
> +#ifdef CONFIG_AM654_INMATE_CELL_EMMC
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
> +#ifdef CONFIG_AM654_INMATE_CELL_EMMC
> +			/* sdhc */
> +			1 << (168 - 160) |
> +#endif
>  			/* vpci */
>  			1 << (189 - 160) |
>  			1 << (190 - 160),


-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bda0b499-e98d-2207-6adb-5baa8d9811cc%40siemens.com.
