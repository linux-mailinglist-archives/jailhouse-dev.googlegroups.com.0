Return-Path: <jailhouse-dev+bncBC44VTVY2UERBH6UTWCQMGQEUFKWCIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6BE38C157
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:06:56 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id n2-20020adfb7420000b029010e47b59f31sf9046796wre.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:06:56 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584415; cv=pass;
        d=google.com; s=arc-20160816;
        b=njg/3Vf8LimFKIB4hhTSosc+/fJ/JGnlG051dQUVG6+XJUcHZgK0XTA6Jnco/L/Z+U
         z6kPGLcOJagnMXNUFnQ8j1ZXrYp4r1hBdzOV8I0sBIFU4JLsdfdoEno5ykVYeQMsovgZ
         oXKdRavcDEocg2uALoE/6nt6vSNIMm1St8eCPjNvs6mHh8OtG8LyNA9rtvOJZvdBlieE
         j1bzB0hxirNMQtemCo4YBaEdOkoDUKhD0TMmj53eLH10A4Ep14RFm0dcT+20gnxPUGJP
         7CF/Vm35N5SykMmDuq90qVVP/8a6NgJfT1/Jucg/TS9m/XuNBuSL9P8j4OXypfrntOuZ
         magg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=23pLvKqVk7IBqapdYlQqDSVUVO2eOAy4rHPNYqZRc6Y=;
        b=DVuPcdbuLdSez+bv15xucgUe8pXGlQjWdqjIPYaBIjZ9ZfBlNe2L4XI4oMq8PTgNn5
         yg81VEnTCt965b66GACKARheeuTsrLONoHtsSTxSPZCtICRhYIrOy4ASFqf7i2jYUdMO
         ksUoHv4iLixLt6Ox5TObL1COWKvquLadQWNo7KuJih3rHCuSJV5EqzVD+XdUIvQSJr0B
         AZ3IOOGe0c5hwKZOOcYby/BUBGS94lfY5wPdWIwPvh6HPHJhu14iiNjUr0Fv5GSUkWsv
         FwgQfLfhmfN0O0KnLgbZxoYTviUmjbwtNXC8bQOuafC5Fbx9uPfDyjIkiaaRoSzO+De3
         wuNA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=boyR9SAr;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.70 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=23pLvKqVk7IBqapdYlQqDSVUVO2eOAy4rHPNYqZRc6Y=;
        b=Yc0POHsPJ50j5/DXdiNUWDfsrEd+9DAp5rqbMVnOSlm6NZF5Mb1Tug6pxXK933lmqe
         piMYuy1cHoiN9j4cFjz2d+2L2BPlCPq65n44UISxv2lHwEOhy6UPm77qPqdJkjbFsde+
         AcnkQZ5rFcB+gIbNMXkt7mdHw+GCVgCEkGVfY3KaTPfcl8UaQ9a+myVYiZTQlIeVrAxc
         FLW2+SwWlzD3KcskjefDCQ5Qd6sYD0WrywvV31AlhRQnwM0nHbhhYyUEQ3fBcVfysuST
         7uVBfHYr41DcS2u2+6RhnjbVuRKlSYZsK2xJ69pSiNDNapNOTTew0qfSvSmT15bmwGul
         133Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=23pLvKqVk7IBqapdYlQqDSVUVO2eOAy4rHPNYqZRc6Y=;
        b=cLq4quocTdoQaeY3YDbvUYu3hmrPHDjhIed6fi2EKVEiqfMwpB9jGCAZ3QM2mir8Yt
         ZpdrRMJMdghvy2PmkzZkTlsnxW5gYnI+HufhSWfItG+vJAkx7K26fQu6HXutFLqjGBgM
         8EPK8gcENkslOlm1pz6q8fW7qcWC/GGae1aiZotpIcZDXq07u5NeQnORP6ZZi8HxOcZw
         ax6bjD8cR51ThljJcvZC+VZzUij3ilVuSYvt75ePiuX4SQaF3N1iRCPDIX9vCWgS28ZU
         TbgWBk2edK6T83ExXfcoyr8WsD+VLnJHV3ltSoS0ffSEfjuipZj4ZAwO5xInmOuv+a8/
         r4hA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531xDlOVGJ6/xR1wIcHMDFR1XWnRXzHG9y06mHh8g0nQ8paY4VoJ
	TW81r/FjQdcMn12283bgLLM=
