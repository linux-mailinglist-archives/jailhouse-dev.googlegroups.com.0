Return-Path: <jailhouse-dev+bncBDEN32754MOBBOWZYT4QKGQEJ4YTVJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97E240525
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 13:17:15 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id c184sf5539602wme.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 04:17:15 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597058234; cv=pass;
        d=google.com; s=arc-20160816;
        b=amhGnICuNaAI79P9lc9YCkjQDqtYENldkDfko+r1fUKpqHaQKQihhtgq6WCxHMk2KF
         EHk8aZy6eNzqvuMXg+xS9guvHgYAiFpMUo12DmIr8yZ11HOaux0h1CrkPAFu9I9ovSuC
         S4MWsNCEOYB2/9XjwSCsT6m4+TYa3UGVh13TnEezbD1Aj31oKskgqPXN97dSDjqo+rXP
         mvGRC8EC82ZAco4kqFctl12QE7/nuBeWq+x2m4hqNzKmmwsnvVi3ZRTX5+WejlWdfqKJ
         sKHVm7rkcqiitQjr3LFz+UEoyJFrGyq47sm7IqEGbI95rz7xE/aFQTrDqJy4cmyJ4Ho7
         3QOQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=0fjImRpJU7cLUNkGJgKFV+ZiIhKpk1wzCfcVocCo88g=;
        b=wSTsnRYckYdqMyMwnS7B9NHx8fzpdnIGeXrt813sSo/6ETdjVc5lf3Z4gCsGqc61nJ
         IfXbgLDQqRHhGMdd/kzzXYHiyz2Si5PUU+ljFal2fWkqYspHfm+ShZ5pDF/iLsSvVQwu
         e7R8Ywac2XkAvgCVfG27hL3zgsECLP3BDcZJMGhZkl5Wo8CYaz1+fpJGwDqrRZN0lcrp
         wRbopJ3ygz0uF1PQVxM4IyAkMkpu5Ws0+GzseuKBazwlpvsrKcdF1t+1It0h7P1pNQ2F
         Op0EidNRvynv33+EvZhyK7UfGa+ZqVyIsXIyHEPBYdlyvhWxwKhCyfhna2JPrObUDkg7
         Le8w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rtMYuB5V;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.57 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0fjImRpJU7cLUNkGJgKFV+ZiIhKpk1wzCfcVocCo88g=;
        b=h7DjdeCrx6PQ011fQfMDIZmT4vymET+JRBnGbZQhFjyZDywjR11Nkj9G0nFl7ipWQs
         SUywpzmRFU3qbkBPdtf2I9bakgbFqErQwUAVm4qtLVtrhzBUfuaDdpslGwo0+ekcihnK
         8G2PrB8oAcyiXKy+P74/uGPUTCNVpjUxNdrX498vgCecH7XbPNyLNCfa9S8YpjjBDhG1
         7V7Hx16xaCMmWT8daiZm+jmnNEkg3rwKqBRdahhPno1OeefOllMahQknbQO8Y3jEREDG
         JPCPiAtL08P1ZB20G+Nyg3NyXpZFUb/NG6gg4oRIQq4hF56jqgXWCH7BL4OunSvlSxDJ
         3Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0fjImRpJU7cLUNkGJgKFV+ZiIhKpk1wzCfcVocCo88g=;
        b=pon0CneIXOsrlooS1D4oJl5k1YmK8sFYM+OQQePAvY3ZAOOO0ybwt/+WWtBw1s1sAH
         avgW22dE7zwgN7jQAaxdly3X4EraipXIf+yUw803WDcX3PvUiRXE4KOlCqFcjeAbPZ/r
         QghAqtpiAqJIdkiNo0Y6TPpWEbwBeN8Q0AsyQyUyioRhavkEWHS9ryHJF7k9WczeqnFg
         NSOWIrbtt6+c3ELvGpoKi/MLpva9qRF7VjtXHDwayoobGCADY3ppTLJrHAQIr243M6CU
         MT5/qW0Jv5a4tbnZXMSVMtwe/WGQa6fYFC5ygcJs/K53GI67c2eiPUmA/SFGbVfF03xK
         wDvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CRq90x4VferMjKPWwWBlmH69NuSvf8E/3qp0CIZSd6ymPvRDi
	M8EjCBwKOAHSOVfGcJLbaTw=
X-Google-Smtp-Source: ABdhPJzYO3Nss2Yc22X02/hNQH6HTdkhMmW5gyD/ktIsoHVMEuSq2esdna0a3QeSCSLa9YC8rQ4Edg==
X-Received: by 2002:a1c:b489:: with SMTP id d131mr26375901wmf.114.1597058234846;
        Mon, 10 Aug 2020 04:17:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fa8e:: with SMTP id h14ls210583wrr.0.gmail; Mon, 10 Aug
 2020 04:17:14 -0700 (PDT)
