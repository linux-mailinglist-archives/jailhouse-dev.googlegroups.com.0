Return-Path: <jailhouse-dev+bncBAABBVOVUOGQMGQEZKVXGPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 65580466721
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Dec 2021 16:48:38 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id t25-20020a2e8e79000000b0021b5c659213sf87574ljk.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Dec 2021 07:48:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638460118; cv=pass;
        d=google.com; s=arc-20160816;
        b=pke0aDT9nUpDr2+rk4tv2scI1w9CdlCHr0aUEbHEaOCBoEsnienkmTSm/Tlv0ldUDD
         Z+F/7OtOE/pMVwA4XBsqwsI1f7/qljYlNAsg+tAISL9FDUSb7V9a0WVBTIJzF3IkfD6a
         AbnkJWZJz7CIH9Pphy6MhB/1Jmdw4UXAZ4RXQu8D4ngPPlIyWRwLwTgcjthjOEwLYKiY
         ovCMXIq8qD4KuIVysjnuTZO6LjjQlrHSoWLaV8q7ABgpeEve0zgQD3geJsYjolhLgEIj
         KSR0aIw7KP30g5TcEYKYz75a6D7zd1YFTT7+ZUW6dycdMfcisibk6KemjUbtZgPiyXGM
         g1yg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=qXYA+vMRKNQ3XS368gUcuJHa8Oaqj7esucQoTX/UWKU=;
        b=Ics0tPv3vcWb2YW67obuSekgU/c5/2qBaRnTBNZbTvZHXgYLAh56rhgHXeiExp40Jl
         k15RonggvAFGDM2SkLq/dhQW53FkZVi311IHL89GjCi6A4Zm5V9DFB+YVT2sgQXSWiKn
         HEntIw6yYGV1K2ceRibQOrLkV4n0McURvxCJRgJDEohNKpzD49Gd8yxCFaV+xrH5aZPr
         U/djmZlmW6iN4KlpmmS8hotjDN6NvLruDPMdoulOpZ+sPTBHEEyUKUeIx9T0k3dHuu5j
         VXB9ZFxw68by/GX1sCN6pYMlUwZspzu5wH0xzUAqLtrhmIAK9XMaNkjhk0PJFw/Trf89
         biLA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=jDi6jNT0;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::605 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qXYA+vMRKNQ3XS368gUcuJHa8Oaqj7esucQoTX/UWKU=;
        b=hQQiX/s/HkLtX8G1c2lq+T6RLVkbIBfTPpsFLGBZu9/g6GAjK4t89v26ainGSIhjwR
         ir6BneaO/bIQQV/pKnsRSrLjEhGdjFe78xC5pkTkuxvDno0GLaXvSlxfRINik12xlRgs
         dGe45E0pZ8K1L3253LVGSQPRDj5b7DmCBK+Q4XQXpg5WUiVBoXfW/3ZqkrdHZ7LV2vhx
         t9lYbcJrPFE5zCLI3Y5eB2GKyeG2abeOVNbTezAalEYr9yH4ZIAZ4Qs3C9BT/F4/ZiJZ
         HIF1ra3lJaU76S2vXrrn+fJDPLmALLkMeaPKScG2e4y4i1SVD3yZn1qcAcgOKIgi/4A5
         jdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qXYA+vMRKNQ3XS368gUcuJHa8Oaqj7esucQoTX/UWKU=;
        b=kO5vfHisS2zThaTmdkTHNO13diFVKDpnm1d3WzsTnyGIMhf6cE8nSkRa0j8AUmm9dA
         dgtyejBOEcfz+tpclCIg6vtF8RrlGcIdGWqGrPtdaA8FWIDSs08RZHgmvcwcXFEi8Z2l
         UQOtI0Ruz0ZZyb2mg21pnM5WgbNk/LF60pJMuHScUid35GKPB46xyofTqdo1olQa16VD
         Gi3STK8dARe/Mue2WEbgRqkkbGLkKS3rjWt8/PnrIdUKcLzhqmHYL8cLF8kc1Nqi246g
         Fu8SjDamCv3o5B8sokS89bwAuX1+4pmhtGhbHuupah7YO9SQ9X+RIg0C8rkwidmCNnOc
         k9tQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531nYT8OWEkSUtrenKBWIm+xIYSF48feFAtSQxdCDM3xl15qPObw
	5iG2vtjOl+XwGDGFkxNX4G4=
