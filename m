Return-Path: <jailhouse-dev+bncBAABBBXF7GHAMGQEUMONFQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D248BE86
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 07:17:43 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id a3-20020a05600c348300b0034a0dfc86aasf451654wmq.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 22:17:43 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641968262; cv=pass;
        d=google.com; s=arc-20160816;
        b=RW+ORb+0M1h2RjpVk5fgUf1jMpD/v+u2GRFsIEZZOgSCg27sqrvlkMiMsm1Hps9bDK
         MEsB2uWf1w63Ynes1kJHNVPDBdgrBhjo9M1WpS8A/Js4KLbHcD1jISMu680j9f9zveeD
         giei4gv+92OYGuDVCZqwmYctB4PKTL+07zjSpA8aGDZh+P01dk2UTPj+PVFH5VqxmSW/
         Mqbd0DwD2vvv1mYqNNljZAiHWTFRdpeOwjVKOv6AwcV19kuwfC6HCSN+PQ5cIGftCvAF
         JcewCLFKStnhKCAGL35TrKMb2opee4LyjfsHs5VRUgxkG95Q4Eu1IfQyX0Z3ClnrN0Vm
         9jIg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=HGk7H2g4MWWTzOJxZ6o7+ms5wIzQfCFcBwHP1gU9J7A=;
        b=u3NFTKHnQ/O5DeRUxuAKhL7OB31y/fCV0/GPrZJCvqWTcBpb2oOc2nDq/+OqWMytET
         G8e04D2AEoBced+GZb76ul60EwPAm2bq/u7vjUQHOuHugN/vX5jMQS0wKg8RkL3HFeCI
         IZ4kXYgiYuYaJXBQxndR5IsL0hdAK5qi8aBJtraLt93tiB/G/JojLkW19fWVseS2nMgf
         swSgZnpi/F+3OAR3qjiX0cPQ7FiCzwptuE388CQFRQ33WcjbGdw+1tms0iGPRLr/GajI
         COBLPdMehapF9WhrmLMi5DD2ohVdb2bQbPY5wfg6LAmFcPuDBRdkWHwBQ50pUnMYO7yS
         /WqA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ZKZO1uGs;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 2a01:111:f400:7d00::612 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:content-transfer-encoding
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HGk7H2g4MWWTzOJxZ6o7+ms5wIzQfCFcBwHP1gU9J7A=;
        b=savByavjXeGIu612E6xCeFFNIjkrsuuHOhh2OKitLBCJb6ric0HA6QEwOZQs0OYMeu
         JT3DnPodusIDVV64RA46r16b2GbW46VFxRq8PTWglIyqEjz6j+gq6aOVPa8q8s3GgayD
         Q5QPQnorUyEVl6m82oSCuFZ3qphUBAZJDwbjeZePVUxzRBm36q8AijQcGh1eE2EncSrZ
         3scb8r/6D1Ca8G/fci7iNBnEPdsm+24f7je5OU8n1oNeNz5nuZWwoLX4ZEj+py+Jt/CI
         A+hIk//hdWKADxnLM/wqfHEA+H5+Uc8uXl7lN9G+Jr+p/IqikxnwOPZFt9qt95xJbl8U
         oAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HGk7H2g4MWWTzOJxZ6o7+ms5wIzQfCFcBwHP1gU9J7A=;
        b=1GgGcHiCJnx0oTcDHimXO+sbvZjRrP/HFCBjNqhtsX26dMDm+bscnrOq8xGQqHrJZn
         mkZNWhaPvvogmtnaMoDKkvXpzvohGobwhilbqyBiXE9gVX8Lkf+j6bhkEssCHNnPshGK
         F4suUMCYCQNpGZxQvM7NItQ+l3KP0OzUypa5YN5D/I4ZbFTMB8XAkY+OQWFP71HRydRX
         Qoxo/qwlrutvSg5mgfLgJG02zLedabIMA5ZEGlJy7wYatVrPbu2GMNrDnPcn330I0yFM
         eP+u4/sUl98sQPk/6ZOooHeeRQe0eBW4B7TpZ86ZhFpbJiq77lQd7DCXwuQiRujxJdb4
         18Kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zEHcaXGhMRHz469BTfy03VnFGOysA/Dko7DEF//5UX1XpAB7E
	5yUBDJQVni1mkHoK9Y+tD88=