X-Google-Smtp-Source: ABdhPJw4TyUZOFiX0SK6nhvH/E+euHpEojLWeaYEsC+8GIYwyQrdoWYdypI/yxK0BIOQz51I5GjKpA==
X-Received: by 2002:adf:f54b:: with SMTP id j11mr7665023wrp.376.1621584415778;
        Fri, 21 May 2021 01:06:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f42:: with SMTP id m2ls2597298wmq.0.gmail; Fri, 21
 May 2021 01:06:54 -0700 (PDT)
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr7358472wmf.140.1621584414859;
        Fri, 21 May 2021 01:06:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584414; cv=pass;
        d=google.com; s=arc-20160816;
        b=IlKgzEDmUu+2HXPTE89CWuFoRzJlHwk8BX+OvHGXapX9zzJKYfn9Uw4ZWQEppDrCHF
         IyL+TOMK7XT5qNLvLwQ4DkK3qOf7A7XR2ctMQ3ow7pi9GmUV+wNMvW7UIq08Nfg5lAIw
         r/+/kg+xCdNEH6bnA8pfXesUR8E7RzMltzcDU0HEsqPopomOUCRojiHAXEMpO5oN2OuT
         7vvdzMzvt+pgdQQX3DpQKMS4Q//p3peaTRdIZveBAEV/NNmdpDOaxhyRvvbfvcpGFrLR
         VNdVkRbTKi2MLgJ9Q1PZ+cRhwbMotAvwHzJQmtCgmIfzcnrEgaWtXobQLf8Er6R4pqwH
         Zkng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wnSBdg1opATCtfBAexvH2r+uRg7e0kjdfJmBrNf2oTU=;
        b=kQXG07WyUhJGFQ5uvql3sKGgDYA/D79l5+ZOvit9Ds8shhTHNV/ypOC3DLsvPrN212
         BjglKr6R5nve9OTzK1B74XacJLQ5095LdyAQC9mFB7e8NiHT/1HweTzhCMZ7siovKpYY
         CtfKMmcVQxJ4Ntqa41o4YYXUQ+WE/WWq5T5IgIDMcLiySwkW5YPisC6N1uXRRLQZRiVM
         KJBd/oa9luU1fwk/L+tSNsaiFJSO6BcodZ7gu1Uc6nETKHeybcgyCANOYmKiBN+baHHv
         HBCdTkwtoExAKEZuboacKUVD/g7Xg1o9W6qR1e2Ap6AK23naD98gvdzFVaG3l1P0Cwtv
         yAiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=boyR9SAr;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.70 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com. [40.107.20.70])
        by gmr-mx.google.com with ESMTPS id w16si258315wmk.2.2021.05.21.01.06.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.70 as permitted sender) client-ip=40.107.20.70;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpJgZGcUTknwLnMwjoNzB7xkqYW/k8L8quI9Z3U6iQQCYsFXCiBKdvQHaAeWFezSnl/s78xdZ/SshbMesmGdzuk0/R6H5G7TU4Cv2pYlt2hk/rKojsPMeVz1Q+LupHAD+ejOyvkDd0HUad8b0iAIvwHwYc3jq5gAc//j2tAh08FQ+BNPdIGsMxthdJQZIbMbPhufTvVXf7DbBBaZFXWNdcnGHdbzugz8qK8qJzh57VS01xXex5R6s+gkeoUHVEZFArfiZnO3AJTCgKDmgnEZHlxYAWU5CJJLBcr2jkFQQryUhLRmxB9QBOssy7OKqu8LSHMNL/HGLqQJ5ierMCSVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnSBdg1opATCtfBAexvH2r+uRg7e0kjdfJmBrNf2oTU=;
 b=dzEFKjLFOBvhZ+nWR/staQzcJpczXaBNrJErRI7QkM21+96uotvvzsFKlLhkfulnv4bVkT58EO7dOvrXRrXnU5/nM5ynF63wfCkb5H3vTAcVoJ+tKh5+8mOmxVRAv5hwVz+Ce/o0X+RnqDU0Qr2j67/xc13q6Tbnsj015DYA55YcPnEhIXnCKaBA20g5NJDGTgFgAdOQ3dmIinxwVHxANSTWaku9rm4Mb/kfafF9OBIc2uOg1keVxDBNRgmaQTQVhVmPq43hO2+ANv45Q9LqqaI3OR9IL10jFhhmPOPYOnfpWxWsxZB0Vx4zU8I08Frc5WDUFc6avAgOmTYkGZTfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:06:54 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:06:54 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [jailhouse-images][PATCH 3/4] start-qemu: x86: Add support for qemu 5.2
