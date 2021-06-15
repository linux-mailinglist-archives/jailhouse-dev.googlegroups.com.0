Return-Path: <jailhouse-dev+bncBC44VTVY2UERBNHHUGDAMGQE6TMNYSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 817963A7AAA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 11:32:36 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id p20-20020a1709064994b02903cd421d7803sf4261259eju.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 02:32:36 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623749556; cv=pass;
        d=google.com; s=arc-20160816;
        b=J+D93x3cpMX+f4nJ+RV3xbnkNPR7W/Tn6BuMchLvZlbO3ZDI3sZF37n4ZF9bxmfp95
         W0XnNY459TvyLK1SIz6xTdBHpadxveswFiIX6sadN8QJbgA/BPabADszhLdp03mT5hxp
         7qMNjFn17SNmOv/XDMTBxSzoyESp+ygn+qFL6YVa87aWxmQCPqrcpoylG4QEK1jSTuCW
         QF1Ks6fIlPvgd2yz1JPAIbr6Q1NFsTj12G81rxBV8W+B+5Pw858ob9amPTEnsrVuMah5
         9fC/0BrOrctOSb4wmAUvj2XH1MbuKcvF4xqeADkD94xiBSzdvR1LrTr8+4MC3pNV1vzJ
         W0KQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VR2N9HnngmHglwfzmw/uRArC35yMxKRJOmSd0EjGf7c=;
        b=pf58sk1qSSqcEtVe8HbzQmmVkMvC1JT61ws2SKGwHny/fZ9oNpCUO1R0WjWdy4FTpj
         5SAvULlHWkhTwLX9NWrku0U9Df/vHtS1EnyCTNxQ50SRpVfbt+9DxsuMa0FLsjVv2w10
         QI1vuIUlNJUlqGibTkjKjv+XnB48vky0LBH+06seAD5JnYyF6rJeMgwyidL5c9FEUFpu
         p/JiY7OtnnMuIp/syMZMVFXG730TZzR70oEz8jDuX4rL89KL3sa6LAyE6mUy4JhQU/bo
         kLgM9AT8gHiMT+GAFGalZoTMem5szGW7AYZld5i+biwL4TPkKpoLsbdEL1iGV9r2UGDn
         cEPQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=MWHuHRNU;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.60 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VR2N9HnngmHglwfzmw/uRArC35yMxKRJOmSd0EjGf7c=;
        b=Zoz9iaNqGGqZtM6+JKV/naZMWZryw5CetvK4pZbTxU3J9DXHMnrJtdi4uQ/ruiIKnf
         N63Z5A0sYjeUwqYqLXppg9/IVrRsREm1iajFthPrbvJGAqQINPVQvcTAXfltGxt4v6Pf
         opBCPIpTG/TVput5oPkvJqm5mnA7rCKYXGWi2yWpmEp7vskzYUBZydWHhX4iEkzL60AH
         R2/d8cFlSMRCSwg7proXyHAylr0fuzeXB2aQ1RgpgDPCAV/yjKFgsBtmR66vxPxP0xjw
         G/RtS+zZ0wZaMt0IRj36DRkav8dnAlYvqUnR/6fLQQ+PGCXRaqjUc8i6GKS+XaOKcc7R
         6BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VR2N9HnngmHglwfzmw/uRArC35yMxKRJOmSd0EjGf7c=;
        b=tHjJoDK3fHCelBtDh/GT+zNUecCosO9Cw2PFovKUjrwwbq/C0MZoUAceBrbAdqpZYi
         DmpIkjqsVo6QEENek3FwZdYrlkpCtg6kIikxiNB6BP+PA9n9F0KVQOvWU/qbS1pXnlUr
         51u21flAlKySIEGoGTAl03roBZo2uhIJiUe8FGpek7Nrf9xR1C10RqG2NFY7z3sgwb5V
         kc5yuwLfB+ViBq+mBiev+2Ox8gJedmaTYwVgEf/k/+5eDvvst20Jg9EHeCrwVP3o0bxI
         ecoeF0MyZoTA2ilgliW0SdufESXz2Tu6qruilzzFmYSTlzZBkAnt3Nn6I5eoItjNMAGx
         kj6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532oeUOdFYSykD9CNG6YQ/bPv3R+9L0qA5Rdoec0FiBtIuN1iNS4
	e3/gcrXezs7MgU5Ncld+EfU=