X-Google-Smtp-Source: ABdhPJwpgCcsytnZyaMh5li98b/Sb+KLvveCrDdqxPO9qnwmAHDrZ6Dxqcbi4XS7ds95/TMedLHtpg==
X-Received: by 2002:a05:600c:4fca:: with SMTP id o10mr5255771wmq.58.1641968262644;
        Tue, 11 Jan 2022 22:17:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe8e:: with SMTP id l14ls858368wrr.3.gmail; Tue, 11 Jan
 2022 22:17:42 -0800 (PST)
X-Received: by 2002:adf:f681:: with SMTP id v1mr6576972wrp.156.1641968261977;
        Tue, 11 Jan 2022 22:17:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641968261; cv=pass;
        d=google.com; s=arc-20160816;
        b=cAzMxnqnfTrSMRPXHR9R7yJMfrpHWFmmQDxU6xOyhcNT4QbUt/KGpMk+/VTrgFrVQW
         D52v2EocLGAl/aSlZx5Kuhh/Rz+1w0rmNQQqffezyrCiBSsRNEwiGFTTDBzx2uJ+0XL/
         6/GKIkp4EomKQNOh0VoiWGEG+QPIWZ9mIbaKaaitao8ZVDmpD3lU1evcNE7x+kbkJmEi
         Otdoyr93tEUND+s019AXCdeUwTLYApXNGmZORwZ1/8AqkM7CnebQDrLWeis+HIFJjZsJ
         8uY/bD45c1h1KzFf+8JjBMXLxFK5n8t4LVbkpwU3Id1oRuG5R8WsJK01T7hgh7Uc/Maq
         c4wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=JO5izEy16X+ClHG0a8Te14fewbibnpNk1kwGJnyARNE=;
        b=IK4Nl7HMtg0T+SYJJUVhh3LYRLaRcKUgUr5mUvwPobgt+Fd8rYiUCPuoa7o90mOOng
         VVoBhTUCWu9JuoU3MCoF81UK/cCOUeGG2DUDWUacOhVE+KhEQ6P30gffxcQhffSSOCR4
         aUzUuKO6KPw6/awG9J4J5oFB7f1j1H/8wdsLpQGz8orag30hegCDYDlnC8j9jpHweq4V
         ildiLgbUKpkyppAJbpBujWjTbQbcVfIK9bz9kcLv+7Sb0BqFcQnlxPIB04CyLoPJ6DY5
         5NVZvzvzVAICFsMS3tz1tr/zngXw+3Q3kGWVWHsdk63QjRpy3Jo4Ee27Pe1iu38DU0q/
         WDYA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ZKZO1uGs;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 2a01:111:f400:7d00::612 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20612.outbound.protection.outlook.com. [2a01:111:f400:7d00::612])
        by gmr-mx.google.com with ESMTPS id n5si108213wms.2.2022.01.11.22.17.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 22:17:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 2a01:111:f400:7d00::612 as permitted sender) client-ip=2a01:111:f400:7d00::612;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5TKwoGDXGP+a/4AbQ/uLJtpBgI40EdudQqUn/p0amzVt2hFgK+lKcGNirrmGOkvBuUYcI43EocPPXJ+W7Z5WLs6v+YbR42QwkUHkCNjFg2stXTfWap5j8ClUBqfNlEbykWEfK1/69dVyXb29hb2AChXMnaYLG5tWXRPzZNNZCOp5cyapIGZHM6slf2Il9DefpqqALTdQNgl+j5QfzTDnJ6wyGL4on2NL63X1MPiFJBOPR0NHOTDn5IuTGUO9YDaN9ML3/eeLw7Kw+xfKXZdieolg7SyQ6c5wSfRQ6iaTHnieTFO+tI+PilwgwV2qHTZtxI0RyXx0UotGFhte6ilDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO5izEy16X+ClHG0a8Te14fewbibnpNk1kwGJnyARNE=;
 b=ADi4K07/M8hEcAgWlLd4bpwFoGT8nxaMn2viN2H3jxjKbHSdRaZa6aTMxrz/IQFw+eyt8+u5cenEGGc2DsMmBLje2W2yeoVmhZJLmaX5LXDy7m3K83atjGza07SqFCf2MEgqeOc0c74DpTOmGQGf52AElx6qXcaNwgVmCmziXnZ/zmq2b1tyyfl1wfdb3XSR+dfZHo3Nhh3coxT9yYXK3hTLENw1meV83gtqH31yNPGHetcUK2+X5DwzOy7rRZaDS28lF4634zhp6wbrsLPEt3d19zF9+PMz6J5i7+OoYywYhdJaDpKLMkf/VCGA4GZLhbtW9+0bvAsBmTmFOqzkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU0PR04MB9442.eurprd04.prod.outlook.com (2603:10a6:10:35a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 06:17:40 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d4dc:8c9a:55d0:81d8]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d4dc:8c9a:55d0:81d8%3]) with mapi id 15.20.4867.011; Wed, 12 Jan 2022
 06:17:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com