X-Received: by 2002:adf:e9cd:: with SMTP id l13mr1065695wrn.340.1597058234350;
        Mon, 10 Aug 2020 04:17:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597058234; cv=pass;
        d=google.com; s=arc-20160816;
        b=T+90okzADPdwPi79oXVBAJ3bSv9bHwsk+b/vGCiFVzJfOVVteP6UkskIn/FWGP5qCI
         /kBywXaXX3ZPbo4JVzm5tLHBSEbC2s5Uy4oOoCf7YAHn40ZN+G4WFf/+RM+S9A3z8i53
         /WX4g84yy5uce1+2NLOtXth7uPUI2nUT2v8CJKCW6IWvGoi8GQW2l9cph+p1VDx4Y92d
         TGke4FLyhkMfmoFLNATplZxEpz40p9eDj0JJiy4S2tVKmYXFzwjSiEvaU5jNhu1DUBlw
         C/6miY+1sTGPWAaMYh+EGMEh3ek7xxN1qw4v//YjjfzV/7ZFmmFUJyaSxeOWi1sN4J5e
         gr+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IN644hnL91HKn5DdE9e0txQJc97/KGt5TfSIHgNf4JU=;
        b=ka5LN1eljsJud/QaSZ8E2rhoY5FkWb7krhIPrSddsngBP5hwOxwOAlUSFWTgoJmfFx
         kXDgC+RJf1WLnQ5s4qSbqdZMQYQy1tmm68esbffPdQTUljrZnvHZCSxGJG0WVeUpU6Cn
         8J6joW00OLM8sOESuZG/rQ2Qo+01qwxuodB+Otg02+RKma1rJv2eN5BQQbVQIqmmZacJ
         yw1/XaqtMQECzOkTach7v4++AXtvsRdBGlOhrIYeVSx++rb4MltNzF9+DGIwND0nBgMR
         EPbHAqpj3iZ2P4AV1MNU7MpQuVxMpRmDShpijYrDgSAPj6nNoAyzStKrIH6wmPc3FEW/
         YIAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rtMYuB5V;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.57 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80057.outbound.protection.outlook.com. [40.107.8.57])
        by gmr-mx.google.com with ESMTPS id s10si775699wme.1.2020.08.10.04.17.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 04:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.8.57 as permitted sender) client-ip=40.107.8.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZeAMOzQlIGN/v0LtJCuB/yFjPY64a3fYb1Zzl/rEFDic6UinVyAzOvXRJjsetlaTUf/8jEosweBREvsh+a0DvAzcRj2x+4kz2UXgpbc+JX1QKWZLdbIW0X/31brVo9PFerropZMiq7Co3cilOlSKN+j2Cr++VCvjhjZ4PfMfF8unLtZP59JpQcIXYsIJNnggZdZWZktGxBQkp/YQZuN4dT3Qt2zyTwm/dU0Fz2fbIvFDivtZR9zy3WjcGbB4XSQG9exm/RR8cYswkGmb3ihjRSuAGaq1KpPYUxQbrYkuHJVjrHItqUKHbDYIZPLFMpcZ7HHoksvtu038KY4594m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN644hnL91HKn5DdE9e0txQJc97/KGt5TfSIHgNf4JU=;
 b=EaVIbAFLID8x9lnZYiEy2AsrJUeQt5HtFWEDYQfA+RP+R0PGPzKvO7YPoEzNBGNRcT7efKv3L7CgncrKtJFAx6ygJxzj4e6LlhGJdi4Gfe4GnW6PkwkTfdiSrDSHuDmzX67LNot3V6sDcH4RbDntz1ddRiCp7DgRGlYLUdk3kwUTm5I4mlAJWoAJ2bw8SIWlzuiOhuWgBQWxYf0fK2zFSi41OVHeB//hX8tjOAnwtKahzsKEACDB2WDbrfkGzJUeykI4lh8JZlUSRvbAgM7vVsTtvjS46ewe5tnWf3xp/TQidaNMSMQoQCwR1jhsJL/PuFFHtwvCEgnUUhiC5NGJNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 11:17:12 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42%9]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 11:17:12 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 5/5] configs: arm64: imx8dxl: add cell configuration files
