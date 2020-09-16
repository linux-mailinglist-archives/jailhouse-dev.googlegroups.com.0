Return-Path: <jailhouse-dev+bncBDEN32754MOBBQUSQ75QKGQEXIYTAZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97826BEE6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:13:54 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id w27sf2565698ejb.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:13:54 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600244034; cv=pass;
        d=google.com; s=arc-20160816;
        b=kzLkw1RuLqn5+9nSl7hDcPOGCOlHkHCiz5vhc1/ZdUTlXPpqKyAwi0HiFI5fIntMoz
         wANLgcdknRHewDrTpwr0CzJAy08Z7047JUPQP22N6eDgNA3CkCKvaqLbIMOSYc7l3isv
         VeaEBCyIvMqabPRLshljjyJlQ6pX5dn9YFsWDLUX7XcseEmF3gY1+umzWtU7QWpUrzZQ
         VNVHTQGKXxHYJdwBKnss6WxnewKGTy2VD1/oqIhn0s86rGCePcfiAby8OW/duOU8X+/c
         6S1TKA02aodNK3as+PtKitlouj6ei79AYH8PssUm+OTp4mzH4N/6r3Fa+QLwvyzk+QSv
         OA8A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=6JN+cdTPe/jW5oHBmTEi6xDe3SDTFlDYXIOHSJU75k8=;
        b=Acdiadt7xB11nx1huemCfLEyMZAmR36gnjf0bDnctCm61AcEoSpUO/ne6oqsSMwgeV
         ygIhIZ1w1ekaagNm/jjkdKvbvhm0il7X8lNfFfohWFVz7InFURU2oPBh0JDLVIR+POYI
         mGxKV6tpTxcx30SKnQJSJVttFRP3y6ickEjQf2FByeJbZQFefwZPuiqIXZs1wiaiZkHp
         ZjPv2usPXXSrdhXqI6dX04qK1GUwpPh6XVu6qOwSY9Tg5IE3+anE1x7zAgWMYjUESPT2
         neRKPK9AchELGi3RRFxGPxH2fM8OcgZnV7lR5BlHdPhRZzwxvpbLEezFSbznIJmTVIu5
         GLkA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=M27Vob4j;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.78 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6JN+cdTPe/jW5oHBmTEi6xDe3SDTFlDYXIOHSJU75k8=;
        b=Jljs9dAGA03eCwyvsf7I545N3r0YP7ludwny+p1dWK0aNU3LO9A9YkJSvbEdFAkxzq
         TycGgnoToj7wnDGZxVffqIqAuP0tuIgpN7D/HL8hX2buLU4njv7UKkkjQZGguVGl7xaf
         Te9MXc2dyX16kxxe42hr8YcNBVfwTVnsZiHbNsgr3W2ireDa60FTq8kBguXryJ1SExmV
         2iQdpqBwI/jYxgHLrt4ClyBI7dPUMnQ/Fahjp//hVbfl5rhHDWd9WK8w+vTKEOsXfzIM
         di7AFYVYLqktWL+eYFWjI5QqVwXjAB1cxeXoD9hiQIOMlDdwLO+yXaOf4UafvtQLUeqZ
         fC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6JN+cdTPe/jW5oHBmTEi6xDe3SDTFlDYXIOHSJU75k8=;
        b=dhmkr5UHKFTxM29TeFWXnoAIz83nUTcd86abpHs7hA+ku5/FxPbejoVCCeFjY2wZQq
         ciOoKGRHpyRt55L2AlU2QXgtCb/VXRgqoHtxqbWX33m2mwebZXCT3UhMyWGym/KFMibV
         WECa8I2P4L9aUPOhpB7YHEDuXbtsAx7XnC2qay4KnzGEoGM0jj+us8XvxyKtMxz+XdfU
         1HQ6+//NL8LBJw19vTGZlMRWwAbH6LrEKHG4gnp2WdlK+xn56eZMhPnAu71nooVyrOy+
         +7ieYThp3kxMpMHhRzgEkHLXVdEJKFQAFz6bw1gTBlpTg+7iXFG1ow/XPbTZAYKH19lL
         WoMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Fa1IxSbgHZ1A9yQFKfPmnvJjHMk4RxUqMcTiHbhgMArW7PoN7
	Qd0SE9k/uh+Y8WfgosuWm1U=
X-Google-Smtp-Source: ABdhPJwFPyERPJCqF7dSRbAFm5cBa80QoaNh1etqEI7W46aOzqxlBPgV9jSlgA9ZG7GgpbljVW8cIA==
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr25673413edb.299.1600244034563;
        Wed, 16 Sep 2020 01:13:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f996:: with SMTP id li22ls615528ejb.10.gmail; Wed,
 16 Sep 2020 01:13:53 -0700 (PDT)