X-Google-Smtp-Source: ABdhPJyI46Vj6kr8nzbhvWZg8BCz8gsHsMurJbIOu5NNrvknz62CMw92mSYP2RbVeB5p9bCTkkcDfQ==
X-Received: by 2002:a05:6402:175b:: with SMTP id v27mr22069776edx.61.1623749556278;
        Tue, 15 Jun 2021 02:32:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:30b2:: with SMTP id df18ls9506516edb.3.gmail; Tue,
 15 Jun 2021 02:32:35 -0700 (PDT)
X-Received: by 2002:aa7:c705:: with SMTP id i5mr22474754edq.222.1623749555343;
        Tue, 15 Jun 2021 02:32:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623749555; cv=pass;
        d=google.com; s=arc-20160816;
        b=gpSpLrOALZP/IqusrcjgrqgDUNd1LOuAcqHf3pR4jrOXjaqbP+KuZkB4GdzYCE/rNh
         OVuezEhDMpnJ2GyIETNKCasjUyPLDwRe7ycxU/ZfW0zdkAJbRNKtVjqGDMlRKQ13u4GA
         uwN5YTNQsB5AAW9a8hQ/W7VmIY3BeQCVjNBmaJxvZ7U+Toy5ix8SwwLmm4rmf80eOD8l
         lwFC4hQYfll3H68T7dm1v1+JDnSCP7D4Wnlyffg6UQZ3Zr21PEzLrG/dxb8UqR5g2LF6
         SElyoDymdCqRpAI8w6K3l5DyFl+4xrpeeMiNMbH23ryDKLoUpk9PDrX5AKSNkd1UWzv6
         zZJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DUg17h3xB6lCVZtyUsSMJsyQ8PTLgl+HOxBLZ4Pjkc4=;
        b=oXqOND4OhSmKrFiDgzYw+QcaUWfzeSFwl8RVfksgzFGDlfAhqEL/BpoZRrhMA2tzKR
         LbGAErJb0m6Y26l1UItGAXl586PPumrqW6zLTB9DSQdjZjBJ5Cr/dLhNuLOSX9ZOUwU5
         aVwnFjF+CNm9rVRs8iH8uLQA0QA0j4uPO0ViH0piPUbqwVB5H40sd/RqjtijyG1Nam1P
         vxt9Sa9requkNUMJkYjp6oBLftbrQnMvHlIrSDXgilDluEC3cVjQ48NzSTfVhAO1uDU1
         DtMxCH5wp2Ihjd5Hww6dmq5dqBn8TIzkeSzLAB1mzcH0pWqoGf/cvLfhY0hW367WACVS
         U4pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=MWHuHRNU;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.60 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com. [40.107.20.60])
        by gmr-mx.google.com with ESMTPS id w2si102809edi.2.2021.06.15.02.32.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 02:32:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.60 as permitted sender) client-ip=40.107.20.60;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/yUJP20OQT6CnXs5juo52rSE85is8RCZJUezkU6xHOnQEaNDSRX4O7bHtvE1nFNZ3JHZ+mAgxSgzl4J3Dy4nrHJWsmNObF614JGcCRWrzfURJnQlNYS9spqGFBsHsukM75AdpVybg50i0TPXTisrgwv2SeBgD6Zu9ofN9pfv3Vh5mqklnUBC3+NQ9zwp1+3h6E3kOZ+aV2fHTkgXeeSkzTLY9NbX3KWzNpdTPwVXzT5BATgu+ZvH36rKns9Fpi5ZbM++9Zh+cD/mtESCSlMJMQhJLwPWOpfQafjGOd01/r7Fm7qjXzcCwgVe99pNACiRAaRPaX8OktksipwHIzxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUg17h3xB6lCVZtyUsSMJsyQ8PTLgl+HOxBLZ4Pjkc4=;
 b=ESoWlCVXR5SlkGBtyuggfA0DYFzhlubH2KfcUwYNXHOkq3EtJdAEubtklMiC77ZqrigMCpNb5fdClDre3S5tCV2BqJ+gGaM1ySFbT+l2hTyALS8LUXp03mBWw+bBCBK28bBDkgmOXjD6mGUnXAL6kaJTIsN2TMKe2zMs0gEnxb46Vf3lhVC7nDw06hMBWpFhHc0j4IY/m5LL9dmceduuVvLEFDqX67AF0rFfukiruSULiTi3CkCS6azZNQwFbjOrb7SkGKlcqCj9QoV0fnf084SCreVNr1aCxUwKumjZ35TKHDATIql7QJsmvdYPiBDsKektkfrQ7XRm/mEI+LqWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 15 Jun
 2021 09:32:34 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 09:32:34 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 3/4] tools/scripts: Remove python2 specific code
