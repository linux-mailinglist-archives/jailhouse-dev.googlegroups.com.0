Return-Path: <jailhouse-dev+bncBDEN32754MOBBIX63H4QKGQERLAGY2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7CC24496D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 14:10:11 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id f7sf3297664wrs.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 05:10:11 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597407010; cv=pass;
        d=google.com; s=arc-20160816;
        b=uQF49RYo2WtO5rMevFmJZfsYYowwnc65p35aliedve5h9kxSZh9XWWZskGa6igW0nT
         i/XSM0eYbRUgUldNycmBXmZsap87A/7LXGQl7vQfXapmvbVi8WD1K/gDfXwkXqstXbki
         XQ9XR58mCSfQHK1RGxn3HJ8x3QzvZNFaHwCNwo41VRwLOSFf5+kPOEiP0G33/aKS2cl+
         cMYyVve/kSsYpVUHpPOQj0GIRhJevcfrEtIvO41vM6Y4eJYa0AHves8PM5BvqfOJK6wD
         bowlxDNpTQauPBmeUZ1Q0U7hP9slaLKBVDSzvbsI1UYFTdwC4isNhWJChvO5vMycre3Z
         T5Aw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=NQoY6PFP/AF7lW7sMSfbrCXNHh1B74psQF+1Gn1CfVg=;
        b=GQT1bBftUIvG3VBZvG2qvDMFrqEUe/KtMxLN6OnP01B60/ugq17E+iVvNMozL0c+f+
         a/zAxEdjK3A2HSMp6WrpjbCjeiSpKtUCsptbJYfnv0HofQ3BCKoZEPqxn3D8U+EJg553
         +raBUrqjNt1iszaKTkFjljO/LbiT+4+CwDdHdHDFBRHVaqsFy6gqL3PCydWqsZNQ8HXU
         FwAvLb6MBHR9W1FwpOzA/QC70jkobeNbARcsj8C3Jz7CNBwsWnLYNuJWbeWpwCWqdqEJ
         41w4riFvL5eBz3H2OzAetCBGXlpp64EE8AEZ9UoFxMnMQNCgYSR5vwqlWYlTqie9iUcN
         XlKg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dtKm5m42;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.85 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NQoY6PFP/AF7lW7sMSfbrCXNHh1B74psQF+1Gn1CfVg=;
        b=M9xJlcd0c9zKdA/EelvH6zYiMNIDUig7HEp4DkWrpIZ7oZw2RHbQTypHKjLZiXv5cv
         LEI+BmQrPu016dqddyqPgyWFlkAVTSkTZVVVsFlKAzuYPbnIIuI28SHSIf3o/hYdQIeF
         vhaTN7oO7b/4Axpg0RpLQNamMAAM2GV429e83otJDvE8j3UtVU7jkH2UDQRxVCFO8qry
         T+3wxR08KLXMNqd15/5KzJlzIYcI361N0NGt50Geu0DYcScHmATYGBi4P3i/NswG/UlP
         4DsaeSiIZSgGoOVoAc9bcxI47Z3IXQ1UIoQe/BSOnYVcKeRT+bgEqHKRHNSjpbQixCL3
         RalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NQoY6PFP/AF7lW7sMSfbrCXNHh1B74psQF+1Gn1CfVg=;
        b=mJb+Qn0T+4jF7fZE8c8pEpsBv8l0dDK+yU8oDCXNY+xrDqPSD48rXpNUy0Pr+Bcxyc
         MqZFlAgbppxAcEnV3kGqh3NitaJOKwKEFvhD3nQW1mTlAaAUE8/x7hsADxyJanaE/+Ps
         ZbM9EqvfBjwVaTtShhJVAFGND1AF4ZcpMI+ve56walK8wg6Ltn70dXuvb5Ux1TSHDz9Z
         bgYwsQCpdwI5Qub4pxLgntDCvn7V44WpeBMPduXBVYXqLbZ7SijeUPnUIKef3ueZU4Q0
         z8Y50M7McKa/AiWmCtcpCsj20XUvE/SGUaQr37ctgi4T8yqMEMJFY+ZAOJzTTu0uXP47
         gUIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531V5zYCGFunRmyFhTLunHErgj3nP/oLZwA20/xNrNDuotaiTz1A
	KVsi3sTCUcQ20R7sENNmkic=
X-Google-Smtp-Source: ABdhPJwtPmmBOUIAETAhLoyva2QH5likxXN16aMIczW/rsC6nZOqGVYzJtgOsjVKpW4GOgdIBaVkJQ==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr2396323wmb.41.1597407010771;
        Fri, 14 Aug 2020 05:10:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:b1cf:: with SMTP id r15ls4711225wra.3.gmail; Fri, 14 Aug
 2020 05:10:09 -0700 (PDT)