Subject: [PATCH] hypervisor: arm/arm64: fix build error
Date: Wed, 12 Jan 2022 14:56:19 +0800
Message-Id: <20220112065619.19432-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60fd667-5763-40e1-4f0d-08d9d5933c6d
X-MS-TrafficTypeDiagnostic: DU0PR04MB9442:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU0PR04MB9442A5FFF2DE13857A641ABCC9529@DU0PR04MB9442.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CWhvtJ6qHPIue+w85oEPWGPR5WhNhKOMZej2/ug22k0bbhrhGunuWbKszZFHVYCqiQ/Wlmq++dGvA5kjRJCl6MsJ35hCw0WkDomqDJxoVZisH9Bg6c2s7drXlJDekGYidqxLlDdLpv8XNnt90o9DO3KNhyXQLDmpa4EZocGVlGB/DY/ElLnQ0nEEV78x7PGlqEGYPLji7iGfnYfoTA81SaymVYfwriPu/SNadeCZX1/VDaamH/s85FxU/eYSlWUC5YRrEaQkPXgKzFh3dyVM8sjfxV67WBDAQCMKCWbQDXE3Bx1IkYq7JFWfAn8p8cIGOkxCbmuLPihUh1y0gEA6C1wa5oCS1X4EUN5x8n5VDAPNJcrEU5gSulCfmTYGu8+goioNiM1wkK341hxnMwGVRGEgwBevPkJ9vN6OfLkJnZdYn6fk+6KA8r7C46nhMb4blFgi29Q6qaf+ZQvgcEwYOkBSFJgiB6VzEbHMGTSEaWe8u09kTrvB66D1bn0oU0/MqVdn4f9vO6gdNneOenFxUN3d29AE4oQHf54tkNfOMIFXcSFPh7E+X6a9DTCIq1OYySYDgnT4HSTdUBjXTlLr0YFCDor1PQlzwpCdUlFu2WId/WlHIf5n3T06FCHXQSN9NN1Vzy8IWe25WAGyB3Si1nqLXXANvovCNUAhgN5mqqtVJlCXDYC/RxWbYw51qKwfxAieRqsg9KU57CxKyQkAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(4326008)(38350700002)(66476007)(66556008)(2616005)(6486002)(5660300002)(6506007)(38100700002)(2906002)(52116002)(8676002)(316002)(86362001)(6666004)(8936002)(83380400001)(6512007)(6916009)(26005)(508600001)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3R5MG40Mlp1dmltKzNwS05sSnErMnVHSE5pOXNNKzhSMVl0OHgza3RQZmU1?=
 =?utf-8?B?V3pVV1NlU1pGV0NRRmU1NFhnU052SjZCdHJWYXp5ZVFiQVN6V3lSaHNFbktC?=
 =?utf-8?B?MjZMaDZORXBtZGdDSXZ3WXR4eXN1UlJRSVRCanc4MkRyTWVVN0tqRzcvdlQ4?=
 =?utf-8?B?ZVcrNFhjWVRMVHVwSjdyUXdWcXZaS2dkeTc0K0lpOFVMSkJHZVdHZk56cTNi?=
 =?utf-8?B?NHBMNWwvRzRyWlk3UXNhWFdCakd5ZDdtRHY1Rlpoak5nRDM5Y3plK1NNNWQ1?=
 =?utf-8?B?UEtQdUdiZnYvOE8yOUY2bktoUnl3QWJIN2xYa2s3NU9WYmpldHl5U2pqQTdD?=
 =?utf-8?B?NG5VWTlQMEs5WnorMFlBdkErYjdoSmdqOUEvdGYwSTBFUVJldFR0Zk1ab3Iy?=
 =?utf-8?B?dzBtd01xSDlDbCtoVTM2UlduNGtHd2JhK0J3SnZNbEhaMDlnUlVnckVKaW9l?=
 =?utf-8?B?eVE5Y09BTlQ4QWp5eHBwNDNBQWZZeGl2YTROMTNwY2lnUkJmVjQzbWJMUm03?=
 =?utf-8?B?L1pENHJHdUJoS1h3TDR2b2JoQkNJaWNJQkJCdUNweEdDM1RUcWswTHpRdXZa?=
 =?utf-8?B?SmFob2Z4M1F2WDRTZnovaUJraWFveEg2V3VkVEFjYXNTWmhXcGFDaTR6REdP?=
 =?utf-8?B?d1NWQUtxYjFobTlzejJXdlV2YWxYUDNHNGU3RjNmMS8ydGZ0OWRqYWlUQlVO?=
 =?utf-8?B?MjU3b1hIc0FFbXJJY01wSldTUmpqWW8vSXVhdVhUSVl1WHV1VjRWKy9IVlhV?=
 =?utf-8?B?VFdSZmd1SW9HWktjWFRsOW5EeUlwd2ozdVBaZGxZc0JJMlMrVUNkN2c3ajcr?=
 =?utf-8?B?QkVuRFcvdGRHS3E5S1dzZVRyRmxUWWpsMjBZanJLTCtPL0ovamNXYXhtQWNn?=
 =?utf-8?B?cUdRL3hOeWJYTEQwMUxuQ084czFVMGM1WTR2ZjljZmlsU1NNUkg3bHVMcmRs?=
 =?utf-8?B?S25oZ0ljKzBZR3BoQjV4bnJRUWdQeG9PTEdydUxZSG9qeVRzcndlM0lvamdj?=
 =?utf-8?B?a3g0RlNHMFowdW9jZGtDbUZBNElnYkpjSTIxeUtFTTRwUEZ3WUNjV2kvN1lY?=
 =?utf-8?B?bkVPdUxzSTRwOEYwNWNSVmJ0OEVYQjYzSnhZT3hmcTVPTEowVGJMeGR4TklG?=
 =?utf-8?B?MzRMekVYWEhJUE14ckpsajR5Y1FQc3JwbnBYbWhwMkwvRGJmQTdPRlNLNldt?=
 =?utf-8?B?L1BKUnltNkVRT0xwYXdUOHZmMjJuL1FteUREY2hKM0k3OEhUdkp6VGt5Q1hP?=
 =?utf-8?B?dU1COU9FWEtxTzh2RW12R2UrS3ZReTAzNnd1TEZocDc2eWdlNE85eDdyZDFr?=
 =?utf-8?B?LzZuZ21ZN1kyYlFiRXRXRXRnTktUVmQwbDdqNXpMOG4zM1FKYW5MMDdjVnhj?=
 =?utf-8?B?UFg5R3B0dGc1UzVIZVJ0UjR2RTV3WWk3SGdTVzIyc2w2cXU4WEg0K2p5QXJy?=
 =?utf-8?B?SDBJYjRzSElZNCt1ZDNPSXBhVW9NWkNPVkRYSjdQVE01eHRoVWQrVk90b01a?=
 =?utf-8?B?OVpZekxZWElLTkk4NlV6YWNrTXBXRGtScEJFM0U2cGJWMU5CVXRjaE1aR2Vr?=
 =?utf-8?B?YUtEU0htMmZacWl1S3ZMaThscHhYc2p0THhCRkliNWh1blQxcjhoYXNmZkF4?=
 =?utf-8?B?cnBuVGYyUEtrMDVGT0VGVmlWVCtmeDhDU3VZa3B3cUVELzFpQXJnSlZSV0l3?=
 =?utf-8?B?bnhZenFnVVBYSkhtLy9YanVyR2NkMmw3aFdMOTMweW9nbkJ5S1IybUV2R0xO?=
 =?utf-8?B?OThHSjFxNEVOeFJsOWdISTlrcHZWZUZKdU1WVzNtMTZ5Tm1EbkI1dFhMTUQ5?=
 =?utf-8?B?d3pzRXkvbzVBNy8xQTdYanF2blpuR2R6dkpuMjYvYWFnczd5SEFjdHI5N3hT?=
 =?utf-8?B?K3dhc2VGZk50Qmo2SzZMd29QcWRpSW12NURmR0RwRE5CbzZvWGpZNlJUejc0?=
 =?utf-8?B?MnIyM0ZRUFNtbXk4bzVkS2xpS2dpM1hUTkFiRFVLZVluWnlPN3RsMzNHMk96?=
 =?utf-8?B?eUxjQUxVUXA4NzdtVklqOWt0QmIzdzd6dVVZbmRkR0FrdU91V21HelE0b0lL?=
 =?utf-8?B?dHVnWERaQ0tPZEVJemQ0Z01UZFM5Q0ZCdC95b3BTdGNLSSt6azVzYVdESzRq?=
 =?utf-8?B?emM2MXp3cGdTd3Q4Y2I0RHVOMGpKZjhsOEsxUTlZL2xPNkpkSUVtZjNEUENP?=
 =?utf-8?Q?UiTjp48pvafeQjzCkmn4gQs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60fd667-5763-40e1-4f0d-08d9d5933c6d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 06:17:40.2841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCm2C6sLWG6KZFTR2I28aZu5W8b3CUakFtTBnylM3nI6BGVuWu7R3/JilGkPECtKxJ9n8RxIkN7rGlW4l85RDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9442
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=ZKZO1uGs;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 2a01:111:f400:7d00::612 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