Date: Tue, 15 Jun 2021 11:32:24 +0200
Message-Id: <20210615093225.162909-4-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615093225.162909-1-florian.bezdeka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR0102CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::23) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR0102CA0046.eurprd01.prod.exchangelabs.com (2603:10a6:803::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 09:32:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 360367d3-f8c0-478e-a9a3-08d92fe0818a
X-MS-TrafficTypeDiagnostic: AM9PR10MB4216:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB421679EDB8EBF23294CF25C9F6309@AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LSfPrRtsD2EVxY5+LCxxh6ouvm1HyEb3LaD63czXSpxaGYwz2nrCc3kSzR1Q2YXI4oNDNND+saOQbLf78TEJr7o9UjTGIhHFvRRSoBQxoigj4WfpgADhyZbH5MBxuEQc2sphNSHUr/HJMpZfNQlTEXM3Cmt5IOq2hHompQW7yczuklxBJRtIMfTlkMvoJIEZfK+6/Z+9SyXCg829oK203yV3SXDzFijhNP/tAox93TekWuMojag0a1q2vF41JVtPrBDUX2UAH7Qv+Mz7PVJQRBpiOxFwCL8G1EAD/SPDKwHApB8crrzhEhdz2Ph50hORBppQh45JWd5zSOEHlh7cYyL9iIYlJ/CjQrWSHwZv4ZGZfsmYJrx9NaZhp9KhUTZFptDS3RxG40d8v5bkiT9i9lxRP/EIDTOl1ZA31Fcgpe/Ce7PRq15ymDozMs+2dTv4DSGhBljHbCgucYTbqkUg9uDioSZfGBIUH1TVLj5vqQlDv9XNnflQ5QnWwzhexfLXy1zXg6/sEqKX5LlxBUVk3Uxe5rpKd6DRZ/4X6s6QDJwKfB3jq+egwDpmX98zjYEFeV3uMSWNrpowDQ+iD3V4QYV6hd1q+oT01sGvrv0WNwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(44832011)(6496006)(478600001)(36756003)(16526019)(186003)(86362001)(38100700002)(6486002)(8676002)(2906002)(8936002)(5660300002)(6666004)(66946007)(83380400001)(54906003)(6916009)(107886003)(66556008)(66476007)(1076003)(956004)(26005)(316002)(2616005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gaxg3cPbbUFc0QXi5vktp+jchdWX8EnyqmzjEseFloCB61A91Mr/CPItGcha?=
 =?us-ascii?Q?HINh/+568iJkb/6UfY9RUNELK6PeJXc5SI2kn6zWqAWBElp24Or/2MpOeaWr?=
 =?us-ascii?Q?20NBgdcWKzACw15WCaerOA67nyGOaTBLZ3EGq1SWqCnP5s1qoJxubd+VdAlU?=
 =?us-ascii?Q?T+0vniaGSXumwHfxcj5fJKt/JWMYKgSIgNsM557TTXP4LWoelapBCEQ5K5NI?=
 =?us-ascii?Q?HrL3XhsPco/fL2oyWfOoJkuNsL/NFPN0G7TIOkJYgT9dcctlVVyXCqqfWIIf?=
 =?us-ascii?Q?+aL528Ys+EF8zlXVqneSzC7530Z4wEchDIzWd4IkmaBlnoL0S0cY/b9Usohj?=
 =?us-ascii?Q?ns+ycIuZXYMMMZpcsbe8x1UP0h5PdcwdOytpex7uVmTh6X7xgdmDk8dXzhda?=
 =?us-ascii?Q?TT8+jj/lfMs5dviYt8vjn2hozrfS0eGZbH7Tjs4nGrq849F5zJKgctc4juWm?=
 =?us-ascii?Q?03Hm1Ws1U3DF4E/Xdu6NGXanuWR2lWEL5ubpKM4K4nlP2EnPsPA428zYbZN1?=
 =?us-ascii?Q?LDHqp92mdj/dnyN5U93EOsV2jmwZ0PbKK9yIB6y1ZUxIlbF9fAAcHY8gIWip?=
 =?us-ascii?Q?iirq2uHzlp9HbQXmiu8TDT1LK/xc0RaudtU7hTL4wnudIF5hR3oVTKxgoMq7?=
 =?us-ascii?Q?KyAjI//Re8dvgESvhh9oydEQH/lGbFccNHwKLEvVZqVH5V/GJJmvFKVOavdD?=
 =?us-ascii?Q?7aWAs5trOdVOhyK0vP3Rb3ZelkNTQ8JAHP/3zRj+93InKwutpg/tNIghNIcr?=
 =?us-ascii?Q?D/V07EpJLMi4vthUFxAz4b8g9uPwnCGANEwxYkYOuo7+ahhUxJQ3pd7t0kFa?=
 =?us-ascii?Q?/zm6zCXACPhps1tbbuhECTMXtRGVAW7IKEf+tqOlj6Xm5CX8kGbAZiaVUEzW?=
 =?us-ascii?Q?IWpKLwaQaGXvk7TVXLNE42AskTfhZ2Vg6dPFP9LtL0zVBsMKdSy3sWhI+tBp?=
 =?us-ascii?Q?0/GfSzD9SHMG16p3i9BVMG5+e2hglB0bnDvdU6d0U/1Iwu8QLl8qxFTxmexz?=
 =?us-ascii?Q?LKGq2cFKtkC0oTz4LnO+ZKE4X0A4aa9WOmMp3lsqdemJGyzMH7kgOBdeaXaw?=
 =?us-ascii?Q?OcC35h2PRI7qBF4GJ3J17++N+GvpZH73icUhNWsaDA5vcj9ALAmlZ285gRfO?=
 =?us-ascii?Q?zWkM4T0dGXQ22fLuUQx3pheepT3z/MEY+0DzJjKoI/RW9tkg697K6E0nUCQA?=
 =?us-ascii?Q?t832ikomiLbjysUtfBAVWZzgnvl4kLUKL+GgEtA86CtCMd/KfAV7gmprcaqp?=
 =?us-ascii?Q?baGco3SDvCJ6hPFQHpXaHYNVVaElpn6bgYBeAmDcNSyb3WT+BY5/VF+o2S2C?=
 =?us-ascii?Q?rV/xRVNHfDhY2D12kO3o6hah?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360367d3-f8c0-478e-a9a3-08d92fe0818a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:32:34.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1cdklUUpNF8y8vyEU9FmdMst06SXAfBQKE/dmCsSEK5hL1NZ8JCwuU/CY9kJ7HYSPHdC/b/CPw9ca8sMLp/L/M3GGfD+85l2o4nK7jDc7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4216
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=MWHuHRNU;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.20.60 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

We are now calling pyhton3 via shebang, so no need to care about
python2 anymore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 pyjailhouse/config_parser.py   |  1 -
 pyjailhouse/extendedenum.py    | 12 ------------
 scripts/arm64-parsedump.py     |  1 -
 tools/jailhouse-cell-linux     |  1 -
 tools/jailhouse-cell-stats     |  1 -
 tools/jailhouse-config-check   |  1 -
 tools/jailhouse-config-create  |  1 -
 tools/jailhouse-hardware-check |  5 -----
 8 files changed, 23 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index cad761a5..7a7f48a3 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -14,7 +14,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import struct
 
 from .extendedenum import ExtendedEnum
diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
index f3dd1bb9..9d6043a4 100644
--- a/pyjailhouse/extendedenum.py
+++ b/pyjailhouse/extendedenum.py
@@ -9,18 +9,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-# Python 2 and 3 have different ways of handling metaclasses. This decorator
-# is a support layer for both and can be removed once Python 2 is no longer
-# supported.
-def with_metaclass(meta):
-    def decorator(cls):
-        body = vars(cls).copy()
-        body.pop('__dict__', None)
-        body.pop('__weakref__', None)
-        return meta(cls.__name__, cls.__bases__, body)
-    return decorator
-
-
 class ExtendedEnumMeta(type):
     def __getattr__(cls, key):
         return cls(cls._ids[key])
diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
index c695706f..54f4fd66 100755
--- a/scripts/arm64-parsedump.py
+++ b/scripts/arm64-parsedump.py
@@ -14,7 +14,6 @@
 # the COPYING file in the top-level directory.
 
 
-from __future__ import print_function
 import subprocess
 import sys
 import fileinput
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 6d1743f3..a1650912 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import argparse
 import gzip
 import os
diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
index 4c5289fb..7a634212 100755
--- a/tools/jailhouse-cell-stats
+++ b/tools/jailhouse-cell-stats
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import curses
 import datetime
 import os
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 62db24c3..d6ea7079 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -15,7 +15,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import argparse
 import os
 import sys
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 2095f4e2..c2cd5952 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -18,7 +18,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import sys
 import os
 import math
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 7a41b48e..fc8ce4f1 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import mmap
 import os
 import struct
@@ -20,10 +19,6 @@ import sys
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
 import pyjailhouse.sysfs_parser as sysfs_parser
 
-# just a dummy to make python2 happy
-if sys.version_info[0] < 3:
-    class PermissionError(OSError):
-        pass
 
 check_passed = True
 ran_all = True
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615093225.162909-4-florian.bezdeka%40siemens.com.