X-Google-Smtp-Source: ABdhPJwQK6ksBR6cSFwHIMH3zbmTJkRV6zzLjMJbb7yShecNoC0V83rDDiJwulouPzog5qIJlvq+mQ==
X-Received: by 2002:a2e:9456:: with SMTP id o22mr12811174ljh.129.1638460117947;
        Thu, 02 Dec 2021 07:48:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8611:: with SMTP id a17ls1093149lji.1.gmail; Thu, 02 Dec
 2021 07:48:37 -0800 (PST)
X-Received: by 2002:a2e:6e15:: with SMTP id j21mr12722858ljc.195.1638460117172;
        Thu, 02 Dec 2021 07:48:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638460117; cv=pass;
        d=google.com; s=arc-20160816;
        b=IpX3g4On1LHF+I082ZPQXMze4zFdfgadVDBW4QcC0W1KcIUCfitJc9j+LGiB5nbA0n
         0KHc5imQ27ch2Ac6V6QZduce3/IQCMCQqREpdDCvO8Rrk/332QwsulbgTss/smQwMAY8
         ovnnT0r/1OHanobn51ds4DOrAMkSriDK4v3b1N7d0LN0BDol1P/1MPjgSxZxjAKiHCx6
         9+A8hX/XRUfGelqQPYmJVJw0t5juZjYxoySJzkc9yzGJLHQt6w9b5hD6Xp1Yke1MwWLR
         cvN13SGQvD1imtM9d2LLEpRZr+z5ckZEW2nYbOSPnzAGiMcMCTCBI6ezwqob6keuTuOM
         ATBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q9u2pj+cHDNeBkeUZfxbwW33q5ruc7gAgR1CyQb6TpE=;
        b=ojOR74LXtabIqkNaja9OmMcqeI2yt3iOX/I6QnAiwCVV6aUOMd/DbD9cGK2RE89rM4
         /0uTahfgJTHq7NocCgVIlPlGizk/omhARJwkPyxHUeKNhQAW9fg4UsOjAWxICFgdYHq5
         NGK/8SX4IfskQqdYEJTpQLdOXrC/hdn2SYTSkXlWWASGMClNkVMSqeNi0Bw6MQzLunTS
         89CS2NBIUaxK3N2xH4uIpMt6y//lX8eraJ00ZN46ul2LRMDS021vnzsCTyGrCRCE+qzG
         v0IKR6hJIx46ce05zgsVp4EXzki14Q5Tguy0RIyb0FatCSPN6MqzQ2ru7BT1AJG2D9QC
         X88Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=jDi6jNT0;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::605 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20605.outbound.protection.outlook.com. [2a01:111:f400:7e1b::605])
        by gmr-mx.google.com with ESMTPS id t18si10948lfp.0.2021.12.02.07.48.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Dec 2021 07:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:7e1b::605 as permitted sender) client-ip=2a01:111:f400:7e1b::605;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr98gWygHCTpumy+r8lZFD8sYnMi9DRXdEdLUcljztYYgm1jrwfZJMfyhBnCv/ybRdHo2kuW7rp64FoNcGnoZNSgFS2CDqsXduqJG9e9gIsw8Fz/DkvOz0BztmAcAmU4VDXStfZ5CGcd/aDSNOjRsyz+UpejLDdcxN0avUIFPJld6as7iPvcnEmc527JCyWciNVr4r36TuTjuWyETgBZUJ01J6dnDMavR8JNG9K4BLHHbBD6s8VCgO+aZlFGRebleyH2JEFe0Lf4Fs3h4hWlX2hamAXj4Wr0+cWbAI677FANTv2+X6dODiDKv6UAu3cBoVdjFhLlepLM1/vxzTs/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9u2pj+cHDNeBkeUZfxbwW33q5ruc7gAgR1CyQb6TpE=;
 b=aiDh5j0Aat1MhxAf3z+EgOpP8sfmlS8yqE7+89TLtHDWUNKfRnErMdiv33KgwrNo+ylSxwISO67yAL5+Q1MV+tedkGlS/y67STcaJpZQJKYST+fdRaP3Jbe/FT8y/jjfZXOezFmX1OfVcqKubB9AljDeeiODRLrC64S3CtK6lXiTfQxQ1Ulcujg2ZZSm6Ewv+vWLpHY1KjDigD+8ukOmvDiVd0tIIhMGiXD1QS0zqbQmzEQgRzAxHfsZ/B1SnZRPFeI5W4wkR5+kYGu0OVtPzwW1pAKyFCmlEm1EhdruXSKKTLkc+T0EqE8GPR/+GKM0hjeHy4OrxAviB/mnpTpRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Thu, 2 Dec
 2021 15:48:35 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%9]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 15:48:35 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	ralf.ramsauer@oth-regensburg.de