X-Received: by 2002:adf:f045:: with SMTP id t5mr2617388wro.288.1597407009165;
        Fri, 14 Aug 2020 05:10:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597407009; cv=pass;
        d=google.com; s=arc-20160816;
        b=rjLHUXxB+YbQCpwSEXANOkSJno3x7NFc4s+MNc2OlrEJxScu+bCODohxSLr0wuuSQQ
         3myw6oeoBjMv9+nMSqjctv3muehy9QLYqP+tCiTrRqWvyIm2zXZlagyggH/q9+MPAkVV
         4mJLY8gHNJSXZNAJnrrfJENZWpo1RSh0y2LI88ZtcFaPZaC5lAD6o/J6rXDjAt2CUKz3
         H1oNZcP2Mk+xF0KMLf4htdyZNl0ivOUNR6PuDfVVic+XjYxhoDa/OyezBswhh0NfmrxE
         8G2q47lm1PvRFAROB/Y42Lk92nvmlp45sXIx3tz0jY2bBRox+tC5pljjqdNt8BP2JOPL
         hLlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BzCGBVDZOpD9YNHYrz9KUg/11AP2wzLQFdMq5tnDgnk=;
        b=s6FhkRYNQem0PCboVQqEe6wTkDNsgXZzpfGkm/R7HfZ1bO3yqJhO2ITSnuManvZ0ug
         7+88aYuW8Crq8pk8f/vCbhY7YRCOCT9jkdjktWsw3tWQRaN0q22+Xtmk+vVEuxaEpcyC
         o+tjxFdiMaRC6df4TawVDJfchz4d0YU9mWbBFayZHJQMntKovfxsoQys7XW23DxsBnKA
         vk958GKhZeGsKGTVN09GaLsjTqX7Crsy8PgDNzeajCEE5Tewz0mo6iyDwoEPwx+fdCwK
         o7+QXuPyvkqFhNrGoXJAl57iZYGudKRM9tm6WX/LMLDLtzbdgTeYyMMiAZCoOsD/s1c5
         ogoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dtKm5m42;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.85 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50085.outbound.protection.outlook.com. [40.107.5.85])
        by gmr-mx.google.com with ESMTPS id m3si468633wme.0.2020.08.14.05.10.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 05:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.85 as permitted sender) client-ip=40.107.5.85;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpEZqen1YsAwrbp9Pc48uHQHrRX/Djyqr25G+L0zCUlT38gXLjJqqj6PY4KJZoPPQbclpPaGmtIPKBQ8ryxjH6ROFrKohD66c8HmU5PJzQCUrDA5sSiyYIKQpdkL9k5bmR6mE+AxGd4bTFGNH0YrRi3NgZJBuZ7rPlFVsOUzyKdws1BpRHy8YG9XodYa+1n2sqVlOgZgnZRk3MTlXbwOV/hXklzuY2A8S3VMtqD0t/Pa30S1G55Y8ERblhBf5RZX3AojNqNNDjNf3zKXcouSy9GNcjlLuoclxrCQ3ZyxIDu1X7/EhxafHREg4/G6mn/cjcIO3md4bbrM9eIs6CyFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzCGBVDZOpD9YNHYrz9KUg/11AP2wzLQFdMq5tnDgnk=;
 b=Y29A6hF2BTknS4W98uMma7V/7FLWZtxTTAXU2vu1o1IthvTOySanJ4H6lRA2sLF9YdUdg31luzuE6Ud/7vPVPreT6THf02Bbn8MwrzAcadTBujJpFg8Ndx3yCIB98L91CXZpucO/8YdVI5R3ZdAFRAmKk+1vdhCxhUWVfRWAD+AT42SKRo453YNBJGotyfnDgApgYjEEfzl3oNq4fK0fVAoT1ljJBefYT0iYEeDPxSwieKzhaI8uDMH9ACsD5KHod8zdRU57feA98MZtoG3m6bWfrfH8njDMdYpkKztYsRG/9AGp5kPPUpe4jRtXrdmPtZVzRy52HEt3EgMGXdNaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4730.eurprd04.prod.outlook.com (2603:10a6:10:1c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 14 Aug
 2020 12:10:07 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.018; Fri, 14 Aug 2020
 12:10:07 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
Date: Sun, 16 Aug 2020 03:09:46 +0800
Message-Id: <20200815190949.6837-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::14) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM0PR08CA0001.eurprd08.prod.outlook.com (2603:10a6:208:d2::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Fri, 14 Aug 2020 12:10:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f672fb5b-fcb4-4061-6a6c-08d8404afba1
X-MS-TrafficTypeDiagnostic: DB7PR04MB4730:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB473085D2C5D2034E475AC4A8E2400@DB7PR04MB4730.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CeJphzYF/K1bin14vO8+Ih5rbSKpCYHoT4InuOJ8i7JQjss9KuYDYX+tZHhgrDR2zTffIQUavwvUEEYbAAOZp8k8Mkz0fpk1lB4HS/DxlZbi/ggbCCpca1zcOc7aj1/4/aRZCgX66qUT+Bun9ZouWCzhEOxH3YRXhpsQdjizc2zaaKi2tg6twOceNGHxMpGrtzt79xChCJb4/TFfjK4R0WLXqqs5ciJiB4ZWGmegkb9dgrhRdXXu4Rq/jkH1WGpKndglrdfMqiYBRzyGNE9Y41jP1d3MZNLVfjWFmVPTgQTqmGw832hqijCWLk5ccpeZop4Fd2Co1IPwOfU/c48dpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(8936002)(6506007)(2906002)(6486002)(83380400001)(16526019)(26005)(186003)(66946007)(44832011)(6512007)(52116002)(8676002)(478600001)(1076003)(5660300002)(66556008)(36756003)(6666004)(4326008)(86362001)(316002)(2616005)(956004)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2yIBCO8QYUj0lS12tthiwtKNavqFv3s/W45x0kQoCXptWKgvN32xWB32IwW/GAFgVyBohOq60Apd/Ke7fKtQOwaDUeqxtXa/nuz+2zFGPwQoyNRu9knkmJ+Ks2vWjv0EIGMsc2Eq+DFRlRwlcncOpRe7JMfMA+0igLGIMNpwn+N6i1e2IahT5II4MB4qistMCctRLWRcUzAl/jti/nB32SSlCCIpOS4AS7TDyyX8OHQLo5mmNnqfNVWarEVs4O2XZ3cEgWra4oJx/O1N9+5/OR9YhlkcWuogH6HpK8Ny/DFBbJkz0GAEAp4PtfTA2htSw0+VxKBjpNlQgDog6YNHx2Pfq9p6h4BSgU78/4cAn83GIQ0Dl0ZMS9wTWjhqpkiXQhTABQxRe/FI4asUqVl2dJ+kj8eK61K3QvcG7t1mVxDr8Pacs98KGBptTloJ6LhKXp8JWQWF0AI1oooDtioc+wk2BlJvX7gLCY3gR2rNWGsPvPBWymoikldCYgciyQBQciKN60l9YYjgRqnCgZ0lvBV4Ocm7ILLKKOSBXyL9PBJCrC7K0u5PVEB9xQ+T8LR7OMkTKK08d6VyUNcC/LqjfFT1BYQJyiEfC4P+lM183ibzg93XM4Yv3MeU5ZUxMiky+In8s72WbwTJvt35nCfV6w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f672fb5b-fcb4-4061-6a6c-08d8404afba1
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 12:10:07.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgcdKxh9tMGG1go2HXTJ2CGHPofkaCjGDFXOQZ30uPhSVmqr13HguGfNLiXU/butfQdptaZxF2KsgUwinDxbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4730
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=dtKm5m42;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.5.85 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
at the same time. If the inmate cell wants to run in AArch32 mode, the
assigned cpu must change to AArch32. Because AArch64 hypervisor and
AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
the cpu back to AArch64.

The following is a summary of some of the points when supporting inmate
cell in AArch32 mode:
Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
state. Add this macro to flags of struct jailhouse_cell_desc, and you can
use it to indicate whether a cell is AArch32.

AArch32 and AArch64 virtual machines use different ARM_PARKING_CODE.
0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by
AArch32 in arm64/include/asm/processor.h, and then select which one to
use by arm_cpu_reset().

When an exception occurs, the processor must execute handler code which
corresponds to the exception. When the exception is being taken at a
lower Exception level, the execution state of the next lower level
(AArch64 or AArch32) will be used. Fill exception handling functions for
Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.

Changing to AArch32 happens after the command "jailhouse cell start 1"
is executed. Changing to AArch64 happens after the command
"jailhouse cell destroy 1". If a cell is AArch32, SPSR_EL2.M[4] will be
set to 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will be
set to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to 0b0
which means lower levels are all AArch32. If a cell is AArch64, make
sure HCR_EL2.RW is 0 and the other registers are configured according to
the previous code.

After Linux operating system boots up, execute the following commands to
use AArch32 virtual machine on the i.MX8DXL:
./jailhouse enable imx8dxl.cell
./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
./jailhouse cell load 1 gic-demo.bin (32-bit)
./jailhouse cell start 1

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/control.c          |  5 ++++-
 hypervisor/arch/arm64/control.c               | 10 ++++++++++
 hypervisor/arch/arm64/entry.S                 |  8 ++++----
 hypervisor/arch/arm64/include/asm/processor.h |  4 +++-
 hypervisor/arch/arm64/include/asm/sysregs.h   |  4 ++++
 include/jailhouse/cell-config.h               |  4 ++++
 6 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 70793432..bfd9e710 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -32,7 +32,10 @@ void arm_cpu_park(void)
 	enter_cpu_off(cpu_public);
 	spin_unlock(&cpu_public->control_lock);
 
-	arm_cpu_reset(0);
+	if (this_cell()->config->flags & JAILHOUSE_CELL_AARCH32)
+		arm_cpu_reset(PARKING_ENTRY_ADDR_AARCH32);
+	else
+		arm_cpu_reset(PARKING_ENTRY_ADDR_AARCH64);
 	arm_paging_vcpu_init(&parking_pt);
 }
 
diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 6e1ffebf..71615c04 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -20,6 +20,8 @@
 
 void arm_cpu_reset(unsigned long pc)
 {
+	u64 hcr_el2;
+
 	/* put the cpu in a reset state */
 	/* AARCH64_TODO: handle big endian support */
 	arm_write_sysreg(SPSR_EL2, RESET_PSR);
@@ -67,6 +69,14 @@ void arm_cpu_reset(unsigned long pc)
 	/* AARCH64_TODO: handle PMU registers */
 	/* AARCH64_TODO: handle debug registers */
 	/* AARCH64_TODO: handle system registers for AArch32 state */
+	arm_read_sysreg(HCR_EL2, hcr_el2);
+	if (this_cell()->config->flags & JAILHOUSE_CELL_AARCH32) {
+		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH32);
+		hcr_el2 &= ~HCR_RW_BIT;
+	} else {
+		hcr_el2 |= HCR_RW_BIT;
+	}
+	arm_write_sysreg(HCR_EL2, hcr_el2);
 
 	arm_write_sysreg(ELR_EL2, pc);
 
diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 27e148c6..4789e933 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -401,8 +401,8 @@ hyp_vectors:
 	ventry	.
 	ventry	.
 
-	ventry	.
-	ventry	.
+	handle_vmexit arch_handle_trap
+	handle_vmexit irqchip_handle_irq
 	ventry	.
 	ventry	.
 