X-Received: by 2002:a17:906:1b04:: with SMTP id o4mr25140103ejg.332.1600244033259;
        Wed, 16 Sep 2020 01:13:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600244033; cv=pass;
        d=google.com; s=arc-20160816;
        b=L7b55C35NY2W+cdkTXj/wN07oB18qGZsBZFXNv+Thc+cxsQFEWME5pA+lHLWWldOT9
         tgw72/qoM0vbIk/YB3EB14sKSXw968ybx4YpKv5535OSFe2Jkj3VGQEjU8wYM3T2KJ7t
         ORuh1tCsdVKh7PMFOuMXl2VRNRCP/thODff+N7gNrPT7zv5pmABou7OOr4bbvGT9waWw
         Zeu+7n4KaresSojdZoTZAZv7jywvvqHkjAoNujp8cw369TucVAIzAyCkLURcZmcptQJZ
         sum/wizrhyVFVSkP+kSUvPtZ8G9yLhInoAvn6rEUVYDuNk0+8URCx4GVBeHjZ34ttdHi
         lbBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NiHgu7RH79nCgoV2TF4FiFOh6wvdNdBjKig4TK6b3kE=;
        b=DP8XEMyaXa7xR+4qsVz3vyYyIliXFVmhI5KK/HZTNLFwgNAeteye/mMo3hmZhu7tdK
         lswX7Xy/Pyir48Jf886f7XgkTH/qHdEFj7iEK9F4UZzyKRcT2/K6bs5xcWbFIrWu+rJ+
         BQgRuJF1WX9tkXrxiQgY4aU7tCJQ+CIHW2w3qxTJMSAEzzweoiyC7uAdPq7+GD4PH3Pf
         qFktbg0zh2QwCaU6zhxRWNszU1+NlcyAfibQrFlFNXzrfgdIw5TsokqMV8pIzkXP0222
         IMumbOnayHuvIZGhTP63n2nqIuq3mP78sdshkeJVwsOzodrHR20ElBDc/Xg/RvZYPA9B
         aolw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=M27Vob4j;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.78 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130078.outbound.protection.outlook.com. [40.107.13.78])
        by gmr-mx.google.com with ESMTPS id k6si438963eds.3.2020.09.16.01.13.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.78 as permitted sender) client-ip=40.107.13.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvNlpfB262ls69Hu6zG1X1iNR4qwQZHDXm9XGju/J+LXQNjMOVhBsnb+Xy43gCvnljaH20jI5xEkRaV/WoOwCSfjx0Rdw1MdkzppqHo+7j+oC3KnnyscI9Vap0AkV9LXqdcqU1lUlAnbRPJV+OcSfp8333iZB9/bkvZ5AOyaPCVihDgX4zAuFl1a7zur5YNbLfng1MZKlOG3dd7ENF46GSt1S98i81KZ6xfTEjbFzGP1OR29AoKETYDAf5Hb7K58DTPGIHTs6ah0iPlOFXXW3mFcwns2s0781YzDExpFIaXYiG3q5AmiVvmBacF0LG0O6jCKd2ho6LDvTxuYBLZD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiHgu7RH79nCgoV2TF4FiFOh6wvdNdBjKig4TK6b3kE=;
 b=nWi/6IQXdIKxeiyLQoIM+yXydRckb240UQhH4ged3s7jwamTZAWSxWMV+oS/XjdW7aRxZwvn1vYzGjxzoOitMsUI+wBXNM3JVthDk4JVTctH+9gz5WvS1mU7OF0E9cES7Mk0LZQH262rACU+iYO28wBdXaUINv7+NZyZVXYAVNg3+SrJKAcxnDjq2E9GHEu5I6I8wWss3pSAs2jSvLAydUfRb6HrxPkwybIQhv6hY+6yDQrhfX50kwYLgZNikhR6lD/V2+AFXX/k0lYTYMoUF0QRm7+2FjJmARi2L9yRsPogs9TWje1Cmf9Ymsz29DdSzkUldkv8QfEapKBDKRhqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5291.eurprd04.prod.outlook.com (2603:10a6:10:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 08:13:51 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 08:13:51 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 4/5] arm64: support ARM MMU-500