Cc: Stephane Viau <stephane.viau@oss.nxp.com>
Subject: [PATCH v3 1/2] [RFC] configs: Introduce helper files to create inmate cell config
Date: Thu,  2 Dec 2021 16:47:59 +0100
Message-Id: <20211202154800.2671-2-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
References: <20211202154800.2671-1-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR07CA0075.eurprd07.prod.outlook.com
 (2603:10a6:207:4::33) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM3PR07CA0075.eurprd07.prod.outlook.com (2603:10a6:207:4::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4755.9 via Frontend Transport; Thu, 2 Dec 2021 15:48:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a649419-e9e6-47c2-f01f-08d9b5ab334a
X-MS-TrafficTypeDiagnostic: AM9PR04MB8716:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB87164BDD73A65CD840C82294A7699@AM9PR04MB8716.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wFSqMP3kjsYg4JEnM7zjb4cYJV35rqvVauYEjek+YlR/meHvjtk+vLI0KesxepK3Ovw7uOZU5jYlrx4hZKih0UvRLF5KE6yZO+JFurWXtOcDONKJ/t80JgjgAg/z76GD4qapqMLmXPNExLO4pLz56PxL432bcmYcfou3RqYMtGWU5Cpaqq4yhiNF9P5N0g5H79If2hvdC33tDr8brR1FINm55yA+KPGjtSybrUxYx9gtpIaloM1It1qiS6hNt/0U813JGIcj+xebZmdwWTNK8dK65AtMJZpqH6j6kw1RzU++ioKVEASwaW6qxo2pSPjfKdwgASA4TK4hyYvWLzVM44GiIMNe+8B1e1rh6xPQxGZsk1emTjtCcX/qAzXNkuxSRZ9RxB0v38ZafrivZ6TAwEQ7eM/uD2LnuiCyA69PjT7I19cZb/9Y9sctE2T8S1mz9/u1JhvEt2B1HeZa+tERjL/XKDBBD7z/+1vf3DufN/Zb7HMpZU4x4k3uEnTtiUXEE13LLhxxOfjFQXDMT/aH7ziX+6pMh7PDqKfLCEG9Via31EnatGJdCfTgZKW4MAzGUfRxu90bfYWOODbTtJA07ecPjfKEKJiHYqm1PQDZ1B+TlnOs/MSJMnAghLz0QPJQO4egp5FDOrdqP9Bertn4/8cgZyZNz6X9xUK4TdVOYf6zXBqHMA+dA83u6u6HWFg/geTuu1i6ntrpM3WuI3aEdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(44832011)(956004)(508600001)(4326008)(66556008)(8676002)(2616005)(38100700002)(66476007)(66946007)(8936002)(1076003)(6666004)(38350700002)(6512007)(2906002)(86362001)(6486002)(5660300002)(26005)(316002)(6506007)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sBE32htwRxSMzBhQqnyyBajTNbx0RZw1pFP+/IJaKcETza60JGZVakM7l5Ip?=
 =?us-ascii?Q?ul9U3LjuN74TUirgdrG/qFGA5yFenrN7Bvo5eQ+YqOk7Pt50AskYBmLGcFtF?=
 =?us-ascii?Q?EewYZSq6dBfsfIOgpLiJvQCFTKY2RqBGda7N9TtXHsYhXQxK0unhTh+Q1pie?=
 =?us-ascii?Q?7wJj06fNLOw3BVCEiiESoSirpRpvIufIeogqfzOd5m0xZSsKB92G0u/PbuCM?=
 =?us-ascii?Q?YZ6sVFpZT4TeouHNVNC7OGJnCaoK9EwEmBxcEbwQw3Wer4cUcwOaZ3uFOs3O?=
 =?us-ascii?Q?OW91rcWcjaWSf94DtJsQdjJp0SQHTnGEqmvv0F9lwBz1fA0C6D6aPk+jbd6n?=
 =?us-ascii?Q?K+N47IyCFhVJBra/jspTl6I/O8BOIfQyxvdpbOvHnarul/+JsKuX3pCG5oAa?=
 =?us-ascii?Q?N76l3WQd7RoNd5V79xTHWrxIix3FHS1+MxFOa1YQLpQZs1yJqOdjPmkMSGWF?=
 =?us-ascii?Q?k6YbzWxCpym/z18+W4fZekMlGETpPcEk/fE5ROchnLyfG1Olpg0MIOzN/Acu?=
 =?us-ascii?Q?2PnGZ+vnvell4lghbUA3ifhLnLRZv86dJnpbiVbdZ944ylL9T9hOqSnGgzoy?=
 =?us-ascii?Q?o6V9KB6QdAOZvTTeDd/ZOmN8sq75yBNOteY7CF2cn54t7FAtuYAaDdccU1dw?=
 =?us-ascii?Q?cRjktVscCU7/e/u7bk3sNcb+2E7/z+5x+pF97D8eOEF+tWAWnxrZISNjPgpa?=
 =?us-ascii?Q?3+uWfDaItRDlCjTduw8Of7TkpQKU09SJar2TnMbS9YRxmfKuTq0L5y44Asg9?=
 =?us-ascii?Q?JyyuRv19HUE7Ww4PtWg4jYzfpXuXPr4Gu+EtiqtY/8j9agQ+SXvim/z4RT8I?=
 =?us-ascii?Q?kgG9XguhxqhHLU28hweAqKSMu7IwfgWfYFEDMpiJbfe38hy8b6oseq9kKAa6?=
 =?us-ascii?Q?XSptwaBamhlhOgJvvPA5uaYoNtiJ/xUikSynbQV/0vJlRoOhivjBspBJi+lq?=
 =?us-ascii?Q?RyrtNqO1N3x7+epyfMGD/bNfdUKzmbUNC8WUiBJ9zOeN4SeX2hwQr2Ruj6/Z?=
 =?us-ascii?Q?PqSBzV5mZtibDZ6LFfuDSYN3mOnxPQJbqErKNDbC46cYzrjinX6YYvBs6E4g?=
 =?us-ascii?Q?a7ydEWFNB5lNOfO4j/o32iATJEGrT8UObvBbvzM7xbhs/3O51CVvUQmGs0ew?=
 =?us-ascii?Q?iVS9H+oXjz9N9OYEZ3PUKEdjMfLnBVa/WskFcO2oj/UMMuGSTyFYPCTSndx+?=
 =?us-ascii?Q?b9NlZqtjsHRa/dSkgHdsYTB9P06Mw8zHZ8/Wd0cUNmDsgdVPWgYYeBp8Kj9t?=
 =?us-ascii?Q?hpGmhzdvB7hLMgbHcWwRlkak6mQqRzCx/Ek+0rS6j6MM6UJu4kjL8mE4RxJm?=
 =?us-ascii?Q?8JzKZJpb/3C2QEUks6S0emFuNGtWapENgaN2pUoSfgvJfi5LQqsmlnfF3rqJ?=
 =?us-ascii?Q?/MZbMnYtA7LUt7HUtwWtwKsy13CpNb1SQfPe4n6wVKEr3GkYtHDzrrO7yxxD?=
 =?us-ascii?Q?4iBPECreSWf1+OAH4Vd8kQ8lLmvTT09iyPBCa3hYazQ4gYf2YW4MzPGTZSym?=
 =?us-ascii?Q?3iV9SZkjO8eN2VHLmYRuD8nxoB3VDZ383Bk85o1exIB0V9GuxBHdJJdYAuMt?=
 =?us-ascii?Q?F8ug8Gay84QxUbsaedtZ/cKxDKJwueHYaibwEUsGu9nCJWiBVD1snkehhlMg?=
 =?us-ascii?Q?FAtsYzBXQQtKuBi7XihSv3s=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a649419-e9e6-47c2-f01f-08d9b5ab334a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 15:48:35.5703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oDSER4L1BlJDwkU/k73f24k4LxnBuFBhHyVoQfMc419pwk0VkBflp45tYGIC6imk3L43gy6ntHZ8PCGKuMrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=jDi6jNT0;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:7e1b::605 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

Inmate cell configurations all look alike - more or less.
Let's create a couple of header files to hide the fastidious stuff
(structure field names and so on) so that .c cell configuration files
look a bit less ugly.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

---

v2 -> v3:
- Get rid of the *_NUM macros in config files and have them computed
  instead (suggested by Ralf)

v1 -> v2:
- Add PCI and Console helpers (needed for inmate cell conversion example)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 configs/arm64/cell-create.h   |  75 +++++++++++++++++++++++
 configs/arm64/cell-helper.h   | 108 ++++++++++++++++++++++++++++++++++
 configs/arm64/cell-template.c |  48 +++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 configs/arm64/cell-create.h
 create mode 100644 configs/arm64/cell-helper.h
 create mode 100644 configs/arm64/cell-template.c

diff --git a/configs/arm64/cell-create.h b/configs/arm64/cell-create.h
new file mode 100644
index 00000000..bfa9471b
--- /dev/null
+++ b/configs/arm64/cell-create.h
@@ -0,0 +1,75 @@
+/*
+ * Cell Configuration - Structure definition
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+#define CONFIG_INMATE_REGIONS_NUM \
+	(sizeof((struct jailhouse_memory[]){CONFIG_INMATE_REGIONS}) \
+	/ sizeof(struct jailhouse_memory))
+
+#define CONFIG_INMATE_PCI_DEVICES_NUM \
+	(sizeof((struct jailhouse_pci_device[]){CONFIG_INMATE_PCI_DEVICES}) \
+	/ sizeof(struct jailhouse_pci_device))
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[CONFIG_INMATE_REGIONS_NUM + 1];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[CONFIG_INMATE_PCI_DEVICES_NUM];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = CONFIG_INMATE_NAME,
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.cpu_reset_address = CONFIG_INMATE_BASE,
+#ifdef CONFIG_INMATE_VPCI_IRQ_BASE
+		.vpci_irq_base = CONFIG_INMATE_VPCI_IRQ_BASE,
+#endif
+#ifdef CONFIG_INMATE_CONSOLE
+		.console = CONFIG_INMATE_CONSOLE,
+#endif
+	},
+
+	.cpus = {
+		/*
+		 * bitmap of cores used by the inmate cell
+		 */
+		CONFIG_INMATE_CORE_BITMAP,
+	},
+
+	.mem_regions = {
+		COMM_REGION_RW(0x80000000, KB(4)), /* communication region */
+		CONFIG_INMATE_REGIONS
+	},
+
+	.irqchips = {
+		{
+			.address = CONFIG_INMATE_IRQCHIPS_ADDR,
+			.pin_base = CONFIG_INMATE_IRQCHIPS_BASE,
+			.pin_bitmap = {
+				CONFIG_INMATE_IRQCHIPS_BITMAP
+			}
+		}
+	},
+
+	.pci_devices = {
+		CONFIG_INMATE_PCI_DEVICES
+	},
+};
diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
new file mode 100644
index 00000000..525d91c6
--- /dev/null
+++ b/configs/arm64/cell-helper.h
@@ -0,0 +1,108 @@
+/*
+ * Cell Configuration - Generic definitions
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef KB
+#define KB(bytes)	(1024 * (bytes))
+#define MB(bytes)	(1024 * KB(bytes))
+#endif
+
+#define REGION(phys, virt, bytes) \
+	.phys_start = (phys), \
+	.virt_start = (virt), \
+	.size = (bytes) \
+
+#define MEM_REGION_ROS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define MEM_REGION_RW(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
+	}
+
+#define MEM_REGION_RWS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+			JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define COMM_REGION_RW(virt, bytes) \
+	{ \
+		REGION(0x00000000, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_COMM_REGION, \
+	}
+
+#define MEM_REGION_RWX(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_EXECUTE, \
+		}
+
+#define MEM_REGION_RWXL(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
+	}
+
+#define MMIO_REGION_RO(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
+	}
+
+#define MMIO_REGION_ROS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
+		         JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define MMIO_REGION_RW(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_IO, \
+	}
+
+#define MMIO_REGION_RWS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define PCI_DEVICE_IVSHMEM(_domain, _bdf, regions_start, dev_id, peers) \
+	{ \
+		.type = JAILHOUSE_PCI_TYPE_IVSHMEM, \
+		.domain = _domain, \
+		.bdf = _bdf, \
+		.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX, \
+		.shmem_regions_start = regions_start, \
+		.shmem_dev_id = dev_id, \
+		.shmem_peers = peers, \
+		.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED, \
+	}
+
+#define CONSOLE(_address, _type, _flags) \
+	{ \
+		.address = _address, \
+		.type = _type, \
+		.flags = _flags, \
+	}
diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
new file mode 100644
index 00000000..8f57c387
--- /dev/null
+++ b/configs/arm64/cell-template.c
@@ -0,0 +1,48 @@
+/*
+ * Cell Configuration - Structure definition
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "cell-helper.h"
+
+/* Name, cores, entry point */
+#define CONFIG_INMATE_NAME		"inmate-cell-name"
+#define CONFIG_INMATE_CORE_BITMAP	(0b1100) /* inmate uses cores 2 and 3 */
+#define CONFIG_INMATE_BASE		(0xc0000000) /* entry point in DDR */
+
+/* Memory & peripherals */
+#define CONFIG_INMATE_REGIONS		\
+	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)),   /* RAM */    \
+
+/* GIC */
+#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
+#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
+#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
+	/* interrupts 32..63 */         \
+	0,                              \
+	/* interrupts 64..95 */         \
+	0,                              \
+	/* interrupts 96..127 */        \
+	1 << (76 + 32 - 96), /* SPI */  \
+	/* interrupts 128..159 */       \
+	0
+
+#define CONFIG_INMATE_VPCI_IRQ_BASE	(76)
+
+#define CONFIG_INMATE_PCI_DEVICES	\
+	PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
+
+/*
+ * #define CONFIG_INMATE_CONSOLE \
+ * 	CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
+ * 		JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
+ */
+
+#include "cell-create.h"
-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211202154800.2671-2-stephane.viau%40oss.nxp.com.