With gcc 5.15, met the following error

hypervisor/arch/arm64/control.c:33:9:
error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [0, 0]=
 [-Werror=3Darray-bounds]
   33 |         memset(&this_cpu_data()->guest_regs, 0, sizeof(union regist=
ers));
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
cc1: all warnings being treated as errors

Fix this by use a volatile pointer to keep GCC from determining its value

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm/control.c   | 3 ++-
 hypervisor/arch/arm64/control.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index 46125e1a..c9c93982 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -23,9 +23,10 @@
 void arm_cpu_reset(unsigned long pc, bool aarch32)
 {
 	u32 sctlr;
+	union registers * volatile guest_regs =3D &this_cpu_data()->guest_regs;
=20
 	/* Wipe all banked and usr regs */
-	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
+	memset(guest_regs, 0, sizeof(union registers));
=20
 	arm_write_banked_reg(SP_usr, 0);
 	arm_write_banked_reg(SP_svc, 0);
diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/contro=
l.c
index 5b41b393..2c33c5f7 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -22,6 +22,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 {
 	u64 hcr_el2;
 	u64 fpexc32_el2;
+	union registers * volatile guest_regs =3D &this_cpu_data()->guest_regs;
=20
 	/* put the cpu in a reset state */
 	/* AARCH64_TODO: handle big endian support */
@@ -30,7 +31,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 	arm_write_sysreg(PMCR_EL0, 0);
=20
 	/* wipe any other state to avoid leaking information accross cells */
-	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
+	memset(guest_regs, 0, sizeof(union registers));
=20
 	/* AARCH64_TODO: wipe floating point registers */
=20
--=20
2.30.0

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20220112065619.19432-1-peng.fan%40oss.nxp.com.