Date: Wed, 12 Aug 2020 02:16:41 +0800
Message-Id: <20200811181641.7282-5-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811181641.7282-1-alice.guo@nxp.com>
References: <20200811181641.7282-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0149.apcprd03.prod.outlook.com
 (2603:1096:4:c8::22) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0149.apcprd03.prod.outlook.com (2603:1096:4:c8::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.6 via Frontend Transport; Mon, 10 Aug 2020 11:17:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fcd40c6-6437-4e98-c1f9-08d83d1eee05
X-MS-TrafficTypeDiagnostic: DB7PR04MB5451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB545170D75AD831943F7B2E36E2440@DB7PR04MB5451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m61jeOgvWL/qvPQZABibmm2ku0YBwRT0D1pRx44ayK65aFtQ5iWby+vOTjVxD+1Q7nMkglCbupMFBqVHBY5vAOkCE4OYBuDFgIwG8J6v0IvHaFuIHi7rWS2FsvSWSSpcTCJeGVhDDZeZZC+UcNhheATOgIaVF91jI+YDuunuYhW4ZrwQCKpRoTyTlOdkM7E9UWQhB+w/Bv+PhXaEGEJ5JeW8ck++5G3aT3UOG/sO8A7E9JkjiTjmIbnNQNtLArQ2Bo7s1FA05WwS4c/XqhU7ZDff+XSVm//LBmwub9u57UHBPELoLsSr2f78g25fRsvNDOyxNVWawxWulGkeL5IfyQWUREsicVSUvkF5ItpcErp5BkBkVPjzsXd1GVZnDJTR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(2906002)(956004)(6512007)(8676002)(52116002)(1076003)(8936002)(478600001)(44832011)(86362001)(5660300002)(66476007)(66556008)(2616005)(83380400001)(36756003)(4326008)(316002)(66946007)(6486002)(186003)(16526019)(26005)(6506007)(6666004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: +BQyewhVSIfTjyu0Ni1y5nIkftzp48Seik6nK7tlFHuCsba3PdgDXzOVhGB9bYk0Imf9zCKoMsrQbakhzjQ7jTCwxdZqf/czxdDFp5oFsOYpG5iIUfsVjcMEWTe9pLQuFgxciowOJCiHsvm4EUijso9w3rFh30LYFx10s+CYbHyXbbn8IlLNDa6UWQQ/zby+4S4Xuni+3d6JMgFJ1MN8ALW6vXYoSOIr0ICyi0qHlEVFF6z4QfavUL6nLMhJdZ/aUU07HO1+Bo6D9sFz+qCR78IraERklAX03fzsjhE/sVcLI2eSuiYhsSb/A6MTierhDjGWbhbmvHtuFpz/WU8h56GXcthux1DcQbMR+VoerjMpN4mu7PCevXblo8aX72+PQ4c5fqUZBQAp1AgBIO+qLD93FrWeZvCx8l5rGUGekRMFU/XVVv9pHdTthZpeQKQSgWm125UkBzCApZZI5qW8AieTjdxG9MlfrmE2Axaf9y1CoP0CcpW/XXb0C40r6cxohCGWCws4Ibcl5DUlu+ddHHMjhVEZSgsQL75aI3PH6ZCn5YpDM+iNaGwxQiMVGDgBc61BfyVnbAtxellt6+PzzshFrU3MHrY4AU4TzdzwSzV48s38OgSUcgOoo+lPqQWi8gTkbpnWQdUNaI2KDn30bg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcd40c6-6437-4e98-c1f9-08d83d1eee05
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 11:17:12.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDEEtbTDGT8U0OcK6JeV4tagUT0RPSoonyyBB0PmPFzDndTPAu+5NaonozHjZcmggKhja/QlbW91VLfGVRSARw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5451
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rtMYuB5V;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.8.57 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

Add imx8dxl-gic-demo-aarch32.c to support AArch32 VM on the imx8dxl
platform. Distinguish whether it is AArch32 inmate cell by the macro
JAILHOUSE_CELL_AARCH32.

Add "imx8dxl-gic-demo-aarch64.c" for AArch64 VM.

"imx8dxl.c" is used for the root cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8dxl-gic-demo-aarch32.c |  64 +++++++++
 configs/arm64/imx8dxl-gic-demo-aarch64.c |  64 +++++++++
 configs/arm64/imx8dxl.c                  | 173 +++++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch32.c
 create mode 100644 configs/arm64/imx8dxl-gic-demo-aarch64.c
 create mode 100644 configs/arm64/imx8dxl.c

diff --git a/configs/arm64/imx8dxl-gic-demo-aarch32.c b/configs/arm64/imx8dxl-gic-demo-aarch32.c
new file mode 100644
index 00000000..80dbd366
--- /dev/null
+++ b/configs/arm64/imx8dxl-gic-demo-aarch32.c
@@ -0,0 +1,64 @@
+/*
+ * iMX8DXL target - gic-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo-aarch32",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xa1700000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/imx8dxl-gic-demo-aarch64.c b/configs/arm64/imx8dxl-gic-demo-aarch64.c
new file mode 100644
index 00000000..88d436fe
--- /dev/null
+++ b/configs/arm64/imx8dxl-gic-demo-aarch64.c
@@ -0,0 +1,64 @@
+/*
+ * iMX8DXL target - gic-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xa1700000,
+			.virt_start = 0,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
new file mode 100644
index 00000000..f94692bc
--- /dev/null
+++ b/configs/arm64/imx8dxl.c
@@ -0,0 +1,173 @@
+/*
+ * i.MX8DXL Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Alice Guo <alice.guo@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xbfc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xbf700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "imx8dxl",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 2, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0xbf900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbf901000,
+			.virt_start = 0xbf901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbf90a000,
+			.virt_start = 0xbf90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xbf90c000,
+			.virt_start = 0xbf90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xbf90e000,
+			.virt_start = 0xbf90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xbfa00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x21d00000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */{
+			.phys_start = 0xa1700000,
+			.virt_start = 0xa1700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xbfb00000,
+			.virt_start = 0xbfb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0000:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0000:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200811181641.7282-5-alice.guo%40nxp.com.