Date: Fri, 21 May 2021 10:06:45 +0200
Message-Id: <20210521080646.488836-4-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080646.488836-1-florian.bezdeka@siemens.com>
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VI1PR0701CA0037.eurprd07.prod.outlook.com
 (2603:10a6:800:90::23) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VI1PR0701CA0037.eurprd07.prod.outlook.com (2603:10a6:800:90::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend Transport; Fri, 21 May 2021 08:06:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d301a0db-d589-4c1d-5012-08d91c2f6562
X-MS-TrafficTypeDiagnostic: AM9PR10MB4870:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB4870FF563E98716FE806B9D8F6299@AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJVqAwpzZKeJKDD9A3lILhvTSIT0/YI14d+Y0hba5iOd/SQWoG4cXV+xpB5rIImXlLFdpfly5wchxpUb64aqh2exvi/PtpQHal4jeH/AVfTB8bbQSs8hyYSBudnnkCvtkzbqtsiCeqboMTen8Bmu6JR8w1u0sUbjMJhHKE+CW4HCxPVdiQuD3ECrb0AIFOcuMALKHP3MorfKTBw4AoTYgGxNoUr1JTxyd/cE9AG8COLZWEgcok2jyHTX+EjRkLv9WoLxi30pF2qISoBzs9cC35qhmKmRJAGJoOI+23S9fRMMYtgKhvOGw9xL1RCvjt9RIQNCCgURtkD+LII24EC0NfuChAWgOXfENL8WYN/juoSRcwR8+s0B1wdDlxAK/rmv1VavwJhFwxJS9fw7hjce5hjIsgyYOOZAou4DWiZ05A0FrXDJi4sHnpPIIvFSkZraxittgVk7ByexFH+LBmivadN5s0osjbU/WehZfZTZyPzADgq2I6XrhY9ebciV/WNXn8bJa5R2KbiG5/WJAf/wNTsbQI3BUFgrCcUTPlKA/H84+1dyRzhe3SvhnMYpyLZQcfySosIIobDlbMZrR37nqDHwdwGa1G9DQsleHkDff6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(16526019)(1076003)(478600001)(8676002)(2906002)(6486002)(107886003)(66946007)(36756003)(186003)(2616005)(44832011)(86362001)(66556008)(6916009)(38100700002)(66476007)(6666004)(6496006)(45080400002)(316002)(83380400001)(4326008)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ltv0HInbMUVawizes3uk9wn7aH+VscD/NYnt2WVXS7iypT/7E+dWhSSzY0XW?=
 =?us-ascii?Q?I9R2tb5Xr/+Bp05CMLe9zk0MIo5aUltCCPTJr8qoo7Eqiy9I+Oiy2aozdWKE?=
 =?us-ascii?Q?Vi/6dTVsHS8KmyAIUaZh+TpGul2dQQtKwGZL36Kdyv8ea27wgV05Hc1lfth6?=
 =?us-ascii?Q?sro5AE1h3Hsdir1g5Chm7iUfoXXfhwHe2f/DibFiAMr34dg4saxDkijdQtsl?=
 =?us-ascii?Q?W5QCRmRX2PkQzRFE4DE1sxxp0M2DkHBSpC9TiQjB97+q/iS3YOtxQbOqDfem?=
 =?us-ascii?Q?tsbywDWPBnd00NXLlpr3jRTLnMEcNNY/vETkW4fuSEGQL/yrWEXz/iOUvhTR?=
 =?us-ascii?Q?reHJpGU5ix9wLsWkQWl/OAakZLMc/h1Me6JqeteOkvd+FCQY9p8AcwfdklLD?=
 =?us-ascii?Q?SQ+f0JK+t4jX56WzJjOe/21/2FYKRfXrq+5D+Bu3FQR2vVBemRry89qHmkSX?=
 =?us-ascii?Q?K1t9AZGwUlqXNwSy+iSy7EItNgF9DvILHLYYTcLWGSMOl4DYVWgMTeQvMmrs?=
 =?us-ascii?Q?D9kSsPCLbNW//rL9vU2I2brEl/CJo4zmhpn1SjHtTV1Z8IQamtsEOUFWoKvK?=
 =?us-ascii?Q?bnzDtgSd1z+Tsr44K92Gki4UURwUQe7UKuoyOCyWJOD1OhsWq3V842P+sRYc?=
 =?us-ascii?Q?DwwJmqsgzWIYWIeyjrSvkbRm2qrN0bNT2wvKMHs0v4XUGXBk6pXCzK3DYnOT?=
 =?us-ascii?Q?o4Gp1N0zB78COZyrlS4jslK+aQwOXHF8YY+2Rtn/cklYasV+c0FHcuAh8IQ9?=
 =?us-ascii?Q?l5cxmC6Z4QAYh9Hb6czkPKMtlSb7a4In3sSpphTBwvOZwkxbSwiGnZb9Sy8j?=
 =?us-ascii?Q?2hobkpRLpUcISTrQ9bqeU6+foop7eJiUaUEifoxXqlRGxdMmfOqS2w8Unz4P?=
 =?us-ascii?Q?Qz9823p2itOknJR26Tmswn7Wc8f4e7+Me6w+2Om3Ipy8FOCE8TGC+C11OKqn?=
 =?us-ascii?Q?NHniCwgHNvPDlzJZaCcgWR8gOnWCHmrrY/BkVTCW9Pry19/zf60FtFI9Jj2s?=
 =?us-ascii?Q?JSJiw+g/IU14PTEU8K0t4en3g59wV4bOGjZcLl8UM41ma0f4cPN2bJgqu8dd?=
 =?us-ascii?Q?ShuCWrk+f6dGcEj/DZtQLlG6cfYMX7Ke+/I6a4zPxeydYPFCLimc0i5QwnlH?=
 =?us-ascii?Q?UxMilPoc1IiQAHGJ833MeETmhzB7H5mFDsUIrQgBmBc2zr2and5isHXjhUMi?=
 =?us-ascii?Q?ULNH+z7IqqsSnfvyeN2D/TlCNogujCtlQ90iYxcWX7kKmsb6dMDt9Ov6vbss?=
 =?us-ascii?Q?W0kjbslQVR46ndGnOUDeWxvk/qATFFOdKnjd7LWKk7m9caYfBoOLpkCu7b0u?=
 =?us-ascii?Q?6j5p1l27tF0detJqR9daX/zPP1RM+E4cQShjURMez3hq6RJq1mb0QfZl4jtH?=
 =?us-ascii?Q?Ue5qcrnFW7SbIFOGzIL6A3wRqnWV?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d301a0db-d589-4c1d-5012-08d91c2f6562
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:06:54.0657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoDkeM1tsX7lv/oYXj1ALc5L23DpKYpMeeMouowFZ4ZZce7S2tSCTtX2c4wFgWs2xhzlJkQCA7pHzPl/vY309cV3APtPXMXkQ2wqcT0UY9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4870
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=boyR9SAr;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.20.70 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

Qemu 5.2 adds a new CPU feature named kvm-asyncpf-int. The qemu 5.2
changelog says:

A new KVM feature which improves the handling of asynchronous page
faults is available with -cpu ...,kvm-async-pf-int. This requires
Linux 5.8.

If this feature is enabled, the (jailhouse enabled) guest kernel will
run into the following situation during "jailhouse cell create". To
avoid that we need to disable this cpu feature when qemu supports it.

jailhouse console output:

FATAL: Unhandled MSR write: 4b564d02
RIP: 0xffffffff8103e117 RSP: 0xffffc900000ffe60 FLAGS: 46
RAX: 0x0000000000000000 RBX: 0x0000000000000003 RCX: 0x000000004b564d02
RDX: 0x0000000000000000 RSI: 0x0000000000000000 RDI: 0x000000004b564d02
CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x000000000200a002 CR4: 0x0000000000372ea0
EFER: 0x0000000000000d01

Stack trace:

[   41.849660] #PF: supervisor instruction fetch in kernel mode
[   41.850301] #PF: error_code(0x0010) - not-present page
[   41.850839] PGD 0 P4D 0
[   41.851121] Oops: 0010 [#1] PREEMPT SMP PTI
[   41.851570] CPU: 3 PID: 25 Comm: cpuhp/3 Tainted: G           O      5.1=
0.31 #1
[   41.852326] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.1=
4.0-2.fc34 04/01/2014
[   41.853207] RIP: 0010:0x0
[   41.853494] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd=
6.
[   41.854287] RSP: 0018:ffffc900000ffe60 EFLAGS: 00010046
[   41.854962] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000004b5=
64d02
[   41.855605] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000004b5=
64d02
[   41.856242] RBP: ffff88803f9971a0 R08: ffff88803f9971c8 R09: ffff888002c=
00058
[   41.856873] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff810=
3e827
[   41.857511] R13: ffffffff8106efa1 R14: ffff88803f9971c8 R15: 00000000000=
00000
[   41.858152] FS:  0000000000000000(0000) GS:ffff88803f980000(0000) knlGS:=
0000000000000000
[   41.859131] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.859738] CR2: ffffffffffffffd6 CR3: 000000000200a002 CR4: 00000000003=
72ea0
[   41.860378] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[   41.860929] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400
[   41.861488] Call Trace:
[   41.861698]  kvm_pv_disable_apf.part.13+0x11/0x2f
[   41.862084]  kvm_cpu_down_prepare+0x42/0x50
[   41.862415]  cpuhp_invoke_callback+0xc1/0x238
[   41.862760]  ? smpboot_unregister_percpu_thread+0x59/0x59
[   41.863187]  cpuhp_thread_fun+0xdd/0x117
[   41.863518]  smpboot_thread_fn+0x190/0x1a5
[   41.863847]  kthread+0x112/0x11a
[   41.864109]  ? kthread_unpark+0x62/0x62
[   41.864412]  ret_from_fork+0x22/0x30
[   41.864765] Modules linked in: af_packet snd_hda_codec_generic evdev pcs=
pkr snd_hda_intel snd_intel_dspcfg serio_raw snd_hda_codec sg snd_hda_core =
snd_pcm snd_timer snd soundcore intel_agp intel_gtt button jailhouse(O) ip_=
tables x_tables ipv6 psmouse e1000e ptp i2c_i801 i2c_smbus lpc_ich pps_core
[   41.866836] CR2: 0000000000000000
[   41.867105] ---[ end trace a63d134522cf2445 ]---
[   41.867466] RIP: 0010:0x0
[   41.867680] Code: Unable to access opcode bytes at RIP 0xffffffffffffffd=
6.
[   41.868216] RSP: 0018:ffffc900000ffe60 EFLAGS: 00010046
[   41.868629] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000004b5=
64d02
[   41.869185] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000004b5=
64d02
[   41.869736] RBP: ffff88803f9971a0 R08: ffff88803f9971c8 R09: ffff888002c=
00058
[   41.870325] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff810=
3e827
[   41.870993] R13: ffffffff8106efa1 R14: ffff88803f9971c8 R15: 00000000000=
00000
[   41.871501] FS:  0000000000000000(0000) GS:ffff88803f980000(0000) knlGS:=
0000000000000000
[   41.872076] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.872477] CR2: ffffffffffffffd6 CR3: 000000000200a002 CR4: 00000000003=
72ea0
[   41.872972] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[   41.873469] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000000=
00400

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 start-qemu.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/start-qemu.sh b/start-qemu.sh
index 7e95ec8..4e90fe3 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -26,8 +26,15 @@ case "$1" in
 	x86|x86_64|amd64)
 		DISTRO_ARCH=3Damd64
 		QEMU=3Dqemu-system-x86_64
+		CPU_FEATURES=3D"-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kv=
mclock"
+
+		# qemu >=3D 5.2 has kvm-asyncpf-int which needs to be disabled
+		if ${QEMU} -cpu help | grep kvm-asyncpf-int > /dev/null; then
+			CPU_FEATURES=3D"${CPU_FEATURES},-kvm-asyncpf-int"
+		fi
+
 		QEMU_EXTRA_ARGS=3D" \
-			-cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmcloc=
k \
+			-cpu host,${CPU_FEATURES} \
 			-smp 4 \
 			-enable-kvm -machine q35,kernel_irqchip=3Dsplit \
 			-serial vc \
--=20
2.31.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210521080646.488836-4-florian.bezdeka%40siemens.com.