@@ -425,8 +425,8 @@ hyp_vectors_hardened:
 	ventry	.
 	ventry	.
 
-	ventry	.
-	ventry	.
+	handle_abort_fastpath
+	handle_vmexit irqchip_handle_irq
 	ventry	.
 	ventry	.
 
diff --git a/hypervisor/arch/arm64/include/asm/processor.h b/hypervisor/arch/arm64/include/asm/processor.h
index b52782b7..e7b048e0 100644
--- a/hypervisor/arch/arm64/include/asm/processor.h
+++ b/hypervisor/arch/arm64/include/asm/processor.h
@@ -34,7 +34,9 @@ union registers {
 
 #define ARM_PARKING_CODE		\
 	0xd503207f, /* 1: wfi  */	\
-	0x17ffffff, /*    b 1b */
+	0x17ffffff, /*    b 1b */	\
+	0xe320f003, /* 2: wfi  */	\
+	0xeafffffd, /*    b 2b */
 
 #define dmb(domain)	asm volatile("dmb " #domain "\n" : : : "memory")
 #define dsb(domain)	asm volatile("dsb " #domain "\n" : : : "memory")
diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 0105b109..62a56743 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -15,11 +15,13 @@
 
 #define PSR_MODE_MASK	0xf
 #define PSR_MODE_EL0t	0x0
+#define PSR_MODE_SVC	0x3
 #define PSR_MODE_EL1t	0x4
 #define PSR_MODE_EL1h	0x5
 #define PSR_MODE_EL2t	0x8
 #define PSR_MODE_EL2h	0x9
 
+#define PSR_32_BIT	(1 << 4)
 #define PSR_F_BIT	(1 << 6)
 #define PSR_I_BIT	(1 << 7)
 #define PSR_A_BIT	(1 << 8)
@@ -28,6 +30,8 @@
 #define PSR_SS_BIT	(1 << 21)
 #define RESET_PSR	(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
 			| PSR_MODE_EL1h)
+#define RESET_PSR_AARCH32	(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT \
+			| PSR_32_BIT | PSR_MODE_SVC)
 
 #define MPIDR_CPUID_MASK	0xff00ffffffUL
 #define MPIDR_CLUSTERID_MASK	0xff00ffff00UL
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6df4a745..6fda32b9 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -56,6 +56,10 @@
 
 #define JAILHOUSE_CELL_PASSIVE_COMMREG	0x00000001
 #define JAILHOUSE_CELL_TEST_DEVICE	0x00000002
+#define JAILHOUSE_CELL_AARCH32		0x00000004
+
+#define PARKING_ENTRY_ADDR_AARCH64	0x0
+#define PARKING_ENTRY_ADDR_AARCH32	0x8
 
 /*
  * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allows inmates to invoke
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200815190949.6837-1-alice.guo%40nxp.com.