Date: Wed, 16 Sep 2020 16:12:52 +0800
Message-Id: <20200916081253.27536-4-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916081253.27536-1-alice.guo@nxp.com>
References: <20200916081253.27536-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 08:13:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 43feae88-0676-4ed2-9796-08d85a187177
X-MS-TrafficTypeDiagnostic: DB7PR04MB5291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB529110F380ED74316D4DEA3DE2210@DB7PR04MB5291.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tPeY1BOP8XHjarjOMDJ1WAfNgSYGQkkKF0odKVvIVcLXDTj9ZTPiQzp+vt8tqLpaEjTu/M3wYrGShzs8A9WWq3P31i4y4NTlj6tQEb4/noBY09YjyczKKIsH7xxNnhTVpZLFIpHI4uf3bB2XKgpS9Hqmt0OhMYMNXbcWBUHAq7AknCXlVjHfd8kpWyXZzR4+dsk6cKh4GImia/B6jvq+1kJ24xKqON8e38gUFBfb2NV0auiD3VPIzggWX8R46FNIruZvMEyBNXVYNE848J5FmLQ2hH3cceqXFjF68EKhIxqOl8hRcXqqI/Gkm84ijzZLecpxeD5R8kylXKD3QL0ZwLhuuc849x8sJnLfJwUz1gpdGclRbceYSNCxWls7O4jO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(2616005)(44832011)(66556008)(1076003)(66476007)(66946007)(86362001)(6486002)(83380400001)(5660300002)(2906002)(36756003)(6506007)(8676002)(26005)(30864003)(498600001)(6512007)(52116002)(186003)(6666004)(16526019)(8936002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hx6+31OPqwKnyE/STAwsoRM1D8qmh+i56zIzDZRz3a/Cq77kiSRkw6Bbxg4mctklwCx8NZulEOpBbTe/7lV7N7j1igZWl6jOqG7Eqwg2Q2a/C6WsqiLZ5k9SedgcEThPlaUJRWmU6CVDUWZQg+xBzZ90HS3YIpAFUV4HNzS6fQKIVJ8kMiJgUEN8TuZ/Z6tBAiVWRxhB7lSnWE6JZq84oSFCMOFU0hx++sU4ufQNQCnR1QI2K5b369ufXYI5+QpkZEbYdDpM18bTJwWjgXmGyWSYpmD/1Yqj7PaUFjchr1intQgc/AysFrrPzSHmvFBrxllwPUO5CxRn/LnLnONckTak39i7Bf3Cf/EPMoixiD6Tb71gWsRu1JVV2b5RHcPSxXMN+V4v/uK/0n3/6mo6dxbZSjRsHf7RDlyBwCB40kkQTV9JiJCQo6VV1habrXc7vG26drcTpSfsDalX1yCb1qHkRQ+F17X9u3Vy2ovwfCNjdJLdKp9CJi05x3BxgsaXQrsf4IfNBa1koyRrjRt4zBiWKUNPW3NBRuiqbHLx/WFKxKIvADOruNOQObYE9+zy+yJCylcbRRhrar/qlqA0h/ha1mv11ZS5rxdtH3YHdwC61XGKGb84JfE2WVAW7FZrzPypYNh8ULaYdHVivGNIUg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43feae88-0676-4ed2-9796-08d85a187177
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:13:51.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKv1gZ4FZ7gRiuNI4jEO1bmE37e0onle0SufOtfcJGPrQtLhrhjOdW48F7x1b11B5nJ3rY5ssXt92JgOPA+7hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5291
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=M27Vob4j;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.13.78 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Enable SMMU for processors which use MMU-500 to implement the ARM SMMU
architecture v2. It supports stage 2 translation that allows a
hypervisor define the translation tables that translate the IPAs for a
particular guest operating system to PAs.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm64/Kbuild                |    1 +
 hypervisor/arch/arm64/include/asm/sysregs.h |    7 +
 hypervisor/arch/arm64/smmu.c                | 1030 +++++++++++++++++++
 3 files changed, 1038 insertions(+)
 create mode 100644 hypervisor/arch/arm64/smmu.c

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 6773714d..4d328021 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -22,3 +22,4 @@ always-y := lib.a
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y += iommu.o smmu-v3.o ti-pvu.o
+lib-y += smmu.o
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 5acd6d12..32391937 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -182,4 +182,11 @@
 
 #endif /* __ASSEMBLY__ */
 
+/* Context Bank Index */
+#define S2CR_CBNDX(s2cr)		SET_FIELD((s2cr), 7, 0)
+/*  Register type */
+#define S2CR_TYPE(s2cr)			SET_FIELD((s2cr), 17, 16)
+/* Privileged Attribute Configuration */
+#define S2CR_PRIVCFG(s2cr)		SET_FIELD((s2cr), 25, 24)
+
 #endif
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
new file mode 100644
index 00000000..f45d2f62
--- /dev/null
+++ b/hypervisor/arch/arm64/smmu.c
@@ -0,0 +1,1030 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2018-2020 NXP
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Modified from Linux smmu.c
+ */
+
+#include <jailhouse/control.h>
+#include <jailhouse/ivshmem.h>
+#include <jailhouse/mmio.h>
+#include <jailhouse/paging.h>
+#include <jailhouse/pci.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/sizes.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <asm/iommu.h>
+#include <asm/spinlock.h>
+#include <asm/sysregs.h>
+#include <jailhouse/cell-config.h>
+
+#define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
+#define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
+#define ARM_SMMU_FEAT_TRANS_S1		(1 << 2)
+#define ARM_SMMU_FEAT_TRANS_S2		(1 << 3)
+#define ARM_SMMU_FEAT_VMID16		(1 << 6)
+#define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
+#define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
+#define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
+#define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
+#define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
+#define ARM_SMMU_FEAT_EXIDS		(1 << 12)
+#define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
+
+#define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
+#define ARM_LPAE_TCR_TG0_4K		(0 << 14)
+#define ARM_LPAE_TCR_TG0_64K		(1 << 14)
+#define ARM_LPAE_TCR_SH0_SHIFT		12
+#define ARM_LPAE_TCR_SH_IS		3
+#define ARM_LPAE_TCR_ORGN0_SHIFT	10
+#define ARM_LPAE_TCR_IRGN0_SHIFT	8
+#define ARM_LPAE_TCR_RGN_WBWA		1
+#define ARM_LPAE_TCR_RGN_WB		3
+#define ARM_LPAE_TCR_SL0_SHIFT		6
+#define ARM_LPAE_TCR_SL0_LVL_1		1
+#define ARM_LPAE_TCR_T0SZ_SHIFT		0
+#define ARM_LPAE_TCR_PS_SHIFT		16
+#define ARM_LPAE_TCR_PS_32_BIT		0x0ULL
+#define ARM_LPAE_TCR_PS_36_BIT		0x1ULL
+#define ARM_LPAE_TCR_PS_40_BIT		0x2ULL
+#define ARM_LPAE_TCR_PS_42_BIT		0x3ULL
+#define ARM_LPAE_TCR_PS_44_BIT		0x4ULL
+#define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
+#define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
+
+#define TLB_LOOP_TIMEOUT		1000000
+#define TLB_SPIN_COUNT			10
+
+/* SMMU global address space */
+#define ARM_SMMU_GR0(smmu)		((smmu)->base)
+#define ARM_SMMU_GR1(smmu)		((smmu)->base + (1 << (smmu)->pgshift))
+/*
+ * SMMU global address space with conditional offset to access secure
+ * aliases of non-secure registers (e.g. nsCR0: 0x400, nsGFSR: 0x448,
+ * nsGFSYNR0: 0x450)
+ */
+#define ARM_SMMU_GR0_NS(smmu)						\
+	((smmu)->base +							\
+		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
+			? 0x400 : 0))
+/* Translation context bank */
+#define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
+
+/* Configuration Register 0 */
+#define ARM_SMMU_GR0_sCR0		0x0
+#define sCR0_CLIENTPD			(1 << 0)
+#define sCR0_GFRE			(1 << 1)
+#define sCR0_GFIE			(1 << 2)
+#define sCR0_EXIDENABLE			(1 << 3)
+#define sCR0_GCFGFRE			(1 << 4)
+#define sCR0_GCFGFIE			(1 << 5)
+#define sCR0_USFCFG			(1 << 10)
+#define sCR0_VMIDPNE			(1 << 11)
+#define sCR0_PTM			(1 << 12)
+#define sCR0_FB				(1 << 13)
+#define sCR0_VMID16EN			(1 << 31)
+#define sCR0_BSU_SHIFT			14
+#define sCR0_BSU_MASK			0x3
+
+/* Auxiliary Configuration Register */
+#define ARM_SMMU_GR0_sACR		0x10
+#define ARM_MMU500_ACTLR_CPRE		(1 << 1)
+#define ARM_MMU500_ACR_SMTNMB_TLBEN	(1 << 8)
+#define ARM_MMU500_ACR_S2CRB_TLBEN	(1 << 10)
+#define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
+
+/* Identification registers */
+#define ARM_SMMU_GR0_ID0		0x20
+#define ARM_SMMU_GR0_ID1		0x24
+#define ARM_SMMU_GR0_ID2		0x28
+#define ARM_SMMU_GR0_ID7		0x3c
+#define ID0_S1TS			(1 << 30)
+#define ID0_S2TS			(1 << 29)
+#define ID0_NTS				(1 << 28)
+#define ID0_SMS				(1 << 27)
+#define ID0_PTFS_NO_AARCH32		(1 << 25)
+#define ID0_PTFS_NO_AARCH32S		(1 << 24)
+#define ID0_CTTW			(1 << 14)
+#define ID0_NUMSIDB_SHIFT		9
+#define ID0_NUMSIDB_MASK		0xf
+#define ID0_EXIDS			(1 << 8)
+#define ID0_NUMSMRG_SHIFT		0
+#define ID0_NUMSMRG_MASK		0xff
+
+#define ID1_PAGESIZE			(1 << 31)
+#define ID1_NUMPAGENDXB_SHIFT		28
+#define ID1_NUMPAGENDXB_MASK		7
+#define ID1_NUMS2CB_SHIFT		16
+#define ID1_NUMS2CB_MASK		0xff
+#define ID1_NUMCB_SHIFT			0
+#define ID1_NUMCB_MASK			0xff
+
+#define ID2_IAS_SHIFT			0
+#define ID2_IAS_MASK			0xf
+#define ID2_OAS_SHIFT			4
+#define ID2_OAS_MASK			0xf
+#define ID2_UBS_SHIFT			8
+#define ID2_UBS_MASK			0xf
+#define ID2_PTFS_4K			(1 << 12)
+#define ID2_PTFS_16K			(1 << 13)
+#define ID2_PTFS_64K			(1 << 14)
+#define ID2_VMID16			(1 << 15)
+
+#define ID7_MAJOR_SHIFT			4
+#define ID7_MAJOR_MASK			0xf
+
+/* Global Fault Status Register */
+#define ARM_SMMU_GR0_sGFSR		0x48
+
+/* TLB */
+#define ARM_SMMU_GR0_TLBIVMID		0X64
+#define ARM_SMMU_GR0_TLBIALLNSNH	0x68
+#define ARM_SMMU_GR0_TLBIALLH		0x6c
+#define ARM_SMMU_GR0_sTLBGSYNC		0x70
+#define ARM_SMMU_GR0_sTLBGSTATUS	0x74
+#define sTLBGSTATUS_GSACTIVE		(1 << 0)
+
+/* Stream Match Register */
+#define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
+#define SMR_VALID			(1 << 31)
+#define SMR_MASK_SHIFT			16
+#define SMR_ID_SHIFT			0
+
+/* Stream-to-Context Register */
+#define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
+#define S2CR_EXIDVALID			(1 << 10)
+
+/* Context Bank Attribute Registers */
+#define ARM_SMMU_GR1_CBAR(n)		(0x0 + ((n) << 2))
+#define CBAR_VMID_SHIFT			0
+#define CBAR_TYPE_SHIFT			16
+#define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
+#define CBAR_IRPTNDX_SHIFT		24
+
+#define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
+#define CBA2R_RW64_32BIT		(0 << 0)
+#define CBA2R_RW64_64BIT		(1 << 0)
+#define CBA2R_VMID_SHIFT		16
+
+/* Stage 1 translation context bank address space */
+#define ARM_SMMU_CB_SCTLR		0x0
+#define ARM_SMMU_CB_ACTLR		0x4
+#define ARM_SMMU_CB_TTBR0		0x20
+#define ARM_SMMU_CB_TTBR1		0x28
+#define ARM_SMMU_CB_TTBCR		0x30
+#define ARM_SMMU_CB_CONTEXTIDR		0x34
+#define ARM_SMMU_CB_FSR			0x58
+
+#define SCTLR_CFCFG			(1 << 7)
+#define SCTLR_CFIE			(1 << 6)
+#define SCTLR_CFRE			(1 << 5)
+#define SCTLR_AFE			(1 << 2)
+#define SCTLR_TRE			(1 << 1)
+#define SCTLR_M				(1 << 0)
+
+#define FSR_MULTI			(1 << 31)
+#define FSR_SS				(1 << 30)
+#define FSR_UUT				(1 << 8)
+#define FSR_ASF				(1 << 7)
+#define FSR_TLBLKF			(1 << 6)
+#define FSR_TLBMCF			(1 << 5)
+#define FSR_EF				(1 << 4)
+#define FSR_PF				(1 << 3)
+#define FSR_AFF				(1 << 2)
+#define FSR_TF				(1 << 1)
+#define FSR_IGN				(FSR_AFF | FSR_ASF | \
+					 FSR_TLBMCF | FSR_TLBLKF)
+#define FSR_FAULT			(FSR_MULTI | FSR_SS | FSR_UUT | \
+					 FSR_EF | FSR_PF | FSR_TF | FSR_IGN)
+
+enum arm_smmu_s2cr_type {
+	S2CR_TYPE_TRANS,
+	S2CR_TYPE_BYPASS,
+	S2CR_TYPE_FAULT,
+};
+
+#define s2cr_init_val (struct arm_smmu_s2cr){	\
+	.type = S2CR_TYPE_BYPASS,		\
+}
+
+enum arm_smmu_s2cr_privcfg {
+	S2CR_PRIVCFG_DEFAULT,
+	S2CR_PRIVCFG_DIPAN,
+	S2CR_PRIVCFG_UNPRIV,
+	S2CR_PRIVCFG_PRIV,
+};
+
+struct arm_smmu_s2cr {
+	enum arm_smmu_s2cr_type		type;
+	enum arm_smmu_s2cr_privcfg	privcfg;
+	u8				cbndx;
+};
+
+struct arm_smmu_smr {
+	u16				mask;
+	u16				id;
+	bool				valid;
+};
+
+enum arm_smmu_context_fmt {
+	ARM_SMMU_CTX_FMT_NONE,
+	ARM_SMMU_CTX_FMT_AARCH64,
+	ARM_SMMU_CTX_FMT_AARCH32_L,
+	ARM_SMMU_CTX_FMT_AARCH32_S,
+};
+
+struct arm_smmu_cfg {
+	u8				cbndx;
+	u8				irptndx;
+	union {
+		u16			asid;
+		u16			vmid;
+	};
+	u32				cbar;
+	enum arm_smmu_context_fmt	fmt;
+};
+struct arm_smmu_cb {
+	u64				ttbr[2];
+	u32				tcr[2];
+	u32				mair[2];
+	struct arm_smmu_cfg		*cfg;
+};
+
+struct arm_smmu_device {
+	void	*base;
+	void	*cb_base;
+	u32	num_masters;
+	unsigned long			pgshift;
+	u32				features;
+	u32				options;
+	u32				num_context_banks;
+	u32				num_s2_context_banks;
+	struct arm_smmu_cb		*cbs;
+	u32				num_mapping_groups;
+	u16				streamid_mask;
+	u16				arm_sid_mask;
+	u16				smr_mask_mask;
+	struct arm_smmu_smr		*smrs;
+	struct arm_smmu_s2cr		*s2crs;
+	struct arm_smmu_cfg		*cfgs;
+	unsigned long			va_size;
+	unsigned long			ipa_size;
+	unsigned long			pa_size;
+	unsigned long			pgsize_bitmap;
+	u32				num_global_irqs;
+	u32				num_context_irqs;
+	unsigned int			*irqs;
+} smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
+
+static unsigned long pgsize_bitmap = -1;
+
+static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_smr *smr = smmu->smrs + idx;
+	u32 reg = smr->id << SMR_ID_SHIFT | smr->mask << SMR_MASK_SHIFT;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_EXIDS) && smr->valid)
+		reg |= SMR_VALID;
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_SMR(idx), reg);
+}
+
+static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
+{
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
+	u32 reg = S2CR_TYPE(s2cr->type) | S2CR_CBNDX(s2cr->cbndx) |
+		  S2CR_PRIVCFG(s2cr->privcfg);
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
+	    smmu->smrs[idx].valid)
+		reg |= S2CR_EXIDVALID;
+	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_S2CR(idx), reg);
+}
+
+static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
+{
+	if (smmu->smrs)
+		arm_smmu_write_smr(smmu, idx);
+
+	arm_smmu_write_s2cr(smmu, idx);
+}
+
+/* Wait for any pending TLB invalidations to complete */
+static int __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
+				void *sync, void *status)
+{
+	unsigned int spin_cnt, delay, i;
+
+	mmio_write32(sync, 0);
+	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
+		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
+			if (!(mmio_read32(status) & sTLBGSTATUS_GSACTIVE))
+				return 0;
+			cpu_relax();
+		}
+		for (i = 0; i < 10 * 1000000; i++);
+	}
+	printk("TLB sync timed out -- SMMU may be deadlocked\n");
+
+	return trace_error(-EINVAL);
+}
+
+static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
+{
+	int ret;
+	void *base = ARM_SMMU_GR0(smmu);
+
+	ret = __arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
+			    base + ARM_SMMU_GR0_sTLBGSTATUS);
+
+	return ret;
+}
+
+static void arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
+				       struct arm_smmu_cfg *cfg,
+				       struct cell *cell)
+{
+	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
+	struct paging_structures *pg_structs;
+	unsigned long cell_table;
+	u32 reg;
+
+	cb->cfg = cfg;
+
+	/* VTCR */
+	reg = ARM_64_LPAE_S2_TCR_RES1 |
+	     (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
+	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
+	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
+
+	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
+
+	switch (PAGE_SIZE) {
+	case SZ_4K:
+		reg |= ARM_LPAE_TCR_TG0_4K;
+		break;
+	case SZ_64K:
+		reg |= ARM_LPAE_TCR_TG0_64K;
+		break;
+	}
+
+	switch (smmu->pa_size) {
+	case 32:
+		reg |= (ARM_LPAE_TCR_PS_32_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 36:
+		reg |= (ARM_LPAE_TCR_PS_36_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 40:
+		reg |= (ARM_LPAE_TCR_PS_40_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 42:
+		reg |= (ARM_LPAE_TCR_PS_42_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 44:
+		reg |= (ARM_LPAE_TCR_PS_44_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 48:
+		reg |= (ARM_LPAE_TCR_PS_48_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	case 52:
+		reg |= (ARM_LPAE_TCR_PS_52_BIT << ARM_LPAE_TCR_PS_SHIFT);
+		break;
+	default:
+		printk("Not supported\n");
+		break;
+		/* TODO */
+		//goto out_free_data;
+	}
+
+	reg |= (64ULL - smmu->ipa_size) << ARM_LPAE_TCR_T0SZ_SHIFT;
+
+	cb->tcr[0] = reg;
+
+	pg_structs = &cell->arch.mm;
+	cell_table = paging_hvirt2phys(pg_structs->root_table);
+	u64 vttbr = 0;
+
+	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
+	vttbr |= (u64)(cell_table & TTBR_MASK);
+	cb->ttbr[0] = vttbr;
+}
+
+static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
+{
+	void *cb_base, *gr1_base;
+	struct arm_smmu_cb *cb = &smmu->cbs[idx];
+	struct arm_smmu_cfg *cfg = cb->cfg;
+	u32 reg;
+
+	cb_base = ARM_SMMU_CB(smmu, idx);
+
+	/* Unassigned context banks only need disabling */
+	if (!cfg) {
+		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
+		return;
+	}
+
+	gr1_base = ARM_SMMU_GR1(smmu);
+
+	/* CBA2R */
+	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
+		reg = CBA2R_RW64_64BIT;
+	else
+		reg = CBA2R_RW64_32BIT;
+	/* 16-bit VMIDs live in CBA2R */
+	if (smmu->features & ARM_SMMU_FEAT_VMID16)
+		reg |= cfg->vmid << CBA2R_VMID_SHIFT;
+
+	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
+
+	/* CBAR */
+	reg = cfg->cbar;
+
+	/*
+	 * Use the weakest shareability/memory types, so they are
+	 * overridden by the ttbcr/pte.
+	 */
+	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
+		/* 8-bit VMIDs live in CBAR */
+		reg |= cfg->vmid << CBAR_VMID_SHIFT;
+	}
+	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
+
+	/*
+	 * TTBCR
+	 * We must write this before the TTBRs, since it determines the
+	 * access behaviour of some fields (in particular, ASID[15:8]).
+	 */
+	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
+
+	/* TTBRs */
+	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
+		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
+		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
+	} else {
+		mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
+	}
+
+	/* SCTLR */
+	reg = SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
+		SCTLR_M;
+
+	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg);
+}
+
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	int i, ret;
+	u32 reg, major;
+
+	/* Clear global FSR */
+	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR);
+	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sGFSR, reg);
+
+	/*
+	 * Reset stream mapping groups: Initial values mark all SMRn as
+	 * invalid and all S2CRn as bypass unless overridden.
+	 */
+	for (i = 0; i < smmu->num_mapping_groups; ++i)
+		arm_smmu_write_sme(smmu, i);
+
+	/*
+	 * Before clearing ARM_MMU500_ACTLR_CPRE, need to
+	 * clear CACHE_LOCK bit of ACR first. And, CACHE_LOCK
+	 * bit is only present in MMU-500r2 onwards.
+	 */
+	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
+	major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
+	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
+	if (major >= 2)
+		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
+	/*
+	 * Allow unmatched Stream IDs to allocate bypass
+	 * TLB entries for reduced latency.
+	 */
+	reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_sACR, reg);
+
+	/* Make sure all context banks are disabled and clear CB_FSR */
+	for (i = 0; i < smmu->num_context_banks; ++i) {
+		void *cb_base = ARM_SMMU_CB(smmu, i);
+
+		arm_smmu_write_context_bank(smmu, i);
+		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
+		/*
+		 * Disable MMU-500's not-particularly-beneficial next-page
+		 * prefetcher for the sake of errata #841119 and #826419.
+		 */
+		reg = mmio_read32(cb_base + ARM_SMMU_CB_ACTLR);
+		reg &= ~ARM_MMU500_ACTLR_CPRE;
+		mmio_write32(cb_base + ARM_SMMU_CB_ACTLR, reg);
+	}
+
+	/* Invalidate the TLB, just in case */
+	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
+	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
+
+	reg = mmio_read32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
+
+	/* Enable fault reporting */
+	reg |= (sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE);
+
+	/* Disable TLB broadcasting. */
+	reg |= (sCR0_VMIDPNE | sCR0_PTM);
+
+	/* Enable client access, handling unmatched streams as appropriate */
+	reg &= ~sCR0_CLIENTPD;
+	reg &= ~sCR0_USFCFG;
+
+	/* Disable forced broadcasting */
+	reg &= ~sCR0_FB;
+
+	/* Don't upgrade barriers */
+	reg &= ~(sCR0_BSU_MASK << sCR0_BSU_SHIFT);
+
+	if (smmu->features & ARM_SMMU_FEAT_VMID16)
+		reg |= sCR0_VMID16EN;
+
+	if (smmu->features & ARM_SMMU_FEAT_EXIDS)
+		reg |= sCR0_EXIDENABLE;
+
+	/* Push the button */
+	ret = arm_smmu_tlb_sync_global(smmu);
+	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
+
+	return ret;
+}
+
+static int arm_smmu_id_size_to_bits(int size)
+{
+	switch (size) {
+	case 0:
+		return 32;
+	case 1:
+		return 36;
+	case 2:
+		return 40;
+	case 3:
+		return 42;
+	case 4:
+		return 44;
+	case 5:
+	default:
+		return 48;
+	}
+}
+
+static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 id;
+	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
+	unsigned long size;
+	int i;
+
+	printk("probing hardware configuration...\n");
+	printk("ARM MMU500 with:\n");
+
+	/* ID0 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
+
+	/* Only stage 2 translation is supported */
+	id &= ~(ID0_S1TS | ID0_NTS);
+
+	if (id & ID0_S2TS) {
+		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
+		printk("\tStage 2 translation\n");
+	}
+
+	if (!(smmu->features &
+		(ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
+		printk("\tNo translation support!\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * In order for DMA API calls to work properly, we must defer to what
+	 * the FW says about coherency, regardless of what the hardware claims.
+	 * Fortunately, this also opens up a workaround for systems where the
+	 * ID register value has ended up configured incorrectly.
+	 */
+	cttw_reg = !!(id & ID0_CTTW);
+	if (cttw_fw || cttw_reg)
+		printk("\t%scoherent translation table walks\n", cttw_fw ? "" : "non-");
+	if (cttw_fw != cttw_reg)
+		printk("\t(IDR0.CTTW is overridden by FW configuration)\n");
+
+	/* Max number of entries we have for stream matching/indexing */
+	if (id & ID0_EXIDS) {
+		smmu->features |= ARM_SMMU_FEAT_EXIDS;
+		size = 1 << 16;
+	} else {
+		size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
+	}
+	smmu->streamid_mask = size - 1;
+
+	if (id & ID0_SMS) {
+		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
+
+		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
+		if (size == 0) {
+			printk("Stream matching is supported, but no SMRs present!\n");
+			return -ENODEV;
+		}
+
+		/* Zero-initialised to mark as invalid */
+		smmu->smrs = page_alloc(&mem_pool, PAGES(size * sizeof(*smmu->smrs)));
+		if (!smmu->smrs)
+			return -ENOMEM;
+		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
+
+		printk("\tstream matching with %lu SMR groups", size);
+	}
+
+	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs)
+				 + sizeof(*smmu->cfgs))));
+	if (!smmu->s2crs) {
+		page_free(&mem_pool, smmu->smrs, PAGES(size * sizeof(*smmu->smrs)));
+		return -ENOMEM;
+	}
+
+	smmu->cfgs = (struct arm_smmu_cfg *)(smmu->s2crs + size);
+
+	/* Configure to Bypass mode */
+	for (i = 0; i < size; i++)
+		smmu->s2crs[i] = s2cr_init_val;
+
+	smmu->num_mapping_groups = size;
+
+	if (!(id & ID0_PTFS_NO_AARCH32)) {
+		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_L;
+		if (!(id & ID0_PTFS_NO_AARCH32S))
+			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_S;
+	}
+
+	/* ID1 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
+	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
+
+	/* Check for size mismatch of SMMU address space from mapped region */
+	size = 1 << (((id >> ID1_NUMPAGENDXB_SHIFT) & ID1_NUMPAGENDXB_MASK) + 1);
+	size <<= smmu->pgshift;
+	if (smmu->cb_base != gr0_base + size)
+		printk("SMMU address space size (0x%lx) differs from mapped region size (0x%tx)!\n",
+		       size * 2, (smmu->cb_base - gr0_base) * 2);
+
+	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
+	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
+	if (smmu->num_s2_context_banks > smmu->num_context_banks) {
+		printk("Impossible number of S2 context banks!\n");
+		return -ENODEV;
+	}
+	/* TODO Check More */
+	smmu->num_context_irqs = smmu->num_context_banks;
+
+	printk("\t%u context banks (%u Stage 2 only)\n",
+	       smmu->num_context_banks, smmu->num_s2_context_banks);
+
+	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks
+			       * sizeof(*smmu->cbs)));
+	if (!smmu->cbs) {
+		/* TODO: Free smrs s2cr */
+		return -ENOMEM;
+	}
+
+	/* ID2 */
+	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
+	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
+	smmu->ipa_size = MIN(size, get_cpu_parange());
+
+	/* The output mask is also applied for bypass */
+	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
+	smmu->pa_size = size;
+
+	if (id & ID2_VMID16)
+		smmu->features |= ARM_SMMU_FEAT_VMID16;
+
+	/*
+	 * What the page table walker can address actually depends on which
+	 * descriptor format is in use, but since a) we don't know that yet,
+	 * and b) it can vary per context bank, this will have to do...
+	 * TODO: DMA?
+	 */
+
+	size = (id >> ID2_UBS_SHIFT) & ID2_UBS_MASK;
+	smmu->va_size = arm_smmu_id_size_to_bits(size);
+	if (id & ID2_PTFS_4K)
+		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
+	if (id & ID2_PTFS_16K)
+		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_16K;
+	if (id & ID2_PTFS_64K)
+		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
+
+	/* Now we've corralled the various formats, what'll it do? */
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
+		smmu->pgsize_bitmap |= SZ_4K | SZ_64K | SZ_1M | SZ_16M;
+	if (smmu->features &
+	    (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
+		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
+		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
+	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
+		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
+
+	if (pgsize_bitmap == -1UL)
+		pgsize_bitmap = smmu->pgsize_bitmap;
+	else
+		pgsize_bitmap |= smmu->pgsize_bitmap;
+	printk("\tsupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
+
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S1)
+		printk("\tStage-1: %lu-bit VA -> %lu-bit IPA\n",
+		       smmu->va_size, smmu->ipa_size);
+
+	if (smmu->features & ARM_SMMU_FEAT_TRANS_S2)
+		printk("\tStage-2: %lu-bit IPA -> %lu-bit PA\n",
+		       smmu->ipa_size, smmu->pa_size);
+
+	return 0;
+}
+
+static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
+{
+	void *gr0_base = ARM_SMMU_GR0(smmu);
+	u32 smr;
+
+	if (!smmu->smrs)
+		return;
+
+	/*
+	 * SMR.ID bits may not be preserved if the corresponding MASK
+	 * bits are set, so check each one separately. We can reject
+	 * masters later if they try to claim IDs outside these masks.
+	 */
+	smr = smmu->streamid_mask << SMR_ID_SHIFT;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
+	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
+	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
+
+	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
+	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
+	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
+	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
+}
+
+static int arm_smmu_find_sme(u16 id, u16 mask, int n)
+{
+	struct arm_smmu_device *smmu = &smmu_device[n];
+	struct arm_smmu_smr *smrs = smmu->smrs;
+	int i, free_idx = -EINVAL;
+
+	/* Stream indexing is blissfully easy */
+	if (!smrs)
+		return id;
+
+	/* Validating SMRs is... less so */
+	for (i = 0; i < smmu->num_mapping_groups; ++i) {
+		if (!smrs[i].valid) {
+			/*
+			 * Note the first free entry we come across, which
+			 * we'll claim in the end if nothing else matches.
+			 */
+			if (free_idx < 0)
+				free_idx = i;
+			continue;
+		}
+		/*
+		 * If the new entry is _entirely_ matched by an existing entry,
+		 * then reuse that, with the guarantee that there also cannot
+		 * be any subsequent conflicting entries. In normal use we'd
+		 * expect simply identical entries for this case, but there's
+		 * no harm in accommodating the generalisation.
+		 */
+		if ((mask & smrs[i].mask) == mask &&
+		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
+			return i;
+		}
+		/*
+		 * If the new entry has any other overlap with an existing one,
+		 * though, then there always exists at least one stream ID
+		 * which would cause a conflict, and we can't allow that risk.
+		 */
+		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
+			return -EINVAL;
+	}
+
+	return free_idx;
+}
+
+static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
+{
+	smmu->s2crs[idx] = s2cr_init_val;
+	if (smmu->smrs) {
+		smmu->smrs[idx].id = 0;
+		smmu->smrs[idx].mask = 0;
+		smmu->smrs[idx].valid = false;
+	}
+
+	return true;
+}
+
+#define for_each_smmu_sid(sid, config, counter)				\
+	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
+	     (counter) < (config)->num_stream_ids;			\
+	     (sid)++, (counter)++)
+
+static int arm_smmu_cell_init(struct cell *cell)
+{
+	struct jailhouse_iommu *iommu;
+	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
+	struct arm_smmu_s2cr *s2cr;
+	struct arm_smmu_cfg *cfg;
+	struct arm_smmu_smr *smr;
+	const __u32 *sid;
+	unsigned int n;
+	int ret, idx, i;
+
+	if (!iommu_count_units())
+		return 0;
+
+	/* If no sids, ignore */
+	if (!cell->config->num_stream_ids)
+		return 0;
+
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
+			continue;
+
+		s2cr = smmu_device[i].s2crs;
+		cfg = &smmu_device[i].cfgs[cell->config->id];
+
+		if (smmu_device[i].features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
+					       ARM_SMMU_FEAT_FMT_AARCH64_16K |
+					       ARM_SMMU_FEAT_FMT_AARCH64_4K))
+			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
+
+		cfg->cbar = CBAR_TYPE_S2_TRANS;
+
+		/* We use cell->config->id here, one cell use one context */
+		cfg->cbndx = cell->config->id;
+		cfg->irptndx = cfg->cbndx;
+		cfg->vmid = cfg->cbndx + 1;
+
+		arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
+		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
+
+		smr = smmu_device[i].smrs;
+
+		for_each_smmu_sid(sid, cell->config, n) {
+			ret = arm_smmu_find_sme(*sid,
+						smmu_device[i].arm_sid_mask, i);
+			if (ret < 0)
+				printk("arm_smmu_find_sme error %d\n", ret);
+			idx = ret;
+
+			if (type == s2cr[idx].type &&
+			    cfg->cbndx == s2cr[idx].cbndx)
+				printk("%s error\n", __func__);
+
+			s2cr[idx].type = type;
+			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
+			s2cr[idx].cbndx = cfg->cbndx;
+
+			arm_smmu_write_s2cr(&smmu_device[i], idx);
+
+			smr[idx].id = *sid;
+			smr[idx].mask = smmu_device[i].arm_sid_mask;
+			smr[idx].valid = true;
+
+			arm_smmu_write_smr(&smmu_device[i], idx);
+		}
+
+		printk("Found %d masters\n", n);
+
+		mmio_write32(ARM_SMMU_GR0(&smmu_device[i])
+			     + ARM_SMMU_GR0_TLBIVMID, cfg->vmid);
+		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
+		if (ret < 0) {
+			printk("TLB maintenance operations globally across the SMMU failed!\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void arm_smmu_cell_exit(struct cell *cell)
+{
+	const __u32 *sid;
+	unsigned int n;
+	int ret, idx, i;
+	int cbndx = cell->config->id;
+	struct jailhouse_iommu *iommu;
+
+	if (!iommu_count_units())
+		return;
+
+	/* If no sids, ignore */
+	if (!cell->config->num_stream_ids)
+		return;
+
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, i++) {
+		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
+			continue;
+
+		for_each_smmu_sid(sid, cell->config, n) {
+			ret = arm_smmu_find_sme(*sid,
+						smmu_device[i].arm_sid_mask, i);
+			if (ret < 0)
+				printk("arm_smmu_find_sme error %d\n", ret);
+			idx = ret;
+
+			if (arm_smmu_free_sme(&smmu_device[i], idx))
+				arm_smmu_write_sme(&smmu_device[i], idx);
+
+			smmu_device[i].cbs[cbndx].cfg = NULL;
+			arm_smmu_write_context_bank(&smmu_device[i], cbndx);
+		}
+
+		mmio_write32(ARM_SMMU_GR0(&smmu_device[i]) + ARM_SMMU_GR0_TLBIVMID,
+					  smmu_device[i].cbs[cbndx].cfg->vmid);
+		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
+		if (ret < 0)
+			printk("TLB maintenance operations globally across the SMMU failed!\n");
+	}
+}
+
+static int arm_smmu_init(void)
+{
+	struct jailhouse_iommu *iommu;
+	int err, i, num = 0;
+
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
+			continue;
+
+		if (iommu->base) {
+			num++;
+
+			smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
+			smmu_device[i].arm_sid_mask = iommu->arm_sid_mask;
+
+			smmu_device[i].base = paging_map_device(iommu->base,
+								iommu->size);
+			if (!smmu_device[i].base)
+				return -ENOMEM;
+
+			smmu_device[i].cb_base = smmu_device[i].base +
+						 iommu->size / 2;
+
+			err = arm_smmu_device_cfg_probe(&smmu_device[i]);
+			if (err)
+				return err;
+
+			if (smmu_device[i].num_context_banks !=
+			    smmu_device[i].num_context_irqs) {
+				printk("found only %d context interrupt(s) but %d required\n",
+				       smmu_device[i].num_context_irqs,
+				       smmu_device[i].num_context_banks);
+				/* TODO: page free smr s2cr cbs */
+				return -ENODEV;
+			}
+
+			/* TODO: request irq */
+
+			err = arm_smmu_device_reset(&smmu_device[i]);
+			if (err)
+				return err;
+
+			arm_smmu_test_smr_masks(&smmu_device[i]);
+		}
+	}
+
+	if (num == 0) {
+		printk("No MMU-500 device found!\n");
+		return 0;
+	}
+
+	/*
+	 * For ACPI and generic DT bindings, an SMMU will be probed before
+	 * any device which might need it, so we want the bus ops in place
+	 * ready to handle default domain setup as soon as any SMMU exists.
+	 */
+	/* TODO: How handle PCI iommu? */
+
+	return arm_smmu_cell_init(&root_cell);
+}
+
+DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
+DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
+DEFINE_UNIT(arm_smmu, "ARM SMMU");
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200916081253.27536-4-alice.guo%40nxp.com.
